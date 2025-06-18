sub win()
    m.winLabel= m.top.findNode("winLabel")
    for row = 0 to 2
        for col = 0 to 2
            if m.x[0].visible = true and m.x[1].visible and m.x[2].visible then
                ' col = col + 1 'increment col'
                 m.winLabel.visible = true
            end if
            if m.o[0].visible  and m.o[1].visible and m.o[2].visible = true then
                ' col = col + 1
                m.winLabel.visible = true
            end if
        end for
    end for
    for col = 0 to 2
        for row = 0 to 2
            if m.x[0].visible = true and m.x[1].visible and m.x[2].visible then
                ' row = row + 1 'increment row'
                m.winLabel.visible = true
            end if
            if m.o[0].visible  and m.o[1].visible and m.o[2].visible = true then
                ' row = row + 1
                m.winLabel.visible = true
            end if
        end for
    end for
    end if
end sub
