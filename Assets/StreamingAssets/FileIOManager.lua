--直接Unityには登録しないスクリプト。いわゆる、ライブラリ化した奴

--FIleIOって書いてあるけど、実質セーブデータ単体の為の機能
--今度リネームしないとね…

--CharacterParameterEnum = {
--	AddHp = 1,
--	AddAttack = 2,
--	AddDeffense = 3,
--	FriendPoint = 4,
--	RemainParameterPoint = 5,
--}

-- クラス定義
FileIOManager = {}

-- シングルトン用定義
local _instance = nil
function FileIOManager.Instance() 
	if not _instance then
		_instance = FileIOManager
		--setmetatable(_instance, { __index = FileIOManager })
	end

	return _instance
end

-- メソッド定義
--function FileIOManager.Initialize(self)と同じ 
function FileIOManager:Initialize() 
	self.FileName = PersistentDataPath.."/SaveData.lua"
	LuaUnityDebugLog("PATH:"..self.FileName)
	self.OneTimeLoadFileName = PersistentDataPath.."/aaa.lua"
	self.EndCallback = nil
end

-- デバッグ機能：セーブファイルを削除する
function FileIOManager:DebugDeleteSaveFile()
	LuaUnityDebugLog("DELETE_SAVE_FILE")
	res, mes = os.remove(self.FileName)
	LuaUnityDebugLog(res)
	LuaUnityDebugLog(mes)
end

-- セーブ
function FileIOManager:Save()
	local saveString = ""
	saveString = saveString.."SaveObject = {\r\n"

	-- ステージ解放状況
	saveString = saveString.."StageUnlockList = {"
	for i = 1, #SaveObject.StageUnlockList do
		if i ~= 1 then
			saveString = saveString..","
		end
		saveString = saveString..SaveObject.StageUnlockList[i]
	end
	saveString = saveString.."},\r\n"

	saveString = saveString.."}\r\n"
	
	CallbackManager.Instance():AddCallback("FileIOManager_SaveCallback", {self}, self.SaveCallback)
	LuaUnitySaveFile(self.FileName, saveString, "LuaCallback", "FileIOManager_SaveCallback")
end

-- セーブコールバック
function FileIOManager.SaveCallback(argList, unityArg) 
	local self = argList[1]
	local unityText = unityArg
	if unityText ~= nil and unityText ~= "" then
		LuaUnityCallExeptionCallback(unityText, 100)
	end
end

-- プログラム中でアクセスするので、デフォルトデータは用意する
function FileIOManager:CreateDefaultSaveObject() 
	LuaUnityDebugLog("CreateDefaultSaveObject")
	--一応グローバル扱いになる
	SaveObject = {
		StageUnlockList = {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	}
end

-- ロード
function FileIOManager:Load(endCallback) 
	LuaUnityDebugLog("StartLoad")
	local f = io.open(self.FileName, "r")
	if f == nil then
		--self:CreateDefaultSaveObject()
		--endCallback()	
		self:CreateDefaultSaveObject()
		TimerCallbackManager:AddCallback({}, endCallback, 1) 
	else
		--dofile(self.FileName)
		self.EndCallback = endCallback
		CallbackManager.Instance():AddCallback("FileIOManager_LoadCallback", {self}, self.LoadCallback)
		LuaUnityLoadSaveFile(self.FileName, self.OneTimeLoadFileName, "LuaCallback", "FileIOManager_LoadCallback")
	end
end

-- ロード
function FileIOManager.LoadCallback(argList, unityArg)
	self = argList[1]
	TimerCallbackManager:AddCallback({self}, self.LoadTimerCallback, 1) 
end

function FileIOManager.LoadTimerCallback(argList)
	self = argList[1]
	dofile(self.OneTimeLoadFileName)
	self:CheckSaveFile()
	CallbackManager.Instance():AddCallback("FileIOManager_DeleteCallback", {self}, self.EndCallback)
	LuaUnityDeleteFile(self.OneTimeLoadFileName, "LuaCallback", "FileIOManager_DeleteCallback")
end

-- すでにユーザーに配布されているセーブデータの中身が、新規追加によって不足する事があると思うので
-- 不足している分に関しては、初期化して追加するようにする
function FileIOManager:CheckSaveFile()
	if SaveObject.StageUnlockList == nil then
		StageUnlockList = {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	end
end

