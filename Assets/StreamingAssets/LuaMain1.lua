--Unity側から呼ばれ、Unity側の処理を呼び出す--Unity～というのは、Unity側から関数の登録がされていないと使えない（というか、処理がない）

LuaMain1Parameter = "LuaMain1Parameter"

function Main()
	LuaUnityDebugLog("LuaMain1")
	LuaUnityDebugLog(LuaMain1Parameter)
	LuaUnityDebugLog(LuaMain2Parameter)
end

function LuaUnitySaveVersionFile(path, src, callbackName, callbackArg)
	UnitySaveVersionFile(path, src, callbackName, callbackArg)
end

function LuaUnityLoadSaveFile(path, oneTimeFileName, callbackName, callbackArg)
	UnityLoadSaveFile(path, oneTimeFileName, callbackName, callbackArg)
end

function LuaUnityDeleteFile(path, callbackName, callbackArg)
	UnityDeleteFile(path, callbackName, callbackArg)
end

function LuaUnityDebugLog(log)
	UnityDebugLog(log)
end

function LuaUnitySaveFile(fileName, saveString, callbackName, callbackTag)
	UnitySaveFile(fileName, saveString, callbackName, callbackTag)
end

--オブジェクト破棄
--引数：ヒエラルキに登録しているオブジェクト名を指定する
--結果：Unity側のヒエラルキオブジェクトディクショナリから削除する
function LuaDestroyObject(hierarchyName)
	UnityDestroyObject(hierarchyName)
end

--オブジェクト名リネーム
--引数：オブジェクトマネージャに登録していない、ヒエラルキ上に存在しているオブジェクト名と、変更後の名前
--結果：変更後のオブジェクトをオブジェクトマネージャに登録し、アクセスできるようjにする
function LuaRenameObject(hierarchyName, renameName)
	UnityRenameObject(hierarchyName, renameName)
end

--オブジェクト検索
--引数：ヒエラルキに登録しているオブジェクト名を指定する
--結果：Unity側のヒエラルキオブジェクトディクショナリに登録されて、アクセス可能になる
function LuaFindObject(hierarchyName)
	UnityFindObject(hierarchyName)
end

--テキスト設定
--引数：ヒエラルキに登録しているオブジェクト名と、設定する文字列
function LuaSetText(hierarchyName, text)
	UnitySetText(hierarchyName, text)
end

--スライダー量設定
--引数：ヒエラルキに登録しているオブジェクト名と、量
function LuaSetSliderValue(hierarchyName, value)
	UnitySetSliderValue(hierarchyName, value)
end

--スライダー最大量設定
--引数：ヒエラルキに登録しているオブジェクト名と、量
function LuaSetMaxSliderValue(hierarchyName, value)
	UnitySetMaxSliderValue(hierarchyName, value)
end

--アニメーション再生
--引数：オブジェクト名、アニメーション名、アニメーションが終わった後のLua側のコールバック関数名
function LuaPlayAnimator(hierarchyName, animationName, isLoop, isAutoActiveFalse, callbackMethodName, callbackMethodArg)
	UnityPlayAnimator(hierarchyName, animationName, isLoop, isAutoActiveFalse, callbackMethodName, callbackMethodArg)
end

--アニメーション一時停止
--引数：オブジェクト名
function LuaPauseAnimator(hierarchyName)
	UnityPauseAnimator(hierarchyName)
end

--アニメーション一時停止の解除
--引数：オブジェクト名
function LuaResumeAnimator(hierarchyName)
	UnityResumeAnimator(hierarchyName)
end

--シーンオブジェクトの切り替え
--引数：シーン名、SetParentしたい親のオブジェクト名
function LuaChangeScene(sceneName, parentHierarchyName)
	UnityChangeScene(sceneName, parentHierarchyName)
end

--座標の設定
--引数：hierarchy名と、x,y,zの座標
function LuaSetPosition(hierarchyName, x, y, z)
	UnitySetPosition(hierarchyName, x, y, z)
end

--ローテーションの設定
--引数：hierarchy名と、x,y,zの回転角度(degree)
function LuaSetRotate(hierarchyName, x, y, z)
	UnitySetRotate(hierarchyName, x, y, z)
end

--スケールの設定
--引数：hierarchy名と、x,y,zの拡大率
function LuaSetScale(hierarchyName, x, y, z)
	UnitySetScale(hierarchyName, x, y, z)
end

--アクティブの切り替え
--引数：
function LuaSetActive(hierarchyName, active)
	UnitySetActive(hierarchyName, active)
end

function LuaLoadAssetBundle(persistentDataPath, assetBundleName, callbackName, callbackArg)
	UnityLoadAssetBundle(persistentDataPath, assetBundleName, callbackName, callbackArg)
end

function LuaSaveAssetBundle(loadPath, savePath, assetBundleName, callbackName)
	UnitySaveAssetBundle(loadPath, savePath, assetBundleName, callbackName)
end

function LuaSaveScriptFile(loadPath, savePath, assetBundleName, assetName, scriptName, callbackName)
	UnitySaveScriptFile(loadPath, savePath, assetBundleName, assetName, scriptName, callbackName)
end

--プレハブをロードするだけ
--function LuaLoadPrefabAfter(prefabPath, hierarchyName, parentHierarchyName)
function LuaLoadPrefabAfter(assetBundleName, prefabName, hierarchyName, parentHierarchyName)
	UnityLoadPrefabAfter(assetBundleName, prefabName, hierarchyName, parentHierarchyName)
end

--親の設定
function LuaSetParent(hierarchyName, parentHierarchyName)
	UnitySetParent(hierarchyName, parentHierarchyName)
end

--ボタンのインタラクティブ設定
function LuaSetButtonInteractable(hierarchyName, interactable)
	UnitySetButtonInteractable(hierarchyName, interactable)
