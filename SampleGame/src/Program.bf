using System;
using PixelBeef;
using raylib_beef;
using raylib_beef.Types;
using PixelBeef.Core;
using PixelBeef.Components;
namespace TestGame;

class Program
{
	static void Main(String[] args)
	{
		var game = scope Game();
		game.Initialize();
		game.Scene = scope Scene();

		var texture = Raylib.LoadTexture("Assets/character.png");
		var sprite = Sprite(texture);

		var entity = new Player(sprite);
		entity.Transform.Position = Vector2(200,200);
		entity.Scene = game.Scene;

		game.Launch();
	}
}