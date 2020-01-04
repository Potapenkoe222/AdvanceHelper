script_name('{00CCFF}Advance Helper')
script_author('Bill Gates')
script_version_number(16)
script_moonloader(022)
require 'lib.sampfuncs'
require "lib.moonloader"
script_version '20.20.2020'
local dlstatus = require "moonloader".download_status

	
-- Initialising libraries
local inicfg   = require 'inicfg'
local sampev   = require 'lib.samp.events'
local imgui    = require 'imgui'
local encoding = require 'encoding'
local vkeys    = require 'vkeys'
local key = require 'vkeys'
local ffi = require 'ffi'
local memory = require 'memory'
local hook = require "lib.samp.events"
local sw, sh = getScreenResolution()
local my_font = renderCreateFont('Segoe UI', 12, 0x1 + 0x8)


-- Initialising encodings
--encoding.default = 'UTF8'
--local u8 = encoding.UTF8
local lsampev, sp = pcall(require, 'lib.samp.events')
local directini = "moonloader\\AdvanceHelper.ini"
local mainini = inicfg.load(nil, directini)
    require 'lib.moonloader'
	activ = (mainini.config.activ)
	active = (mainini.config.active)
	color = (mainini.interface.color)
	DS1 = (mainini.interface.DS1)
	DS2 = (mainini.interface.DS2)
	DS3 = (mainini.interface.DS3)
	DS4 = (mainini.interface.DS4)
	DS5 = (mainini.interface.DS5)
	DS6 = (mainini.interface.DS6)
	DS7 = (mainini.interface.DS7)
	DS8 = (mainini.interface.DS8)
	DS9 = (mainini.interface.DS9)
	ncmd1 = (mainini.zamenacommand1.notcommand1)
	ncmd2 = (mainini.zamenacommand2.notcommand2)
	ncmd3 = (mainini.zamenacommand3.notcommand3)
	ncmd4 = (mainini.zamenacommand4.notcommand4)
	acmd1 = (mainini.zamenacommand1.activecommand1)
	acmd2 = (mainini.zamenacommand2.activecommand2)
	acmd3 = (mainini.zamenacommand3.activecommand3)
	acmd4 = (mainini.zamenacommand4.activecommand4)
	ip = (mainini.recconect1.ip)
	port = (mainini.recconect1.port)
	reccmd = (mainini.recconect1.reccmd)
	ip2 = (mainini.recconect2.ip2)
	port2 = (mainini.recconect2.port2)
	reccmd2 = (mainini.recconect2.reccmd2)
	meria_goroda = (mainini.config.meria_goroda)
	ad = (mainini.config.ad)




--===========================Основные настройки====================================
--sampAddChatMessage('' .. DS9 .. '' .. tag .. ' ' .. DS1 .. '(*Основной текст*) ' .. DS2 .. '(*выделение*) ' .. DS1 .. '(*Основной текст*) ' .. DS3 .. '(*прочая информация*)', color)
--sampShowDialog(3, '' .. DS4 .. '(Заголовок окна)', command_list, 'OK', '', DIALOG_STYLE_MSGBOX)
--command_list50 =''..DS5..'/cmd		'..DS4..'||'..DS6..'Описание команды' .. DS3 .. '(прочее)- Информация о команде'
--DS7 - Выделенные Абзацы и ошибки
--DS8 - Время в /mp и комментарии к /adv /alic
--DS9 - Цвет тэга [Advance Helper]

--color = '0xFF00CCFF'              -- Цвет текста timestamp
--DS1 = '{eaeaea}' --EAEAEA
--DS2 = '{00ccff}' --00ccff
--DS3 = '{808080}' --808080
--DS4 = '{00ff00}' --00ff00
--DS5 = '{00ccff}' --7fffd4
--DS6 = '{eaeaea}' --EAEAEA
--DS7 = '{ff3300}' --FF3300
--DS8 = '{41A85F}' --41A85F 
--DS9 = '{00ccff}' --00ccff 
--================================================================================== 
 --active = 0
 --inf = 1
 --[Данные] 
--meria_goroda = 'Лас-Вентурас'
--===================================Подача объявления==============================
--ad = 'Куплю бизнес в любой точке штата. Цена:договорная'

--=========================Сокращение или замена команд=============================
--Команда (ncmd = 'lock 1') заменена на команду (acmd = '1') - Без "/"

--=========================Настройка реконнекта=============================
--ip = '5.254.104.131' -- 
--port = '7777'
--reccmd = 'red'
--======================Настройка расположения inf=======================
xinf = '39' --39
yinf = '349' --349
--========================================================================

local servers = {
["5.254.104.131"] = "Advance-RP Red",
["5.254.104.132"] = "Advance-RP Green",
["5.254.104.133"] = "Advance-RP Yellow",
["5.254.104.134"] = "Advance-RP Orange",
["5.254.104.135"] = "Advance-RP Blue",
["5.254.104.136"] = "Advance-RP White",
["5.254.104.137"] = "Advance-RP Silver",
["5.254.104.138"] = "Advance-RP Purple",
["194.61.44.67"] = "Amber",
}




tag = '[Advance Helper]:' -- Тэг перед оповещениями
tag2 = 'Advance Helper' -- Названия скрипта в тексте
tagtest = '{ff8800}[TEST]:' -- Тэг перед оповещениями (для тестеров)
status = '\n[Разработчик]' -- Cтатус владельца (Разработчик, тестер) игрок не прописывается
status_color = '{ff5500}'

--Разработчик{ff5500}
--Тестер{ff9999}


-- Нстройка расписания мероприятий на сервере Advance RP(/mpinfo)
mp00 = 'Гонки по Лас-Вентурас'
mp01 = 'Казаки на Ферме наркоманов'
mp02 = 'Экстремальные гонки на NRG-500'
mp03 = '{ff2200}Гонки по Лас-Вентурас'
mp04 = 'Казаки под водой'
mp05 = 'Экстремальные гонки на Sultan'
mp06 = '{ff2200}Гонки по Лос-Сантос'
mp07 = 'Казаки на военном заводе'
mp08 = 'Экстремальные гонки на NRG-500'
mp09 = 'Гонки по Лос-Сантос'
mp10 = 'Казаки на испытательном полигоне'
mp11 = 'Экстремальные гонки на Infernus'
mp12 = 'Гонки по Лас-Вентурас'
mp13 = 'Казаки на Ферме наркоманов'
mp14 = 'Экстремальные гонки на Sultan'
mp15 = 'Гонки по гетто'
mp16 = 'Казаки под водой'
mp17 = 'Экстремальные гонки на NRG-500'
mp18 = 'Гонки по Сан-Фиерро'
mp19 = 'Казаки на военном заводе'
mp20 = 'Экстремальные гонки на Infernus'
mp21 = 'Гонки по Лос-Сантос'
mp22 = 'Казаки на испытательном полигоне'
mp23 = 'Экстремальные гонки на Sultan'
mpinf = 'Информация о мероприятиях'
mpdata = '{ff2200}обновляется\n{ffffff}Обновленная информация указана белым цветом!' -- Дата обновления информации

