Components available in Nix's Items:

# `NixsItems_itemBanDisable`
*This component's functionality is not yet implemented.*

Items with this component are banned for all characters.

There are no fields or constants on this component.

It is not hardcoded to any entities. However, it is automatically assigned to or removed from items during an entity schema regeneration, depending on player-selected settings. The mod's default settings do not assign it to any entities.

# `NixsItems_itemDigStrengthPurchase`
*This component's functionality is not yet implemented.*

An item with this component increases the holder's dig strength, but takes gold to do so above the strength the holder otherwise has. If the holder doesn't have sufficient gold, the dig fails.

This component has the following fields:

* constant float `costPerDigStrengthIncrease` (default 10): For every level of dig strength, take this many coins. Rounds down after multiplying (for example 12.9 × 2 = 25.8 = 25).
* constant int `maxGoldDigStrength` (default `Dig.Strength.SHOP`): The highest level dig that can be achieved with this item.

*This component will be assigned to entities, but is not yet.*

# `NixsItems_itemFlawlessDamageIncrease`
*This component's functionality is not yet implemented.*

An item with this component increases weapon damage output. It starts at 0, and increases by 1 for each flawless victory earned with the item equipped.

This component has the following fields:

* int `amount` (default 0): The amount by which damage is increased.
* constant int `maximum` (default 4): The maximum amount by which damage can be increased.

*This component will be assigned to entities, but is not yet.*

# `NixsItems_itemSpellKillStorage`
*This component's functionality is not yet implemented.*

An item with this component stores enemy kills as if they were fuel for spell cooldowns. If the holder has no spells that are on cooldown, one kill adds one charge to this component.