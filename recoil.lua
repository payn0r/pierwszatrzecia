local scopedWeapons = 

{

    100416529,  -- WEAPON_SNIPERRIFLE

    205991906,  -- WEAPON_HEAVYSNIPER

    3342088282, -- WEAPON_MARKSMANRIFLE

	177293209,   -- WEAPON_HEAVYSNIPER MKII

	1785463520  -- WEAPON_MARKSMANRIFLE_MK2

}



function HashInTable( hash )

    for k, v in pairs( scopedWeapons ) do 

        if ( hash == v ) then 

            return true 

        end 

    end 



    return false 

end 



function ManageReticle()

    local ped = GetPlayerPed( -1 )

    local _, hash = GetCurrentPedWeapon( ped, true )

        if not HashInTable( hash ) then 

		end 

end 





Citizen.CreateThread(function()

	while true do

		Citizen.Wait(0)

		local ped = GetPlayerPed( -1 )

		local weapon = GetSelectedPedWeapon(ped)

		--print(weapon) -- To get the weapon hash by pressing F8 in game

		

		-- Disable reticle

		

		ManageReticle()

		

		-- Disable melee while aiming (may be not working)

		

		if IsPedArmed(ped, 6) then

        	DisableControlAction(1, 140, true)

            DisableControlAction(1, 141, true)

            DisableControlAction(1, 142, true)

        end

		

		-- Disable ammo HUD

		

		DisplayAmmoThisFrame(false)

		

		-- Shakycam

		

		-- Pistol

		if weapon == GetHashKey("WEAPON_STUNGUN") then

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)

			end

		end

		

		if weapon == GetHashKey("WEAPON_FLAREGUN") then	

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.01)

			end

		end

		

		if weapon == GetHashKey("WEAPON_SNSPISTOL") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then	

			SetPlayerWeaponDamageModifier(PlayerId(), 0.48)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)

				RecoilThirdPersonMultiplier(3.5,3.2)

			end

		elseif weapon == GetHashKey("WEAPON_SNSPISTOL") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM

			SetPlayerWeaponDamageModifier(PlayerId(), 0.75*0.48)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5*0.05)

				end

		end

		

		if weapon == GetHashKey("WEAPON_SNSPISTOL_MK2") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then	

			SetPlayerWeaponDamageModifier(PlayerId(), 0.58)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.1)

				RecoilThirdPersonMultiplier(3.5,3.2)

			end

		elseif weapon == GetHashKey("WEAPON_SNSPISTOLMK2") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM

			SetPlayerWeaponDamageModifier(PlayerId(), 0.75*0.58)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5*0.1)

				end

		end

		

		if weapon == GetHashKey("WEAPON_PISTOL") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then	

			SetPlayerWeaponDamageModifier(PlayerId(), 0.85)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.2*0.2)

				RecoilThirdPersonMultiplier(3.5,3.2)

			end

		elseif weapon == GetHashKey("WEAPON_PISTOL") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM

			SetPlayerWeaponDamageModifier(PlayerId(), 0.75*0.85)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5*1.2*0.2)

				RecoilThirdPersonMultiplier(0.25*3.5,0.25*3.2)

				end

		end

		

		if weapon == GetHashKey("WEAPON_SMERFPISTOL") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then	

			SetPlayerWeaponDamageModifier(PlayerId(), 0.58)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.05)

				RecoilThirdPersonMultiplier(3.5,3.2)

			end

		elseif weapon == GetHashKey("WEAPON_SMERFPISTOL") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM

			SetPlayerWeaponDamageModifier(PlayerId(), 0.75*0.58)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5*0.05)

				end

		end

		

		if weapon == GetHashKey("WEAPON_PISTOL_MK2") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then

			SetPlayerWeaponDamageModifier(PlayerId(), 0.55)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.12)

				RecoilThirdPersonMultiplier(2.5,2.2)

			end

		elseif weapon == GetHashKey("WEAPON_PISTOL_MK2") and IsPedCurrentWeaponSilenced(PlayerPedId()) then			-- Z TLUMIKIEM

			SetPlayerWeaponDamageModifier(PlayerId(), 0.75*0.55)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5*0.12)

				RecoilThirdPersonMultiplier(0.25*2.5,0.25*2.2)

			end

		end

		

		if weapon == GetHashKey("WEAPON_APPISTOL") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.3)

				RecoilThirdPersonMultiplier(3.5,3.2)

			end

		elseif weapon == GetHashKey("WEAPON_APPISTOL") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5*0.3)

				RecoilThirdPersonMultiplier(0.25*3.5,0.25*3.2)

				end

		end

		

		if weapon == GetHashKey("WEAPON_COMBATPISTOL") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then	

			SetPlayerWeaponDamageModifier(PlayerId(), 0.85)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.16)

				RecoilThirdPersonMultiplier(3.0,2.7)

			end

		elseif weapon == GetHashKey("WEAPON_COMBATPISTOL") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM

			SetPlayerWeaponDamageModifier(PlayerId(), 0.75*0.85)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5*0.16)

				RecoilThirdPersonMultiplier(0.25*3.0,0.25*2.7)

				end

		end

		

		if weapon == GetHashKey("WEAPON_PISTOL50") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then

			SetPlayerWeaponDamageModifier(PlayerId(), 0.9)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.0)

				RecoilThirdPersonMultiplier(4.5,4.2)

			end

		elseif weapon == GetHashKey("WEAPON_PISTOL50") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM

			SetPlayerWeaponDamageModifier(PlayerId(), 0.75*0.9)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5*1.0)

				RecoilThirdPersonMultiplier(0.5*4.5,0.5*4.2)

			end

		end

		

		if weapon == GetHashKey("WEAPON_HEAVYPISTOL") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then		

			SetPlayerWeaponDamageModifier(PlayerId(), 0.7)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.4)

				RecoilThirdPersonMultiplier(3.5,3.2)

			end

		elseif weapon == GetHashKey("WEAPON_HEAVYPISTOL") and IsPedCurrentWeaponSilenced(PlayerPedId()) then	    -- Z TLUMIKIEM

			SetPlayerWeaponDamageModifier(PlayerId(), 0.75*0.7)			

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5*0.4)

				RecoilThirdPersonMultiplier(0.25*3.5,0.25*3.2)	

				end

		end

		

		if weapon == GetHashKey("WEAPON_VINTAGEPISTOL") and not IsPedCurrentWeaponSilenced(PlayerPedId()) then	

			SetPlayerWeaponDamageModifier(PlayerId(), 0.38)		

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)

			end

		elseif weapon == GetHashKey("WEAPON_VINTAGEPISTOL") and  IsPedCurrentWeaponSilenced(PlayerPedId()) then		

			SetPlayerWeaponDamageModifier(PlayerId(), 0.75*0.38)		

			if IsPedShooting(ped) then

				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.50*0.15)	

			end

		end

		


	end

