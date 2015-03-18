class CfgFunctions
{
	class KOTH
	{
		class client
		{
			file = "functions\client";
			class hudUpdate{};
			class playerMarker {};
			class thirdPersonView {};
			class loadout{};
			class addStats{};
			class addEventhandlers{};
			class setupStats{};
			class setupLoadout{};
		};

		class event
		{
			file = "functions\event";
			class killed{};
			class spawn{};
		};
		class network
		{
			file = "functions\network";
			class MPexec{};
			class MP{};
		};
	};
};