sub init()
    ' width and height of the screen
    deviceInfo = createObject("roDeviceInfo")
    m.scrWidth = deviceInfo.getDisplaySize().w
    m.scrHeight = deviceInfo.getDisplaySize().h

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
    m.cursor.setFocus(true)
    m.cursor.width = m.grid[0].width
    m.cursor.height = m.cursor.width
    m.cursor.translation = m.grid[0].translation

    ' a count variable to track the number of moves
    m.count = 0
end sub

' remote interaction setup
function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    hoi = m.grid[0].width
    if press then
        if key = "up"
            m.cursor.translation = [m.cursor.translation[0], m.cursor.translation[1] - hoi]
        else if key = "down"
            m.cursor.translation = [m.cursor.translation[0], m.cursor.translation[1] + hoi]
        else if key = "right"
            m.cursor.translation = [m.cursor.translation[0] + hoi, m.cursor.translation[1]]
        else if key = "left"
            m.cursor.translation = [m.cursor.translation[0] - hoi, m.cursor.translation[1]]
        else if key = "OK"
            displayXorY()
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
            if m.x[i].translation[0] = m.cursor.translation[0] and m.x[i].translation[1] = m.cursor.translation[1] then
                m.x[i].visible = true
            end if
        end for
    else
        for i = 0 to m.o.Count() - 1
            if m.o[i].translation[0] = m.cursor.translation[0] and m.o[i].translation[1] = m.cursor.translation[1] then
                m.o[i].visible = true
            end if
        end for
    end if
    m.count = m.count + 1
end sub