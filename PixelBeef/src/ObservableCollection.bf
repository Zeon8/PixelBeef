using System.Collections;
using System;
using internal PixelBeef;
namespace PixelBeef;

enum CollecionChangeType
{
	Add,
	Remove,
	Clear
}

class CollectionChangedArgs<T>
{
	public CollecionChangeType Type { get; internal set; }
	public T AddedItem { get; internal set; }
	public T RemovedItem { get; internal set; }
}

class ObservableCollection<T> : ICollection<T>, IEnumerable<T>
{
	public Event<EventHandler<CollectionChangedArgs<T>>> CollectionChanged ~ _.Dispose();

	private List<T> _list = new .() ~ delete _;

	public int Count => _list.Count;

	public void Add(T item)
	{
		_list.Add(item);

		var args = scope CollectionChangedArgs<T>();
		args.Type = .Add;
		args.AddedItem = item;
		CollectionChanged.Invoke(this, args);
	}

	public void Clear()
	{
		_list.Clear();

		var args = scope CollectionChangedArgs<T>();
		args.Type = .Clear;
		CollectionChanged.Invoke(this, args);
	}

	public bool Contains(T item)
	{
		return _list.Contains(item);
	}

	public void CopyTo(System.Span<T> span)
	{
		_list.CopyTo(span);
	}

	public bool Remove(T item)
	{
		bool success = _list.Remove(item);

		var args = scope CollectionChangedArgs<T>();
		args.Type = .Remove;
		args.RemovedItem = item;
		CollectionChanged.Invoke(this, args);
		return success;
	}

	public List<T>.Enumerator GetEnumerator()
	{
		return _list.GetEnumerator();
	}
}