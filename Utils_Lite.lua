local Utils = {}

function NPC.GetAbsOrigin(p1)
	return Entity.GetAbsOrigin(p1)
end

function NPC.GetUnitsInRadius(p1, p2, p3) 
	local answer = Entity.GetUnitsInRadius(p1, p2, p3)
	if answer ~= nil then
		return answer
	else
		return {}
	end
end

function NPC.GetHeroesInRadius(p1, p2, p3)
	return Heroes.InRadius(Entity.GetAbsOrigin(p1), p2, Entity.GetTeamNum(p1), p3)
end


function Ability.CastAbilityPosition(p1, p2)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, nil, p2, p1, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_CURRENT_UNIT_ONLY, nil, false, false)
	return true
end

function Ability.CastCustomTarget(p1, p2, p3)
	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, Heroes.GetLocal(), Vector(0,0,0), p1, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, p3)

	return true
end

function Ability.GetRadius(p1)
	return Ability.GetLevelSpecialValueFor(p1, "radius")
end
 


return Utils