--- Main
function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then

		return
	end
	while not isSampAvailable() do wait(100) end
	if servers[sampGetCurrentServerAddress()] == nil then
		sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Скрипт предназначен только для серверов проекта  ' .. DS2 .. 'Advance RP', color)
		sampAddChatMessage(''..DS9..'' .. tag .. ' {ff8800}Внимание произошла критическая ошибка{FF2200} Код: #006 ' .. DS3 .. '(Допуск к серверу запрещен!) ', color)
		sampAddChatMessage(''..DS9..'' .. tag .. ' {ff9900}Работа скрипта приостановлена!', color)
        thisScript():unload()	
		wait(-1)
		end
	autoupdate("https://api.jsonbin.io/b/5e10f16bb236b871b35c0f72", '['..string.upper(thisScript().name)..']: ', "https://api.jsonbin.io/b/5e10f16bb236b871b35c0f72")	
	sampRegisterChatCommand("ginfo", ginfo)
	sampRegisterChatCommand("aut", aut)
	sampRegisterChatCommand("daut", aut1)
	sampRegisterChatCommand("autot", auto)
	sampRegisterChatCommand("gk", gk)
	sampRegisterChatCommand("ainfo", ltest)
	sampRegisterChatCommand("acolor", acolor)
	sampRegisterChatCommand("test", test) 
	sampRegisterChatCommand("mpinfo", mp)  
	sampRegisterChatCommand("p", p) 
	sampRegisterChatCommand("h", h)
	sampRegisterChatCommand("cc", cc)
	sampRegisterChatCommand("st", cmdSetTime)
	sampRegisterChatCommand("sw", cmdSetWeather)
	sampRegisterChatCommand("version", version)
	sampRegisterChatCommand("info", info)
	sampRegisterChatCommand("sinfo", sinfo)
	sampRegisterChatCommand(''..reccmd..'', rec)
	sampRegisterChatCommand(''..reccmd2..'', rec2)
	sampRegisterChatCommand("rechelp", help1)
	sampRegisterChatCommand("reload", reload)
	sampRegisterChatCommand("adhelp", adhelp)
	sampRegisterChatCommand("skin", skin)
	
	sampRegisterChatCommand("history", function(param)
    if param:match('^(%d+)$') and sampIsPlayerConnected(param) then
        local playerNickname = sampGetPlayerNickname(param)
        if playerNickname then sampSendChat("/history " .. playerNickname)
		sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Вам была предоставлена информация о сменах ника, игрока: ' .. DS2 .. '' .. playerNickname .. '' .. DS1 .. '.', color)		
		end
    else sampSendChat("/history " .. param) 
	    sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Для поиска по идентификационному номеру используйте: ' .. DS2 .. '/history [id]' .. DS1 .. '.', color) 
	end
	end)
	sampRegisterChatCommand(''..acmd1..'', cmd1) 
	sampRegisterChatCommand(''..acmd2..'', cmd2) 
	sampRegisterChatCommand(''..acmd3..'', cmd3)  
	sampRegisterChatCommand(''..acmd4..'', cmd4)
	sampRegisterChatCommand("adv", activatecmd)
	sampRegisterChatCommand("alic", activatecmd2)
	sampRegisterChatCommand("inf", activatecmd3)
	opovewenie()
	sampTextdrawDelete(102)
	 while true do	 
		wait(0)	
		if salaryon then
			renderFontDrawText(my_font, ''..DS7..'FireHelp\n{FFFFFF}Заработано: {32C13E}\t ' .. salary .. '$', 39, 450,-1)
		end
		if time then
      setTimeOfDay(time, 0)  
    end
if not isPauseMenuActive() and isPlayerPlaying(playerHandle) then -- Если игрок уже в игре и не на паузе - продолжаем скрипт
          if activ == 1 then -- Проверка на активацию, если activ == 1, то продолжаем
            -- Тут Продолжаем свой код	
--//////////////////////////////////////////////////////////////////////////////////////////////////// 
local _, id = sampGetPlayerIdByCharHandle(playerPed)
local nickname = sampGetPlayerNickname(id)
renderFontDrawText(my_font, ''..DS9..''..tag2..' '..status_color..''..status..'\n' .. DS1 .. 'Ваш ник: '..DS4..'\t '..nickname..'\n' .. DS1 .. 'Ваш id: '..DS4..'\t '..id..'', xinf, yinf,-1)
--////////////////////////////////////////////////////////////////////////////////////////////////////	
	end
		end
	if isKeyJustPressed(VK_HOME) then
      sampSendChat('/ad '..ad..'')
	end
	
	if isKeyJustPressed(VK_END) then
      sampSendChat("/p")
	  sampSendChat("Для связи используйте - SMS")
	  sampSendChat("/h")
	end
   if isKeyJustPressed(VK_SUBTRACT) then
      sampSendChat("/c 60")
    end
	if isKeyJustPressed(VK_MULTIPLY) then
	  sampSendChat("/lock 1")
    end
	if isKeyJustPressed(VK_ADD) then
      sampSendChat("/find")
    end
	if isKeyDown(VK_LSHIFT) and isKeyJustPressed(VK_2) then
      sampSendChat("/lock 2")
	end
	if isKeyDown(VK_LSHIFT) and isKeyJustPressed(VK_3) then
      sampSendChat("/lock 3")
	end
	if isKeyDown(VK_LSHIFT) and isKeyJustPressed(VK_4) then
      sampSendChat("/lock 4")
	end
	 if not isPauseMenuActive() and isPlayerPlaying(playerHandle) then -- Если игрок уже в игре и не на паузе - продолжаем скрипт
          if active == 1 then -- Проверка на активацию, если active == 1, то продолжаем
            -- Тут Продолжаем свой код
local _, id = sampGetPlayerIdByCharHandle(playerPed)
local nickname = sampGetPlayerNickname(id)			
if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_G) then
  sampSendChat('Здраствуйте,я Адвокат Мэрии города ' .. meria_goroda .. ' - ' .. nickname .. '.')
  wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("Для Вас мои услуги будут стоить 9000$. Вы согласны оплатить мои услуги?")
  wait(1000)
  sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Если клиент согласен! Нажмите клавишу ' .. DS2 .. 'Ctrl+H', color)
