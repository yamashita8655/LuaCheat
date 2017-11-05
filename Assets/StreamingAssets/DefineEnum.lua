﻿--直接Unityには登録しないスクリプト。いわゆる、ライブラリ化した奴

BulletTypeEnum = {
	Normal = 0,--ノーマルって書いてあるけど、弾の情報だけで処理できる弾
	UseTargetPosition = 1,--他の何かの座標値が影響する弾の情報
}

EffectNameEnum = {
	HitEffect		= "HitEffect2",
	KarikariEffect	= "KarikariEffect",
}

EmitterTypeEnum = {
	Normal = 0,
	Satellite = 1,
}

EnemyTypeEnum = {
	Normal = 0,
	BulletShooter = 1,
}

CharacterParameterEnum = {
	AddHp = 1,
	AddAttack = 2,
	AddDeffense = 3,
	FriendPoint = 4,
	RemainParameterPoint = 5,
}

CharacterTypeEnum = {
	Mochi = 1,
	Tora = 2,
	Buchi = 3,
	Sakura = 4,
	Max = 4,
}

MoveTypeEnum = {
	None = -1,
	Straight = 0,
	SinCurve = 1,
	Homing = 2,
	Circle = 3,
}

SceneNameEnum = {
	Boot			= 1,
	Title			= 2,
	StageSelect		= 3,
	Game1			= 4,
	Game2			= 5,
	Game3			= 6,
	Game4			= 7,
	Game5			= 8,
	Game6			= 9,
	Game7			= 10,
	Game8			= 11,
	Game9			= 12,
	Game10			= 13,
	Game11			= 14,
	Game12			= 15,
	Game13			= 16,
	Game14			= 17,
	Game15			= 18,
	Game16			= 19,
}

SkillTypeEnum = {
	Emitter = 1,
	Bullet = 2,
	ExpTable = 3,
}

ItemType = {
	ParameterUp = 1,
	PointUp = 2,
}

ParameterType = {
	AddHp = 1,
	AddAttack = 2,
	AddDeffense = 3,
	AddFriend = 4,
	AddMoney = 5,
}

RarityType = {
	Normal = 1,
	Rare = 2,
	SuperRare = 3,
}

