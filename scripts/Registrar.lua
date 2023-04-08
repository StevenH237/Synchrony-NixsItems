local Components     = require "necro.game.data.Components"
local CustomEntities = require "necro.game.data.CustomEntities"
local HSVFilter      = require "necro.render.filter.HSVFilter"

--#region COMPONENTS
Components.register {
  NixsItems_consumableResetSpellCooldowns = {},
  NixsItems_itemBanDisable = {},
  NixsItems_itemConsumeFoodOnDeath = {
    Components.field.float("healingFactor", 0.5)
  },
  NixsItems_itemDigStrengthPurchase = {
    Components.constant.float("costPerDigStrengthIncrease", 10),
    Components.constant.int("maxGoldDigStrength", 4)
  },
  NixsItems_itemFlawlessDamageIncrease = {
    Components.field.int("amount", 0),
    Components.constant.int("maximum", 4)
  },
  NixsItems_itemRegenerationOnConstantHits = {
    Components.constant.int("hitCounter", 5),
    Components.constant.int("hitsPerBeat", 1),
    Components.constant.bool("damageOnly", true),
    Components.constant.int("healthGain", 1),
    Components.constant.int("changeOnHeal", 0),
    Components.field.int("neededHits", 5),
    Components.field.int("achievedHits", 0),
    Components.field.int("hitsLastBeat", 0)
  },
  NixsItems_itemSpellKillStorage = {
    Components.field.int("kills", 0),
    Components.constant.int("maximum", 100),
    Components.constant.float("conversionRate", 2)
  },
  NixsItems_itemTemporarilyIncreaseDamage = {
    Components.constant.int("increase", 1)
  },
  NixsItems_temporaryDamageIncrease = {
    Components.field.int("increase", 0)
  }
}
--#endregion

--#region ENTITIES
CustomEntities.extend {
  name = "NixsItems_ShovelSilver",
  template = CustomEntities.template.item("shovel_basic"),
  data = {
    flyaway = "Silver Shovel",
    name = "Silver Shovel",
    hint = "+Dig for a price",
    slot = "shovel"
  },
  components = {
    NixsItems_itemDigStrengthPurchase = {},
    sprite = {
      texture = "mods/NixsItems/gfx/shovel_silver.png"
    },
    itemPoolLockedChest = {
      weights = { 40, 40, 40, 1 }
    },
    itemPoolNeed = {},
    itemPoolSecret = {
      weights = { 40, 40, 40, 1 }
    },
    itemPoolShop = {
      weights = { 40 }
    },
    itemPrice = {
      blood = 1.5,
      coins = 80
    }
  }
}

CustomEntities.extend {
  name = "NixsItems_RingPreservation",
  template = CustomEntities.template.item("ring_shielding"),
  data = {
    flyaway = "Ring of Preservation",
    name = "Ring of Preservation",
    hint = "Preserve shields",
    slot = "ring"
  },
  components = {
    sprite = {
      texture = HSVFilter.getPath("ext/items/ring_shielding.png", -86 / 360, -0.3, 0)
    },
    itemIncomingDamageImmunityCastSpell = false,
    itemIncomingDamageImmunityConsume = false,
    itemIncomingDamageImmunityFirst = false,
    itemIncomingDamageImmunityFlyaway = false,
    itemIncomingDamageImmunityHitstop = false,
    Sync_itemProtectShields = {}
  }
}
--#endregion
