script_name('[arz]crBot')
script_version(1.00)
upd = [[
1
2
3
-
]]--upd

require 'moonloader'
requests = require 'requests'
sampev = require'samp.events'
imgui = require 'imgui'
encoding = require("encoding"); encoding.default = 'CP1251'; u8 = encoding.UTF8  
json = {
    defPath = getWorkingDirectory()..'/config/',
    save = function(t,path) 
        if not path:find('/') or not path:find('\\') then;  path = json.defPath..path end
        t = (t == nil and {} or (type(t) == 'table' and t or {}))
        local f = io.open(path,'w');    f:write(encodeJson(t) or {});   f:close()
    end,
    load = function(t,path) 
        if not path:find('/') or not path:find('\\') then;  path = json.defPath..path end
        if not doesFileExist(path) then;    json.save(t,path);  end
        local f = io.open(path,'r+');   local T = decodeJson(f:read('*a')); f:close()
        return T
    end
}
j = json.load({
    tg = {
        token = '5217069040:AAHY87seXspuLM3VVZk94JRL399_M8ozJR4',
        chat_id = 620180223,
    },
    lavki = {
        colors = {
            ['редактирует'] = {1,0,0,1},
            ['продаёт'] = {0,1,0,1},
            ['покупает'] = {0,1,1,1},
            ['продаёт и покупает'] = {1,0,1,1},
            ['свободная лавка'] = {1,1,1,1},
        },
        coordmaster = {
            step = 5,
            delay = 69,
        },
    },
    bot = {
        delay = 10,
        coords = {}, 
        items = {},
    }
},'[arz]CrBaron.json')
crItems = json.load({},'[arz]CrBaron_Items.json')

lavki = {
    lavki = {
        {imgui=imgui.ImVec2(125-10,50),pos={1133.8615722656, -1515.1368408203}},
        {imgui=imgui.ImVec2(125-30,50),pos={1137.6138916016, -1513.7829589844}},
        {imgui=imgui.ImVec2(125-30-40,60),pos={1147.3572998047, -1507.4227294922}},
        {imgui=imgui.ImVec2(125+10,50),pos={1122.9432373047, -1515.4566650391}},
        {imgui=imgui.ImVec2(125+30,50),pos={1118.6518554688, -1513.9273681641}},
        {imgui=imgui.ImVec2(125+30+40,60),pos={1109.0301513672, -1506.6022949219}},
        {imgui=imgui.ImVec2(125+30,100),pos={1116.8221435547,-1502.4484863281}},
        {imgui=imgui.ImVec2(125+30,100+20),pos={1116.8892822266,-1493.3395996094}},
        {imgui=imgui.ImVec2(125+30,100+40),pos={1116.8883056641,-1488.8804931641}},
        {imgui=imgui.ImVec2(125+30,100+60),pos={1116.8883056641,-1484.2327880859}},
        {imgui=imgui.ImVec2(125+30+40,100+40-5),pos={1107.1037597656,-1478.1535644531}},
        {imgui=imgui.ImVec2(125+30+40,100+60-5),pos={1108.6922607422,-1473.6702880859}},
        {imgui=imgui.ImVec2(125-30-40,100+40-5),pos={1150.3121337891,-1478.5914306641}},
        {imgui=imgui.ImVec2(125-30-40,100+60-5),pos={1148.5478515625,-1473.7545166016}},
        {imgui=imgui.ImVec2(125+30+40,100+80),pos={1110.6108398438,-1465.3223876953}},
        {imgui=imgui.ImVec2(125+30+40,100+80+20),pos={1110.6101074219,-1460.9644775391}},
        {imgui=imgui.ImVec2(125+30+40,100+80+40),pos={1110.6107177734,-1456.3336181641}},
        {imgui=imgui.ImVec2(125+30+40,100+80+60),pos={1110.6134033203,-1449.4990234375}},
        {imgui=imgui.ImVec2(125+30+40,100+80+80),pos={1110.6119384766,-1442.9114990234}},
        {imgui=imgui.ImVec2(125+30+40,100+80+100),pos={1110.6101074219,-1438.4370117188}},
        {imgui=imgui.ImVec2(125+30+40,100+80+120),pos={1110.6103515625,-1433.7307128906}},
        {imgui=imgui.ImVec2(125-30-40,100+80),pos={1148.5134277344,-1473.6695556641}},
        {imgui=imgui.ImVec2(125-30-40,100+80+20),pos={1146.6704101563,-1465.4056396484}},
        {imgui=imgui.ImVec2(125-30-40,100+80+40),pos={1146.6697998047,-1460.9720458984}},
        {imgui=imgui.ImVec2(125-30-40,100+80+60),pos={1146.6704101563,-1456.4584960938}},
        {imgui=imgui.ImVec2(125-30-40,100+80+80),pos={1146.6704101563,-1442.8240966797}},
        {imgui=imgui.ImVec2(125-30-40,100+80+100),pos={1146.6704101563,-1438.4714355469}},
        {imgui=imgui.ImVec2(125-30-40,100+80+120),pos={1146.6483154297,-1433.8829345703}},
        {imgui=imgui.ImVec2(125+10,100+80+20),pos={1125.6596679688,-1460.8344726563}},
        {imgui=imgui.ImVec2(125+10,100+80+20+20),pos={1125.6607666016,-1456.4132080078}},
        {imgui=imgui.ImVec2(125+10,100+80+20+40),pos={1125.6608886719,-1451.9625244141}},
        {imgui=imgui.ImVec2(125+10,100+80+20+60),pos={1125.6491699219,-1447.2241210938}},
        {imgui=imgui.ImVec2(125+10,100+80+20+80),pos={1125.6608886719, -1442.8026123047}},
        {imgui=imgui.ImVec2(125+10,100+80+20+100),pos={1125.6608886719, -1438.3663330078}},
        {imgui=imgui.ImVec2(125-10,100+80+20),pos={1132.1005859375,-1460.8640136719}},
        {imgui=imgui.ImVec2(125-10,100+80+20+20),pos={1132.1091308594,-1456.4731445313}},
        {imgui=imgui.ImVec2(125-10,100+80+20+40),pos={1132.1005859375,-1451.8995361328}},
        {imgui=imgui.ImVec2(125-10,100+80+20+60),pos={1132.109375,-1447.3287353516}},
        {imgui=imgui.ImVec2(125-10,100+80+20+80),pos={1132.1014404297,-1442.8031005859}},
        {imgui=imgui.ImVec2(125-10,100+80+20+100),pos={1132.1007080078,-1438.1531982422}},
    },
    window = imgui.ImBool(false),
    colors = {},
    coordmaster = {
        work = false,
        step = imgui.ImFloat(j.lavki.coordmaster.step),
        delay = imgui.ImInt(j.lavki.coordmaster.delay),
    },
}
for k,v in pairs(j.lavki.colors) do
    lavki.colors[k] = imgui.ImFloat4(unpack(v))
