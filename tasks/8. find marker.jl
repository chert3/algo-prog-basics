# function findmarker!(robot)
#     max_n = 0
#     side = Nord
#     while !findmarker!(robot, side, max_n)
#         side = left(side)
#         (side in (nord, Sud)) && (max_n += 1)
#     end
# end

# function findmarker!(robot, side, max_n)::Bool
#     for _ in 0:max_n
#         ismarker(robot) && return true
#         move!(robot, side)
#     end
#     return ismarker(robot)
# end

function spiral!(r)
    n_vert = 1
    n_hor = 1
    while ismarker(r)
        for x in 1:n_vert
            move!(r, Nord)
            n_vert += 1
            putmarker!(r)
        end
        for x in 1:n_hor
            move!(r, West)
            n_hor += 1
            putmarker!(r)
        end
        for x in 1:n_vert
            move!(r, Sud)
            
            putmarker!(r)
        end
        for x in 1:n_hor
            move!(r, Ost)
            
            putmarker!(r)
        end
    end



end
