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
	self.SelectStageNumber = 0
end

-- 呼び出される毎に加算する時間
function GameManager:GetBattleDeltaTime() 
	return self.BattleDeltaTime
end

-- 
function GameManager:GetSelectStageNumber() 
	return self.SelectStageNumber
end
function GameManager:SetSelectStageNumber(stageNumber) 
	self.SelectStageNumber = stageNumber
end

function GameManager:Update(deltaTime) 
end

function GameManager:Release()
end

