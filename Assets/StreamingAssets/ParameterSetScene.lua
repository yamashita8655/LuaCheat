--直接Unityには登録しないスクリプト。いわゆる、ライブラリ化した奴

-- クラス定義
ParameterSetScene = {}

-- コンストラクタ
function ParameterSetScene.new()
	local this = SceneBase.new()

	this.CurrentCharacterObjectName = ""
	
	this.CurrentCharacterObjectName = ""

	-- メソッド定義
	-- 初期化
	this.SceneBaseInitialize = this.Initialize
	this.Initialize = function(self)
		this.HpLv = 1
		this.WeaponLv = 1
		this.GuradLv = 1
		this.ActionCountLv = 1
		this.Lv = 1
		this.SelectEnemyIndex = 0
		
		LuaChangeScene("ParameterSet", "MainCanvas")

		if self.IsInitialized == false then
			LuaSetActive("HeaderObject", false)
			LuaSetActive("FooterObject", false)
			
			LuaFindObject("ParameterSetHpLvText")
			LuaFindObject("ParameterSetHpText")
			LuaFindObject("ParameterSetWeaponLvText")
			LuaFindObject("ParameterSetWeaponText")
			LuaFindObject("ParameterSetGuradLvText")
			LuaFindObject("ParameterSetGuradText")
			LuaFindObject("ParameterSetActionCountLvText")
			LuaFindObject("ParameterSetActionCountText")
			LuaFindObject("ParameterSetLvText")
			
			LuaFindObject("ParameterSetEnemyHpText")
			LuaFindObject("ParameterSetEnemyAttackText")
			LuaFindObject("ParameterSetEnemyDeffenseText")
			LuaFindObject("ParameterSetEnemyActionCountText")
		
			self:CreateEnemyButton()
		end
		self:UpdateText()
		self:UpdateEnemyText()
		
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

		local enemyButtonName = string.find(buttonName, "ParameterSetEnemyButton")
		if enemyButtonName ~= nil then
			local number = string.gsub(buttonName, "ParameterSetEnemyButton", "")
			self.SelectEnemyIndex = number
			self:UpdateEnemyText()
		end
		
		if buttonName == "ParameterSetBattleStartButton" then
		LuaSetText("ParameterSetActionCountText", ActionCountValueTable[self.ActionCountLv])
		LuaSetText("ParameterSetLvText", self.Lv)
			GameManager.Instance():SetDebugBattleData(
				HpValueTable[self.HpLv], 
				WeaponValueTable[self.WeaponLv], 
				GuardValueTable[self.GuradLv], 
				ActionCountValueTable[self.ActionCountLv],
				EnemyList[tonumber(self.SelectEnemyIndex)]
			) 
			SceneManager.Instance():ChangeScene(SceneNameEnum.DebugBattle)
		end


		if buttonName == "ParameterSetLeftButton1" then
			if self.HpLv ~= 1 then
				self.Lv = self:AddAllLv(self.Lv, -1)
			end
			self.HpLv = self:AddLv(self.HpLv, -1)
			self:UpdateText()
		elseif buttonName == "ParameterSetRightButton1" then
			if self.HpLv ~= 99 then
				self.Lv = self:AddAllLv(self.Lv, 1)
			end
			self.HpLv = self:AddLv(self.HpLv, 1)
			self:UpdateText()
		elseif buttonName == "ParameterSetLeftButton2" then
			if self.WeaponLv ~= 1 then
				self.Lv = self:AddAllLv(self.Lv, -1)
			end
			self.WeaponLv = self:AddLv(self.WeaponLv, -1)
			self:UpdateText()
		elseif buttonName == "ParameterSetRightButton2" then
			if self.WeaponLv ~= 99 then
				self.Lv = self:AddAllLv(self.Lv, 1)
			end
			self.WeaponLv = self:AddLv(self.WeaponLv, 1)
			self:UpdateText()
		elseif buttonName == "ParameterSetLeftButton3" then
			if self.GuradLv ~= 1 then
				self.Lv = self:AddAllLv(self.Lv, -1)
			end
			self.GuradLv = self:AddLv(self.GuradLv, -1)
			self:UpdateText()
		elseif buttonName == "ParameterSetRightButton3" then
			if self.GuradLv ~= 99 then
				self.Lv = self:AddAllLv(self.Lv, 1)
			end
			self.GuradLv = self:AddLv(self.GuradLv, 1)
			self:UpdateText()
		elseif buttonName == "ParameterSetLeftButton4" then
			if self.ActionCountLv ~= 1 then
				self.Lv = self:AddAllLv(self.Lv, -1)
			end
			self.ActionCountLv = self:AddLv(self.ActionCountLv, -1)
			self:UpdateText()
		elseif buttonName == "ParameterSetRightButton4" then
			if self.ActionCountLv ~= 99 then
				self.Lv = self:AddAllLv(self.Lv, 1)
			end
			self.ActionCountLv = self:AddLv(self.ActionCountLv, 1)
			self:UpdateText()
		end
	end
	
	this.AddLv = function(self, nowLevel, addValue)
		local val = nowLevel + addValue
		if val > 99 then
			val = 99
		end
		
		if val <= 1 then
			val = 1
		end

		return val
	end
	
	this.AddAllLv = function(self, nowLevel, addValue)
		local val = nowLevel + addValue
		return val
	end
	
	this.UpdateText = function(self)
		LuaSetText("ParameterSetHpLvText", self.HpLv)
		LuaSetText("ParameterSetHpText", HpValueTable[self.HpLv])
		LuaSetText("ParameterSetWeaponLvText", self.WeaponLv)
		LuaSetText("ParameterSetWeaponText", WeaponValueTable[self.WeaponLv])
		LuaSetText("ParameterSetGuradLvText", self.GuradLv)
		LuaSetText("ParameterSetGuradText", GuardValueTable[self.GuradLv])
		LuaSetText("ParameterSetActionCountLvText", self.ActionCountLv)
		LuaSetText("ParameterSetActionCountText", ActionCountValueTable[self.ActionCountLv])
		LuaSetText("ParameterSetLvText", self.Lv)
	end
	
	this.UpdateEnemyText = function(self)
		if self.SelectEnemyIndex == 0 then
			return;
		end

		local enemy = EnemyList[tonumber(self.SelectEnemyIndex)]
		LuaSetText("ParameterSetEnemyHpText", enemy.Hp)
		LuaSetText("ParameterSetEnemyAttackText", enemy.Attack)
		LuaSetText("ParameterSetEnemyDeffenseText", enemy.Deffense)
		LuaSetText("ParameterSetEnemyActionCountText", enemy.ActionCount)
	end
	
	this.CreateEnemyButton = function(self)
		LuaFindObject("ParameterSetEnemyContent")

		LuaUnityDebugLog("ENEMYLIST"..#EnemyList)
		for i = 1, #EnemyList do
			LuaLoadPrefabAfter("ParameterSetScene", "ParameterSetEnemyButton", "ParameterSetEnemyButton"..i, "ParameterSetEnemyContent")
			LuaFindObject("ParameterSetEnemyText")
			LuaRenameObject("ParameterSetEnemyText", "ParameterSetEnemyText"..i)
			LuaSetText("ParameterSetEnemyText"..i, EnemyList[i].Name)
		end
	end
	
	-- 
	
	return this
end

