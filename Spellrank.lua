SPELLRANK = {}

SLASH_SPELLRANK1 = "/spellrank"


function SPELLRANK.rankUpSpells()
    for slot = 1,120 do
        local upgrade = false
        local action = SPELLRANK.getAction(slot)
        if action and action._type == "spell" then
            ClearCursor()
            PickupAction(slot)
            ClearCursor()
            PickupSpellBookItem(action.name)
            PlaceAction(slot)
            

            end
        end
        print("Scan complete")
    end


function SPELLRANK.getAction(slot)
    assert(slot)
    local _type, id, subType = GetActionInfo(slot)
    if not _type or id == 0 then
        return nil
    end

    action = {}
    action._type = _type
    action.id = id
    action.subType = subType

    if _type == "spell" then
        C_Spell.RequestLoadSpellData(id)
        local spellName,_,_,_,_,_,_ = GetSpellInfo(id)
        action.name = spellName
    else
    end
    return action
end

SlashCmdList["SPELLRANK"] = SPELLRANK.rankUpSpells