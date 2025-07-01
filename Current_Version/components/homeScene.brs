sub init()
    ? "[start_scene] init"
    
    ? "[home_scene] init"

    ? "[xWin_scene] init"

    ? "[oWin_scene] init"
    'q bank and a bank setup for TorF'
    m.questionBankTorF = CreateObject("roList")
    m.questionBankTorF.AddTail("The sky is blue because of the ocean's reflection")
    m.questionBankTorF.AddTail("Humans will die within 3 hours of not having water")
    m.questionBankTorF.AddTail("Vending machines are more deadly than sharks")
    m.questionBankTorF.AddTail("India has 22 official languages")
    m.questionBankTorF.AddTail("Water constantly breaks into H and OH molecules then recombines into H2O")
    m.questionBankTorF.AddTail("Norway and North Korea are only one country apart")
    m.questionBankTorF.AddTail("LA28 is the first time the Summer Olympics will be held in the US")
    m.questionBankTorF.AddTail("Hamburgers and fries are purely American")
    m.questionBankTorF.AddTail("Paris is the city with the most French speakers")
    m.questionBankTorF.AddTail("Mammoths were extinct before the pyramids were built")
    m.questionBankTorF.AddTail("Cleopatra lived closer to the invention of the iPhone than to the building of the pyramids")
    m.questionBankTorF.AddTail("John Tyler's (President from 1841-1845) last grandson died in May 2025")
    m.questionBankTorF.AddTail("The US was colonized by the British, Dutch, Spanish, French, and Swedish")
    m.questionBankTorF.AddTail("Kids born on US military bases are US citizens")
    m.questionBankTorF.AddTail("The official language of the US has always been English")

    m.answerBankTorF = CreateObject("roList")
    m.answerBankTorF.AddTail("False")
    m.answerBankTorF.AddTail("False")
    m.answerBankTorF.AddTail("True")
    m.answerBankTorF.AddTail("True")
    m.answerBankTorF.AddTail("True")
    m.answerBankTorF.AddTail("True")
    m.answerBankTorF.AddTail("False")
    m.answerBankTorF.AddTail("False")
    m.answerBankTorF.AddTail("False")
    m.answerBankTorF.AddTail("False")
    m.answerBankTorF.AddTail("True")
    m.answerBankTorF.AddTail("True")
    m.answerBankTorF.AddTail("True")
    m.answerBankTorF.AddTail("False")
    m.answerBankTorF.AddTail("False")


    'q bank and a bank setup for MCQ'
    m.questionBankMCQ = createObject("roList")
    m.questionBankMCQ.AddTail("Where was Michael B Jordan born")
    m.questionBankMCQ.AddTail("What is the capital of Canada?")
    m.questionBankMCQ.AddTail("Where is Microsoft headquartered?")
    m.questionBankMCQ.AddTail("What is the largest pizza chain in the world?")
    m.questionBankMCQ.AddTail("What is the chemical symbol for gold?")
    m.questionBankMCQ.AddTail("What country did Indonesia get independence from?")
    m.questionBankMCQ.AddTail("What country is Rihanna from?")
    m.questionBankMCQ.AddTail("What language does Liechtenstein speak?")
    m.questionBankMCQ.AddTail("How many countries speak French officially?")
    m.questionBankMCQ.AddTail("What is the lifespan of a rhino?")
    m.questionBankMCQ.AddTail("What is the currency of Japan?")
    m.questionBankMCQ.AddTail("Who was the father of genetics?")
    m.questionBankMCQ.AddTail("Who won the Nobel Prize with Malala Yousafzai?")
    m.questionBankMCQ.AddTail("Which soccer player is nicknamed 'the Golden Boy' in Spanish")
    m.questionBankMCQ.AddTail("What is the largest lake on Earth?")

    m.answerBankMCQ = createObject("roList")
     m.answerBankMCQ.AddTail("Los Angeles, CA")
     m.answerBankMCQ.AddTail("Ottawa")
     m.answerBankMCQ.AddTail("Seattle, WA")
     m.answerBankMCQ.AddTail("Domino's")
     m.answerBankMCQ.AddTail("Au")
     m.answerBankMCQ.AddTail("Netherlands")
     m.answerBankMCQ.AddTail("Barbados")
     m.answerBankMCQ.AddTail("German")
     m.answerBankMCQ.AddTail("29")
     m.answerBankMCQ.AddTail("50")
     m.answerBankMCQ.AddTail("Yen")
     m.answerBankMCQ.AddTail("Mendel")
     m.answerBankMCQ.AddTail("Kailash Satyarthi")
     m.answerBankMCQ.AddTail("Diego Maradona")
     m.answerBankMCQ.AddTail("Caspian Sea")

    m.choicesBankMCQ = [
        ["New York, NY", "Denver, CO", "Los Angeles, CA", "New Orleans, LA"],
        ["Toronto", "Ottawa", "Perth", "London"],
        ["Austin, TX", "Los Angeles, CA", "Seattle, WA", "Cleveland, OH"],
        ["Domino's", "Pizza Hut", "Costco", "Little Caesars"],
        ["Au", "Go", "Gd", "Ag"],
        ["England", "Netherlands", "France", "Germany"],
        ["St Kitts", "Jamaica", "Barbados", "Trinidad and Tobago"],
        ["Dutch", "German", "French", "Polish"],
        ["56", "29", "25", "22"],
        ["100", "75", "50", "40"],
        ["Yen", "Won", "Yuan", "Rupee"],
        ["Freud", "Mendel", "Durant", "Curie"],
        ["Barack Obama", "Daron Acemoglu", "Kailash Satyarthi", "Demis Hassabis"],
        ["Pele", "Diego Maradona", "Eusebio", "Lionel Messi"],
        ["Red Sea", "Lake Huron", "Caspian Sea", "Lake Superior"]
    ]
    'check variable


    'mode variable
    m.mode = 1' 1 for mixed, 2 for TorF, 3 for MCQ

    ' confetti animation setup

    m.confetti1 = m.top.findNode("confetti1")
    m.confetti2 = m.top.findNode("confetti2")
    m.confettiAnimation = m.top.findNode("confettiAnimation")

    m.confettiAnimation.observeField("state", "onConfettiAnimationComplete")

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

    ' setup start screen
    m.startScreen = m.top.findNode("startscreen")
    m.startScreen.width = m.scrWidth
    m.startScreen.height = m.scrHeight
    m.startScreen.visible = true   ' <-- Add this line

    ' setup click screen
    m.clickScreen = m.top.findNode("clickScreen")
    m.clickScreen.width = m.scrWidth
    m.clickScreen.height = m.scrHeight

    ' setup X Win Screen
    m.xWinScreen = m.top.findNode("xWinScreen")
    m.xWinScreen.width = m.scrWidth
    m.xWinScreen.height = m.scrHeight
    
    ' setup O Win Screen
    m.oWinScreen = m.top.findNode("oWinScreen")
    m.oWinScreen.width = m.scrWidth
    m.oWinScreen.height = m.scrHeight

    ' initially show and focus the hidden button when on start screen
    m.hiddenStartButton.visible = true
    m.hiddenStartButton.setFocus(true)

    ' question active'
    m.questionActive = false

    ' background setup
    m.background = m.top.findNode("background")
    m.background.width = m.scrWidth
    m.background.height= m.scrHeight

    ' grid setup
    m.grid = []
    m.gridContainer = m.top.findNode("gridContainer")
    gridSize = 0.25
    numCol = 3
    gridImg = "https://b-o09.github.io/host/grid.png"
    createGrid(m.grid, m.gridContainer, gridSize, numCol, gridImg)

    ' x setup
    m.x = []
    m.xContainer = m.top.findNode("xContainer")
    xSize = 0.25
    xImg = "https://b-o09.github.io/host/x.png"
    createGrid(m.x, m.xContainer, xSize, numCol, xImg)
    ' make x invisible
    for i = 0 to m.x.Count() - 1
        m.x[i].visible = false
    end for

    ' o setup
    m.o = []
    m.oContainer = m.top.findNode("oContainer")
    oSize = 0.25
    oImg = "https://b-o09.github.io/host/o.png"
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
    
    'category label'
    m.categoryLabel = m.top.FindNode("categoryLabel")
    ' turn label setup'
    m.turnLabel = m.top.findNode("turnLabel")
    m.turnLabel.horizAlign = "center"
    m.turnLabel.width = m.scrWidth
    m.turnLabel.font.size = m.scrHeight * 0.08
    m.turnLabel.translation = [0, m.scrHeight * 0.9] 

    ' win label setup
    m.winLabel = m.top.findNode("winLabel")
    m.winLabel.horizAlign = "center"
    m.winLabel.width = m.scrWidth
    m.winLabel.font.size = m.scrHeight * 0.08

    ' question label setup'
    m.questionLabel = m.top.FindNode("question")
    m.questionLabel.font.size = m.scrHeight * 0.1
    m.questionLabel.width = m.scrWidth  
    m.questionLabel.horizAlign = "center"
    m.questionLabel.wrap = true
    m.questionLabel.maxLines = 3

    ' font setup
    m.moodcake = CreateObject("roSGNode", "Font")
    m.moodcake.uri = "pkg:/fonts/Moodcake.ttf"
    m.moodcake.size = 50
    m.winLabel.font = m.moodcake
    m.turnLabel.font = m.moodcake

    m.moodcake1 = CreateObject("roSGNode", "Font")
    m.moodcake1.uri = "pkg:/fonts/Moodcake.ttf"
    m.moodcake1.size = 70
    m.questionLabel.font = m.moodcake1
    m.questionLabel.width = m.scrWidth  
    m.questionLabel.horizAlign = "center"

    ' button response setup'
    m.ButtonResponse = m.top.FindNode("response")
    m.ButtonResponse.size = 60
    m.ButtonResponse.observeField("buttonSelected", "onButtonSelected")

    ' question background setup'
    m.questionBackground = m.top.FindNode("questionBackground")
    m.questionBackground.width = m.scrWidth
    m.questionBackground.height = m.scrHeight

    ' audio setup
    m.audio = createObject("roSGNode", "Audio")
    m.audioContent = createObject("RoSGNode", "ContentNode")
    m.audioContent.url = "https://audio.jukehost.co.uk/eAuwXAPByXT38nMsNOEyDShJW2nLjIrk"
    m.audio.content = m.audioContent
    m.audio.control = "play"
    m.audio.loop = true

    m.winaudio = createObject("roSGNode", "Audio")
    m.winaudioContent = createObject("RoSGNode", "ContentNode")
    m.winaudioContent.url = "https://audio.jukehost.co.uk/c6TJG5nVmQLWlGL0sjeFjbTRhSk9KWsk"
    m.winaudio.content = m.winaudioContent
    m.winaudio.control = "none"
    
    m.anotherwinaudio = createObject("roSGNode", "Audio")
    m.anotherwinaudioContent = createObject("RoSGNode", "ContentNode")
    m.anotherwinaudioContent.url = "https://audio.jukehost.co.uk/jOjnwHzIcYu7Plo2KnfzHwVBqaSHV5Sq"
    m.anotherwinaudio.content = m.anotherwinaudioContent
    m.anotherwinaudio.control = "none"

    m.questionaudio = createObject("roSGNode", "Audio")
    m.questionaudioContent = createObject("RoSGNode", "ContentNode")
    m.questionaudioContent.url = "https://audio.jukehost.co.uk/6ymP8ODVlSdxuNXvCUIypxoMzYZUvjJg"
    m.questionaudio.content = m.questionaudioContent
    m.questionaudio.control = "none"
    
