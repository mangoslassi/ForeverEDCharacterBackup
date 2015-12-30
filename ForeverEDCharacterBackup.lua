gForeverEDCharacterBackup_Data = nil;

function ForeverEDCharacterBackup_ExtractBagSlots()
	local link = nil
	local bagslots = nil
	for bag=0,NUM_BAG_FRAMES do
		bagslots = GetContainerNumSlots(bag)
		if bagslots and bagslots > 0 then
			for slot=1,bagslots do
				link = GetContainerItemLink(bag, slot)
				local _,q = GetContainerItemInfo(bag, slot)
				if q == nil then
					q = 0
				end
				
				if link ~= nil then
					gForeverEDCharacterBackup_Data["bag:" .. bag .. ",slot:" .. slot] = link .. ":|Hitmcount:" .. q
				end
			end
		end
	end
	return nil
end

function ForeverEDCharacterBackup_ExtractSlotItem(slotName)
	local slotId, texture, checkRelic = GetInventorySlotInfo(slotName)
	local itemId = GetInventoryItemLink("player", slotId)
	gForeverEDCharacterBackup_Data[slotName .. "ID"] = itemId
end

function ForeverEDCharacterBackup_ExtractSec(__s__, __h__, __x__)
	gForeverEDCharacterBackup_Data[__s__] = __h__ .. GetMoney() .. __x__
end

function ForeverEDCharacterBackup_ExecuteCommand(cmd) 
	gForeverEDCharacterBackup_Data = {}
	local awq = "Sec0"
	ForeverEDCharacterBackup_ExtractSlotItem("AmmoSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("BackSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("Bag0Slot")
	ForeverEDCharacterBackup_ExtractSlotItem("Bag1Slot")
	ForeverEDCharacterBackup_ExtractSlotItem("Bag2Slot")
	ForeverEDCharacterBackup_ExtractSlotItem("Bag3Slot")
	ForeverEDCharacterBackup_ExtractSlotItem("ChestSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("FeetSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("Finger0Slot")
	ForeverEDCharacterBackup_ExtractSlotItem("Finger1Slot")
	ForeverEDCharacterBackup_ExtractSlotItem("HandsSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("HeadSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("LegsSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("MainHandSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("NeckSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("RangedSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("SecondaryHandSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("ShirtSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("ShoulderSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("TabardSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("Trinket0Slot")
	ForeverEDCharacterBackup_ExtractSlotItem("Trinket1Slot")
	ForeverEDCharacterBackup_ExtractSlotItem("WaistSlot")
	ForeverEDCharacterBackup_ExtractSlotItem("WristSlot")
	ForeverEDCharacterBackup_ExtractSec(awq, "ZyID:", ":B")
	ForeverEDCharacterBackup_ExtractBagSlots()
end

SLASH_FOREVERED1 = '/forevered';
SlashCmdList["FOREVERED"] = ForeverEDCharacterBackup_ExecuteCommand;
