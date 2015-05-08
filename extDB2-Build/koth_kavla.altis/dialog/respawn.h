class KOTH_RespawnDialog
{
	idd = 1000;
	name = "KOTH_RespawnDialog";
	movingEnabled = false;
	enableSimulation = true;
	
	class controls
	{
		class Respawn_Text: KOTH_RscText
		{
			idc = 1001;
			text = "You Are Unconscious";
			x = 0.374807 * safezoneW + safezoneX;
			y = 0.710047 * safezoneH + safezoneY;
			w = 0.276742 * safezoneW;
			h = 0.0560125 * safezoneH;
			shadow = 0;
			sizeEx = 0.08;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,0.7};
		};
		class Respawn_Button : KOTH_RscButton
		{
			idc = 1002;
			text = "Respawn";
			x = 0.434109 * safezoneW + safezoneX;
			y = 0.850078 * safezoneH + safezoneY;
			w = 0.131782 * safezoneW;
			h = 0.0280062 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])", "(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])", "(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])", "(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
			action = "closeDialog 0; setPlayerRespawnTime 15;";
		};
	};
};