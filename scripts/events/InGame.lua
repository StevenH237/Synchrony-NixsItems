local Currency = require "necro.game.item.Currency"
local Event    = require "necro.event.Event"

Event.holderComputeDigStrength.add("purchaseUpgrade",
  { order = "resistanceUpgrade", filter = "NixsItems_itemDigStrengthPurchase" }, function(ev)
  -- The shovel's base strength
  local baseStrength = ev.strength
  -- The wall's dig resistance
  local wallStrength = ev.resistance
  -- The shovel's maximum strength for a gold-powered dig
  local maxStrength = ev.entity.NixsItems_itemDigStrengthPurchase.maxGoldDigStrength

  if (wallStrength > baseStrength and wallStrength <= maxStrength and not ev.noHighResistance) then
    local holder = ev.holder
    local price = (wallStrength - baseStrength) * ev.entity.NixsItems_itemDigStrengthPurchase.costPerDigStrengthIncrease

    if (holder.goldCounter and holder.goldCounter.amount > price) then
      Currency.subtract(ev.holder, Currency.Type.GOLD, price)
      ev.strength = wallStrength
    end
  end
end)
