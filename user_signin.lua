-----------------------------------------------------------------------------------------
--用戶登入
-- 


-- date: 2016/10/31
-----------------------------------------------------------------------------------------

--=======================================================================================
--引入各種函式庫
--=======================================================================================
local scene = composer.newScene( )

--=======================================================================================
--宣告各種變數
--=======================================================================================
local background
local login
local text
local register
local forgetPassword
local account
local password

--=======================================================================================
--宣告各種函數函數
--=======================================================================================
local init

--=======================================================================================
--定義各種函式
--=======================================================================================
init = function ( _parent  )
    background = display.newImageRect( _parent , "images/bg.png", _SCREEN.W , _SCREEN.H )
    background.x , background.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y
    background:setFillColor( 0.9 )

    login = display.newImageRect( _parent , "images/login.jpg", 400*WIDTH , 120*HEIGHT )
    login.x , login.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y *1.2 

    text = display.newText( _parent , "---- 或者你可以 ----" , _SCREEN.CENTER.X , _SCREEN.CENTER.Y*1.5  , font , 18 )
    text:setFillColor( 0.2 )

    register = display.newImageRect( _parent , "images/register.jpg", 400*WIDTH , 120*HEIGHT )
    register.x , register.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y*1.7

    forgetPassword = display.newImageRect( _parent , "images/forgetPassword.jpg", 200*WIDTH , 70*HEIGHT )
    forgetPassword.x , forgetPassword.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y*0.8

    accountTxt = display.newText( _parent , "帳號：", _SCREEN.CENTER.X*0.3, _SCREEN.CENTER.Y*0.2 , font , 23 )
    accountTxt:setFillColor( 0.4 )
   
    passwordTxt = display.newText( _parent,  "密碼：", _SCREEN.CENTER.X*0.3, _SCREEN.CENTER.Y*0.5 , font , 23 )
    passwordTxt:setFillColor( 0.4 )

    login:addEventListener( "tap", function (  )
        composer.gotoScene( "main_interface" )
    end )

    register:addEventListener( "tap", function (  )
        composer.gotoScene( "register" )
    end )

    forgetPassword:addEventListener( "tap", function (  )
        local options = {
            isModal = true,
            effect = "fromBottom",
            time = 400,
        }
        composer.showOverlay( "forgetPassword" , options )
        hideTextField()
    end )           
end

showTextField = function (  )
    account = native.newTextField( _SCREEN.CENTER.X*1.2 , _SCREEN.CENTER.Y*0.2 , 400*WIDTH , 100*HEIGHT )
    password = native.newTextField( _SCREEN.CENTER.X*1.2 , _SCREEN.CENTER.Y*0.5 , 400*WIDTH , 100*HEIGHT )
    password.isSecure = true
end

hideTextField = function (  )
    account:removeSelf( )
    password:removeSelf( )
end
--=======================================================================================
--Composer
--=======================================================================================

--畫面沒到螢幕上時，先呼叫scene:create
--任務:負責UI畫面繪製
function scene:create(event)
    print('scene:create')
    --把場景的view存在sceneGroup這個變數裡
    local sceneGroup = self.view

   --接下來把會出現在畫面的東西，加進sceneGroup裡面，這個非常重要
   init(sceneGroup)

end


--畫面到螢幕上時，呼叫scene:show
--任務:移除前一個場景，播放音效，開始計時，播放各種動畫
function  scene:show( event)
    local sceneGroup = self.view
    local phase = event.phase

    if( "will" == phase ) then
        print('scene:show will')
        --畫面即將要推上螢幕時要執行的程式碼寫在這邊
        showTextField()
    elseif ( "did" == phase ) then
        print('scene:show did')
        --把畫面已經被推上螢幕後要執行的程式碼寫在這邊
        --可能是移除之前的場景，播放音效，開始計時，播放各種動畫

        --移除前一個畫面的元件
      
    end
end


--即將被移除，呼叫scene:hide
--任務:停止音樂，釋放音樂記憶體，停止移動的物體等
function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( "will" == phase ) then
        print('scene:hide will')
        --畫面即將移開螢幕時，要執行的程式碼
        --這邊需要停止音樂，釋放音樂記憶體，有timer的計時器也可以在此停止
       hideTextField()
    elseif ( "did" == phase ) then
        print('scene:hide did')
        --畫面已經移開螢幕時，要執行的程式碼
    end
end

--下一個場景畫面推上螢幕後
--任務:摧毀場景
function scene:destroy( event )
    print('scene:destroy')
    if ("will" == event.phase) then
        --這邊寫下畫面要被消滅前要執行的程式碼

    end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene