function init()
    ? "[homeScene] init"

    m.homeScreen = m.top.findNode("Start")
    m.homeScreen.setFocus(true)

    m.game = m.top.findNode("gameScene")
    m.game.visible = false

    m.jeopardy = m.top.findNode("Trivia_logic")
    m.jeopardy.visible = false

    m.homeScreen.observeField("category_selected", "onCategorySelected")

    m.buttonIndex = -1
end function

sub onCategorySelected(obj)
    ? "onCategorySelected field: "; obj.getField()
    ? "onCategorySelected data: "; obj.getData()

    m.buttonIndex = obj.getData()

    if m.buttonIndex = 1 then
        m.homeScreen.visible = false
        m.game.visible = true

        m.homeScreen.setFocus(false)
        m.game.setFocus(true)
    end if

    if m.buttonIndex = 0 then
        m.homeScreen.visible = false
        m.game.visible = false
        m.jeopardy.visible = true

        m.homeScreen.setFocus(false)
        m.game.setFocus(false)
        m.jeopardy.setFocus(true)

    end if
end sub
function OnKeyEvent(key as String, press as Boolean) as Boolean

    result = false
    if press then
        if key = "back" then
            if m.jeopardy.visible then
                m.jeopardy.visible = false
                m.game.visible = false
                m.homeScreen.visible = true

                m.jeopardy.setFocus(false)
                m.game.setFocus(false)
                m.homeScreen.setFocus(true)
                m.homeScreen.callFunc("buttonFocus")

                result = true

            else if m.game.visible then
                m.game.visible = false
                m.jeopardy.visible = false
                m.homeScreen.visible = true

                m.jeopardy.setFocus(false)
                m.game.setFocus(false)
                m.homeScreen.setFocus(true)
                m.homeScreen.callFunc("buttonFocus")

                result = true
            end if
        end if
    end if
    return result
end function