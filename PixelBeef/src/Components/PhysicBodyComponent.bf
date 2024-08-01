using PixelBeef.Core;
using Box2DBeef;
using System;
using raylib_beef.Types;
using PixelBeef.Shapes;
using PixelBeef;
using internal PixelBeef;
namespace PixelBeef.Components;

class PhysicBodyComponent : EntityComponent
{
	public float Density{ get; set; } = 1f;

	public float Friction { get; set; } = 0.3f;

	public float Restrition { get; set; }

	public IShape Shape { get; set; } ~ delete _;

	public BodyType BodyType { get; set; }

	public Vector2 Velocity
	{
		get => b2Body_GetLinearVelocity(_bodyId).ToEngine();
		set => b2Body_SetLinearVelocity(_bodyId, value.ToBox2d());
	}

	private b2BodyDef _bodyDef;
	private b2BodyId _bodyId;
	private b2ShapeDef _shapeDef;

	public this(BodyType bodyType, IShape shape)
	{
		BodyType = bodyType;
		Shape = shape;
	}

	public override void Start()
	{
		_bodyDef = b2DefaultBodyDef();
		_bodyDef.type = (b2BodyType)BodyType;
		_bodyDef.position = Entity.Transform.Position.ToBox2d();

		_bodyId = b2CreateBody(Game.World.WorldId, &_bodyDef);

		_shapeDef = b2DefaultShapeDef();
		_shapeDef.density = Density;
		_shapeDef.friction = Friction;

		b2Polygon polygon = Shape.Create();
		b2CreatePolygonShape(_bodyId, &_shapeDef, &polygon);
	}

	public override void Update()
	{
		b2Vec2 position = b2Body_GetPosition(_bodyId);
		Entity.Transform.Position = position.ToEngine();
		b2Rot rotation = b2Body_GetRotation(_bodyId);
		Entity.Transform.Rotation = rotation.ToAngle();
	}

	public void ApplyForce(Vector2 force, Vector2 point, bool wake)
	{
		b2Body_ApplyForce(_bodyId, force.ToBox2d(), point.ToBox2d(), wake);
	}

	public void ApplyForceToCenter(Vector2 force, bool wake)
	{
		b2Body_ApplyForceToCenter(_bodyId, force.ToBox2d(), wake);
	}
}

public enum BodyType : int32
{
    StaticBody = 0,
    KinematicBody = 1,
    DynamicBody = 2,
}