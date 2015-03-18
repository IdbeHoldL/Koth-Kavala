waitUntil {!isNull player};
waitUntil {alive player};

cutText ["Loading", "BLACK"];

removeAllWeapons player;
removeBackpack player;

player addweapon "arifle_Katiba_C_F";
player addmagazine "30Rnd_65x39_caseless_green";
player addmagazine "30Rnd_65x39_caseless_green";
player addmagazine "30Rnd_65x39_caseless_green";

player addweapon "hgun_P07_F";
player addmagazine "16Rnd_9x21_Mag";
player addmagazine "16Rnd_9x21_Mag";
player addmagazine "16Rnd_9x21_Mag";

player additem "FirstAidKit";

cutText ["", "BLACK IN"];