--直接Unityには登録しないスクリプト。いわゆる、ライブラリ化した奴

-- クラス定義
StageSelectScene = {}

-- コンストラクタ
function StageSelectScene.new()
	local this = SceneBase.new()

	-- メソッド定義
	-- 初期化
	this.SceneBaseInitialize = this.Initialize
	this.Initialize = function(self)
		this.StageNumber = 0
		--this.WeaponLv = 1
		--this.GuradLv = 1
		--this.ActionCountLv = 1
		--this.Lv = 1
		--this.SelectEnemyIndex = 0
		
		LuaChangeScene("StageSelect", "MainCanvas")

		if self.IsInitialized == false then
			for i = 1, 16 do
				LuaFindObject("StageSelectButton"..i)
			end
		end
			
		for i = 1, 16 do
			if SaveObject.StageUnlockList[i] == 1 then
				LuaSetButtonInteractable("StageSelectButton"..i, true)
			else 
				LuaSetButtonInteractable("StageSelectButton"..i, false)
			end
		end

		GameManager:Instance():SetSelectStageNumber(0)
		
		this:SceneBaseInitialize()
	end
	
	-- 更新
	this.SceneBaseUpdate = this.Update
	this.Update = function(self, deltaTime)
		this:SceneBaseUpdate(deltaTime)
	end
	
	-- 終了
	this.SceneBaseEnd = this.End
	this.End = function(self)
		this:SceneBaseEnd()
	end
	
	-- 有効かどうか
	this.IsActive = function(self)
		return self.IsActive
	end
	
	-- ボタン
	this.OnClickButton = function(self, buttonName)
		local stageSelectButton = string.find(buttonName, "StageSelectButton")
		if stageSelectButton ~= nil then
			this.StageNumber = string.gsub(stageSelectButton, "StageSelectButton", "")
			GameManager:Instance():SetSelectStageNumber(this.StageNumber)
		end

		if buttonName == "StageSelectStartButton" then
			if GameManager:Instance():GetSelectStageNumber() == 1 then
				SceneManager:Instance():ChangeScene(SceneNameEnum.Game1)
			end
			--if GameManager:Instance():GetSelectStageNumber() == 2 then
			--	SceneManager:Instance():ChangeScene(SceneNameEnum.Game2)
			--end
		end
	end
	
	return this
end

