sub init()
    
    ? "[start_scene] init"
    
    ? "[home_scene] init"

    ' setup hidden start button
    m.hiddenStartButton = m.top.findNode("hiddenStartButton")
    m.hiddenStartButton.observeField("buttonSelected", "onHiddenStartButtonPressed")

    ' setup click screen timer
    m.clickScreenTimer = m.top.findNode("clickScreenTimer")
    m.clickScreenTimer.observeField("fire", "onClickScreenTimerFire")

    ' width and height of the screen
    deviceInfo = createObject("roDeviceInfo")
    m.scrWidth = deviceInfo.getDisplaySize().w
    m.scrHeight = deviceInfo.getDisplaySize().h

    m.startScreen = m.top.findNode("startscreen")
    m.startScreen.width = m.scrWidth
    m.startScreen.height = m.scrHeight

    m.clickScreen = m.top.findNode("clickScreen")
    m.clickScreen.width = m.scrWidth
    m.clickScreen.height = m.scrHeight

    ' initially show and focus the hidden button when on start screen
    m.hiddenStartButton.visible = true
    m.hiddenStartButton.setFocus(true)


    ' background setup
    m.background = m.top.findNode("background")
    m.background.width = m.scrWidth
    m.background.height= m.scrHeight

    ' grid setup
    m.grid = []
    m.gridContainer = m.top.findNode("gridContainer")
    gridSize = 0.25
    numCol = 3
    gridImg = "pkg:/images/grid.png"
    createGrid(m.grid, m.gridContainer, gridSize, numCol, gridImg)

    ' x setup
    m.x = []
    m.xContainer = m.top.findNode("xContainer")
    xSize = 0.25
    xImg = "pkg:/images/x.png"
    createGrid(m.x, m.xContainer, xSize, numCol, xImg)
    ' make x invisible
    for i = 0 to m.x.Count() - 1
        m.x[i].visible = false
    end for

    ' o setup
    m.o = []
    m.oContainer = m.top.findNode("oContainer")
    oSize = 0.25
    oImg = "pkg:/images/o.png"
    createGrid(m.o, m.oContainer, oSize, numCol, oImg)
    ' make o invisible
    for i = 0 to m.o.Count() - 1
        m.o[i].visible = false
    end for

    ' cursor setup
    m.cursor = m.top.findNode("cursor")
    m.cursor.width = m.grid[0].width
    m.cursor.height = m.cursor.width
    m.cursor.translation = m.grid[0].translation 
    m.numRows = 3
    m.numCols = 3
    m.cursorRow = 0
    m.cursorCol = 0
    m.cursor.visible = false

    ' a count variable to track the number of moves
    m.count = 0    
    
    'win label setup
    m.winLabel = m.top.findNode("winLabel")
    m.winLabel.font.size = 50

    m.audio = createObject("roSGNode", "Audio")
    m.audioContent = createObject("RoSGNode", "ContentNode")
    m.audioContent.url = "https://audio.jukehost.co.uk/eAuwXAPByXT38nMsNOEyDShJW2nLjIrk"
    m.audio.content = m.audioContent
    m.audio.control = "play"
    m.audio.loop = true
end sub

sub openGame()
    buttonIndex = m.startButton.buttonSelected
    if buttonIndex = 0
        m.startButton.visible = false
        m.startScreen.visible = false
        m.background.visible = true
        m.cursor.visible = true
        m.cursor.setFocus(true)
        m.gridArray.visible = true
    end if
end sub

' remote interaction setup
function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    hoi = m.grid[0].width
    
    if press then
        ' Only handle game controls when not on start screen
        if m.startScreen.visible = false and m.clickScreen.visible = false then
            if key = "up" and m.cursorRow > 0
                m.cursorRow = m.cursorRow - 1
                m.cursor.translation = [m.cursor.translation[0], m.cursor.translation[1] - hoi]
                handled = true
            else if key = "down" and m.cursorRow < m.numRows - 1
                m.cursorRow = m.cursorRow + 1
                m.cursor.translation = [m.cursor.translation[0], m.cursor.translation[1] + hoi]
                handled = true
            else if key = "right" and m.cursorCol < m.numCols - 1
                m.cursorCol = m.cursorCol + 1
                m.cursor.translation = [m.cursor.translation[0] + hoi, m.cursor.translation[1]]
                handled = true
            else if key = "left" and m.cursorCol > 0
                m.cursorCol = m.cursorCol - 1
                m.cursor.translation = [m.cursor.translation[0] - hoi, m.cursor.translation[1]]
                handled = true
            else if key = "OK"
                displayXorY()
                handled = true
            end if
        end if
    end if
    
    return handled
end function

