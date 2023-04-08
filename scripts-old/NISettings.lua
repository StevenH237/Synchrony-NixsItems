local Event    = require "necro.event.Event"
local ItemBan  = require "necro.game.item.ItemBan"
local Settings = require "necro.config.Settings"

local PowerSettings = require "PowerSettings.PowerSettings"

--#region SETTINGS

Potionvial = PowerSettings.group {
  name = "Potion Vial",
  id = "potionVial",
  order = 16.1520
}

PotionvialEnable = PowerSettings.entitySchema.bool {
  name = "Enabled",
  id = "potionVial.enabled",
  order = 0,
  default = true
}

PotionvialCharmslot = PowerSettings.entitySchema.bool {
  name = "Use charm slot",
  id = "potionVial.charmSlot",
  order = 1,
  default = false,
  visibility = Settings.Visibility.ADVANCED
}

PotionvialHealing = PowerSettings.entitySchema.number {
  name = "Half-hearts healed",
  id = "potionVial.healing",
  order = 2,
  default = 1,
  minimum = 1,
  visibility = Settings.Visibility.ADVANCED
}

--#endregion

--#region SETTINGS EVENTS

Event.entitySchemaLoadNamedEntity.add("nixsItemSettingsPotionVial", "NixsItems_PotionVial", function (ev)
  local ent = ev.entity

  if not PotionvialEnable then
    ent.NixsItems_itemBanDisable = {}
  end

  if PotionvialCharmslot then
    ent.itemSlot.name = "misc"
  end

  ent.consumableHeal.health = PotionvialHealing
end)

Event.entitySchemaLoadNamedEntity.add("nixsItemSettingsPotionVialEmpty", "NixsItems_PotionVialEmpty", function (ev)
  local ent = ev.entity

  if PotionvialCharmslot then
    ent.itemSlot.name = "misc"
  end
end)

Event.entitySchemaLoadEntity.add("addNixsItemBans", {order="overrides"}, function(ev)
  local ent = ev.entity

  if not ent.playableCharacter then return end

  ev.entity.inventoryBannedItems = ev.entity.inventoryBannedItems or {components = {}}
  ev.entity.inventoryBannedItems.components.NixsItems_itemBanDisable = ItemBan.Type.FULL
end)

--#endregion