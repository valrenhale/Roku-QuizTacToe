sub diagonalLeft()
    count = 0 
    isWin = true
    while count < m.gridArray.count() and isWin = true
        if m.x[count].visible = true then
            count = count + 4
            ? count
        else 
            isWin = false
        end if
    end while
    
    if count >= 8 then
        m.cursor.visible = false
    end if
end sub

sub diagonalRight()
    count = 2
    isWin = true
    while count < m.gridArray.count() - 2 and isWin = true
        if m.x[count].visible = true then
            count = count + 2
        else 
            isWin = false
        end if
    end while

    if count >= 6 then
        m.cursor.visible = false
    end if
end sub

sub horizontal()
for i = 0 to m.gridArray.count() - 1
    if m.x[i].visible= true
        if m.x[i+1].visible= true
            if m.x[i+2].visible=true
                m.cursor.visible = false
            end if
        end if
    end if 
end for

sub vertical()
    ' for same y coordinates 
end sub