end
if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_H) then
  sampSendChat("Отлично заполним бланк для освобождения")
  wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("/me открыл портфель") 
  wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("/me вытащил бланк Освобождение заключенного")
   wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("Можно Ваше Имя и Фамилию?")
  wait(1000)
  sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'После того как клиент назвал!. Нажмите клавишу ' .. DS2 .. 'Ctrl+K', color)
  end
if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_K) then
  sampSendChat("/me заполнил бланк") 
  wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("/me расписался на бланке")
   wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("Распишитесь, пожалуйста, тут.")
  wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("/me передал бланк с ручкой клиенту.")
  wait(1000)
  sampAddChatMessage(''..DS9..'' .. tag .. '' .. DS1 .. ' После того как клиент подписал. Введите команду ' .. DS2 .. '/free [id][цена]', color)
  wait(2000)
  sampAddChatMessage(''..DS9..'' .. tag .. ' '.. DS1 .. 'Для выключения отыгровки '.. DS2 .. 'Адвоката '.. DS1 .. 'введите команду ' .. DS2 .. '/adv', color)
  end
  
  
  if not isPauseMenuActive() and isPlayerPlaying(playerHandle) then -- Если игрок уже в игре и не на паузе - продолжаем скрипт
          if active == 1 then -- Проверка на активацию, если active == 1, то продолжаем
            -- Тут Продолжаем свой код
local _, id = sampGetPlayerIdByCharHandle(playerPed)
local nickname = sampGetPlayerNickname(id)			
if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_Q) then
  sampSendChat('Здраствуйте,я Лицензер Мэрии города ' .. meria_goroda .. ' - ' .. nickname .. '.')
  wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("Желаете приобрести лицензию? Базовый уровень прав - 1.000$")
  wait(2000)
  sampSendChat("Профессиональный уровень прав - 10.000$. Лицензия на оружие - 30.000$ ")
  wait(1000)
  sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Если клиент согласен! Нажмите клавишу ' .. DS2 .. 'Ctrl+W', color)
end
if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_W) then
  sampSendChat("/me достал папку с документами")
  wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("/me достал ручку из кармана") 
  wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("/me заполнил данные о лицензии")
   wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("Будьте добры, Ваше Имя и Фамилия.")
  wait(1000)
  sampAddChatMessage(''..DS9..'' .. tag .. '' .. DS1 .. ' После того как клиент назвал!. Нажмите клавишу ' .. DS2 .. 'Ctrl+E', color)
  end
if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_E) then
  sampSendChat("/me заполнил бланк на выдачу лицензии") 
  wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("/me расписался на бланке")
   wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("Распишитесь, пожалуйста, тут.")
  wait(2000) -- задержка в мс 2000 - 2 сек
  sampSendChat("/me передал бланк с ручкой клиенту.")
  wait(1000)
  sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'После подписания. Введите команду ' .. DS2 .. '/givelic [id] [id лицензии (1 - права , 2 - оружие)] [цена]', color)
  wait(20000)
  sampSendChat("/me выдал лицензию")
  wait(1000)
  sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Поздравляем лицензия продана!', color)
  wait(2000)
  sampAddChatMessage(''..DS9..'' .. tag .. ' '.. DS1 .. 'Для выключения отыгровки '.. DS2 .. 'Лицензера '.. DS1 .. 'введите команду ' .. DS2 .. '/alic', color)
  end
end
end
end
end
end
end


    function opovewenie()
		sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Для получения подробной информации введите ' .. DS2 .. '/info', color)
    end
	function skin()
		sampShowDialog(3, ''.. DS4 ..'Цены на скины (Advance / Diamond)', command_list4, 'OK', '', DIALOG_STYLE_LIST)
	end
	
function ginfo()
		sampShowDialog(3, ''.. DS4 ..'Команды для использования', command_list, 'OK', '', DIALOG_STYLE_MSGBOX)
	end	
	
	function version()
		sampShowDialog(3, ''.. DS4 ..'Лог обновлений ' .. thisScript().name .. ' ' .. DS3 .. '(Версия: ' .. version_1 .. ')', command_list6, 'OK', '', DIALOG_STYLE_MSGBOX)
	end
	
	function p()
		local _, id = sampGetPlayerIdByCharHandle(playerPed)
		local nickname = sampGetPlayerNickname(id)	
		sampSendChat("/p")
		sampSendChat('Добрый день! Меня зовут ' .. nickname .. ', чем я могу помочь?')
	end
	
	function h()
		sampSendChat("Спасибо за звонок. До свидания.")
		sampSendChat("/h")
	end
	
	function aut()
		sampShowDialog(1, ''.. DS4 ..'Цены для продажи/покупки автомобилей на проекте Advance RP', command_list2, 'ОК', '', DIALOG_STYLE_LIST)
	end
	
	function aut1()
		sampShowDialog(1, ''.. DS4 ..'Цены для продажи/покупки автомобилей на проекте Diamond RP', command_list15, 'ОК', '', DIALOG_STYLE_LIST)
	end
	
	function test()
		sampAddChatMessage(''..DS9..'' .. tag .. ' {ff8800}Внимание произошла критическая ошибка{FF2200} Код: K-6 ' .. DS3 .. '(Доступно в тестовой версии!) ', color)
		sampAddChatMessage(''..DS9..'' .. tag .. ' {ff9900}Для устанения ошибки обратитесь к создателю и укажите код ошибки!', color)
	end
	
	function auto()
		sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Информация о всех транспортных средствах на ' .. DS2 .. 'Advance RP', color)
		sampShowDialog(1, ''.. DS4 ..'Цены на автомобили', command_list5, 'OK', '', DIALOG_STYLE_LIST)
	end
	
	function gk()
		sampShowDialog(3, ''.. DS4 ..'Список модифицированных команд:', command_list3, 'OK', '', DIALOG_STYLE_MSGBOX)
	end

function rec()
		sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Произведен реконнект командой ' .. DS2 .. '/'..reccmd..'' .. DS1 .. ' по адресу ' .. DS2 .. ''..ip..':'..port..'' .. DS3 .. ' (/ainfo)', color)
		sampConnectToServer(''..ip..'', port)
	end

function rec2()
		sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Произведен реконнект командой ' .. DS2 .. '/'..reccmd2..'' .. DS1 .. ' по адресу ' .. DS2 .. ''..ip2..':'..port2..'' .. DS3 .. ' (/ainfo)', color)
		sampConnectToServer(''..ip2..'', port2)
	end