end)



-- recoil script by bluethefurry / Blumlaut https://forum.fivem.net/t/betterrecoil-better-3rd-person-recoil-for-fivem/82894

-- I just added some missing weapons because of the doomsday update adding some MK2.

-- I can't manage to make negative hashes works, if someone make it works, please let me know =)



local recoils = {

	[453432689] = 1.5, -- PISTOL

	[3219281620] = 1.5, -- PISTOL MK2

	[1593441988] = 0.2, -- COMBAT PISTOL

	[584646201] = 0.1, -- AP PISTOL

	[2578377531] = 5.8, -- PISTOL .50

	[324215364] = 1.0, -- MICRO SMG

	[736523883] = 0.1, -- SMG

	[2024373456] = 0.1, -- SMG MK2

	[4024951519] = 0.1, -- ASSAULT SMG

	[3220176749] = 1.2, -- ASSAULT RIFLE

	[961495388] = 0.2, -- ASSAULT RIFLE MK2

	[2210333304] = 0.1, -- CARBINE RIFLE

	[4208062921] = 0.1, -- CARBINE RIFLE MK2

	[2937143193] = 0.1, -- ADVANCED RIFLE

	[2634544996] = 0.1, -- MG

	[2144741730] = 0.1, -- COMBAT MG

	[3686625920] = 0.1, -- COMBAT MG MK2

	[487013001] = 0.4, -- PUMP SHOTGUN

	[1432025498] = 0.4, -- PUMP SHOTGUN MK2

	[2017895192] = 0.7, -- SAWNOFF SHOTGUN

	[3800352039] = 0.4, -- ASSAULT SHOTGUN

	[2640438543] = 0.2, -- BULLPUP SHOTGUN

	[911657153] = 0.1, -- STUN GUN

	[100416529] = 0.5, -- SNIPER RIFLE

	[205991906] = 0.7, -- HEAVY SNIPER

	[177293209] = 0.7, -- HEAVY SNIPER MK2

	[856002082] = 1.2, -- REMOTE SNIPER

	[2726580491] = 1.0, -- GRENADE LAUNCHER

	[1305664598] = 1.0, -- GRENADE LAUNCHER SMOKE

	[2982836145] = 0.0, -- RPG

	[1752584910] = 0.0, -- STINGER

	[1119849093] = 0.01, -- MINIGUN

	[3218215474] = 0.05, -- SNS PISTOL

	[2009644972] = 0.25, -- SNS PISTOL MK2

	[1627465347] = 0.1, -- GUSENBERG

	[3231910285] = 0.2, -- SPECIAL CARBINE

	[-1768145561] = 0.25, -- SPECIAL CARBINE MK2

	[3523564046] = 0.5, -- HEAVY PISTOL

	[2132975508] = 0.2, -- BULLPUP RIFLE

	[-2066285827] = 0.25, -- BULLPUP RIFLE MK2

	[137902532] = 0.7, -- VINTAGE PISTOL

	[-1746263880] = 0.4, -- DOUBLE ACTION REVOLVER

	[2828843422] = 0.7, -- MUSKET

	[984333226] = 0.2, -- HEAVY SHOTGUN

	[3342088282] = 0.3, -- MARKSMAN RIFLE

	[1785463520] = 0.35, -- MARKSMAN RIFLE MK2

	[1672152130] = 0, -- HOMING LAUNCHER

	[1198879012] = 0.9, -- FLARE GUN

	[171789620] = 0.2, -- COMBAT PDW

	[3696079510] = 0.9, -- MARKSMAN PISTOL

  	[1834241177] = 2.4, -- RAILGUN

	[3675956304] = 0.3, -- MACHINE PISTOL

	[3249783761] = 0.6, -- REVOLVER

	[-879347409] = 0.65, -- REVOLVER MK2

	[4019527611] = 0.7, -- DOUBLE BARREL SHOTGUN

	[1649403952] = 0.3, -- COMPACT RIFLE

	[317205821] = 0.2, -- AUTO SHOTGUN

	[125959754] = 0.5, -- COMPACT LAUNCHER

	[3173288789] = 0.1, -- MINI SMG		

}







