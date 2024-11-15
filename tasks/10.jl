

function pole_shag!(robot, bigN)
   
    count = 1
    smallN = 0


    # робот идет в левую нижнюю клетку
    go_to_start!(robot, West)
    go_to_start!(robot, Sud)

    # робот маркирует поле
    while smallN != bigN
    count = markline!(robot, Nord, count, smallN)
    count += 1
    count = markline!(robot, Sud, count, smallN)
    end

end


function go_to_start!(robot, side)
    while isborder(robot, side) == false
        move!(robot, side)
    end
end


function markline!(robot, side, count_chet, smallN)
    while smallN != bigN 
        if count_chet % 2 == 0
            putmarker!(robot)
        end
        move!(robot, side)
        count_chet += 1  
        smallN += 1
    end
    
    if count_chet % 2 == 0
        putmarker!(robot)
        count_chet += 1
    end
    move!(robot, Ost)
    return count_chet, smallN
end

