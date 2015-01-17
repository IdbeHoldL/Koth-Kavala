_return = false;

if ( isNil {uiNamespace getVariable "extDB_ID"}) then
{
	_result = "extDB" callExtension "9:VERSION";

	diag_log format ["extDB: Version: %1", _result];
	if(_result == "") exitWith {diag_log "extDB: Failed to Load"; false};
	if ((parseNumber _result) < 20) exitWith {diag_log "Error: extDB version 20 or Higher Required";};

	_result = call compile ("extDB" callExtension "9:DATABASE:koth");

	if (_result select 0 == 0) exitWith {diag_log format ["extDB: Error Database: %1", _result]; false};
	diag_log "extDB: Connected to Database";

	extDB_ID = compileFinal str(round(random(999999)));

	_result = call compile ("extDB" callExtension ("9:ADD:DB_CUSTOM_V5:" + str(call extDB_ID) + ":koth"));

	if (_result select 0 == 0) exitWith {diag_log format ["extDB: Error Database Setup: %1", _result]; false};
	diag_log "extDB: Initalized DB_CUSTOM_V5 Protocol";

	"extDB" callExtension "9:LOCK";
	diag_log "extDB: Locked";

	uiNamespace setVariable ["waste_server_extDB_ID", str(call(extDB_ID))];
	_return = true;
}
else
{
	extDB_ID = compileFinal str(uiNamespace getVariable "extDB_ID");
	diag_log "extDB: Already Setup";
	_return = true;
};

_return