function reload()
	  sampAddChatMessage(''..DS9..'' .. tag .. ''..DS1..' Cкрипты ' .. DS2 .. 'lua '..DS1..'успешно '..DS8..'перезагружены'..DS1..'!', color)
      reloadScripts()
    end

	function ltest()
		sampShowDialog(3, ''.. DS4 ..'Заданные настройки ' .. thisScript().name .. '', command_list8, 'OK', '', DIALOG_STYLE_LIST)
	end

	function adhelp()
		sampShowDialog(3, ''.. DS4 ..'Информация про подачу объявления ', command_list13, 'OK', '', DIALOG_STYLE_MSGBOX)
	end
	
	function info()
		local name_server = sampGetCurrentServerName()
		local ip,port = sampGetCurrentServerAddress()
		local _, id = sampGetPlayerIdByCharHandle(playerPed)
		local nickname = sampGetPlayerNickname(id)
		sampShowDialog(3, ''.. DS4 ..'Информация о ' .. thisScript().name .. ' ' .. DS3 .. '(Версия: '..thisScript().version..')', '\n' .. DS1 .. 'Добро пожаловать ' .. DS2 .. ''..nickname..'\n\n' .. DS8 .. 'Текущий сервер: \t' .. DS1 .. '' .. name_server .. ' \n' .. DS8 .. 'IP-адрес: \t\t' .. DS1 .. '' .. ip .. ':'..port..'\n\n' .. DS1 .. 'Информацию о командах вы можете узнать используя ' .. DS2 .. '/ginfo\n\n'..DS5..'/inf\t\t' .. DS4 .. '||'..DS6..'- Показ информации\n'..DS5..'/autologin\t' .. DS4 .. '||'..DS6..'- Настройка АвтоЛогина\n'..DS5..'/adv\t\t' .. DS4 .. '||'..DS6..'- Отыгровка работы Адвоката\n'..DS5..'/alic\t\t' .. DS4 .. '||'..DS6..'- Отыгровка работы Лицензера\n'..DS5..'/gk\t\t' .. DS4 .. '||'..DS6..'- Список модифицированных команд\n'..DS5..'/autot\t\t' .. DS4 .. '||'..DS6..'- Цены на автомобили\n'..DS5..'/aut\t\t' .. DS4 .. '||'..DS6..'- Цены на автомобили для перепродажи\n'..DS5..'/mpinfo\t\t' .. DS4 .. '||'..DS6..'- Расписание мероприятий\n'..DS5..'/сс\t\t' .. DS4 .. '||'..DS6..'- Очистить чат ' .. DS3 .. '(16 строк)\n'..DS5..'/history\t' .. DS4 .. '||'..DS6..'- История имен по id\n'..DS5..'/st\t\t' .. DS4 .. '||'..DS6..'- Изменение времени ' .. DS3 .. '(визуально)\n'..DS5..'/sw\t\t' .. DS4 .. '||'..DS6..'- Изменение погоды ' .. DS3 .. '(визуально)\n'..DS5..'/reload\t\t' .. DS4 .. '||'..DS6..'- Перезагрузка всех lua-скриптов\n\n'..DS5..'/ainfo\t\t' .. DS4 .. '||'..DS6..'- Заданные настройки\n'..DS5..'/aсolor\t\t' .. DS4 .. '||'..DS6..'- Заданные настройки цвета\n'..DS5..'/version\t' .. DS4 .. '||'..DS6..'- Лог обновлений скрипта\n\n' .. DS1 .. 'Изменение настроек и цветовых параметров\nвыполняетcя в файле ' .. DS2 .. 'Advance.lua\n\n' .. DS1 .. 'Разработчик: ' .. DS7 .. 'Bill Gates{FFFFFF}', 'OK', '', DIALOG_STYLE_MSGBOX)
	end
	
	function acolor()
		sampShowDialog(3, ''.. DS4 ..'Заданные настройки цвета ' .. thisScript().name .. '', command_list9, 'OK', '', DIALOG_STYLE_LIST)
	end
	
	function cc()
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage("		", color)
	  sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Чат успешно ' .. DS2 .. 'очищен' .. DS1 .. '!', color)
    end
	function mp()
		sampShowDialog(1, ''.. DS4 ..'Расписание мероприятий', command_list7, 'OK', '', DIALOG_STYLE_MSGBOX)
	end
	function cmd1()
		sampSendChat('/'..ncmd1..'')
	end
	function cmd2()
		sampSendChat('/'..ncmd2..'')
	end
	function cmd3()
		sampSendChat('/'..ncmd3..'')
	end
	function cmd4()
		sampSendChat('/'..ncmd4..'')
	end
	
--- Callbacks
function cmdSetTime(param)
  local hour = tonumber(param)
  if hour ~= nil and hour >= 0 and hour <= 23 then
    time = hour
    patch_samp_time_set(true)
	sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Время было изменено на ' .. DS2 .. '' .. param .. '' .. DS1 .. ' ч.', color)
  else
	sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Правильный ввод: ' .. DS2 .. '/st [0 - 23]' .. DS1 .. '.', color)
    patch_samp_time_set(false)
    time = nil
  end
end

function cmdSetWeather(param)
  local weather = tonumber(param)
  if weather ~= nil and weather >= 0 and weather <= 45 then
    sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Погода была изменена на ' .. DS2 .. '' .. param .. '' .. DS1 .. '.', color) 
    forceWeatherNow(weather)
	else
	forceWeatherNow(false)
	sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Правильный ввод: ' .. DS2 .. '/sw [0 - 45]' .. DS1 .. '.', color)
  end
end

function patch_samp_time_set(enable)
	if enable and default == nil then
		default = readMemory(sampGetBase() + 0x9C0A0, 4, true)
		writeMemory(sampGetBase() + 0x9C0A0, 4, 0x000008C2, true)
	elseif enable == false and default ~= nil then
		writeMemory(sampGetBase() + 0x9C0A0, 4, default, true)
		default = nil
	end
end

function activatecmd()
   if active == 0 then -- Если active == 0, то присваиваем ему 1
       active = 1
	   sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Отыгровка Адвоката ' .. DS4 .. 'включена' .. DS1 .. '! Для активации нажмите ' .. DS2 .. 'Ctrl+G', color)
   else -- Если activeadv == 0, то присваиваем 1
       active = 0
	   sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Отыгровка Адвоката ' .. DS7 .. 'выключена' .. DS1 .. '! Для включения введите команду ' .. DS2 .. '/adv', color)
     end
end

