﻿package {
    
    import flash.display.Sprite;
    import flash.text.Font;
    import flash.text.FontType;
    import flash.text.FontStyle;
    import flash.external.ExternalInterface;
    
    public class getFonts extends Sprite
    {
        public function getFonts()
        {
            ExternalInterface.call('populateFontList', getDeviceFonts());
			//ExternalInterface.addCallback("getDeviceFonts", getDeviceFonts);
        }
        
        public function getDeviceFonts():Array
        {
            var embeddedAndDeviceFonts:Array = Font.enumerateFonts(true);
            
            var deviceFontNames:Array = [];
            for each (var font:Font in embeddedAndDeviceFonts)
            {
                if (font.fontType == FontType.EMBEDDED
                    || font.fontStyle != FontStyle.REGULAR
                    )
                    continue;
                deviceFontNames.push(font.fontName);
            }
            
            deviceFontNames.sort();
            return deviceFontNames;
        }
    }
}