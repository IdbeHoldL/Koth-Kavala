player addEventHandler ["Respawn", { _this spawn KOTH_fnc_spawn}];
player addEventHandler ["Killed", { _this spawn KOTH_fnc_killed }];

"player_stats_add" addPublicVariableEventHandler KOTH_fnc_addStats;
"player_stats" addPublicVariableEventHandler KOTH_fnc_setupStats;
"player_equip" addPublicVariableEventHandler KOTH_fnc_setupLoadout;