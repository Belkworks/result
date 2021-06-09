-- easy.moon
-- SFZILabs 2021

class Result
	new: =>
		@Callbacks = {}
		@resolver = (...) -> @resolve ...

	resolve: (...) =>
		return if @Value
		@Value = { ... }
		Fn ... for Fn in *@Callbacks
		@Callbacks = nil	

	result: (Fn) =>
		if @Value
			Fn unpack @Value
		else table.insert @Callbacks, Fn

	hasResult: =>
		@Value != nil

	getResult: =>
		assert @hasResult!, 'cannot getResult until there is a result!'
		unpack @Value
