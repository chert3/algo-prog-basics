using HorizonSideRobots

mutable struct Coordinates
    x::Int
    y::Int
end
coord = Coordinates(0, 0)

function HorizonSideRobots.move!(coord::Coordinates, side::HorizonSide)
    if side == Nord
        coord.y += 1
    elseif side == Sud
        coord.y -= 1
    elseif side == Ost
        coord.x += 1
    else #if side == West
        coord.x -= 1
    end
    nothing
end

mutable struct ChessRobot{N}
    robot::Robot
    coord::Coordinates
end

HorizonSideRobot.isborder(robot::ChessRobot, side) = isborder(robot.robot, side)

function HorizonSideRobots.move!(robot::ChessRobot{N}, side) where N <:
    Integer
    x = robot.coord.x % 2N
    y = robot.coord.y % 2N
    if ((x in 0:N-1) && (y in 0:N-1)) || ((x in N:2N-1) && (x in N:2N-1))
        putmarker!(robot.robot)
    end
    move!(robot.robot, side)
end

function snake!(stop_condition::Function, robot, sides::NTuple{2, HorizonSide})
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

chesmark!(robot::Robot, N::Int) = snake!(ChessRobot{N}(robot, Coordinates(0,0)), (Ost, Nord)) do side
    isborder(robot, side) && isborder(robot, Nord) end
