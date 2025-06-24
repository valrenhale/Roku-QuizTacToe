sub createStart()
    ' Get device info for screen dimensions
    deviceInfo = createObject("roDeviceInfo")
    m.scrWidth = deviceInfo.getDisplaySize().w
    m.scrHeight = deviceInfo.getDisplaySize().h

    ' Setup the start screen image to fill the screen
    m.startScreenImage = m.top.findNode("startScreenImage")
    m.startScreenImage.width = m.scrWidth
    m.startScreenImage.height = m.scrHeight
    
    ' Set focus to the scene so it can receive key presses
    m.top.setFocus(true)
end sub

' Handle remote control input - any button press starts the game
function onPress(key as String, press as Boolean) as Boolean
    handled = false
    if press then
        ' Any key press starts the game
        m.top.startGame = true
        handled = true
    end if
    return handled
end function