function markdirect!(robot::Robot, TypeRobot::DataType, side)
    robot = MarkRobot{TypeRobot}(TypeRobot(robot))
    while !isborder(robot, side)
        trymove!(robot, side)
        putmarker!(robot)
    end
end

#Расставляет маркеры до границы (в заданных направлениях)
function markcross!(robot::Robot, TypeRobot::DataType, sides = (Nord, Ost, Sud, West))
    robot = MarkRobot{TypeRobot}(TypeRobot(robot))
    for s = sides
        n = markdirect!(robot, s)
        trymove!(robot, inverse(s), n)
    end
end

#Вызов функции косого креста
Robot(robot::XBorderRobot) = robot 
markcross!(robot, ((Nord, Ost), (Sud, Ost), (Sud, West), (Nord, West)))