TestSwitch = {

	setupClass = function ()
		class "ExampleA" {}
		class "ExampleB" {}
	end;

	teardownClass = function ()
		_G['ExampleA'] = nil
		_G['ExampleB'] = nil
	end;

	test_statement = function ()
		local var
		switch (2) {
			[1] = function ()
				var = 1
			end;
			[2] = function ()
				var = 2
			end;
			[3] = function ()
				var = 3
			end;
		}
		LuaUnit.assertEquals(var, 2)
	end;

	test_multiple = function ()
		local var
		local val = "c"
		switch (val) {
			[{"a", "b"}] = function ()
				var = "a, b"
			end;
			[{"c", "d"}] = function ()
				var = val
			end;
			e = function ()
				var = "e"
			end;
		}
		LuaUnit.assertEquals(var, "c")
	end;

	test_expression = function ()
		local var = switch "b" {
			a = 1;
			b = 2;
			c = 3;
		}
		LuaUnit.assertEquals(var, 2)
	end;

	test_instance = function ()
		local objA = ExampleA()
		local objB = ExampleB()
		local val = objB
		local var
		switch (val) {
			[objA] = function ()
				var = "A"
			end;
			[objB] = function ()
				var = "B"
			end;
		}
		LuaUnit.assertEquals(var, "B")
	end;

	test_default = function ()
		local var
		switch ("c") {
			a = function ()
				var = "a"
			end;
			b = function ()
				var = "b"
			end;
			[default] = function ()
				var = "c"
			end;
		}
		LuaUnit.assertEquals(var, "c")
	end;

	test_notMatch = function ()
		local var = 0
		switch ("d") {
			a = function ()
				var = "a"
			end;
		}
		LuaUnit.assertEquals(var, 0)
	end;
}