end sub

sub OnButtonSelected()
    m.questionBackground.visible= false
    m.buttonresponse.setFocus(false)
    m.buttonresponse.visible = false
    m.questionlabel.visible = false
    m.questionActive = false
    triviaCorrect()
    if m.winLabel.text = "X Wins!" or m.winLabel.text = "O Wins!" or m.winLabel.text = "It's a Tie!" then
        m.cursor.visible = false
        m.cursor.setFocus(false)
        ' Set focus to the scene itself so it can handle back key
        m.top.setFocus(true)
    else
        showGameElements()
    end if
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

sub backtoMenu()
    'hide background'
    m.background.visible = false
    m.questionBackground.visible = false

    'hide confetti'
    m.confetti1.visible = false
    m.confetti2.visible = false
    m.confettiAnimation.control = "stop"
    m.xWinScreen.visible = false
    m.oWinScreen.visible = false
    
    'set focus to false and visibility of labels to false except for win cus people still playing the game
    m.cursor.setFocus(false)
    m.buttonResponse.setFocus(false)
    m.cursor.visible = false
    m.buttonResponse.visible = false
    m.questionLabel.visible = false
    m.winLabel.text = ""
    m.turnLabel.text = ""
    m.categoryLabel.visible = true

    'no more questions haha you get the joke
    m.questionActive = false

    'reset game state
    m.count = 0
    m.cursorRow = 0
    m.cursorCol = 0

    'grid stuff and x or o's that may still be visible from previous game
    m.gridContainer.visible = false
    for i = 0 to m.grid.Count() - 1
        m.grid[i].visible = false
        m.x[i].visible = false
        m.o[i].visible = false
    end for

    'reset cursor position to top-left
    m.cursor.translation = m.grid[0].translation

    'onto real stuff now we start the menu screen and its a cycle again
    m.startScreen.visible = true
    m.hiddenStartButton.visible = true
    m.hiddenStartButton.setFocus(true)
