sub horizontal() 
    ' check for horizontal win for x' 
    if (m.x[0].visible and m.x[1].visible and m.x[2].visible) or (m.o[0].visible and m.o[1].visible and m.o[2].visible) then
        m.cursor.visible = false
    else if (m.x[3].visible and m.x[4].visible and m.x[5].visible) or (m.o[3].visible and m.o[4].visible and m.o[5].visible) then
        m.cursor.visible = false
    else if (m.x[6].visible and m.x[7].visible and m.x[8].visible) or (m.o[6].visible and m.o[7].visible and m.o[8].visible) then
        m.cursor.visible = false
    end if
end sub

sub vertical()
    if (m.x[0].visible and m.x[3].visible and m.x[6].visible) then
        m.cursor.visible = false
        helperX(0, 3, 6)  
    else if (m.o[0].visible and m.o[3].visible and m.o[6].visible) then
        m.cursor.visible = false
        helperO(0, 3, 6)
    else if (m.x[1].visible and m.x[4].visible and m.x[7].visible) then 
        m.cursor.visible = false
        helperX(1, 4, 7)
    else if (m.o[1].visible and m.o[4].visible and m.o[7].visible) then
        m.cursor.visible = false
        helperO(1, 4, 7)      
    else if (m.x[2].visible and m.x[5].visible and m.x[8].visible) then
        m.cursor.visible = false
        helperX(2, 5, 8)
    else if (m.o[2].visible and m.o[5].visible and m.o[8].visible) then
        m.cursor.visible = false
        helperO(2, 5, 8)
    end if
end sub
