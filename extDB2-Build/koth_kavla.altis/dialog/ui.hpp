class statsScreen
{    
	idd = -1;
	duration = 1e+1000;
	fadeIn = 0;
	fadeOut = 0;
	name = "";
	onLoad = "uiNamespace setVariable ['statsDisplay', _this select 0];";
		
	class controls
	{
		class stats_west: KOTH_RscText
		{
			idc = 1001;
			type = 0;
			style = 0;
			font = "PuristaMedium";

			text = "0"; //--- ToDo: Localize;
			x = 0.836044 * safezoneW + safezoneX;
			y = 0.9481 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.0399999 * safezoneH;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,1,0.5};
		};
		class stats_east: KOTH_RscText
		{
			idc = 1002;
			type = 0;
			style = 0;
			font = "PuristaMedium";

			text = "0"; //--- ToDo: Localize;
			x = 0.895346 * safezoneW + safezoneX;
			y = 0.9481 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.0399999 * safezoneH;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0,0,0.5};
		};
		class stats_indep: KOTH_RscText
		{
			idc = 1003;
			type = 0;
			style = 0;
			font = "PuristaMedium";
	
			text = "0"; //--- ToDo: Localize;
			x = 0.954648 * safezoneW + safezoneX;
			y = 0.9481 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.0399999 * safezoneH;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,1,0,0.5};
		};
		class stats_pro: KOTH_RscState
		{
			idc = 1004;
			x = 0.862401 * safezoneW + safezoneX;
			y = 0.90609 * safezoneH + safezoneY;
			w = 0.131782 * safezoneW;
			h = 0.0280062 * safezoneH;
			colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class stats_level: KOTH_RscText
		{
			idc = 1005;
			text = "";
			x = 0.836044 * safezoneW + safezoneX;
			y = 0.90609 * safezoneH + safezoneY;
			w = 0.0263564 * safezoneW;
			h = 0.0280062 * safezoneH;
		};
		class stats_kd: KOTH_RscText
		{
			idc = 1006;
			text = "";
			x = 0.836044 * safezoneW + safezoneX;
			y = 0.864081 * safezoneH + safezoneY;
			w = 0.158139 * safezoneW;
			h = 0.0280062 * safezoneH;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class stats_protext: KOTH_RscText
		{
			idc = 1007;
			text = ""; //--- ToDo: Localize;
			x = 0.862401 * safezoneW + safezoneX;
			y = 0.90609 * safezoneH + safezoneY;
			w = 0.131782 * safezoneW;
			h = 0.0280062 * safezoneH;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 39) * 1)";
		};
	};
};