end sub

' remote interaction setup
function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    hoi = m.grid[0].width
   
    if press then
        if key = "fastforward"
            m.mode = m.mode + 1
            if m.mode > 3
                m.mode = 1
            end if
            if m.mode = 1
                m.categoryLabel.text = "Press the fastforward(>>) button to change category!                                                                                         Currently set to: Mixed"
            else if m.mode = 2
                m.categoryLabel.text = "Press the fastforward(>>) button to change category!                                                                                         Currently set to: True or False"
            else if m.mode = 3
                m.categoryLabel.text = "Press the fastforward(>>) button to change category!                                                                                         Currently set to: Multiple Choice"
            handled = true
            end if 
        end if 
        if key = "back"
            if m.winaudio.control = "play" then
                m.winaudio.control = "stop"
                m.audio.control = "play"
            else if m.anotherwinaudio.control = "play" then
                m.anotherwinaudio.control = "stop"
                m.audio.control = "play"
            else if m.questionaudio.control = "play" then
                m.questionaudio.control = "stop"
                m.audio.control = "play"
            end if
        backtoMenu()
        handled = true
        end if

    
        if m.cursor.visible = true
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
                randomNum = RND(2)
                if m.mode = 1 ' mixed mode
                    ? "mixed"
                    if randomNum = 1
                        ? "mixed true or false"
                        TorF()
                    else if randomNum = 2
                        ? "mixed trivia"
                        triviaQuestion()
                    end if
                else if m.mode = 2 ' true or false mode
                    ? "true or false"
                    TorF()
                else if m.mode = 3 ' multiple choice questions mode
                    ? "mcq nigguh"
                    triviaQuestion()
                end if
                if m.questionActive = true
                   m.buttonResponse.visible = true
                   m.buttonResponse.setFocus(true)
                end if
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
        m.turnlabel.text = "O's turn"
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
        m.turnLabel.text = "X's turn"
        for i = 0 to m.o.Count() - 1
            if m.x[i].visible = false and m.o[i].visible = false then
                if m.o[i].translation[0] = m.cursor.translation[0] and m.o[i].translation[1] = m.cursor.translation[1] then
                    m.o[i].visible = true
                    ' if m.winLabel.text = "X starts first" or m.winLabel.text = "Correct answer" then
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
        m.audio.control = "stop"
        m.anotherwinaudio.control = "play"
        m.anotherwinaudio.loop = true
        showWinWithConfetti()
    end if 