function activatecmd2()
   if active == 0 then -- Если active == 0, то присваиваем ему 1
       active = 1
	   sampAddChatMessage(''..DS9..'' .. tag .. '' .. DS1 .. ' Отыгровка Лицензера ' .. DS4 .. 'включена' .. DS1 .. '! Для активации нажмите ' .. DS2 .. 'Ctrl+Q', color)
   else -- Если active == 0, то присваиваем 1
       active = 0
	   sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Отыгровка Лицензера' .. DS7 .. ' выключена' .. DS1 .. '! Для включения введите ' .. DS2 .. '/alic', color)
     end
	end
	
	function activatecmd3()
   if activ == 0 then -- Если activ == 0, то присваиваем ему 1
       activ = 1
	   sampAddChatMessage(''..DS9..'' .. tag .. '' .. DS1 .. ' Показ информации ' .. DS4 .. 'включен' .. DS1 .. '! Для активации введите ' .. DS2 .. '/inf', color)
   else -- Если activ == 0, то присваиваем 1
       activ = 0
	   sampAddChatMessage(''..DS9..'' .. tag .. ' ' .. DS1 .. 'Показ информации' .. DS7 .. ' выключен' .. DS1 .. '! Для включения введите ' .. DS2 .. '/inf', color)
     end
	end
	
function sampev.onServerMessage(color, text)
--	print(text.. " | " ..color)
	if string.find(color, "-1", 1, true) and string.find(text, "Чтобы завершить или начать рабочий день можно также использовать команду ", 1, true) then
		salary = 0
		salaryon = true
		return true
	end
	if string.find(color, "-1", 1, true) and string.find(text, "Потушено очагов возгорания: ", 1, true) and salaryon then
		salaryon = false
		sampTextdrawDelete(105)
		return true
	end
	if string.find(color, "865730559", 1, true) and string.find(text, "Огонь потушен!", 1, true) and salaryon then
		money = string.match(text, "Бонус (%d+)")
		salary = salary+money
	end
end

function sinfo()
		sampShowDialog(1, '{FF2222}Информация по сокращению команд!', command_list10, 'OK', 'назад', DIALOG_STYLE_MSGBOX)
	end


function help1()
		sampShowDialog(1, ''..DS4..'Информация по настройке реконнекта', command_list12, 'OK', 'назад', DIALOG_STYLE_MSGBOX)
	end

command_list =''..DS5..'/info\t\t' .. DS4 .. '||'..DS6..'- Информация о скрипте\n'..DS5..'/autologin\t' .. DS4 .. '||'..DS6..'- Настройка АвтоЛогина\n'..DS5..'/inf\t\t' .. DS4 .. '||'..DS6..'- Показ информации\n'..DS5..'/adv\t\t' .. DS4 .. '||'..DS6..'- Отыгровка работы Адвоката\n'..DS5..'/alic\t\t' .. DS4 .. '||'..DS6..'- Отыгровка работы Лицензера\n'..DS5..'/gk\t\t' .. DS4 .. '||'..DS6..'- Список модифицированных команд\n'..DS5..'/autot\t\t' .. DS4 .. '||'..DS6..'- Цены на автомобили\n'..DS5..'/aut\t\t' .. DS4 .. '||'..DS6..'- Цены на автомобили для перепродажи\n'..DS5..'/mpinfo\t\t' .. DS4 .. '||'..DS6..'- Расписание мероприятий\n'..DS5..'/сс\t\t' .. DS4 .. '||'..DS6..'- Очистить чат ' .. DS3 .. '(16 строк)\n'..DS5..'/history\t' .. DS4 .. '||'..DS6..'- История имен по id\n'..DS5..'/st\t\t' .. DS4 .. '||'..DS6..'- Изменение времени ' .. DS3 .. '(визуально)\n'..DS5..'/sw\t\t' .. DS4 .. '||'..DS6..'- Изменение погоды ' .. DS3 .. '(визуально)\n'..DS5..'/reload\t\t' .. DS4 .. '||'..DS6..'- Перезагрузка всех lua-скриптов\n\n'..DS5..'/ainfo\t\t' .. DS4 .. '||'..DS6..'- Заданные настройки\n'..DS5..'/aсolor\t\t' .. DS4 .. '||'..DS6..'- Заданные настройки цвета\n'..DS5..'/version\t' .. DS4 .. '||'..DS6..'- Лог обновлений скрипта'
command_list3 = ''..DS7..'Горячие клавиши:\n'..DS5..'HOME		' .. DS4 .. '||'..DS6..'- Подача объявления ' .. DS3 .. '(/adhelp)\n'..DS5..'Numpad -	' .. DS4 .. '||'..DS6..'- Заменяет команду /c 60\n'..DS5..'Numpad +	' .. DS4 .. '||'..DS6..'- Заменяет команду /find\n'..DS5..'Numpad *	' .. DS4 .. '||'..DS6..'- Заменяет команду /lock 1\n'..DS5..'LSHIFT + 2	' .. DS4 .. '||'..DS6..'- Заменяет команду /lock 2\n'..DS5..'LSHIFT + 3	' .. DS4 .. '||'..DS6..'- Заменяет команду /lock 3\n'..DS5..'LSHIFT + 4	' .. DS4 .. '||'..DS6..'- Заменяет команду /lock 4\n\n'..DS7..'Сокращенные команды' .. DS3 .. ' (/sinfo):\n'..DS5..'/'..acmd1..'		' .. DS4 .. '||'..DS6..'- Заменяет команду /'..ncmd1..'\n'..DS5..'/'..acmd2..'		' .. DS4 .. '||'..DS6..'- Заменяет команду /'..ncmd2..'\n'..DS5..'/'..acmd3..'		' .. DS4 .. '||'..DS6..'- Заменяет команду /'..ncmd3..'\n'..DS5..'/'..acmd4..'		' .. DS4 .. '||'..DS6..'- Заменяет команду /'..ncmd4..'\n\n'..DS7..'Измененные команды:\n'..DS5..'/p		' .. DS4 .. '||'..DS6..'- Автоприветствие ' .. DS3 .. '(для телефонного звонка)\n'..DS5..'/h		' .. DS4 .. '||'..DS6..'- Автопрощание ' .. DS3 .. '(для телефонного звонка)'
command_list7 = ''..DS8..'00.05 - '..DS6..''..mp00..'\n'..DS8..'01.05 - '..DS6..''..mp01..'\n'..DS8..'02.05 - '..DS6..''..mp02..'\n'..DS8..'03.05 - '..DS6..''..mp03..'\n'..DS8..'04.05 - '..DS6..''..mp04..'\n'..DS8..'05.10 - '..DS6..''..mp05..'\n'..DS8..'06.05 - '..DS6..''..mp06..'\n'..DS8..'07.05 - '..DS6..''..mp07..'\n'..DS8..'08.05 - '..DS6..''..mp08..'\n'..DS8..'09.05 - '..DS6..''..mp09..'\n'..DS8..'10.05 - '..DS6..''..mp10..'\n'..DS8..'11.05 - '..DS6..''..mp11..'\n'..DS8..'12.05 - '..DS6..''..mp12..'\n'..DS8..'13.05 - '..DS6..''..mp13..'\n'..DS8..'14.05 - '..DS6..''..mp14..'\n'..DS8..'15.05 - '..DS6..''..mp15..'\n'..DS8..'16.05 - '..DS6..''..mp16..'\n'..DS8..'17.05 - '..DS6..''..mp17..'\n'..DS8..'18.05 - '..DS6..''..mp18..'\n'..DS8..'19.05 - '..DS6..''..mp19..'\n'..DS8..'20.05 - '..DS6..''..mp20..'\n'..DS8..'21.05 - '..DS6..''..mp21..'\n'..DS8..'22.05 - '..DS6..''..mp22..'\n'..DS8..'23.05 - '..DS6..''..mp23..'\n\n'..DS1..''..mpinf..' '..DS8..''..mpdata..''
--command_list8 =''..DS5..'Ник\t\t\t' .. DS4 .. '||'..DS6..' '..nick..'\n'..DS5..'Мэрия города\t\t' .. DS4 .. '||'..DS6..' '..meria_goroda..'\n'..DS5..'Объявление\t\t' .. DS4 .. '||'..DS6..' '..ad..''
command_list8 =''..DS5..'Мэрия города\t\t' .. DS4 .. '||'..DS6..' '..meria_goroda..'\n{808080}__________________Информация о реконнекте________________________\n'..DS5..'Команда для реконнекта №1:\t\t' .. DS4 .. '|| '..DS6..'/'..reccmd..'\n'..DS5..'Aдрес сервера:\t\t\t' .. DS4 .. '|| '..DS6..' '..ip..':'..port..'\n'..DS5..'Команда для реконнекта №2:\t\t' .. DS4 .. '|| '..DS6..'/'..reccmd2..'\n'..DS5..'Aдрес сервера:\t\t\t' .. DS4 .. '|| '..DS6..' '..ip2..':'..port2..'\n'..DS1..'Информацию о настройке вы можете узнать используя '..DS2..'/rechelp\n'
command_list9 = '{7fffd4}Параметр\tЦветовая конфигурация параметров\n{ffffff}DS1\t\t'..DS1..'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n{ffffff}DS2\t\t'..DS2..'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n{ffffff}DS3\t\t'..DS3..'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n{ffffff}DS4\t\t'..DS4..'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n{ffffff}DS5\t\t'..DS5..'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n{ffffff}DS6\t\t'..DS6..'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n{ffffff}DS7\t\t'..DS7..'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n{ffffff}DS8\t\t'..DS8..'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n{ffffff}DS9\t\t'..DS9..'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
command_list13 = '\n{ff9900}Для настройки подачи объявления следуйте следующим пунктам:\n\n{ff9900}1) {eaeaea}Откройте файл {00ccff}Advance.lua {eaeaea}с помощью блокнота.{808080} (Путь: GTA SAMP/moonloader/config/Advance.lua)\n{ff9900}2) {eaeaea}Найдите раздел {00ccff}"Подача объявления"\n{ff9900}3) {eaeaea}Замените параметр соответствующим значением:\n\n{ff9900}Например,{eaeaea} нужно заменить на {00ccff}Куплю бизнес. Цена договорная.\n{eaeaea}В переменной {00ccff}ad = "ваше обьявление" {eaeaea}заменяем значение на ваше обьявление {808080}(без "/ad")\n{ff9900}Общий вид в файле:\n{eaeaea}ad = "Куплю бизнес. Цена договорная"\n{ff9900}4) {eaeaea}Сохраняем файл. Заходим в игру {808080}(если уже в игре, то /reload)\n\n{eaeaea}Обьявление автоматически заменится в {00ccff}/adinfo\n\n{ff9900}Текущее объявление:\n{eaeaea}\t\t\t{41A85F}'..ad..''


