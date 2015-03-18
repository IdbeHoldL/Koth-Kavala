player addEventHandler ["Respawn", { _this spawn clientEvents_fnc_spawn}];
player addEventHandler ["Killed", { _this spawn clientEvents_fnc_killed }];

"player_stats_add" addPublicVariableEventHandler client_fnc_addStats;
"player_stats" addPublicVariableEventHandler client_fnc_setupStats;
"player_equip" addPublicVariableEventHandler client_fnc_setupLoadout;