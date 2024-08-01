using System;
using Box2DBeef;
namespace PixelBeef;

class Simulation
{
	public float TimeStep { get; set; } = 1.0f / 60.0f;
	public int32 SubStepCount { get; set; } = 4;

	private World _world;

	public this(World world)
	{
		_world = world;
	}

	public void Update()
	{
		b2World_Step(_world.[Friend]WorldId, TimeStep, SubStepCount);
	}
}