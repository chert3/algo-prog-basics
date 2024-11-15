function snake!(stop_condition::Function, robot::Robot, TypeRobot::DataType, sides::NTuple{2, HorizonSide})
    robot = MarkRobot{TypeRobot}(TypeRobot(robot))
    s = side[1]
    while !stop_condition()
        movetoend!(()->stop_condition || isborder(robot, s), robot, s)
        if stop_condition()
            break
        end
        s = inverse(s)
        move!(robot, sides[2])
    end
end
chesmark!(robot::BorderRobot, N::Int) = snake!(ChessRobot{N}(robot, Coordinates(0,0)), (Ost, Nord)) do side
    isborder(robot, side) && isborder(robot, Nord) end