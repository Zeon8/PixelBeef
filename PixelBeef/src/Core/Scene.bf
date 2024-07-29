using System;
using System.Collections;
using internal PixelBeef;

namespace PixelBeef.Core;

public class Scene
{
    public ObservableCollection<Entity> Entities { get; } = new .() ~ DeleteContainerAndItems!(_);

	private readonly Queue<Entity> _startEntities = new .() ~ delete _;
	private readonly Queue<Entity> _deleteEntities = new .() ~ delete _;
	private readonly List<EntityComponent> _startComponents = new .() ~ delete _;

	public this()
	{
		Entities.CollectionChanged.Add(new (sender, e) => {
			if(e.AddedItem != null)
				_startEntities.Add(e.AddedItem);
		});
	}

    internal void Update()
    {
		while(_startEntities.Count > 0)
			_startEntities.PopFront().StartInternal();

		for(var component in _startComponents)
		{
			if(component.IsEnabled)
			{
				component.Start();
				_startComponents.Remove(component);
			}
		}
		
        for (var entity in Entities)
            entity.UpdateInternal();

		while(_deleteEntities.Count > 0)
			delete _deleteEntities.PopFront();
    }

    internal void Draw()
    {
        for (var entity in Entities)
            entity.DrawInternal();
    }

	public void StartComponent(EntityComponent component)
	{
		_startComponents.Add(component);
	}

	public void DeleteEntity(Entity entity)
	{
		entity.Scene = null;
		_deleteEntities.Add(entity);
	}
}