end

bot = {
    window = imgui.ImBool(false),
    --
    lavka = imgui.ImBool(false),
    --
    work = false,
    bool = imgui.ImBool(false),
    delay = imgui.ImInt(j.bot.delay),
    int = 0,
    --
    search = imgui.ImBuffer(256),
    int = imgui.ImInt(1),
    cost = imgui.ImInt(10),
    buy = imgui.ImBool(false),
    -- items = {},
    --
    td = {
        int = 0,
        page = 0,
        shop = {
            id = 0,
            pos = {0,0, 0,0},
        },
        items = {},
    },
}

tg = {
    window = imgui.ImBool(false),
    token = imgui.ImBuffer(j.tg.token,256),
    chat_id = imgui.ImInt(j.tg.chat_id),
}

window = imgui.ImBool(false)
upd = {
    window = imgui.ImBool(false),
    text = '',
}

active = ''
font = renderCreateFont('Arial',10,0x4)
function main()
    while not isSampAvailable() do wait(0) end
    -- while not sampIsLocalPlayerSpawned() do wait(0) end
    upd = ''

    sampRegisterChatCommand('crb',function() window.v = not window.v end)

    for k,v in ipairs(lavki.lavki) do
        v.text = {
            id = 0,
            text ='свободная лавка!',
        }
        v.buy = false
        v.render = false
    end

    asyncHttpRequest('GET','https://raw.githubusercontent.com/v3sp4n/crBot/main/%5Barz%5DcrBot.lua',nil,function(r)
        local version,u = r.text:match('^%S+\nscript_version%((%S+)%)\nupd %= %[%[\n(.+)\n%]%]%-%-upd')
        if tonumber(version) > tonumber(thisScript().version) then
            sampAddChatMessage('{F8B32D}Вышло обновление на версию %s, подробности в /crb',version)
            upd = u
        end
    end,nil)

    while true do wait(0)
        imgui.Process = window.v or lavki.window.v or bot.window.v
        MY_ID = select(2,sampGetPlayerIdByCharHandle(PLAYER_PED))
        MY_NICK = sampGetPlayerNickname(MY_ID)
        MYPOS = {getCharCoordinates(PLAYER_PED)}
        sw,sh = getScreenResolution()

