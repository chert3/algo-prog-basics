# ДАНО: Робот находится в произвольной клетке ограниченного
# прямоугольного поля без внутренних перегородок и маркеров.
# РЕЗУЛЬТАТ: Робот — в исходном положении в центре косого креста из
# маркеров, расставленных вплоть до внешней рамки.

using HorizonSideRobots

function mark_direct!(robot, side)
    while !isborder(robot, side)
    move!(robot, side)
    putmarker!(robot)
    end
end

HorizonSideRobots.isborder(robor, side::NTuple{HorizonSide}) = isborder(robot, side[1]) || isborder(robot, side[2])
HorizonSideRobots.move!(robot, side::Any) = for s in side move!(robot, s) end
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))

function xcross!(robot, sides = (Nord, Ost, Sud, West))
    for s in sides
    n = mark_direct!(robot, s)
    move!(robot, inverse(s), n)
    end
end

#xcross!(r, ((Nord, Ost), (Sud, Ost), (Sud, West), (Nord, West)))

