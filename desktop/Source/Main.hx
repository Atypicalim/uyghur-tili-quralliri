package;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;

import openfl.text.*;
import openfl.events.*;

class Main extends Sprite
{
	public function new()
	{
		super();
		//
        var bitmapData = Assets.getBitmapData ("assets/sancar_nare.jpg");
        var bitmap = new Bitmap (bitmapData);
        addChild (bitmap);
		//
        bitmap.x = (stage.stageWidth - bitmap.width) / 2;
        bitmap.y = (stage.stageHeight - bitmap.height) / 2;
		//
		// https://api.openfl.org/openfl/text/TextField.html
		//
		var font : Font = Font.fromFile("assets/alkatip_tor_tom.ttf");
		var format : TextFormat = new TextFormat();
		format.color = 0xffff00;
		format.align = "center";
		format.font = font.fontName;
		format.size = 36;
		format.leftMargin = 0;
		format.rightMargin = 0;
		//
        var text : TextField = new TextField();
        text.text = "ﺕﻪﻴﯩﺌﻣﻪﺟ";
		text.type = TextFieldType.INPUT; // DYNAMIC
        text.autoSize = TextFieldAutoSize.LEFT;
		text.multiline = true;
		//
        text.background = true;
        text.backgroundColor = 0x222222;
		text.border = true;
		text.borderColor = 0x000000;
		//
        addChild(text);
        text.x = (stage.stageWidth - text.width) / 2;
        text.y = (stage.stageHeight - text.height) / 2;
		//
		text.embedFonts = true;
		text.setTextFormat(format);
		//
		this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		this.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}

	private function onKeyDown(evt:KeyboardEvent):Void {
		trace("Char code: " + evt.charCode);
		trace("Key code: " + evt.keyCode);
	}

	private function onKeyUp(evt:KeyboardEvent):Void {
	}

}
