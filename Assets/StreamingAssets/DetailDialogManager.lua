--直接Unityには登録しないスクリプト。いわゆる、ライブラリ化した奴

--SceneNameEnum = {
--}

-- クラス定義
DetailDialogManager = {}

-- シングルトン用定義
local _instance = nil
function DetailDialogManager.Instance() 
	if not _instance then
		_instance = DetailDialogManager
		--setmetatable(_instance, { __index = DetailDialogManager })
	end

	return _instance
end

-- メソッド定義
function DetailDialogManager:Initialize() 
	--self.BGMIndexList = {
	--	TitleSceneBgm = 0,
	--	HomeSceneBgm = 1,
	--	BattleSceneBgm = 2,
	--}
	--self.BGMNameList = {
	--	"BGM_MusMus_TitleBgm",
	--	"BGM_MusMus_HomeBgm",
	--	"BGM_MusMus_BattleBgm",
	--}
	--self.SENameList = {
	--	BoardSlide = "boardSlide",
	--	ButtonePush = "buttonPush",
	--	EnemyDeath = "enemyDeath",
	--	BattleLose = "Jingle_MusMus_BattleLose",
	--	BattleWin = "Jingle_MusMus_BattleWin",
	--	ResultStringVisible = "ResultStringVisible",
	--	RareDrop = "SE_MusMus_RareDrop",
	--	BulletShoot = "selfBulletShoot",
	--	SelfHit = "selfHit",
	--	SlideDialogOpen = "SlideDialogOpen",
	--	SkillLevelUp = "SkillLevelUp",
	--}

	--LuaUnityCreateSEAudioSource(50)

	--for i = 1, #self.BGMNameList do
	--	LuaUnityDebugLog("SoundManagerInit!!")
	--	LuaUnityAddBGMAudioSourceAndClip("Sound", self.BGMNameList[i])
	--end
end

function DetailDialogManager:ShowDetailDialog(currentSceneType, stageNumber)
	if currentSceneType == SceneNameEnum.Title then
		DialogManager:Instance():OpenOkDialog(
			"タイトル画面です。\nボタンを押して、ステージ選択に行きましょう。",
			function() end,
			function() end
		)
	elseif currentSceneType == SceneNameEnum.StageSelect then
		DialogManager:Instance():OpenOkDialog(
			"ステージ選択画面です。\nステージを選んで、クリアしましょう。",
			function() end,
			function() end
		)
	elseif currentSceneType == SceneNameEnum.Game1 then
		LuaUnityDebugLog(#StageData)
		LuaUnityDebugLog(stageNumber)
		DialogManager:Instance():OpenOkDialog(
			StageData[tonumber(stageNumber)].Detail,
			function() end,
			function() end
		)
	end
end