command_list10 =
[[
{ff9900}
Для настройки функции сокращения и замены команд следуйте следующим пунктам:

{ff9900}1) {eaeaea}Откройте файл {00ccff}Advance.lua {eaeaea}с помощью блокнота.{808080} (Путь: GTA SAMP/moonloader/config/Advance.lua)
{ff9900}2) {eaeaea}Найдите раздел {00ccff}"Сокращение или замена команд"
{ff9900}3) {eaeaea}Замените параметры соответствующей командой:

{ff9900}Например,{eaeaea} нужно заменить команду {00ccff}/lock 1 {eaeaea}на {00ccff}/1.
{eaeaea}В переменной {00ccff}ncmd1 = 'lock 1' {eaeaea}заменяем значение на заменяемую команду {808080}(без "/")
{eaeaea}В переменной {00ccff}acmd1 = '1' {eaeaea}заменяем значение на заменяющую команду {808080}(без "/")
{ff9900}4) {eaeaea}Сохраняем файл. Заходим в игру {808080}(если уже в игре, то /reload)
  
  {eaeaea}Команды автоматически изменятся в {00ccff}/gk
  
  {ff9900}Общий вид в файле:
  {eaeaea}ncmd1 = 'lock 1'   acmd = '1'
]]

command_list12 =
[[
{ff9900}
Для настройки реконнекта следуйте следующим пунктам:

{ff9900}1) {eaeaea}Откройте файл {00ccff}Advance.lua {eaeaea}с помощью блокнота.{808080} (Путь: GTA SAMP/moonloader/config/Advance.lua)
{ff9900}2) {eaeaea}Найдите раздел {00ccff}"Настройки реконнекта"
{ff9900}3) {eaeaea}Замените параметры соответствующим значением:

{ff9900}Например,{eaeaea} нужно заменить команду на {00ccff}/rec,{eaeaea} а также {00ccff}IP-адрес.
{eaeaea}В переменной {00ccff}reccmd = 'rec' {eaeaea}заменяем значение на заменяемую команду {808080}(без "/")
{eaeaea}В переменной {00ccff}ip = '5.254.104.131' {eaeaea}заменяем значение на ваш IP {808080}(все числа до ':')
{eaeaea}В переменной {00ccff}port = '7777' {eaeaea}заменяем значение на ваш порт {808080}(все числа после ':')
{ff9900}4) {eaeaea}Сохраняем файл. Заходим в игру {808080}(если уже в игре, то /reload)
  
  {eaeaea}Команды автоматически изменятся в {00ccff}/reinfo
  
  {ff9900}Общий вид в файле:
  {eaeaea}ip = '5.254.104.131'
  {eaeaea}port = '7777'
  {eaeaea}reccmd = 'rec'
]]




