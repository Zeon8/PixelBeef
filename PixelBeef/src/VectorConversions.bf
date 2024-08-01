using Box2DBeef;
using raylib_beef.Types;
using System;
namespace PixelBeef;

static
{
	[Inline]
	public static Vector2 ToEngine(this b2Vec2 vector)
	{
		return Vector2(vector.x, vector.y);
	}

	[Inline]
	public static b2Vec2 ToBox2d(this Vector2 vector)
	{
		return b2Vec2(vector.x, vector.y);
	}

	[Inline]
	public static float ToAngle(this b2Rot rotation)
	{
		return Math.Atan2(rotation.s, rotation.s);
	}
}