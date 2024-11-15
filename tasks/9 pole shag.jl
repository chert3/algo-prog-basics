

function pole_shag!(robot)
   
    count = 1

    # робот идет в левую нижнюю клетку
    go_to_start!(robot, West)
    go_to_start!(robot, Sud)

    # робот маркирует поле
    while isborder(robot, Ost) == false
    count = markline!(robot, Nord, count)
    count += 1
    count = markline!(robot, Sud, count)
    end

end


function go_to_start!(robot, side)
    while isborder(robot, side) == false
        move!(robot, side)
    end
end


function markline!(robot, side, count_chet)
    while isborder(robot, side) == false 
        if count_chet % 2 == 0
            putmarker!(robot)
        end
        move!(robot, side)
        count_chet += 1  
    end
    
    if count_chet % 2 == 0
        putmarker!(robot)
        count_chet += 1
    end
    move!(robot, Ost)
    return count_chet
end

