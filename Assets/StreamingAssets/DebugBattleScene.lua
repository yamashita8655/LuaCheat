--直接Unityには登録しないスクリプト。いわゆる、ライブラリ化した奴

-- クラス定義
DebugBattleScene = {}

-- コンストラクタ
function DebugBattleScene.new()
	local this = SceneBase.new()

	-- メソッド定義
	-- 初期化
	this.SceneBaseInitialize = this.Initialize
	this.Initialize = function(self)
		this.EnemyData = nil
		this.EnemyNowHp = 0
		this.PlayerNowHp = 0
		this.PlayerMaxHp = 0
		this.PlayerAttack = 0
		this.PlayerDeffense = 0
		this.PlayerActionCount = 0
		this.BattleLogText = ""
		this.TurnCount = 1
		this.BattleCount = 1

		local hp, atk, def, atc, enemy = GameManager.Instance():GetDebugBattleData()
		
		this.PlayerNowHp = hp
		this.PlayerMaxHp = hp
		this.PlayerAttack = atk
		this.PlayerDeffense = def
		this.PlayerActionCount = atc
		this.EnemyData = enemy
		this.EnemyNowHp = enemy.Hp

		LuaChangeScene("DebugBattle", "MainCanvas")
		
		if self.IsInitialized == false then
			LuaSetActive("HeaderObject", false)
			LuaSetActive("FooterObject", false)
			
			LuaFindObject("DebugBattlePlayerNowHpText")
			LuaFindObject("DebugBattlePlayerMaxHpText")
			LuaFindObject("DebugBattlePlayerAttackText")
			LuaFindObject("DebugBattlePlayerDeffenseText")
			LuaFindObject("DebugBattlePlayerActionCountText")
			
			LuaFindObject("DebugBattleEnemyNowHpText")
			LuaFindObject("DebugBattleEnemyMaxHpText")
			LuaFindObject("DebugBattleEnemyAttackText")
			LuaFindObject("DebugBattleEnemyDeffenseText")
			LuaFindObject("DebugBattleEnemyActionCountText")
			
			LuaFindObject("DebugBattleLogText")
		end

		self:UpdateParameterText()
		self:UpdateBattleLogText()

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
		if buttonName == "DebugBattleBackButton" then
			SceneManager.Instance():ChangeScene(SceneNameEnum.ParameterSet)
		end
		
		if buttonName == "DebugBattleAttackButton" then
			self.BattleLogText = self.BattleLogText.."-----TURN"..self.TurnCount.."-----\n"
			local playerAttackDamage = self.PlayerAttack - self.EnemyData.Deffense
			if playerAttackDamage <= 0 then
				playerAttackDamage = 0
			end
			self.EnemyNowHp = self.EnemyNowHp - playerAttackDamage
			if self.EnemyNowHp <= 0 then
				self.EnemyNowHp = 0
			end
			self:AddBattleLog("プレイヤー", "敵", playerAttackDamage)

			if self.EnemyNowHp > 0 then
				local enemyAttackDamage = self.EnemyData.Attack - self.PlayerDeffense
				if enemyAttackDamage <= 0 then
					enemyAttackDamage = 0
				end
				self.PlayerNowHp = self.PlayerNowHp - enemyAttackDamage
				if self.PlayerNowHp <= 0 then
					self.PlayerNowHp = 0
				end
				self:AddBattleLog("敵", "プレイヤー", enemyAttackDamage)
			end

			self:UpdateParameterText()
			self:UpdateBattleLogText()

			self.TurnCount = self.TurnCount + 1
		end
	end
	
	this.UpdateParameterText = function(self)
		LuaSetText("DebugBattlePlayerNowHpText", self.PlayerNowHp)
		LuaSetText("DebugBattlePlayerMaxHpText", self.PlayerMaxHp)
		LuaSetText("DebugBattlePlayerAttackText", self.PlayerAttack)
		LuaSetText("DebugBattlePlayerDeffenseText", self.PlayerDeffense)
		LuaSetText("DebugBattlePlayerActionCountText", self.PlayerActionCount)
		
		LuaSetText("DebugBattleEnemyNowHpText", self.EnemyNowHp)
		LuaSetText("DebugBattleEnemyMaxHpText", self.EnemyData.Hp)
		LuaSetText("DebugBattleEnemyAttackText", self.EnemyData.Attack)
		LuaSetText("DebugBattleEnemyDeffenseText", self.EnemyData.Deffense)
		LuaSetText("DebugBattleEnemyActionCountText", self.EnemyData.ActionCount)
	end
	
	this.AddBattleLog = function(self, from, to, damage)
		local string = from.."の攻撃！"..to.."に<color=#ff0000ff>"..damage.."</color>のダメージ！\n"
		self.BattleLogText = self.BattleLogText..string
	end
	
	this.UpdateBattleLogText = function(self)
		LuaSetText("DebugBattleLogText", self.BattleLogText)
	end

	this.InitBattle = function(self)
		self.TurnCount = 1
		self.BattleCount = 1

		local hp, atk, def, atc, enemy = GameManager.Instance():GetDebugBattleData()
		self.PlayerNowHp = hp
		self.PlayerMaxHp = hp
		self.PlayerAttack = atk
		self.PlayerDeffense = def
		self.PlayerActionCount = atc
		self.EnemyData = enemy
		self.EnemyNowHp = enemy.Hp
		self:UpdateParameterText()
	end
	
	return this
end