end

--プレハブのロード
function LuaLoadPrefab(prefabName)
	UnityLoadPrefab(prefabName)
end

--シーンの切り替え
function LuaLoadLevel(sceneName)
	UnityLoadLevel(sceneName)
end

--基本Lua関数を使えるようにする
function LuaBindCommonFunction(fileName)
	UnityBindCommonFunction(fileName)
end

--Luaファイルを読み込んで、アクセスできる状態にする
function LoadLuaFile(filename)
	UnityLoadLuaFile(filename)
end

--例外処理呼び出し
function LuaUnityCallExeptionCallback(errorString, errorNumber)
	UnityCallExeptionCallback(errorString, errorNumber)
end

--LuaMainの初期化が終わった事を通知する
function LuaUnityCallLuaMainEndCallback()
	UnityCallLuaMainEndCallback()
end

--Unity側から呼び出される。Event系の関数
function EventClickButtonFromUnity(buttonName)
	SceneManager.Instance():OnClickButton(buttonName) 
	DialogManager.Instance():OnClickButton(buttonName) 
end

--Unity側から呼び出される。Event系の関数
function EventToggleValueChangeFromUnity(hierarchyName, value)
	LuaUnityDebugLog(hierarchyName)
	LuaUnityDebugLog(value)
	SceneManager.Instance():OnToggleValueChange(hierarchyName, value) 
	DialogManager.Instance():OnToggleValueChange(hierarchyName, value) 
end

--Unity側から呼び出される。Event系の関数
function EventSuspendFromUnity()
	SceneManager.Instance():OnSuspend() 
end

--Unity側から呼び出される。Event系の関数
function EventResumeFromUnity()
	SceneManager.Instance():OnResume() 
end

-- BGMのAudioClipを読んで、マネージャに登録
function LuaUnityAddBGMAudioSourceAndClip(assetBundleName, assetName)
	UnityAddBGMAudioSourceAndClip(assetBundleName, assetName)
end

-- BGMの再生
function LuaUnityPlayBGM(bgmIndex)
	UnityPlayBGM(bgmIndex)
end

-- BGMの停止
function LuaUnityStopBGM(bgmIndex)
	UnityStopBGM(bgmIndex)
end

-- SEの初期化
function LuaUnityCreateSEAudioSource(sourceNum)
	UnityCreateSEAudioSource(sourceNum)
end

-- SEの再生
function LuaUnityPlaySE(assetBundleName, seName)
	UnityPlaySE(assetBundleName, seName)
end

function EventSliderFromUnity(sliderName, value)
	SceneManager.Instance():OnChangeSliderValue(sliderName, value) 
end

function OnMouseDownFromUnity(touchx, touchy)
	SceneManager.Instance():OnMouseDown(touchx, touchy)
end

function OnMouseDragFromUnity(touchx, touchy)
	SceneManager.Instance():OnMouseDrag(touchx, touchy)
end

function OnMouseUpFromUnity(touchx, touchy)
	SceneManager.Instance():OnMouseUp(touchx, touchy)
end

function LuaUnitySetToggleFlag(objectName, isOn)
	UnitySetToggleFlag(objectName, isOn)
end

--Unity側から呼ばれる、更新関数
function UpdateFromUnity(deltaTime)
	-- 線形補間で計算はしないので、実際に経過しているフレーム自体を固定にして、処理落ち対策とする
	SceneManager.Instance():Update(GameManager:GetBattleDeltaTime())
	TimerCallbackManager.Instance():Update(GameManager:GetBattleDeltaTime())
end

function LuaCallback(callbackName, unityArg) 
	CallbackManager.Instance():ExecuteCallback(callbackName, unityArg)
end

--ホームシーン関数

----コルーチンテスト
--function CallCoroutine()
--	local coro = coroutine.create(LuaMainLoop)
--	coroutine.resume(coro)-- これで、初めて一回実行される
--	coroutine.resume(coro)-- 以降、yieldで止めていた所から再開される
--end
--
--function LuaMainLoop()
--	counter = 0
--	while true do
--		LuaUnityDebugLog(counter)
--		counter = counter + 1
--		coroutine.yield(0)
--	end
--end

function LoadAssetBundleCallback(arg, errorString)
	LuaUnityDebugLog(errorString)
	if errorString ~= nil and errorString ~= "" then
		LuaUnityCallExeptionCallback(errorString, 7)
	else
		LoadAssetBundle()
	end
end

function SaveAssetBundleCallback(errorString)
	LuaUnityDebugLog(errorString)
	if errorString ~= nil and errorString ~= "" then
		LuaUnityCallExeptionCallback(errorString, 3)
	else
		SaveAssetBundleCounter = SaveAssetBundleCounter + 1
		LuaSetSliderValue("InAppSlider", SaveAssetBundleCounter)
		LuaSetText("InAppNowLoadText", SaveAssetBundleCounter)
		SaveAssetBundle()
	end
end

function SaveScriptFileCallback(errorString)
	LuaUnityDebugLog(errorString)
	if errorString ~= nil and errorString ~= "" then
		LuaUnityCallExeptionCallback(errorString, 4)
	else
		SaveLuaScriptIndex = SaveLuaScriptIndex + 1
		LuaSetSliderValue("InAppSlider", SaveLuaScriptIndex)
		LuaSetText("InAppNowLoadText", SaveLuaScriptIndex)
		SaveScriptFile()
	end
end

function SaveVersionFileCallback(callbackArg, errorString)
	LuaUnityDebugLog(errorString)
	if errorString ~= nil and errorString ~= "" then
		LuaUnityCallExeptionCallback(errorString, 5)
	else
		LuaUnityCallLuaMainEndCallback()
		InitGame()
	end
end
