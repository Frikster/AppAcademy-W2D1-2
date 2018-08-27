shawna = Employee.new("shawna", "TA", 12000, "darren")
david = Employee.new("david", "TA", 10000, "darren")
darren = Manager.new("darren", "TA Manager", 78000, "ned", [shawna, david]
ned = Manager.new("ned", "Founder", 1000000, nil, [darren])
