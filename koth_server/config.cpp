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
	class KOTH_Server
	{
		tag = "BAROD";
		class extdb
		{
			file = "koth_server\functions\extdb";
			class async{};
			class extdb{};
			class strip{};
		};	
		class game
		{
			file = "koth_server\functions\game";
			class config{};
			class marker{};
			class zone{};
		};		
		class player
		{
			file = "koth_server\functions\player";
			class playerLoad{};
			class playerSave{};
		};	
	};
};
