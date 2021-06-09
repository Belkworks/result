local Result
do
  local _class_0
  local _base_0 = {
    resolve = function(self, ...)
      if self.Value then
        return 
      end
      self.Value = {
        ...
      }
      local _list_0 = self.Callbacks
      for _index_0 = 1, #_list_0 do
        local Fn = _list_0[_index_0]
        Fn(...)
      end
      self.Callbacks = nil
    end,
    result = function(self, Fn)
      if self.Value then
        return Fn(unpack(self.Value))
      else
        return table.insert(self.Callbacks, Fn)
      end
    end,
    hasResult = function(self)
      return self.Value ~= nil
    end,
    getResult = function(self)
      assert(self:hasResult(), 'cannot getResult until there is a result!')
      return unpack(self.Value)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self)
      self.Callbacks = { }
      self.resolver = function(...)
        return self:resolve(...)
      end
    end,
    __base = _base_0,
    __name = "Result"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Result = _class_0
  return _class_0
end
