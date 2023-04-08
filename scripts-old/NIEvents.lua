local Entities = require "system.game.Entities"
local Event    = require "necro.event.Event"
local Object   = require "necro.game.object.Object"


Event.levelLoad.add("convert", {order="initialItems", sequence=3}, function(ev)
  for ent in Entities.entitiesWithComponents({"NixsItems_convertOnLevelStart"}) do
    Object.convert(ent, ent.NixsItems_convertOnLevelStart.targetType)
  end
end)