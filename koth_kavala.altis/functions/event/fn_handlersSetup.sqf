player addEventHandler ["Respawn", { _this spawn KOTH_fnc_handlersRespawn}];
player addEventHandler ["Killed", { _this spawn KOTH_fnc_handlersKilled}];

"player_stats_add" addPublicVariableEventHandler KOTH_fnc_addStats;
"player_stats" addPublicVariableEventHandler KOTH_fnc_setupStats;
"player_equip" addPublicVariableEventHandler KOTH_fnc_setupLoadout;

findDisplay 46 displayAddEventHandler [ "KeyDown", KOTH_fnc_onKeyDown ];
findDisplay 46 displayAddEventHandler [ "KeyUp", KOTH_fnc_onKeyUp ];