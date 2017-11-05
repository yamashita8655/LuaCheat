--直接Unityには登録しないスクリプト。いわゆる、ライブラリ化した奴

-- クラス定義
Game1Scene = {}

-- コンストラクタ
function Game1Scene.new()
	local this = SceneBase.new()

	-- メソッド定義
	-- 初期化
	this.SceneBaseInitialize = this.Initialize
	this.Initialize = function(self)
		LuaChangeScene("Game1", "MainCanvas")

		this.ClickCount = 0

		LuaFindObject("GameSceneStage1ChangeImageRed")
		LuaFindObject("GameSceneStage1ClearButton")

		LuaSetActive("GameSceneStage1ChangeImageRed", false)
		LuaSetButtonInteractable("GameSceneStage1ClearButton", false)

		if self.IsInitialized == false then
		end
			
		this:SceneBaseInitialize()
	end
	
	this.Stage1Init = function(self)
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
		if buttonName == "GameSceneStage1BackButton" then
			SceneManager.Instance():ChangeScene(SceneNameEnum.StageSelect)
		end
		
		if buttonName == "GameSceneStage1ChangeButton" then
			self.ClickCount = self.ClickCount + 1
			if self.ClickCount == 500 then
				LuaSetActive("GameSceneStage1ChangeImageRed", true)
				LuaSetButtonInteractable("GameSceneStage1ClearButton", true)
			else
				LuaSetActive("GameSceneStage1ChangeImageRed", false)
				LuaSetButtonInteractable("GameSceneStage1ClearButton", false)
			end
		end
		
		if buttonName == "GameSceneStage1ClearButton" then
			DialogManager:Instance():OpenOkDialog(
				"クリア！",
				function() end,
				function()
					SaveObject.StageUnlockList[2] = 1
					FileIOManager.Instance():Save()
					SceneManager.Instance():ChangeScene(SceneNameEnum.StageSelect)
				end
			)
		end
	end
	
	return this
end

