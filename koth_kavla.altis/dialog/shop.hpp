class koth_shop {
	idd = 1000;
	name= "koth_shop";
	movingEnable = true;
	enableSimulation = true;

	class controlsBackground {
		class BackgroundHeader: KOTH_RscText
		{
			idc = 1001;
			x = 0.328683 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.329455 * safezoneW;
			h = 0.476106 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
	};
	class controls 
	{
		class Title: KOTH_RscText
		{
			idc = 1002;
			text = "";
			x = 0.328683 * safezoneW + safezoneX;
			y = 0.289953 * safezoneH + safezoneY;
			w = 0.329455 * safezoneW;
			h = 0.0280062 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class ShopList: KOTH_RscListBox
		{
			idc = 1003;
			x = 0.335272 * safezoneW + safezoneX;
			y = 0.331963 * safezoneH + safezoneY;
			w = 0.316277 * safezoneW;
			h = 0.420094 * safezoneH;
		};
		class ShopBuy: KOTH_RscButtonMenu
		{
			idc = 1004;
			text = "Buy"; //--- ToDo: Localize;
			x = 0.546124 * safezoneW + safezoneX;
			y = 0.766059 * safezoneH + safezoneY;
			w = 0.112015 * safezoneW;
			h = 0.0280062 * safezoneH;
			onButtonClick = "[] spawn KOTH_fnc_shopBuy;";
		};
		class ShopCancel: KOTH_RscButtonMenu
		{
			idc = 1005;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.328683 * safezoneW + safezoneX;
			y =	0.766059 * safezoneH + safezoneY;
			w = 0.131782 * safezoneW;
			h = 0.0280062 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
	};
};