' create a grid of posters
sub createGrid(gridArray as Object, container as Object, gridSize as Float, numCol as Integer, imgUri as String)
    ' create the posters
    for i = 0 to (numCol * numCol) - 1
        gridArray.Push(CreateObject("roSGNode", "Poster"))
        gridArray[i].uri = imgUri
        gridArray[i].height = gridSize * m.scrHeight
        gridArray[i].width = gridArray[i].height
        gridArray[i].visible = false
        container.appendChild(gridArray[i])
    end for
    ' calculate the initial coordinates
    xCoor = m.scrWidth/2 - 1.5 * gridArray[0].width
    yCoor = m.scrHeight/2 - 1.5 * gridArray[0].height
    ' place the posters
    for i = 0 to gridArray.Count() - 1
        gridArray[i].translation = [xCoor, yCoor]
        if (i + 1) MOD numCol = 0 then
            xCoor = m.scrWidth/2 - 1.5 * gridArray[0].width
            yCoor = yCoor + gridArray[0].height
        else
            xCoor = xCoor + gridArray[0].width
        end if
    end for
end sub

' display x or y as appropriate
sub displayXorY()
    if m.count MOD 2 = 0 then
        for i = 0 to m.x.Count() - 1
            if m.x[i].visible = false and m.o[i].visible = false then
                if m.x[i].translation[0] = m.cursor.translation[0] and m.x[i].translation[1] = m.cursor.translation[1] then
                    m.x[i].visible = true
                    m.count = m.count + 1
                end if
            end if
        end for
        win()
    else
        for i = 0 to m.o.Count() - 1
            if m.x[i].visible = false and m.o[i].visible = false then
                if m.o[i].translation[0] = m.cursor.translation[0] and m.o[i].translation[1] = m.cursor.translation[1] then
                    m.o[i].visible = true
                    m.count = m.count + 1
                end if
            end if
        end for
        win()
    end if
end sub

sub helperX(pos1, pos2, pos3)
    if m.x[pos1].visible and m.x[pos2].visible and m.x[pos3].visible then
        m.winLabel.text = "X Wins!"
    end if 
end sub 

sub helperO(pos1, pos2, pos3)
    if m.o[pos1].visible and m.o[pos2].visible and m.o[pos3].visible then
        m.winLabel.text = "O Wins!"
    end if 
end sub 

sub helperTie()
    if m.count = 9 then
        m.winLabel.text = "It's a Tie!"
        m.cursor.visible = false
    end if
end sub

' Simplified vertical win check
sub vertical()
    for i = 0 to 2
        if m.x[i].visible and m.x[i+3].visible and m.x[i+6].visible then
            m.cursor.visible = false
            helperX(i, i+3, i+6)
            
        else if m.o[i].visible and m.o[i+3].visible and m.o[i+6].visible then
            m.cursor.visible = false
            helperO(i, i+3, i+6)
        end if
    end for
end sub

'Simplified horizontal win check'
sub horizontal()
    for i = 0 to 6 step 3 
        if m.x[i].visible and m.x[i+1].visible and m.x[i+2].visible then
            m.cursor.visible = false
            helperX(i, i+1, i+2)
            
        else if m.o[i].visible and m.o[i+1].visible and m.o[i+2].visible then
            m.cursor.visible = false
            helperO(i, i+1, i+2)
        end if
    end for
end sub

sub diagonal()
    if (m.x[0].visible and m.x[4].visible and m.x[8].visible) then
        m.cursor.visible = false
        helperX(0, 4, 8)
    else if (m.o[0].visible and m.o[4].visible and m.o[8].visible) then
        m.cursor.visible = false
        helperO(0, 4, 8)
    else if m.x[2].visible and m.x[4].visible and m.x[6].visible then 
        m.cursor.visible = false
        helperX(2, 4, 6)
    else if (m.o[2].visible and m.o[4].visible and m.o[6].visible) then
        m.cursor.visible = false
        helperO(2, 4, 6)
    end if
end sub

sub win()
    helperTie()
    horizontal()
    vertical()
    diagonal()
    if m.winLabel.text <> "" then
        m.cursor.setFocus(false)
    end if
end sub 

' Function to make all game elements visible
sub showGameElements()
    m.background.visible = true
    m.gridContainer.visible = true  ' Show the grid
    for i = 0 to m.grid.Count() - 1
        m.grid[i].visible = true
    end for
    m.cursor.visible = true
    m.cursor.setFocus(true)
end sub

sub onHiddenStartButtonPressed()
    ' Hide start screen and show click screen
    m.startScreen.visible = false
    m.hiddenStartButton.visible = false
    m.clickScreen.visible = true
    
    ' Start timer for 0.5 seconds
    m.clickScreenTimer.control = "start"
end sub

sub onClickScreenTimerFire()
    ' Hide click screen and show game elements after 0.5 seconds
    m.clickScreen.visible = false
    showGameElements()
end sub
