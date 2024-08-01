using System;
using PixelBeef;
using raylib_beef;
using raylib_beef.Types;
using PixelBeef.Core;
using PixelBeef.Components;
using Box2DBeef;
namespace SampleGame;

class Program
{
	static void Main(String[] args)
	{
		var game = scope Game();
		game.Scene = scope TestScene();
		game.Launch();
	}
}