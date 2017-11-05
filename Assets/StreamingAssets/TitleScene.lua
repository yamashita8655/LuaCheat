--直接Unityには登録しないスクリプト。いわゆる、ライブラリ化した奴

-- クラス定義
TitleScene = {}

-- コンストラクタ
function TitleScene.new()
	local this = SceneBase.new()

	-- メソッド定義
	-- 初期化
	this.SceneBaseInitialize = this.Initialize
	this.Initialize = function(self)
		--this.HpLv = 1
		--this.WeaponLv = 1
		--this.GuradLv = 1
		--this.ActionCountLv = 1
		--this.Lv = 1
		--this.SelectEnemyIndex = 0
		
		LuaChangeScene("Title", "MainCanvas")

		if self.IsInitialized == false then
		end
		
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
		if buttonName == "TitleSceneStartButton" then
			SceneManager.Instance():ChangeScene(SceneNameEnum.StageSelect)
		end
	end
	
	return this
end

