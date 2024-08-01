using Box2DBeef;
using raylib_beef.Types;
namespace PixelBeef;

class World
{
	internal b2WorldId WorldId { get; private set; }
	private b2WorldDef _worldDef;

	public Vector2 Gravity
	{
		get => _worldDef.gravity.ToEngine();
		set => _worldDef.gravity = value.ToBox2d();
	}

	public this(Vector2 gravity)
	{
		_worldDef = b2DefaultWorldDef();
		_worldDef.gravity = b2Vec2(gravity.x, gravity.y);
		WorldId = b2CreateWorld(&_worldDef);
	}

	public this() : this(Vector2(0f, -10.0f)) {}
}