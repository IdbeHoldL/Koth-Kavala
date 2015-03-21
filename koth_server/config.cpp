class DefaultEventhandlers;

class CfgPatches 
{
	class koth_server
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		fileName = "koth_server.pbo";
		author[]= {"BAROD"}; 
	};
};

class CfgFunctions
{
	class HIVE
	{
		class extDB
		{
			file = "\koth_server\functions\extdb";
			class async{};
			class strip{};
		};
		
		class player
		{
			file = "\koth_server\functions\player";
			class loadLoadout{};
			class loadStats{};
			class saveLoadout{};
			class saveStats{};
		};

		class serverEvents
		{
			file = "\koth_server\functions\event";
			class handleDisconnect {};
			class onKilled {};
		};
	};
};
