--- STEAMODDED HEADER
--- MOD_NAME: Test Sound
--- MOD_ID: TESTSOUND
--- AUTHOR: TuNombre
--- DESCRIPTION: Test manual de audio
--- PREFIX: ts
--- VERSION: 1.0.0
-- ----------------------------------------------

-- Ruta absoluta a tu mod
local mod_path = SMODS.current_mod.path

-- Cargar el sonido manualmente
local prueba_sound = love.audio.newSource(mod_path.."assets/sounds/prueba.ogg", "static")

-- Atlas para la imagen del Joker
SMODS.Atlas({
  key = 'TestJoker',
  path = 'Josuke_Joker.png',
  px = 71, py = 95
})

-- Joker de prueba
SMODS.Joker({
  key = 'J_Test',
  set = "Joker",
  loc_txt = {
    name = 'Test Joker',
    text = { 'Sirve para probar sonido cargado manualmente.' }
  },
  atlas = 'TestJoker',
  rarity = 1,
  cost = 1,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  weight = 9999,

  calculate = function(self, card, context)
    if context and context.joker_main then
      prueba_sound:stop()   -- por si estaba sonando
      prueba_sound:play()
      return {
        message = "¡Sonido manual!",
        colour = G.C.MULT
      }
    end
  end,

  in_pool = function() return true end
})
