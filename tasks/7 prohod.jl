function prohod!(r)
    while !isborder(r, West)
        move!(r, West)
    end

    while isborder(r, Nord)
        move!(r, Ost)
    end

end