command_list2 =
[[{FFFFFF}Марка		Гос.		Min.		Max.		Min.[FT]	Max.[FT]
{7fffd4}Sultan		590.000$	520.000$	560.000$	1.470.000$	1.510.000$
{7fffd4}Elegy		305.000$	260.000$	290.000$	1.210.000$	1.240.000$
{7fffd4}Huntley 	214.000$	170.000$	200.000$	1.120.000$	1.150.000$
{7fffd4}Bullet		1.250.000$	1.100.000$	1.200.000$	2.050.000$	2.150.000$
{7fffd4}Cheetah 	1.800.000$	1.500.000$	1.700.000$	2.450.000$	2.650.000$
{7fffd4}Turismo 	2.100.000$	1.800.000$	2.000.000$	2.750.000$	2.950.000$
{7fffd4}Banshee 	730.000$	630.000$	700.000$	1.580.000$	1.650.000$
]]


command_list6 =
[[	
{7fffd4}Версия: 1.2.0  {FFFFFF}(Обновлено: {F37934}24.09.2019 {FFFFFF})
		{FFFFFF}-{808080}Добавлен настраиваемый реконнект (/rechelp)
		{FFFFFF}-{808080}Добавлены 4 настраиваемые команды (/none)

{7fffd4}Версия: 1.1.0  {FFFFFF}(Обновлено: {F37934}14.09.2019 {FFFFFF})
		{FFFFFF}-{808080}Глобальное обновление, направленое на настройку
		оформления в индивидуальном порядке

{7fffd4}Версия: 1.0.3  {FFFFFF}(Обновлено: {F37934}13.07.2019 {FFFFFF})
		{FFFFFF}-{808080}Добавлена система изменения цветной палитры
		
{7fffd4}Версия: 1.0.2  {FFFFFF}(Обновлено: {F37934}28.05.2019 {FFFFFF})
		{FFFFFF}-{808080}Добавлена смена погоды командой /sw	
		{FFFFFF}-{808080}Добавлена смена времени дня командой /st
		{FFFFFF}-{808080}Оптимизация скрипта		
		
{7fffd4}Версия: 1.0.1  {FFFFFF}(Обновлено: {F37934}28.02.2019 {FFFFFF})
		{FFFFFF}-{808080}Добавлена функция /history по id
	
	

]]

command_list15 =
[[
{41A85F}id	Марка		Гос. цена	Скорость | Скорость[FT]{7fffd4}
Esperanto - 90.000$104 км/ч
Perenniel - 19.000$ - 93 км/ч
Bravura - 30.000$ - 102 км/ч
Manana - 25.000$ - 90 км/ч
Voodoo - 100.000$ - 118 км/ч
Pony - 115.000$ - 77 км/ч
Bobcat - 36.000$ - 98 км/ч
Stallion - 25.000$ - 118 км/ч
Oceanic - 28.000$ - 98 км/ч
Glendale - 34.000$ - 104 км/ч
Hermes - 39.000$ - 104 км/ч
Regina - 28.000$ - 98 км/ч
GreenWood - 30.000$ - 98 км/ч
Virgo - 38.000$ - 104 км/ч
Majestic - 38.000$ - 110 км/ч
Buccaneer - 40.000$ - 115 км/ч
Clover - 15.000$ - 115 км/ч
Sadler - 15.000$ - 105 км/ч
Hustler - 20.000$ - 103 км/ч
Tampa - 33.000$ - 101 км/ч
BroadWay - 35.000$ - 110 км/ч
Tornado - 33.000$ - 110 км/ч
Picador - 25.000$ - 105 км/ч
Emperor - 30.000$ - 107 км/ч


Phoenix - 300.000$ - 120 км/ч
Huntley - 205.000$ - 110 км/ч
Club - 200.000$ - 113 км/ч
Stafford - 250.000$ - 107 км/ч
Savanna - 150.000$ - 121 км/ч
Tahoma - 150.000$ - 112 км/ч
Stratum - 120.000$ - 107 км/ч
Uranus - 160.000$ - 108 км/ч
Windsor - 120.000$ - 110 км/ч
Yosemite - 165.000$ - 100 км/ч
Merit - 130.000$ - 110 км/ч
Remington - 200.000$ - 118 км/ч
Cadrona - 100.000$ - 104 км/ч
Slamvan - 18.000$ - 110 км/ч
Elegant - 140.000$ - 116 км/ч
Rancher - 180.000$ - 97 км/ч
Fortune - 150.000$ - 110 км/ч
Feltzer - 150.000$ - 117 км/ч
Mesa - 120.000$ - 98 км/ч
Blista Compact - 120.000$ - 114 км/ч
Sabre - 40.000$ - 121 км/ч
Admiral - 100.000$ - 114 км/ч
Premier - 150.000$ - 121 км/ч
Washington - 190.000$ - 107 км/ч
Sentinel - 160.000$ - 114 км/ч
Landstalker - 150.000$ - 110 км/ч


Alpha - 395.000$ - 118 км/ч
Euros - 450.000$ - 115 км/ч
Jester - 540.000$ - 124 км/ч
Sultan - 570.000$ - 118 км/ч
Elegy - 400.000$ - 124 км/ч
Bullet - 1.100.000$ - 142 км/ч
Super GT - 700.000$ - 105 км/ч
Comet - 555.000$ - 129 км/ч
Hotknife - 1.300.000$ - 116 км/ч
ZR-350 - 810.000$ - 130 км/ч
Cheetah - 1.600.000$ -134 км/ч
Banshee Banger - 900.000$ - 142 км/ч
Buffalo - 900.000$ - 130 км/ч
Turismo - 2.000.000$ - 135 км/ч
Infernus - 5.000.000$ - 155 км/ч


BMX - 2.000$ - N/A
Bike - 2.100$ - N/A
Mountain Bike - 5.000$ - N/A
Faggio - 10.000$ - 76 км/ч
PCJ-600 - 120.000$ - 108 км/ч
FCR-900 - 150.000$ - 110 км/ч
Freeway - 100.000$ - 99 км/ч
Wayfarer - 30.000$ - 103 км/ч
Quad - 50.000$ - 77 км/ч
Sanchez - 80.000$ - 100 км/ч
NRG-500 - 2.500.000$ - 128 км/ч
]]



