class CfgFunctions
{
	class KOTH_CLIENT
	{
		tag = "KOTH";
		class client_event
		{
			file = "functions\event";
			class onKeyDown{};
			class onRespawn{};
			class onKilled{};
			class onPause{};
		};	
		class player
		{
			file = "functions\player";
			class playerLoadout{};
			class playerMarkers{};
			class playerHud{};
			class playerEH{};
			class playerTags{};
			class playerLevel{};
			class playerSave{};
			class playerLoad{};
			class playerConfig{};
		};
		class shop
		{
			file = "functions\shop";
			class fetchCfgInfo{};
			class shopMenu{};
			class shopBuy{};
		};				
	};
};