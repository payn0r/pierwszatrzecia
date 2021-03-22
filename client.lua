Config = {

	FirstPersonShoot = true,

	DisplayCrosshair = {

		'WEAPON_SNIPERRIFLE',

		'WEAPON_HEAVYSNIPER',

		'WEAPON_HEAVYSNIPER_MK2',

		'WEAPON_MARKSMANRIFLE',

		'WEAPON_MARKSMANRIFLE_MK2'

	},

}

local shooting = 1



RegisterCommand('pierwsza', function(source, args)

shooting = 1

end, false) 



RegisterCommand('trzecia', function(source, args)

shooting = 3

end, false) 

local camera = nil

Citizen.CreateThread(function()

	while true do

		Citizen.Wait(0)

		if IsControlJustPressed(0, 25) and GetFollowPedCamViewMode() ~= 4 then

			if shooting == 1 then

				camera = GetFollowPedCamViewMode()

				SetFollowPedCamViewMode(4)

			end	

		elseif IsControlJustPressed(0, 25) and GetFollowPedCamViewMode() == 4 then

			if shooting == 1 then

				SetFollowPedCamViewMode(camera)

			end

		end

	end

end)


Citizen.CreateThread(function()

    while true do

        Citizen.Wait(0)

        if IsControlPressed(0, 197) then

		local ped = PlayerPedId()		

		shooting = 1

			if IsControlPressed(0, 25) then

				SetFollowPedCamViewMode(4)

			end					

		elseif IsControlPressed(0, 274) then

		local ped = PlayerPedId()	

		shooting = 3	

			if IsControlPressed(0, 25) then

				SetFollowPedCamViewMode(2)

			end			

        end

    end

end)





Citizen.CreateThread(function()

	while true do

		Citizen.Wait(0)

		if shooting == 1 then

			local ped = PlayerPedId()

			if IsPedBeingStunned(ped) then

				SetPedMinGroundTimeForStungun(ped, Config.Stungun)

			end



			local show, weapon = false, GetSelectedPedWeapon(ped)



			for _, model in ipairs(Config.DisplayCrosshair) do

				if weapon == GetHashKey(model) then

					show = true

					break

				end

			end

			local aiming, shooting = IsControlPressed(0, 25), IsPedShooting(ped)

			local inVehicle = IsPedInAnyVehicle(ped, false)

			if not show then

				if Config.FirstPersonShoot then

					local aiming, shooting = IsControlPressed(0, 25), IsPedShooting(ped)

					if aiming or shooting then

						if shooting and not aiming then

							isShooting = true

							aimTimer = 0

						else

							isShooting = false

						end



						if not isAiming then

							isAiming = true



							lastCamera = GetFollowPedCamViewMode()

							if lastCamera ~= 4 then



								SetFollowPedCamViewMode(4)

							end

						elseif GetFollowPedCamViewMode() ~= 4 then

							SetFollowPedCamViewMode(4)



						end

					elseif isAiming then

						local off = true

						if isShooting then

							off = false



							aimTimer = aimTimer + 20

							if aimTimer == 3000 then

								isShooting = false

								aimTimer = 0

								off = true

							end

						end



						if off then

							isAiming = false

							if lastCamera ~= 4 then

								SetFollowPedCamViewMode(lastCamera)

							end

						end

					elseif not inVehicle then



					end

				end

			end

		end	

	end

end)


Citizen.CreateThread(function()

	while true do

		Citizen.Wait(0)

		if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then

			local _,wep = GetCurrentPedWeapon(PlayerPedId())

			_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)

			if recoils[wep] and recoils[wep] ~= 0 then

				tv = 0

				if GetFollowPedCamViewMode() ~= 4 then

					repeat 

						Wait(0)

						p = GetGameplayCamRelativePitch()

						SetGameplayCamRelativePitch(p+0.1, 0.2)

						tv = tv+0.1

					until tv >= recoils[wep]

				else

					repeat 

						Wait(0)

						p = GetGameplayCamRelativePitch()

						if recoils[wep] > 0.1 then

							SetGameplayCamRelativePitch(p+0.6, 1.2)

							tv = tv+0.6

						else

							SetGameplayCamRelativePitch(p+0.016, 0.333)

							tv = tv+0.1

						end

					until tv >= recoils[wep]

				end

			end

		end

	end

end)

