KeyEnd = {}

function KeyEnd.handleInputEnd(key)
    if (key == 'space') then
        love.event.quit()
    end
end
