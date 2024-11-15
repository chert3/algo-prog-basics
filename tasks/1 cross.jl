function cross!(robot::Robot)
    for side in [Nord,Ost,West,Sud]
        steps_in_direction = mark_direct!(robot, side)
        move!(robot, inverse(side), steps_in_direction)
    end
end

function mark_direct!(robot, side)::Int64
    n = 0
    while !isborder(robot, side)
    move!(robot, side)
    putmarker!(robot)
    n += 1
    end
    return n
end

HorizonSideRobots.move!(r, s, n) = for x in 1:n move!(r, s) end
inverse(side::HorizonSide) == HorizonSide(mod(Int(side)+2, 4))
