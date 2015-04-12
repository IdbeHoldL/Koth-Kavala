class CfgFunctions
{
	tag = "KOTH";
	class KOTH
	{
		class client_event
		{
			file = "functions\event";
			class onKeyDown{};
			class onRespawn{};
			class onKilled{};
		};	
		class player
		{
			file = "functions\player";
			class playerLoadout{};
			class playerMarkers{};
			class playerHud{};
			class playerAction{};
			class playerEH{};
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