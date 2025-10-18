package haxewindow;

import sys.*;
import lime.app.Application;
import lime.graphics.Image;
import openfl.Assets;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import openfl.display.NativeWindow;

class HWindow
{
	var version:String = "1.1.2"; // If you need to get the current version of HWindow, it will be here.

	public static function changeTitle(name:String)
	{
		Application.current.window.title = name;
	}

	public static function addToTitle(value:String)
	{
		Application.current.window.title += value;
	}

	public static function setIcon(path:String)
	{
		var image = Assets.getBytes(path);
        var icon = Image.fromBytes(image);
        Application.current.window.setIcon(icon);
	}

	public static function offsetWindow(xOffset:Int, yOffset:Int)
	{
		Application.current.window.x += xOffset;
		Application.current.window.y += yOffset;
	}

	public static function bounceWindow(direction:String, pixels:Int, comebackDur:Float, easeType:EaseFunction)
	{
		switch (direction)
		{
			case "VERTICAL":
				Application.current.window.x += pixels;
				FlxTween.tween(Application.current.window, {x: Application.current.window.x - pixels}, dur, {ease: easeType});
			case "HORIZONTAL":
				Application.current.window.y += pixels;
				FlxTween.tween(Application.current.window, {y: Application.current.window.y - pixels}, dur, {ease: easeType});
		}
	}

	public static function minimize()
	{
		var mainWindow:NativeWindow = Application.current.window;
		mainWindow.minimize();
	}

	public static function closeWindow(code = 0)
	{
		Sys.exit(code);
	}
}
