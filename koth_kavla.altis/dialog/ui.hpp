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
		class statsxp
		{    
			idc = 1000;
			type = 0;
			style = 0;
				
			text = "0";
			x = 0.85 * safezoneW + safezoneX;
			y = 0.87 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.04 * safezoneH;
				
			font = "PuristaMedium";
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};  
		class statskills
		{    
			idc = 1001;
			type = 0;
			style = 0;
				
			text = "0";
			x = 0.85 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.04 * safezoneH;
				
			font = "PuristaMedium";
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class statsblu
		{    
			idc = 1002;
			type = 0;
			style = 0;
				
			text = "0";
			x = 0.85 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.04 * safezoneH;
				
			font = "PuristaMedium";
			sizeEx = 0.07;
			colorBackground[] = {0,0,1,0.5};
			colorText[] = {1,1,1,1};
		};
		class statsred
		{    
			idc = 1003;
			type = 0;
			style = 0;
				
			text = "0";
			x = 0.9 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.04 * safezoneH;
				
			font = "PuristaMedium";
			sizeEx = 0.07;
			colorBackground[] = {1,0,0,0.5};
			colorText[] = {1,1,1,1};
		};
		class statsind
		{    
			idc = 1004;
			type = 0;
			style = 0;
				
			text = "0";
			x = 0.95 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.04 * safezoneH;
			
			font = "PuristaMedium";
			sizeEx = 0.07;
			colorBackground[] = {0,1,0,0.5};
			colorText[] = {1,1,1,1};
		};	
	};
};