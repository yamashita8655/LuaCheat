--直接Unityには登録しないスクリプト。いわゆる、ライブラリ化した奴

-- クラス定義
GameManager = {}

-- シングルトン用定義
local _instance = nil
function GameManager.Instance() 
	if not _instance then
		_instance = GameManager
		--_instance:Initialize()
	end

	return _instance
end

-- メソッド定義
function GameManager:Initialize() 
	self.BattleDeltaTime = 1.0/60.0
	self.PlayerHp = 0
	self.PlayerAttack = 0
	self.PlayerDeffense = 0
	self.PlayerActionCount = 0
	
	self.EnemyData = 0
end

-- 呼び出される毎に加算する時間
function GameManager:GetBattleDeltaTime() 
	return self.BattleDeltaTime
end

function GameManager:SetDebugBattleData(playerHp, playerAttack, playerDeffense, playerActionCount, enemyData) 
	self.PlayerHp = playerHp
	self.PlayerAttack = playerAttack
	self.PlayerDeffense = playerDeffense
	self.PlayerActionCount = playerActionCount
	
	self.EnemyData = enemyData
end
function GameManager:GetDebugBattleData() 
	return self.PlayerHp, self.PlayerAttack, self.PlayerDeffense, self.PlayerActionCount, self.EnemyData
end



function GameManager:Update(deltaTime) 
end

function GameManager:Release()
end

