

function main!(robot)
    
    sides = [Ost, Sud, West, Nord]
    steps_made_to_border = 0
    count = 0
        
    # робот идет вверх до границы
    while isborder(robot, sides[4]) == false
        move!(robot, Nord)
        steps_made_to_border += 1
    end

    # робот ставит маркеры по периметру
    for s in sides 
        count = markline!(robot, s, count)
    end
    
    while ismarker(robot) == false
        putmarker!(robot)
        move!(robot, sides[1])
    end

    # робот возвращается в исходную точку
    for _ in 1:steps_made_to_border
        move!(robot, sides[2])
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
    return count_chet

end

