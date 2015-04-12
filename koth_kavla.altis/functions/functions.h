class CfgFunctions
{
	tag = "KOTH";
	class KOTH
	{
		class client_event
		{
			file = "functions\event";
			class initEventHandlers{};
			class onKeyDown{};
			class onRespawn{};
		};	
		class client
		{
			file = "functions\client";
			class playerLoadout{};
			class playerMarkers{};
			class playerHud{};
			class playerAction{};
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