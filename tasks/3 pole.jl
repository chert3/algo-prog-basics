

function pole!(robot)
   
    # робот идет в левую нижнюю клетку
    go_to_start!(robot, West)
    go_to_start!(robot, Sud)

    # робот маркирует поле
    while isborder(robot, Ost) == false
    markline!(robot, Nord)
    markline!(robot, Sud)
    end

end


function go_to_start!(robot, side)
    while isborder(robot, side) == false
        move!(robot, side)
    end
end


function markline!(robot, side)
    while isborder(robot, side) == false 
        putmarker!(robot)
        move!(robot, side)   
    end
    putmarker!(robot)
    move!(robot, Ost)
end