-- anim.file PED,anim.name FALL_FALL[1130]
        for k,v in ipairs(lavki.lavki) do
            if v.text.text == 'свободная лавка!' then
                local _,x,y,z = convert3DCoordsToScreenEx(v.pos[1],v.pos[2],MYPOS[3])
                if z > 1 then
                    local xx,yy = convert3DCoordsToScreen(unpack(MYPOS))
                    renderFontDrawTextFromAlign(font,'Свободная лавка!',x,y,float4ToHex(lavki.colors['свободная лавка']),2)
                end
                if v.buy and getDistanceBetweenCoords3d(MYPOS[1], MYPOS[2], MYPOS[3],v.pos[1],v.pos[2],MYPOS[3]) <= 1.5 and not lavki.coordmaster.work and not isCharPlayingAnim(PLAYER_PED,'FALL_FALL') then
                    if sampIsDialogActive() and sampGetDialogText():find('^%{%x+%}Стоимость аренды лавки%: %{%x+%}%$%d+') then
                        wait(1)
                        sampCloseCurrentDialogWithButton(1)
                        sendTelegramMessage('Словил лавку!!!')
                    end
                    sendSyncKey('ALT')
                    wait(10)
                end
            end
        end

        for IDTEXT = 0, 2048 do
            if sampIs3dTextDefined(IDTEXT) then
                local text, _, posX, posY, posZ, _, _, _, _ = sampGet3dTextInfoById(IDTEXT)
                -- posZ = posZ - 2.1 !
                for k,v in ipairs(lavki.lavki) do
                    local d = getDistanceBetweenCoords3d(posX, posY, posZ,v.pos[1],v.pos[2],posZ) 
                    if d <= 1.9 and (text:find("^%w+_%w+ .+ товар$") or text:find('редактирует')) then
                        v.text.id = IDTEXT
                        v.text.text = (text):gsub('%{%x+%}','')
                    elseif d <= 1.9 and v.text.id == IDTEXT and not (text:find("^%w+_%w+ .+ товар$") or text:find('редактирует')) then
                        if v.buy and not lavki.coordmaster.work then
                            lavki.coordmaster.work = true
                            coordMaster(v.pos[1],v.pos[2],(posZ-2.1))
                        end
                        if v.render then 
                            sendTelegramMessage('Лавка(%s) освободилась!',k)
                        end
                        v.text.text = 'свободная лавка!'
                        v.text.id = 0
                    end
                end

            end
        end

        if bot.td.shop.id ~= 0 and (not sampTextdrawIsExists(bot.td.shop.id) or sampTextdrawGetString(bot.td.shop.id) ~= 'SHOP') then
            bot.td = {
                int = 0,
                page = 0,
                shop = {
                    id = 0,
                    pos = {0,0, 0,0},
                },
                items = {},
            }
        end
        bot.td.items = {}
        local page = {0,0}
        for id = 1,3000 do
            if sampTextdrawIsExists(id) then
                local x, y = convertGameScreenCoordsToWindowScreenCoords(sampTextdrawGetPos(id))
                local model, rotX, rotY, rotZ, zoom, clr1, clr2 = sampTextdrawGetModelRotationZoomVehColor(id)
                local box, boxColor, sizeX, sizeY = sampTextdrawGetBoxEnabledColorAndSize(id)
                local letterX,letterY,letterColor = sampTextdrawGetLetterSizeAndColor(id)
                local shadow,colorShadow = sampTextdrawGetShadowColor(id)
                local outline,outlineColor  = sampTextdrawGetOutlineColor(id)
                local text = sampTextdrawGetString(id)

                local td = bot.td


                if (text == 'SHOP' or text == gameConvertText('МАГАЗЙН','rustogame')) then
                    -- renderDrawPolygon(x,y,10,10,10,0,-1)
                    td.shop.id = id
                    td.shop.pos[1] = x
                    td.shop.pos[2] = y
                end

                if td.shop.id ~= 0 and 
                    text == gameConvertText('>','rustogame')
                    then
                    td.shop.pos[3] = x+50
                    td.shop.pos[4] = y
                end

                if td.shop.pos[3] ~= 0 and
                    x < (td.shop.pos[3]-50) and x > (td.shop.pos[3]-50-30) and
                    y > (td.shop.pos[4]-30) and
                    text == gameConvertText('LD_SРАС:whitе','rustogame')
                    then
                    td.page = id
                end

                if td.shop.pos[4] ~= 0 and
                    x < td.shop.pos[3] and
                    model ~= 1649 and model ~= 0
                    then
                    table.insert(td.items,{
                        id = id,
                        x=x,
                        y=y
                    })
                end

                if bot.bool.v and lavkaOpen() and (text == gameConvertText('СКУПКА','rustogame')) then
                    sampSendClickTextdraw(id-1)
                    wait(5)
                end

            end
        end


    end
end

function lavkaOpen()
    return bot.td.shop.id ~= 0
end

function float4ToHex(var) return ('0x%02x%02x%02x%02x'):format(var.v[4]*255,var.v[1]*255,var.v[2]*255,var.v[3]*255) end

function imgui.OnDrawFrame()
    imgui.ShowCursor = true
    if isKeyDown(VK_RBUTTON) then
        imgui.ShowCursor = false
    end

   if window.v then
        -- imgui.SetNextWindowSize(imgui.ImVec2(150,85),1)
        imgui.SetNextWindowPos(imgui.ImVec2(sw/2.6,sh/2), imgui.Cond.FirstUseEver)
        imgui.Begin(u8'цыганский барон у цр-crBot | '..thisScript().version ,window,32+64)

        imgui.BeginChild('b1',imgui.ImVec2(150,100),true)
            local b = {
                {'telegram',u8'Получение уведомлений в телеграм',function() imgui.OpenPopup('tg') end},
                {'lavki',u8[[
Можно узнать где-какая лавка свободная или занята
Включить ловлю на определенную лавку(работает на coordmaster'e)]],function() lavki.window.v = not lavki.window.v end},
                {'bot',u8[[Бот который сам чекает каждую лавку(если она занятая и нет текста РЕДАКТИРУЕТ) и ищит указанны(й/е) товар(ы)]],function() bot.window.v = not bot.window.v end},
            }
            for k,v in ipairs(b) do
                if imgui.Button(v[1],imgui.ImVec2(-1,25)) then
                    v[3]()
                end
                imgui.TextQuestion(nil,v[2])
            end
        if imgui.BeginPopup('tg') then
            if imgui.InputText('token',tg.token) then; j.tg.token = tg.token.v; json.save(j,'[arz]CrBaron.json'); end
            if imgui.InputInt('chat_id',tg.chat_id) then; j.tg.chat_id = tg.chat_id.v;  json.save(j,'[arz]CrBaron.json'); end

            if imgui.Button('test message',imgui.ImVec2(-1,30)) then
                local r = requests.get('https://api.telegram.org/bot' .. tg.token.v .. '/sendMessage?chat_id=' .. tg.chat_id.v .. '&text='..'[BaronCr] test message!')
                local rj = decodeJson(r.text)
                sampAddChatMessage(rj.ok and '{13E01D}successfull sending!' or ('{D21C1C}error code %s - %s'):format(rj.error_code,rj.description))
            end
            if imgui.CollapsingHeader(u8'Когда приходят уведомления?') then
                imgui.Text(u8[[
Когда лавка освободилась(нужно на лавку включить рендер)
Когда скрипт словил лавку
Когда бот нашел определенный предмет в лавке (или когда купил)
Когда бот начал/сделал круг
]])
                imgui.Separator()
            end
            imgui.EndPopup()
        end
        imgui.EndChild()
        imgui.SameLine()
        imgui.BeginChild('text',imgui.ImVec2(200,100),true)

        imgui.Text('idea-publisher KostLim'); imgui.SameLine();   if imgui.SmallButton('(profile)##1') then;  os.execute('explorer "https://www.blast.hk/members/269820/"'); end
        imgui.Text('developer vespan'); imgui.SameLine();   if imgui.SmallButton('(profile)##2') then;  os.execute('explorer "https://www.blast.hk/members/295413/"'); end
        if imgui.Button('github repository script') then
            os.execute('explorer "https://github.com/Affarsi/CR_bot"')
        end
        if upd ~= '' then 
            imgui.Separator()
            if imgui.Button(u8'что за обновление?',imgui.ImVec2(-1,0)) then
                imgui.OpenPopup('update')
            end
            if imgui.BeginPopupModal('update',nil,64+1) then
                for l in upd:gmatch('[^\n]+') do
                    imgui.Text(u8(l))
                end
                if imgui.Button(u8'обновиться',imgui.ImVec2(0,20)) then
                    downloadUrlToFile(
                        'https://raw.githubusercontent.com/v3sp4n/crBot/main/%5Barz%5DcrBot.lua',
                        thisScript().path,
                        function(id,status,_,_)
                            if status == 58 then
                                sampAddChatMessage('{0CC726}Успешно{cccccc} установлено обновление! Перезагружаюсь..')
                                thisScript():reload()
                            end
                        end
                    )
                end
                imgui.SameLine()
                if imgui.Button(u8'та нахой оно мне нада',imgui.ImVec2(0,20)) then
                    imgui.CloseCurrentPopup()
                end
                imgui.EndPopup()
            end
        end
        imgui.EndChild()

        imgui.End()
    end

    if bot.window.v then
        imgui.SetNextWindowSize(imgui.ImVec2(350,300),1)
        imgui.SetNextWindowPos(imgui.ImVec2(sw/1.5-350/2,sh/2.5-300/2), imgui.Cond.FirstUseEver)
        imgui.Begin('bot',bot.window,32)

        if imgui.Checkbox(u8'запустить бота?',bot.bool) then
            bot.int = 1
            bot.td.int = 1
            lua_thread.create(function()
                local freeze,nextPage = true,false
                local c,clock = 1,0
                while bot.bool.v do wait(0)
                    local t = j.bot.coords[bot.int]
                    if #j.bot.items == 0 then
                        sendTelegramMessage('Были выкуплены ВСЕ предметы!\nБот отключен')
                        break
                    end
                    if t == nil and clock == 0 then
                        c = c + 1
                        clock = os.clock()
                        bot.int = 1
                        bot.td.int = 1
                        sendTelegramMessage('Был сделан %s круг!\nЖдем %s минут..',c,bot.delay.v)
                    end
                    if clock ~= 0 and ((os.clock()-clock)/60) >= bot.delay.v then
                        clock = 0
                        sendTelegramMessage('Вышло время!\nНачинаю круг..')
                    end
                    if clock == 0 then
                        local d = getDistanceBetweenCoords3d(t.pos[1],t.pos[2],0,MYPOS[1],MYPOS[2],0)
                        if d > 1 then
                            bot.td.int = 1
                            setAngle(t.pos[1],t.pos[2],t.pos[3])
                            setGameKeyState(1, -255)
                        else
                            if d <= 0.7 and freeze then
                                freezeCharPosition(PLAYER_PED,true)
                                wait(100)
                                freezeCharPosition(PLAYER_PED,false)
                                freeze = false
                            end
                            if t.lavka then
                                if lavkaOpen() or sampIsDialogActive() then
                                    local selling = false
                                    for IDTEXT = 0, 2048 do
                                        if sampIs3dTextDefined(IDTEXT) then
                                            local text, _, posX, posY, posZ, _, _, _, _ = sampGet3dTextInfoById(IDTEXT)
                                            if text:find('продаёт') and getDistanceBetweenCoords3d(posX, posY, 0,MYPOS[1],MYPOS[2],0) <= 2.5 then
                                                selling = true
                                            end
                                        end
                                    end
                                    if not selling then
                                        bot.int = bot.int + 1
                                    end
                                end
                                if lavkaOpen() and not sampIsDialogActive() then
                                    if bot.td.items[bot.td.int] == nil or bot.td.items[bot.td.int].id == nil or bot.td.int > #bot.td.items then
                                        sampSendClickTextdraw(bot.td.page)
                                        wait(3000)
                                        if #bot.td.items == 0 then
                                            sampSendClickTextdraw(0xffff)
                                            bot.int = bot.int + 1
                                            freeze = true
                                        end
                                        bot.td.int = 1
                                    else
                                        sampSendClickTextdraw(bot.td.items[bot.td.int].id)
                                        wait(50)
                                    end
                                elseif not lavkaOpen() then
                                    if sampIsDialogActive() then wait(1) sampCloseCurrentDialogWithButton(0) end
                                    sendSyncKey('ALT')
                                    wait(10)
                                end
                            else
                                freeze = true
                                bot.int = bot.int + 1
                            end
                        end
                    end
                end
            end)
        end
        imgui.TextQuestion(u8[[
Бот начнет с первой точки до последней
после последней точки бот ждет время которое вы укажите
после чего насчет снова круг
]])

        if imgui.CollapsingHeader(u8'путь бота') then
            if imgui.DragInt('delay',bot.delay,0.005,1,1000) then;   j.bot.delay = bot.delay.v;  json.save(j,'[arz]CrBaron.json');   end
            imgui.TextQuestion(u8[[
Время в минутах!
Через сколько минут бот начнет проходить точки
Таймер запускается после последней точки
Во время таймера бот ничего не делает]])
            if imgui.Button(u8'Поставить точку сюда!') then
                -- MYPOS[3] = MYPOS[3]-1.5
                table.insert(j.bot.coords,{
                    pos = MYPOS,
                    lavka = bot.lavka.v
                })
                json.save(j,'[arz]CrBaron.json')
            end
            imgui.SameLine()
            imgui.Checkbox('lavka?',bot.lavka)
            imgui.TextQuestion(u8[[
Если бот подошел к этой точке и тут стоит lavka?=true
то скрипт будет флудить АЛЬТ для открытия лавки
(если поблизости Свободная лавка то скрипт её пропустит)]])
            imgui.Separator()
            for k,v in ipairs(j.bot.coords) do
                local _,x,y,z = convert3DCoordsToScreenEx(unpack(v.pos))
                if z > 1 then
                    renderFontDrawText(font,tostring(k),x,y,-1)
                end
                if j.bot.coords[k+1] ~= nil then
                    local _,xx,yy,zz = convert3DCoordsToScreenEx(unpack(j.bot.coords[k+1].pos))
                    if zz > 1 and z > 1 then
                        renderDrawLine(x,y,xx,yy,2,-1)
                    end
                end
                drawCircleIn3d(v.pos[1],v.pos[2],v.pos[3],1,360,2,('0x%02xffffff'):format(100))
                imgui.Text(k..',its lavka?='..tostring(v.lavka))
                imgui.SameLine()
                if imgui.Button(u8'lavka##'..k) then;  v.lavka = not v.lavka;  json.save(j,'[arz]CrBaron.json'); end
                imgui.SameLine()
                if imgui.Button(u8'thisPos##'..k) then;  v.pos = MYPOS;  json.save(j,'[arz]CrBaron.json'); end
                imgui.SameLine()
                if imgui.Button(u8'delete##'..k) then;  table.remove(j.bot.coords,k);   json.save(j,'[arz]CrBaron.json'); end
            end
            imgui.Separator()
            imgui.NewLine()
        end

        if imgui.BeginMenu('items check bot') then


            for k,v in ipairs(j.bot.items) do
                imgui.Text(u8(v.item))
                imgui.TextQuestion(nil,u8(
                    (v.buy and ('Купить предмет за '..v.cost..'$ и меньше,'..v.int..' кол-во') or 'Чекнуть')
                ))
                imgui.SameLine()
                if imgui.Button('<delete##'..k) then
                    table.remove(j.bot.items,k)
                    json.save(j,'[arz]CrBaron.json')
                end
            end
            imgui.EndMenu()
        end

        if imgui.Button(u8'Обновить список предметов',imgui.ImVec2(350-35,30)) then
            imgui.OpenPopup('sure?')
        end

        imgui.InputText('search',bot.search)

        if #bot.search.v > 1 then
            for k,v in ipairs(crItems) do
                if (stringToLower(v)):find(u8:decode(bot.search.v)) then
                    if imgui.Button(u8(v)) then
                        imgui.OpenPopup(u8(v))
                    end
                end
                if imgui.BeginPopupModal(u8(v),nil,64) then
                    -- imgui.Text(string.rep(' ',(imgui.CalcTextSize(u8(v)).x/2+20) ))

                    local int = imgui.ImInt((bot.buy.v and 1 or 0))
                    imgui.RadioButton(u8'Чекнуть ли есть товар в лавке',int,0)
                    imgui.SameLine()
                    imgui.Text(string.rep(' ',(imgui.CalcTextSize(u8(v)).x/4) ))
                    imgui.RadioButton(u8'Купить товар',int,1)
                    bot.buy.v = (int.v == 1 and true or false)

                    if int.v == 1 then
                        imgui.Text(u8'Купить товар если цена ниже(<=)')
                        imgui.SameLine()
                        imgui.PushItemWidth(150)
                        imgui.InputInt(u8'(цена за одну штуку)##cost',bot.cost)
                        imgui.Text(u8'Сколько купить?')
                        imgui.SameLine()
                        imgui.InputInt(u8'##int',bot.int)
                        imgui.PopItemWidth(2)
                    end
                    if imgui.Button('add',imgui.ImVec2(-1,20)) then
                        table.insert(j.bot.items,{
                            item = v,
                            buy = bot.buy.v,
                            cost = bot.cost.v,
                            int = bot.int.v,
                        })
                        json.save(j,'[arz]CrBaron.json')
                        imgui.CloseCurrentPopup()
                    end

                    imgui.SetCursorPos(imgui.ImVec2(imgui.GetWindowSize().x-imgui.CalcTextSize('close').x-20,25))
                    if imgui.Button('close') then imgui.CloseCurrentPopup() end

                    imgui.EndPopup()
                end
            end
        end
        if imgui.BeginPopup('sure?') then
            imgui.Text(u8[[
Вы уверены что хотите перезаписать предметы?
Через что хочешь?]])
            if imgui.Button(u8'Через сайт arz-wiki') then
                local res,er = pcall(requests.get,'https://arz-wiki.com/items/')
                if not res then
                    sampShowDialog(1,'crBot',(
[[Скрипту не удалось получить текст с сайта!
ошибка:
    <%s>

Зайдите на github репозиторий скрипта, там должен быть json файл([arz]CrBaron_Items.json) со всеми предметами
закиньте этот json в папку config]]):format(er),'<','>',0)
                else
                    sampAddChatMessage('Парсинг предметов начался! Для {CD1515}отмены{cccccc} зажмите цифру 0')
                    crItems = {}
                    local maxPage = 0
                    lua_thread.create(function()
                        local get = false
                        asyncHttpRequest('GET','https://arz-wiki.com/items/',nil,function(r)
                            for l in r.text:gmatch('[^\n]+') do
                                if l:find('^%<a class%=.page%-numbers. href%=.%S+.%>(%d+)%<%/a%>$') then
                                    local n = tonumber(l:match('^%<a class%=.page%-numbers. href%=.%S+.%>(%d+)%<%/a%>$'))
                                    if n > maxPage then;    maxPage = n;    end
                                end
                                get = true
                            end
                        end,nil)
                        while not get do wait(5) end
                        
                        for page = 1,maxPage do
                            if isKeyDown(VK_0) then
                                sampShowDialog(1,'crBot',([[
    Парсинг был отменен!
    Было записано %s предметов из %s/%s страниц]]):format(#crItems,page,maxPage),'<','>',0)
                                break
                            end
                            local get = false
                            asyncHttpRequest('GET','https://arz-wiki.com/items/page/'..page..'/',nil,function(r)
                                for l in r.text:gmatch('[^\n]+') do
                                    if l:find('%<a href%=.https%:%/%/arz%-wiki%.com%/items%/%S+/.%>(.+)%<%/a%>%<%/h2%>$') then
                                        table.insert(crItems,u8:decode(l:match('%<a href%=.https%:%/%/arz%-wiki%.com%/items%/%S+/.%>(.+)%<%/a%>%<%/h2%>$')))
                                    end
                                end
                                get = true
                            end,nil)
                            while (not get) do wait(10) end
                            clearPrints()
                            printStringNow('write item #'..#crItems..',page '..page..'/'..maxPage,1000)
                        end
                        json.save(crItems,'[arz]CrBaron_Items.json')
                        sampAddChatMessage('Парсинг {0CC726}успешно{cccccc} завершен!')
                    end)
                end
            end
        imgui.TextQuestion(u8[[
Скрипт парсит страницы 'https://arz-wiki.com/items/page/1+/' и берет название товаров
в одной странице 30 предметов

время парсинга всех страниц предметов на arz-wiki зависит от вашего интернета
(сайт возможно не будет работать в Украине(но у меня работал, тут зависит от вашего провайдера))
]])
            if imgui.Button(u8'Установить json из github репозиторий скрипта') then
                downloadUrlToFile(
                    'https://raw.githubusercontent.com/v3sp4n/crBot/main/%5Barz%5DCrBaron_Items.json',
                    'moonloader/confog/[arz]CrBaron_Items.json',
                    function(id,status,_,_)
                        if status == 58 then
                            sampAddChatMessage('[arz]CrBaron_Items.json был {0CC726}успешно{cccccc} скачан и установлен в папку config! Скрипт будет перезагружен..')
                            thisScript():reload()
                        end
                    end
                )
            end
            imgui.TextQuestion(u8[[
Возможные неактуальные товары!]])
            imgui.EndPopup()
        end

        imgui.End()
    end


    if lavki.window.v then
        imgui.SetNextWindowSize(imgui.ImVec2(250,380),0)
        imgui.SetNextWindowPos(imgui.ImVec2(sw/1.3,sh/2.5), imgui.Cond.FirstUseEver)
        imgui.Begin(u8'lavki(by vespan)',lavki.window,32)

        if imgui.BeginMenu('edit colors') then
            for k,v in pairs(lavki.colors) do
                if imgui.ColorEdit4(u8(k),v) then
                    j.lavki.colors[k] = {v.v[1],v.v[2],v.v[3],v.v[4]}
                    json.save(j,'[arz]CrBaron.json')
                end
            end
            imgui.EndMenu()
        end

        if imgui.BeginMenu('coordmaster') then
            imgui.Text(u8[[
Если к премеру вы сделали на пару лавок ловлю
то если лавка слетит и скрипт успешно её купит все другие лавки отключат ловлю]])
            if imgui.DragFloat('step',lavki.coordmaster.step,0.5,1,10000) then j.lavki.coordmaster.step = lavki.coordmaster.step.v;    json.save(j,'[arz]CrBaron.json');   end
            if imgui.DragInt('delay',lavki.coordmaster.delay,0.5,10,10000) then j.lavki.coordmaster.delay = lavki.coordmaster.delay.v;    json.save(j,'[arz]CrBaron.json');   end
            imgui.EndMenu()
        end
        if imgui.Button('off all render') then 
            for k,v in ipairs(lavki.lavki) do;  v.render = false;   end
        end
        imgui.SameLine()
        if imgui.Button('off all lovly') then 
            for k,v in ipairs(lavki.lavki) do;  v.buy = false;   end
        end

        for k,v in pairs(lavki.lavki) do
            local r,g,b,a = unpack(j.lavki.colors['свободная лавка'])
            imgui.SetCursorPos(imgui.ImVec2(v.imgui.x,v.imgui.y+40))
            if v.text.text:find('^%S+ продаёт товар') then
                r,g,b,a = unpack(j.lavki.colors['продаёт'])
            elseif v.text.text:find('^%S+ покупает товар') then
                r,g,b,a = unpack(j.lavki.colors['покупает'])                
            elseif v.text.text:find('^%S+ продаёт и покупает товар') then
                r,g,b,a = unpack(j.lavki.colors['продаёт и покупает'])                
            elseif v.text.text:find('^%S+ редактирует список') then
                r,g,b,a = unpack(j.lavki.colors['редактирует'])
            end
            imgui.PushStyleColor(1,imgui.ImVec4(r,g,b,a))
            imgui.Text('<>')
            imgui.PopStyleColor()

            if imgui.IsItemHovered() then
                if imgui.IsItemClicked(0) then
                    v.render = not v.render
                elseif imgui.IsItemClicked(1) then
                    v.buy = not v.buy
                    lua_thread.create(function()
                        if not lavki.coordmaster.work then
                            lavki.coordmaster.work = true
                            coordMaster(v.pos[1],v.pos[2],17)
                        end
                    end)
                end
                imgui.BeginTooltip()
                imgui.Text(u8('Лавка '..k..'\n'..v.text.text))
                imgui.Text(u8(v.render and 'Рендер включен' or 'Рендер выключен') ..u8'(ЛКМ)')
                imgui.Text(u8(v.buy and 'Ловля включена' or 'Ловля выключена') ..u8'(ПКМ)(ловля курдмастером)')
                imgui.EndTooltip()
            end

        end
        imgui.End()
    end

end

function update(notf)

end

function sampev.onShowDialog(id, style, title, b1, b2, text)
    if title == '{BFBBBA}' and text:find('^%{%x+%}Стоимость аренды лавки%: %{%x+%}%$%d+') then

    end

    if bot.bool.v and lavkaOpen() and title:find('Покупка предмета') then
    -- if true then
        local item,int,cost = '',0,0
        for l in text:gmatch('[^\n]+') do
            if l:find('^%{%x+%}%W+%: ') and item == '' then
                item = (l:match('^%{%x+%}%W+%: (.+)')):gsub('%{%x+%}','') 
            end
            if l:find('^В наличии%: (%d+) шт%.') and int == 0 then
                int = tonumber(l:match('^В наличии%: (%d+) шт%.'))
            end
            if l:find('Стоимость%: %$(%S+) за (%d+) шт%.$') and cost == 0 then
                cost = ((l:match('Стоимость%: %$(%S+) за (%d+) шт%.$')):gsub('%.',''):gsub(',',''))
                cost = tonumber(cost)
            end
        end
        for k,v in ipairs(j.bot.items) do
            if v.item == item then
                if v.buy and v.cost <= cost then
                    if style == 0 then
                        lua_thread.create(function() wait(1) sampCloseCurrentDialogWithButton(1) end)
                    else
                        sampSendDialogResponse(id,1,_,tostring((v.int > int and int or v.int)))
                    end
                    v.int = v.int - 1
                    sendTelegramMessage('Предмет %s был куплен за %s$(за 1шт)\nВсего было куплено %s количество,осталось %s',item,cost,int,v.int)
                    if v.int == 0 then
                        sendTelegramMessage('Предмет %s был весь выкуплен!\n(предмет для скупки удален из скрипта)',item)
                        table.remove(j.bot.items,k)
                    end
                    json.save(j,'[arz]CrBaron.json')
                else
                    sendTelegramMessage('Предмет %s был найден в лавке за %s$(за 1шт)\nВсего количества %s',cost,int)
                end
            end
        end
        bot.td.int = bot.td.int + 1
        lua_thread.create(function() wait(3) sampCloseCurrentDialogWithButton(0) end)
    end

end

function drawCircleIn3d(x, y, z, radius, polygons,width,color)
    local step = math.floor(360 / (polygons or 36))
    local sX_old, sY_old
    for angle = 0, 360, step do
        local lX = radius * math.cos(math.rad(angle)) + x
        local lY = radius * math.sin(math.rad(angle)) + y
        local lZ = z
        local _, sX, sY, sZ, _, _ = convert3DCoordsToScreenEx(lX, lY, lZ)
        if sZ > 1 then
            if sX_old and sY_old then
                renderDrawLine(sX, sY, sX_old, sY_old, width, color)
            end
            sX_old, sY_old = sX, sY
        end
    end
end

function setAngle(x,y,z)
    local SMOOTH = 2
    local myPos = {getActiveCameraCoordinates()}
    local vector = {myPos[1] - x, myPos[2] - y, myPos[3] - z}
    if isWidescreenOnInOptions() then coefficentZ = 0.0778 else coefficentZ = 0.103 end
    local angle = {(math.atan2(vector[2], vector[1]) + 0.04253), (math.atan2((math.sqrt((math.pow(vector[1], 2) + math.pow(vector[2], 2)))), vector[3]) - math.pi / 2 - coefficentZ)}
    local view = {fix(representIntAsFloat(readMemory(0xB6F258, 4, false))), fix(representIntAsFloat(readMemory(0xB6F248, 4, false)))}
    local difference = {angle[1] - view[1], angle[2] - view[2]}
    local smooth = {difference[1] / SMOOTH, difference[2] / SMOOTH}
    setCameraPositionUnfixed((view[2] + smooth[2]), (view[1] + smooth[1]))
end

function fix(angle)
    if angle > math.pi then
        angle = angle - (math.pi * 2)
    elseif angle < -math.pi then 
        angle = angle + (math.pi * 2) 
    end
    return angle
end

function gameConvertText(text,conv)
    local t = {
        ['gametorus'] = {[69]=168,[101]=184,[65]=192,[128]=193,[139]=194,[130]=195,[131]=196,[69]=197,[132]=198,[136]=199,[133]=200,[133]=201,[75]=202,[135]=203,[77]=204,[72]=205,[79]=206,[140]=207,[80]=208,[67]=209,[143]=210,[89]=211,[129]=212,[88]=213,[137]=214,[141]=215,[142]=216,[138]=217,[167]=218,[145]=219,[146]=220,[147]=221,[148]=222,[149]=223,[97]=224,[151]=225,[162]=226,[153]=227,[154]=228,[101]=229,[155]=230,[159]=231,[156]=232,[157]=233,[107]=234,[158]=235,[175]=236,[174]=237,[111]=238,[163]=239,[112]=240,[99]=241,[166]=242,[121]=243,[63]=244,[120]=245,[36]=246,[164]=247,[165]=248,[161]=249,[144]=250,[168]=251,[169]=252,[170]=253,[171]=254,[172]=255},
        ['rustogame'] = {[230]=155,[231]=159,[247]=164,[234]=107,[250]=144,[251]=168,[254]=171,[253]=170,[255]=172,[224]=97,[240]=112,[241]=99,[226]=162,[228]=154,[225]=151,[227]=153,[248]=165,[243]=121,[184]=101,[235]=158,[238]=111,[245]=120,[233]=157,[242]=166,[239]=163,[244]=63,[237]=174,[229]=101,[246]=36,[236]=175,[232]=156,[249]=161,[252]=169,[215]=141,[202]=75,[204]=77,[220]=146,[221]=147,[222]=148,[192]=65,[193]=128,[209]=67,[194]=139,[195]=130,[197]=69,[206]=79,[213]=88,[168]=69,[223]=149,[207]=140,[203]=135,[201]=133,[199]=136,[196]=131,[208]=80,[200]=133,[198]=132,[210]=143,[211]=89,[216]=142,[212]=129,[214]=137,[205]=72,[217]=138,[218]=167,[219]=145},
    }
    local result = {}
    for i = 1, #text do
        local c = text:byte(i)
        result[i] = string.char(t[conv:lower()][c] or c)
    end
    return table.concat(result)
end

function renderFontDrawTextFromAlign(FONT,text,x,y,color,align)
    align = align or 1
    if align == 2 then
        x = x - renderGetFontDrawTextLength(FONT,text)/2 
    elseif align == 3 then
        x = x - renderGetFontDrawTextLength(FONT,text)
    end
    renderFontDrawText(FONT,text,x,y,-1)
end

function sendTelegramMessage(text,...)
    for l in (tostring(text)):format(...):gmatch('[^\n]+') do
        sampAddChatMessage('{0090FF}'..l)
    end
    text = '[crBot]'..(tostring(text)):format(...)
    text = text:gsub('{......}', '')
    text = text:gsub(' ', '%+')
    text = text:gsub('\n', '%%0A')
    text = u8:encode(text, 'CP1251')
    requests.get('https://api.telegram.org/bot' .. tg.token.v .. '/sendMessage?chat_id=' .. tg.chat_id.v .. '&text='..text)
end

function sendSyncKey(key)
    local keys = {
        ['W'] = {offset=1,key=32768},
        ['A'] = {offset=1,key=255},
        ['S'] = {offset=2,key=128},
        ['SPRINT'] = {offset=4,key=8},
        ['ALT'] = {offset=4,key=1024},
        ['F'] = {offset=4,key=16},
        ['CAPS LOCK'] = {offset=4,key=128},
        ['Y'] = {offset=36,key=64},
        ['N'] = {offset=36,key=128},
        ['H'] = {offset=36,key=192},
        ['C'] = {offset=36,key=256},
    }
    if keys[key]==nil then return end
    local _, myId = sampGetPlayerIdByCharHandle(PLAYER_PED)
    local data = allocateMemory(68)
    sampStorePlayerOnfootData(myId, data)
    setStructElement(data, keys[key].offset, 2, keys[key].key, false)
    sampSendOnfootData(data)
    freeMemory(data)
end


function coordMaster(px, py, pz)
    -- lua_thread.create(function()
        if not lavki.coordmaster.work then freezeCharPosition(PLAYER_PED,false) return end
        local step = lavki.coordmaster.step.v
        local delay = lavki.coordmaster.delay.v

        local x, y, z = getCharCoordinates(PLAYER_PED)
        local d = getDistanceBetweenCoords3d(px, py, pz, x, y, z)

        if getDistanceBetweenCoords3d(px,py,0,x,y,0) >= 3 then
            local dz = (-5) - z
            z = z + step / 20 * dz
        else
            local dz = pz - z
            z = z + step / d * dz
        end


        if d <= (step) then
            sampAddChatMessage("FIN")
            freezeCharPosition(PLAYER_PED,false)
            setCharCoordinates(PLAYER_PED, px, py, pz)
            lavki.coordmaster.work = false
            return
        end

        freezeCharPosition(PLAYER_PED,true)
        local dx, dy = px - x, py - y
        x = x + step / d * dx
        y = y + step / d * dy

        setCharCoordinates(PLAYER_PED, x, y, z)
        wait(delay)
        coordMaster(px, py, pz)
    -- end)
end


function asyncHttpRequest(method, url, args, resolve, reject)
    local request_thread = (require'effil').thread(function (method, url, args)
    local requests = require 'requests'
    local result, response = pcall(requests.request, method, url, args)
    if result then
        response.json, response.xml = nil, nil
        return true, response
    else
        return false, response
    end
    end)(method, url, args)
    if not resolve then resolve = function() end end
    if not reject then reject = function() end end
    lua_thread.create(function()
        local runner = request_thread
        while true do
            local status, err = runner:status()
            if not err then
                if status == 'completed' then
                    local result, response = runner:get()
                    if result then; resolve(response)
                    else;   reject(response)   
                    end
                    return
                elseif status == 'canceled' then
                    return reject(status)
                end
            else
                return reject(err)
            end
        wait(0)
        end
    end)
end

function stringToLower(s)
    for i = 192, 223 do   
        s = s:gsub(_G.string.char(i), _G.string.char(i + 32))
    end
    s = s:gsub(_G.string.char(168), _G.string.char(184))
    return s:lower()
end

function apply_custom_style()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 0.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0

    colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end
apply_custom_style()

local origsampAddChatMessage = sampAddChatMessage
function sampAddChatMessage(text,...); origsampAddChatMessage('[crBot]{cccccc}' .. (tostring(text)):format(...),0x66EAD3); end

function imgui.TextQuestion(text,tip)
    if text ~= nil then
        imgui.SameLine()
        imgui.TextDisabled('(?)')
    end
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.Text((text == nil and tip or text))
        imgui.EndTooltip()
    end
end
