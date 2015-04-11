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
		};				
	};
};