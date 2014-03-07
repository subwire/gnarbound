function init()
  entity.setDeathParticleBurst("deathPoof")
  entity.setAnimationState("movement", "start")
  if storageApi.isInit() then
    storageApi.init({ mode = 1, capacity = 4, merge = true, ondeath = 1 })
  end
  local states = stateMachine.scanScripts(entity.configParameter("scripts"), "(%a+State)%.lua")
  self.state = stateMachine.create(states)
  if storage.stationPos == nil then
    storage.stationPos = entity.configParameter("stationPos")
  end
  if storage.active == nil then storage.active = true end
  if (self.stationId == nil) or not world.entityExists(self.stationId) then
    local ids = world.objectQuery(storage.stationPos, 1, { name = "dronestation", callScript = "droneRegister", callScriptArgs = { entity.id() } })
    for _,v in pairs(ids) do
      self.stationId = v
      break
    end
  end
  self.start = 2
  if storage.fuel == nil then storage.fuel = 50 end
end

function setActive(flag)
  storage.active = flag
end

function die()
  world.callScriptedEntity(self.stationId or -1, "droneDeath", entity.id())
  storageApi.die()
end

function onLanding()
  entity.setAnimationState("movement", "start")
  entity.setDeathParticleBurst(nil)
  self.dead = true
  return storage.fuel
end

function shouldDie()
  return self.dead or not world.entityExists(self.stationId or -1)
end

function moveTo(pos, dt)
  local p = entity.position()
  if (self.px ~= nil) and (math.abs(pos[1] - p[1]) > 1) and (math.abs(p[1] - self.px) < 0.01) then
    entity.flyTo({ pos[1], p[2] + 2.5 }, true)
  else
    entity.flyTo(pos, true)
  end
  self.px = p[1]
end

function main()
  if not self.dead then
    if not world.entityExists(self.stationId or -1) then self.dead = true
    elseif self.start > 0 then
      entity.fly({ 0, 0.15 })
      self.start = self.start - entity.dt()
      if self.start <= 0 then
        entity.setAnimationState("movement", "fly")
      end
    else
      local dt = entity.dt()
      if storage.fuel > 0 then storage.fuel = storage.fuel - dt * 2 end
      self.state.update(dt)
    end
  end
end