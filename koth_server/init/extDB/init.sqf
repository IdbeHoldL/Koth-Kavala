_return = false;

if ( isNil {uiNamespace getVariable "extDB_ID"}) then
{
	_result = "extDB2" callExtension "9:VERSION";

	diag_log format ["extDB2: Version: %1", _result];
	if(_result == "") exitWith {diag_log "extDB2: Failed to Load"; false};
	if ((parseNumber _result) < 20) exitWith {diag_log "Error: extDB2 version 20 or Higher Required";};

	_result = call compile ("extDB2" callExtension "9:DATABASE:koth");

	if (_result select 0 == 0) exitWith {diag_log format ["extDB2: Error Database: %1", _result]; false};
	diag_log "extDB2: Connected to Database";

	extDB_ID = compileFinal str(round(random(999999)));

	_result = call compile ("extDB2" callExtension ("9:ADD:koth:SQL_CUSTOM:" + str(call extDB_ID) + ":koth"));
	
	if (_result select 0 == 0) exitWith {diag_log format ["extDB2: Error Database Setup: %1", _result]; false};
	diag_log "extDB2: Initalized SQL_CUSTOM Protocol";

	"extDB2" callExtension "9:LOCK";
	diag_log "extDB2: Locked";

	uiNamespace setVariable ["extDB_ID", str(call(extDB_ID))];
	_return = true;
}
else
{
	extDB_ID = compileFinal str(uiNamespace getVariable "extDB_ID");
	diag_log "extDB2: Already Setup";
	_return = true;
};

_return;
