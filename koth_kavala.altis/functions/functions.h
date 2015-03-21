class CfgFunctions
{
	class KOTH
	{
		class player
		{
			file = "functions\player";
			class thirdPersonView {};
		};

		class event
		{
			file = "functions\event";
			class handlersKilled{};
			class handlersRespawn{};
			class handlersSetup{};
		};
		class network
		{
			file = "functions\network";
			class MPexec{};
			class MP{};
		};
		class system
		{
			file = "functions\system";
			class setupStats{};
			class setupLoadout{};
			class addStats{};
		};	
		class gui
		{
			file = "functions\gui";
			class hudUpdate{};
			class onKeyDown{};
			class onKeyUp{};
		};
	};
};