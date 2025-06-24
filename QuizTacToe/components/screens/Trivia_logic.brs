sub init()
    m.top.status="loading"
    'destination of api, doesnt need a key'
    url="https://opentdb.com/api.php?amount=1"
    req = CreateObject("roUrlTransfer")
    port=
    req.SetUrl(url)
    raw = req.AsyncGetToString()
    'check validity of data/ cleaning data'
    if raw.result() <> invalid 
        sorted = ParseJson(raw)
        if sorted.count() > 0
            items = sorted.results
            m.top.status="loaded"
            m.top.question = items.question
            m.top.correctAnswer = items.correct.answer
            m.top.options = items.incorrect_answers
            m.top.options.push(items.correct_answer)
            
        end if 

    end if
end sub


'Fisher-Yates shuffle algorithm/ found on roku forum
sub shuffle (options as object) as void
    for i%= options.Count() -1 to 1 step -1
        j% = Rnd(i% + 1) - 1
        t = options[i%]
        options[i%] = options[j%]
        options[j%] = t
    end for
    
 end sub



 function getTrivia() as object


 end function 


 