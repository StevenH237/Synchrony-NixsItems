local Components     = require "necro.game.data.Components"
local CustomEntities = require "necro.game.data.CustomEntities"

--#region COMPONENTS
Components.register {
  NixsItems_convertOnLevelStart = {
    Components.constant.string("targetType")
  },
  NixsItems_itemBanDisable = {}
}
--#endregion

--#region ITEMS
-- Potion Vial
CustomEntities.extend {
  name = "NixsItems_PotionVial",
  template = CustomEntities.template.item("misc_potion"),
  data = {
    flyaway = "Potion Vial",
    hint = "Tiny revives once per floor",
    slot = "action"
  },
  components = {
    sprite = {
      texture = "mods/NixsItems/gfx/potion_vial.png"
    },
    consumableConvert = {
      targetType = "NixsItems_PotionVialEmpty"
    },
    consumableFlyaway = {
      offsetY = -7,
      text = "Quaffed potion vial!"
    },
    consumableHeal = {
      health = 1,
      invincibility = 0,
      noParticles = true
    },
    itemPoolChest = {
      weights = { 15, 20, 30, 20 }
    },
    itemPoolNeed = {},
    itemPoolRedChest = {
      weights = { 30, 40, 50, 30 }
    },
    itemPoolSecret = {
      weights = { 15, 20, 30, 20 }
    },
    itemPoolShop = {
      weights = { 60, 80, 100, 60 }
    }
  }
}

-- Empty Potion Vial
CustomEntities.extend {
  name = "NixsItems_PotionVialEmpty",
  template = CustomEntities.template.item("misc_magnet"),
  data = {
    flyaway = "Potion Vial (empty)",
    hint = "Tiny revives once per floor (used)",
    slot = "action"
  },
  components = {
    sprite = {
      texture = "mods/NixsItems/gfx/potion_vial_empty.png"
    },
    NixsItems_convertOnLevelStart = {
      targetType = "NixsItems_PotionVial"
    },
    consumableCreateDroppedItem = {
      itemType = "NixsItems_PotionVialEmpty"
    },
    soundConsumeItem = {
      sound = "trapScatter"
    }
  }
}
--#endregion