Citizen.CreateThread(function()

	while true do

		Citizen.Wait(0)

		if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then

			local _,wep = GetCurrentPedWeapon(PlayerPedId())

			_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)

			if recoils[wep] and recoils[wep] ~= 0 then

				tv = 0

				repeat 

					Wait(0)

					p = GetGameplayCamRelativePitch()

					if GetFollowPedCamViewMode() ~= 4 then

						SetGameplayCamRelativePitch(p+0.1, 0.2)

					end

					tv = tv+0.1

				until tv >= recoils[wep]

			end

			

		end

	end

end)





function RecoilThirdPersonMultiplier(ThirdPersonMultiplier,ThirdPersonAimingMultiplier)

	if GetFollowPedCamViewMode() ~= 4 then -- Not First Person

		local getwidthrecoil = GetGameplayCamRelativeHeading()

		local widthrecoil = math.random() + math.random() - math.random() - math.random()

		SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonMultiplier)

		

		local getheightrecoil = GetGameplayCamRelativePitch()

		local heightrecoil = math.random() + math.random()

		SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonMultiplier, 1.0)

		if IsControlPressed(0, 25) then --RMB aim

			local getwidthrecoil = GetGameplayCamRelativeHeading()

			local widthrecoil = math.random() + math.random() - math.random() - math.random()

			SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonAimingMultiplier)

			

			local getheightrecoil = GetGameplayCamRelativePitch()

			local heightrecoil = math.random() + math.random()

			SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonAimingMultiplier, 1.0)

			Citizen.Wait(0)

		end

	end