end sub 

sub helperO(pos1, pos2, pos3)
    if m.o[pos1].visible and m.o[pos2].visible and m.o[pos3].visible then
        m.winLabel.text = "O Wins!"
        m.audio.control = "stop"
        m.winaudio.control = "play"
        m.winaudio.loop = true
        showWinWithConfetti()
    end if 
end sub 

sub helperTie()
    actualMoves = 0
    for i = 0 to 8
        if m.x[i].visible = true or m.o[i].visible = true then
            actualMoves = actualMoves + 1
        end if
    end for
    
    if actualMoves = 9 then
        m.winLabel.text = "It's a Tie!"
    end if
end sub

' Simplified vertical win check
sub vertical()
    for i = 0 to 2
        if m.x[i].visible and m.x[i+3].visible and m.x[i+6].visible then
            m.cursor.visible = false
            m.top.setFocus(true)
            helperX(i, i+3, i+6)
            
        else if m.o[i].visible and m.o[i+3].visible and m.o[i+6].visible then
            m.cursor.visible = false
            m.top.setFocus(true)
            helperO(i, i+3, i+6)
        end if
    end for
end sub

'Simplified horizontal win check'
sub horizontal()
    for i = 0 to 6 step 3 
        if m.x[i].visible and m.x[i+1].visible and m.x[i+2].visible then
            m.cursor.visible = false
            m.top.setFocus(true)
            helperX(i, i+1, i+2)
            
        else if m.o[i].visible and m.o[i+1].visible and m.o[i+2].visible then
            m.cursor.visible = false
            m.top.setFocus(true)
            helperO(i, i+1, i+2)
        end if
    end for
