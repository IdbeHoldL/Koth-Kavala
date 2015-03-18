﻿/*
	Author: Karel Moricky
	Description:
	Execute received remote execution
	Parameter(s):
	_this select 0: STRING - Packet variable name (always "life_fnc_MP_packet")
	_this select 1: ARRAY - Packet value (sent by life_fnc_MP function; see it's description for more details)
	
	Returns:
	BOOL - true if function was executed successfully
*/

private [ "_params", "_functionName", "_target", "_isPersistent", "_isCall", "_varName", "_varValue", "_function", "_exitScope" ];

_varName = _this select 0;
_varValue = _this select 1;

_mode = [ _varValue, 0, [0] ] call BIS_fnc_param;
_params = [ _varValue, 1, [] ] call BIS_fnc_param;
_functionName =	[ _varValue, 2, "", [""] ] call BIS_fnc_param;
_target = [ _varValue, 3, true, [objNull,true,0,[],sideUnknown,grpNull,""] ] call BIS_fnc_param;
_isPersistent = false;
_isCall = [ _varValue, 5, false, [false] ] call BIS_fnc_param;

_exitScope = false;

if ( { !( toLower _functionName in [ "bis_fnc_execvm", "bis_fnc_effectkilledairdestruction", "bis_fnc_effectkilledairdestructionstage2", "bis_fnc_setdate", "bis_fnc_setovercast", "bis_fnc_setfog" ] ) } ) exitWith {};
if ( getNumber ( missionConfigFile >> "CfgRemoteExecFunctions" >> _functionName >> "disabled" ) > 0 ) exitWith {};

if ( !_exitScope && { _functionName == "BIS_fnc_execVM" } ) then {
	private "_script";
	_script = +_params;

	if ( typeName _params == typeName [] ) then {

		_script = _script select 1;

	};

	_exitScope = !( _script == "initPlayerServer.sqf" );
};

if ( _exitScope ) exitWith { false };

if ( typeName _target == typeName [] ) then {
	{ [ _varName, [ _mode, _params, _functionName, _x, _isPersistent, _isCall ] ] call KOTH_fnc_MPexec; } foreach _target;
} else {
	if ( isMultiplayer && _mode == 0 ) then {

		private [ "_ownerID", "_serverID" ];
		_serverID = owner ( missionNamespace getVariable [ "BIS_functions_mainscope",objNull ] ); 

		switch ( typeName _target ) do {

			case ( typeName "" ): {

				_ownerID = owner ( missionNamespace getVariable [ _target,objNull ] );

			};
			case ( typeName objNull ): {

				private [ "_targetCuratorUnit" ];
				_targetCuratorUnit = getAssignedCuratorUnit _target;
				if !( isNull _targetCuratorUnit ) then { _target = _targetCuratorUnit; };
				_ownerID = owner _target;

			};
			case ( typeName true ): {

				_ownerID = [ _serverID, -1 ] select _target;

			};
			case ( typeName 0 ): {

				_ownerID = _target;

			};
			case ( typeName grpNull );
			case ( typeName sideUnknown ): {

				_ownerID = -1;

			};

		};

		KOTH_fnc_MP_packet = [ 1, _params, _functionName, _target, _isPersistent, _isCall ];

		if ( _ownerID < 0 ) then {
			publicVariable "KOTH_fnc_MP_packet";
		} else {
			if (_ownerID != _serverID) then {
				_ownerID publicVariableClient "KOTH_fnc_MP_packet";
			};
		};

		if ( _ownerID == -1 || _ownerID == _serverID ) then {
			[ "KOTH_fnc_MP_packet", KOTH_fnc_MP_packet ] call KOTH_fnc_MPexec;
		};
		
		if ( _isPersistent ) then {
			if ( typeName _target != typeName 0 ) then {

				private [ "_logic", "_queue" ];
				_logic = missionNamespace getVariable [ "BIS_functions_mainscope", objNull ];
				_queue = _logic getVariable [ "BIS_fnc_MP_queue", [] ];
				_queue set [ count _queue, +KOTH_fnc_MP_packet ];
				_logic setvariable [ "BIS_fnc_MP_queue", _queue, true ];
			} else {
				[ "Persistent execution is not allowed when target is %1. Use %2 or %3 instead.", typeName 0, typeName objNull, typeName false ] call BIS_fnc_error;
			};
		};
	} else {
		private [ "_canExecute" ];
		
		_canExecute = switch ( typeName _target ) do {
			case ( typeName grpNull ): { player in units _target };
			case ( typeName sideUnknown ): { ( player call BIS_fnc_objectside ) == _target };
			default { true };
		};

		if ( _canExecute ) then {
			_function = missionNamespace getVariable _functionName;
			if !( isNil "_function" ) then {
				if ( _isCall ) then {
					_params call _function;
				} else {
					_params spawn _function;
				};
				true
			} else {
				_supportInfo = supportInfo format [ "*:%1*", _functionName ];
				if ( count _supportInfo > 0 ) then {
					_cfgRemoteExecCommands = [ [ "CfgRemoteExecCommands" ], configfile ] call BIS_fnc_loadClass;
					if ( isClass ( _cfgRemoteExecCommands >> _functionName ) ) then {
						_paramCount = if ( typeName _params == typeName [] ) then { count _params } else { 1 };
						switch ( _paramCount ) do {
							case 0: { _params call compile format [ "%1", _functionName ]; true };
							case 1: { _params call compile format [ "%1 (_this)", _functionName ]; true };
							case 2: { _params call compile format [ "(_this select 0) %1 (_this select 1)", _functionName ]; true };
							default { [ "Error when remotely executing '%1' - wrong number of arguments (%2) passed, must be 0, 1 or 2", _functionName, count _params ] call BIS_fnc_error; false };
						};
					} else {
						[ "Scripting command '%1' is not allowed to be remotely executed", _functionName ] call BIS_fnc_error;
						false
					};
				} else {
					[ "Function or scripting command '%1' does not exist", _functionName ] call BIS_fnc_error;
					false
				};
			};
		};
	};
};