end



function RecoilThirdPersonInCarMultiplier(ThirdPersonInCarMultiplier)

	local getwidthrecoil = GetGameplayCamRelativeHeading()

	local widthrecoil = math.random() + math.random() - math.random() - math.random()

	SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * ThirdPersonInCarMultiplier)

				

	local getheightrecoil = GetGameplayCamRelativePitch()

	local heightrecoil = math.random() + math.random()

	SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * ThirdPersonInCarMultiplier, 1.0)

end



function RecoilFirstPersonInCarMultiplier(FirstPersonInCarMultiplier)

	local getwidthrecoil = GetGameplayCamRelativeHeading()

	local widthrecoil = math.random() + math.random() - math.random() - math.random()

	SetGameplayCamRelativeHeading(getwidthrecoil + widthrecoil * FirstPersonInCarMultiplier)

	--Doesnt work hence side ways recoil increased

	--[[local getheightrecoil = GetGameplayCamRelativePitch()

	local heightrecoil = math.random() + math.random()

	SetGameplayCamRelativePitch(getheightrecoil + heightrecoil * FirstPersonInCarMultiplier, 1.0)--]]

end



Config = {}

Config.Weapons = {

    [`WEAPON_SNSPISTOL`] = 0.51,

    [`WEAPON_SNSPISTOL_MK2`] = 0.61,

    [`WEAPON_PISTOL`] = 0.88,

    [`WEAPON_PISTOL_MK2`] = 0.58,

    [`WEAPON_COMBATPISTOL`] = 0.88,

    [`WEAPON_PISTOL50`] = 0.93,

    [`WEAPON_HEAVYPISTOL`] = 0.73,

    [`WEAPON_VINTAGEPISTOL`] = 0.41,

    [`WEAPON_PUMPSHOTGUN`] = 2.53,

    [`WEAPON_PUMPSHOTGUN_MK2`] = 2.53,

    [`WEAPON_SAWNOFFSHOTGUN`] = 3.53,

    [`WEAPON_ASSAULTSHOTGUN`] = 3.53,

    [`WEAPON_BULLPUPSHOTGUN`] = 3.53,

    [`WEAPON_DBSHOTGUN`] = 3.53,

    [`WEAPON_AUTOSHOTGUN`] = 3.53,

}



Citizen.CreateThread(function()



    local aiming, shooting, curMul, _, weapon = nil, nil, nil







    while true do

        aiming, shooting = IsControlPressed(0, 25), IsPedShooting(PlayerPedId())



        if aiming or shooting then            

            _, weapon = GetCurrentPedWeapon(PlayerPedId(), true)



            if _ then

                curMul = GetPlayerWeaponDamageModifier(PlayerId())

 



                if curMul > (Config.Weapons[weapon]) then

                    TriggerServerEvent('twojstarynajebany:siema', curMul, (Config.Weapons[weapon]))

                    Citizen.Wait(60000)

                end

            end

        else

            Citizen.Wait(10)

        end



        Citizen.Wait(0)

    end

end)









