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
		var childEntity = new Entity(Vector2(100,100));
		childEntity.Components.Add(new SpriteComponent(Sprite(texture, Rectangle(0,0,24,24))));

		var entity = new Entity(Vector2(100,100));
		entity.Scene = game.Scene;
		entity.Components.Add(new SpriteComponent(Sprite(texture, Rectangle(0,0,24,24))));
		entity.Components.Add(new PlayerMovement(childEntity, texture));
		childEntity.Get<TransformComponent>().Parent = entity.Get<TransformComponent>();

		game.Launch();
	}
}