function onCreate()
setPropertyFromClass('GameOverSubstate', 'characterName', 'death');
end	

function onEvent(name,value1,value2)
if name == 'Flash White' then
cameraFlash('other', 'FFFFFF', '1')
end
end

function onBeatHit()
if curBeat == 1 then
doTweenColor('timeBar', 'timeBar', '8E8E8E', 0.01, 'linear');
end
end