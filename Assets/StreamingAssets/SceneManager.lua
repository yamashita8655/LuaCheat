--直接Unityには登録しないスクリプト。いわゆる、ライブラリ化した奴

--SceneNameEnum = {
--}

-- クラス定義
SceneManager = {}

-- シングルトン用定義
local _instance = nil
function SceneManager.Instance() 
	if not _instance then
		_instance = SceneManager
		--setmetatable(_instance, { __index = SceneManager })
	end

	return _instance
end

-- メソッド定義
function SceneManager:Initialize() 
	self.CurrentScene = nil
	self.CurrentSceneEnum = nil
	self.SceneCacheTable = {
		BootScene.new(),
		TitleScene.new(),
		StageSelectScene.new(),
		Game1Scene.new(),
		--Game2Scene.new(),
		--Game3Scene.new(),
		--Game4Scene.new(),
		--Game5Scene.new(),
		--Game6Scene.new(),
		--Game7Scene.new(),
		--Game8Scene.new(),
		--Game9Scene.new(),
		--Game10Scene.new(),
		--Game11Scene.new(),
		--Game12Scene.new(),
		--Game13Scene.new(),
		--Game14Scene.new(),
		--Game15Scene.new(),
		--Game16Scene.new(),
	}

	LuaLoadPrefabAfter("common", "HeaderObject", "HeaderObject", "HeaderFooterCanvas")
	LuaLoadPrefabAfter("common", "FooterObject", "FooterObject", "HeaderFooterCanvas")
	LuaSetActive("HeaderObject", false)
	LuaSetActive("FooterObject", false)
end

-- シーンの切り替え
function SceneManager:ChangeScene(sceneNameEnum) 
	LuaUnityDebugLog("ChangeScene"..sceneNameEnum)
	self.CurrentSceneEnum = sceneNameEnum
	CallbackManager.Instance():AddCallback("SceneManager_CallbackStartFade", {self, sceneNameEnum}, self.CallbackFadeIn)
	LuaPlayAnimator("FadeObject", "FadeIn", false, false, "LuaCallback", "SceneManager_CallbackStartFade")
end

-- フェード後コールバック
function SceneManager.CallbackFadeIn(argList, unityArg) 
	local self			= argList[1]
	local sceneNameEnum	= argList[2]
	
	LuaUnityDebugLog("CallbackFadeIn"..sceneNameEnum)
	
	if self.CurrentScene == nil then
	else
		self.CurrentScene:End()
	end
		
	local scene = self.SceneCacheTable[sceneNameEnum]
	self.CurrentScene = scene
	scene:Initialize()
	
	CallbackManager.Instance():AddCallback("SceneManager_AfterInitialize", {self, sceneNameEnum}, self.AfterInitialize)
	LuaPlayAnimator("FadeObject", "FadeOut", false, true, "LuaCallback", "SceneManager_AfterInitialize")
end

-- フェードあけた後の、初期化
function SceneManager.AfterInitialize(argList, unityArg) 
	local self			= argList[1]
	local sceneNameEnum	= argList[2]
	
	local scene = self.SceneCacheTable[sceneNameEnum]
	scene:AfterInitialize()
	LuaSetActive("FadeObject", false)
end

-- ボタンイベント検知
function SceneManager:OnClickButton(buttonName) 
	if buttonName == "FrontMenuDetailButton" then
		DetailDialogManager:Instance():ShowDetailDialog(self.CurrentSceneEnum, GameManager:Instance():GetSelectStageNumber())
	elseif buttonName == "FrontMenuLuaButton" then
	elseif buttonName == "FrontMenuExecuteButton" then
	else
		SoundManager.Instance():PlaySE("sound", SoundManager.Instance().SENameList.ButtonePush)
		self.CurrentScene:OnClickButton(buttonName)
	end
end

-- トグルイベント検知
function SceneManager:OnToggleValueChange(hierarchyName, value) 
	SoundManager.Instance():PlaySE("sound", SoundManager.Instance().SENameList.ButtonePush)
	self.CurrentScene:OnToggleValueChange(hierarchyName, value)
end

-- スライダーイベント検知
function SceneManager:OnChangeSliderValue(sliderName, value) 
	self.CurrentScene:OnChangeSliderValue(sliderName, value)
end

-- サスペンド
function SceneManager:OnSuspend() 
	self.CurrentScene:OnSuspend()
end

-- レジューム
function SceneManager:OnResume() 
	self.CurrentScene:OnResume()
end

-- 更新
function SceneManager:Update(deltaTime) 
	self.CurrentScene:Update(deltaTime)
end

-- 画面タッチ処理
function SceneManager:OnMouseDown(touchx, touchy) 
	self.CurrentScene:OnMouseDown(touchx, touchy)
end

function SceneManager:OnMouseDrag(touchx, touchy) 
	self.CurrentScene:OnMouseDrag(touchx, touchy)
end

function SceneManager:OnMouseUp(touchx, touchy) 
	self.CurrentScene:OnMouseUp(touchx, touchy)
end