command_list5 =
[[{41A85F}id	Марка			Тип		Гос. цена	Прочее	Скорость | Скорость[FT]{7fffd4}
445	Admiral			авто		140.000$			 91	 | 	118
602	Alpha			авто		280.000$				 94 | 122		
424	BF Injection		авто		625.000$				 75 | 98
581	BF-400			мото		123.000$				  - | -
481	BMX			вело		12.500$					  - | -
568	Bandito			авто		242.000$				 87 | 113
429	Banshee		авто		730.000$				112 | 146
511	Beagle			самолет	5.120.000$	лото			  - | -
509	Bike			вело		4.200$				  	  - | -
536	Blade			авто		152.000$				 96 | 125
496	Blista			авто		220.000$				 90 | 117
504	Bloodring Banger	авто		730.000$				 96 | 125
422	Bobcat			авто		23.700$					 78 | 101
401	Bravura		авто		64.000$					 82 | 107
575	Broadway		авто		41.000$					 88 | 114
402	Buffalo			авто		850.000$				103 | 134
541	Bullet			авто		1.250.000$				113 | 147
527	Cadrona		авто		86.200$					83 | 108
483	Camper			авто		201.500$				68 | 95
415	Cheetah		авто		1.800.000$				107 | 139
542	Clover			авто		15.000$					91 | 118
589	Club			авто		350.000$				90 | 117
480	Comet			авто		795.000$				102 | 133
512	Cropduster		самолет	5.180.000$	лото			- | -
473	Dinghy			лодка		2.200.000$	лото			- | -
593	Dodo			самолет	5.350.000$	лото			- | -
562	Elegy			авто		305.000$				99 | 129
585	Emperor		авто		116.000$				85 | 111
587	Euros			авто		525.000$				91 | 118
521	FCR-900		мото		162.000$				- | -
462	Faggio			мото		24.000$					- | -
533	Feltzer			авто		240.000$				93 | 121
565	Flash			авто		642.000$				91 | 118
526	Fortune		авто		82.000$					88 | 114
463	Freeway		мото		98.000$					- | -
466	Glendale		авто		24.000$					82 | 107
492	Grenwood		авто		35.000$					78 | 101
474	Hermes			авто		17.300$					83 | 108
588	Hotdog			авто		148.000$	лото			60 | 78
434	Hotknife		авто		430.000$	лото			93 | 121
494	Hotring Racer		авто		850.000$	лото		119 | 155
502	Hotring Racer А	авто		940.000$	лото		119 | 155
503	Hotring Racer Б	авто		941.000$	лото		119 | 155
579	Huntley			авто		214.000$			88 | 114
545	Hustler			авто		15.200$				82 | 107
411	Infernus		авто		5.000.000$	лото			123 | 170
546	Intruder		авто		121.000$			83 | 108
559	Jester			авто		659.000$			99 | 129
493	Jetmax			лодка		4.600.000$	лото
508	Journey		авто		429.000$				69 | 94
571	Kart			авто		123.000$	лото			35 | 46
400	Landstalker		авто		165.000$				88 | 114
417	Leviathan		вертолет	5.800.000$	лото		- | -
517	Majestic		авто		23.000$				87 | 113
410	Manana			авто		12.000$				72 | 94
484	Marquis		лодка		4.780.000$	лото		- | -
487	Maverick		вертолет	5.175.000$	лото		- | -
500	Mesa			авто		115.000$				78 | 101
418	Moonbeam		авто		145.000$				65 | 85
510	Mountain Bike		вело		16.800$				- | -
522	NRG-500		мото		4.850.000$				- | -
516	Nebula			авто		43.000$				87 | 113
467	Oceanic		авто		31.500$				78 | 101
461	PCJ-600		мото		140.000$				- | -
470	Patriot			авто		570.000$				87 | 113
404	Perenniel		авто		19.500$				74 | 96
603	Phoenix		авто		395.000$				95 | 124
600	Picador			авто		19.200$				84 | 109
426	Premier		авто		130.000$				96 | 125
436	Previon		авто		84.000$				83 | 108
547	Primo			авто		125.000$				79 | 103
471	Quad			мото		194.000$				- | -
563	Raindance		авто		5.920.000				- | -
505	Rancher		авто		176.000$				77 | 100
453	Reefer			лодка		3.100.000$	лото		- | -
479	Regina			авто		47.500$				78 | 101
534	Remington		авто		280.000$				94 | 102
442	Romero		авто		164.000$				77 | 100
475	Sabre			авто		82.000$				96 | 125
543	Sadler			авто		16.000$				84 | 109
495	Sandking		авто		2.680.000$				98 | 127
468	Sanchez		мото		56.000$				- | -
567	Savanna		авто		190.000$				96 | 125
405	Sentinel		авто		102.000$				91 | 118
519	Shamal			самолет	12.000.000$	лото		- | -
535	Slamvan		авто		24.100$				88 | 114
458	Solair			авто		158.000$				87 | 113
469	Sparrow		вертолет	4.300.000$	лото		- | -
452	Speeder		лодка		3.740.000$	лото		- | -
446	Squallo			лодка		3.700.000$	лото		- | -
580	Stafford		авто		250.000$				85 | 111
439	Stallion			авто		26.000$				93 | 121
409	Stretch			авто		1.700.000$				88 | 114
513	Stuntplane		самолет	5.570.000$	лото		- | -
560	Sultan			авто		590.000$				94 | 122
550	Sunrise			авто		126.000$				80 | 104
506	Super GT		авто		760.000$				99 | 129
566	Tahoma			авто		167.000$				89 | 116
549	Tampa			авто		20.100$				85 | 111
576	Tornado		авто		230.000$				88 | 114
454	Tropic			лодка		5.500.000$	лото		- | -
451	Turismo		авто		2.100.000$				107 | 139
540	Vincent			авто		134.000$				83 | 108
412	Voodoo			авто		240.000$				94 | 122
539	Vortex			авто		5.100.000$				- | -
421	Washington		авто		124.000$				85 | 111		
586	Wayfarer		мото		81.000$				- | -
529	Willard			авто		37.600$				83 | 108
555	Windsor		авто		130.000$				88 | 114
477	ZR-350			авто		810.000$				103 | 134
]]


--
--     _   _   _ _____ ___  _   _ ____  ____    _  _____ _____   ______   __   ___  ____  _     _  __
--    / \ | | | |_   _/ _ \| | | |  _ \|  _ \  / \|_   _| ____| | __ ) \ / /  / _ \|  _ \| |   | |/ /
--   / _ \| | | | | || | | | | | | |_) | | | |/ _ \ | | |  _|   |  _ \\ V /  | | | | |_) | |   | ' /
--  / ___ \ |_| | | || |_| | |_| |  __/| |_| / ___ \| | | |___  | |_) || |   | |_| |  _ <| |___| . \
-- /_/   \_\___/  |_| \___/ \___/|_|   |____/_/   \_\_| |_____| |____/ |_|    \__\_\_| \_\_____|_|\_\                                                                                                                                                                                                                  
--
-- Author: http://qrlk.me/samp
--
function autoupdate(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('Загружено %d из %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('Загрузка обновления завершена.')
                      sampAddChatMessage((prefix..'Обновление завершено!'), color)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'Обновление прошло неудачно. Запускаю устаревшую версию..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': Обновление не требуется.')
            end
          end
        else
          print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end
