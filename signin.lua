-----------------------------------------------------------------------------------------
--登入頁面
-- 


-- date: 2016/10/31
-----------------------------------------------------------------------------------------

--=======================================================================================
--引入各種函式庫
--=======================================================================================
composer = require("composer")

local scene = composer.newScene( )

--=======================================================================================
--宣告各種變數
--=======================================================================================
local background
local logo
local experience_signin
local user_signin
local fb_signin
local terms
local precautions

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

    logo = display.newImageRect( _parent , "images/logo.jpg" , 300*WIDTH , 250*HEIGHT )
    logo.x , logo.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y * 0.5

    experience_signin = display.newImageRect( _parent , "images/experience_signin.jpg", 350*WIDTH , 100*HEIGHT )
    experience_signin.x , experience_signin.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y*0.9 

    user_signin = display.newImageRect( _parent , "images/user_signin.jpg", 350*WIDTH , 100*HEIGHT )
    user_signin.x , user_signin.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y*1.1

    fb_signin = display.newImageRect( _parent, "images/fb_signin.jpg" , 350*WIDTH , 100*HEIGHT )
    fb_signin.x , fb_signin.y = _SCREEN.CENTER.X , _SCREEN.CENTER.Y * 1.3

    terms = display.newText( _parent , "服務條款", _SCREEN.CENTER.X * 0.7 , _SCREEN.CENTER.Y * 1.5 , native.systemFont , 20 )
    terms:setFillColor( 0.7 )

    precautions = display.newText( _parent , "注意事項", _SCREEN.CENTER.X *1.3 , _SCREEN.CENTER.Y*1.5 , native.systemFont , 20 )
    precautions:setFillColor( 0.7 )

    experience_signin:addEventListener( "tap", function (  )
        composer.gotoScene( "experience" )
    end )

    user_signin:addEventListener( "tap", function (  )
        composer.gotoScene( "user_signin" )
    end )

    fb_signin:addEventListener( "tap", function (  )
        composer.gotoScene( "fb_signin" )
    end )

    terms:addEventListener( "tap", function (  )
        composer.gotoScene( "terms" )
    end )

    precautions:addEventListener( "tap", function (  )
        composer.gotoScene( "precautions" )
    end )
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