end sub

sub diagonal()
    if (m.x[0].visible and m.x[4].visible and m.x[8].visible) then
        m.cursor.visible = false
        m.top.setFocus(true)
        helperX(0, 4, 8)
    else if (m.o[0].visible and m.o[4].visible and m.o[8].visible) then
        m.cursor.visible = false
        m.top.setFocus(true)
        helperO(0, 4, 8)
    else if m.x[2].visible and m.x[4].visible and m.x[6].visible then 
        m.cursor.visible = false
        m.top.setFocus(true)
        helperX(2, 4, 6)
    else if (m.o[2].visible and m.o[4].visible and m.o[6].visible) then
        m.cursor.visible = false
        m.top.setFocus(true)
        helperO(2, 4, 6)
    end if
end sub

' check win conditions and display the result
sub win()
    helperTie()
    horizontal()
    vertical()
    diagonal()
end sub 

' function to make all game elements visible
sub showGameElements()
    m.background.visible = true
    m.gridContainer.visible = true  ' Show the grid
    m.xContainer.visible = true   
    m.oContainer.visible = true     
    for i = 0 to m.grid.Count() - 1
        m.grid[i].visible = true
    end for
    m.cursor.visible = true
    m.cursor.setFocus(true)
    m.turnlabel.visible = true
end sub

sub onHiddenStartButtonPressed()
    m.categoryLabel.visible ="false"
    ' hide start screen and show click screen
    m.startScreen.visible = false
    m.hiddenStartButton.visible = false
    m.clickScreen.visible = true
    
    ' start timer for 0.5 seconds
    m.clickScreenTimer.control = "start"
end sub

sub onClickScreenTimerFire()
    ' hide click screen and show game elements after 0.5 seconds
    m.clickScreen.visible = false
    m.winLabel.text = "X starts first" ' show after click screen
    showGameElements()
end sub

'true or false
sub TorF()
    m.questionActive = true
    m.audio.control = "stop"
    m.questionaudio.control = "play"

    randomNum = RND(m.questionBankTorF.Count()) - 1
    m.currentCorrectAnswer = m.answerBankTorF[randomNum] 'correct answer'
    m.top.FindNode("global").text = randomNum.ToStr()
    m.questionLabel.text = m.questionBankTorF[randomNum] 'question text'
    m.questionBackground.visible = true
    if m.questionBackground.visible = true
        m.questionLabel.visible = true
    end if
    m.ButtonResponse.visible = true
    m.ButtonResponse.setFocus(true)
    m.ButtonResponse.buttons = ["True", "False"]  
end sub

sub triviaQuestion()
    m.questionActive = true
    m.cursor.setFocus(false)
    
    m.audio.control = "stop"
    m.questionaudio.control = "play"

    randomNum = RND(m.questionBankMCQ.Count()) - 1
    m.currentCorrectAnswer = m.answerBankMCQ[randomNum] 'correct answer'
    m.questionLabel.text = m.questionBankMCQ[randomNum] 'question text'
    m.questionBackground.visible = true
    if m.questionBackground.visible = true
    m.questionLabel.visible = true
    end if
    m.ButtonResponse.visible = true
    m.ButtonResponse.setFocus(true)
    m.ButtonResponse.buttons = m.choicesBankMCQ[randomNum]
end sub

sub TriviaCorrect()
    selectedIndex = m.ButtonResponse.buttonSelected
    selectedContent = m.ButtonResponse.buttons[selectedIndex]

    if selectedContent = m.currentCorrectAnswer then
        m.winLabel.text="Correct answer!"
        m.audio.control = "play"
        m.questionaudio.control = "stop"
        if m.count MOD 2 = 0 then
            m.turnlabel.text = "X's turn"
        else 
            m.turnlabel.text = "O's turn"
        end if
        displayXorY()
    else
        m.count = m.count + 1 ' fixed place marker turns; not + 2, has to be odd
        m.winLabel.text = "Wrong answer! You lose your turn"
        m.audio.control = "play"
        m.questionaudio.control = "stop"
        if m.count MOD 2 = 0 then
            m.turnlabel.text = "X's turn"
        else 
            m.turnlabel.text = "O's turn" ' changed X and O order
        end if
    end if
end sub 

sub selectRandomQ()
    tempList = createObject("roList")
    for item = 0 to m.QuestionBank.count() - 1
        if m.QuestionBank[item] = true ' if question appears on the screen
            tempList.AddTail(item)
              if m.QuestionBank[m.RandomNum] = m.tempList[item]
                ? "randomNum is equal to temp"
                m.QuestionBank.delete(m.RandomNum)
                m.AnswerBank.delete(m.RandomNum)
              end if
        end if
    end for
end sub

sub showWinWithConfetti()

    ' hide game elements
    m.cursor.visible = false
    m.cursor.setFocus(false)
    m.gridContainer.visible = false
    m.background.visible = false
    m.xContainer.visible = false
    m.oContainer.visible = false
    
    m.turnLabel.visible = false
    
    ' show the appropriate win screen background
    if m.winLabel.text = "X Wins!" then
        m.xWinScreen.visible = true
    else if m.winLabel.text = "O Wins!" then
        m.oWinScreen.visible = true
    end if
    
    ' show confetti and start animation
    m.confetti1.visible = true
    m.confetti2.visible = true
    m.confettiAnimation.control = "start"
    
    ' set focus to scene for back button handling
    m.top.setFocus(true)
end sub

sub onConfettiAnimationComplete()
    if m.confettiAnimation.state = "stopped" then
        ' Keep confetti visible at bottom of screen
        ' Player can press back to return to menu
    end if
end sub

sub categoryLabel()
        
end sub