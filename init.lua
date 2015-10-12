------------------------------------------------------------
-- Texture Combined Nodes - Minetest Utility MOD -
-- 
-- Copyright (c) 2015 Yakisoba-PanTARO
-- https://github.com/Yakisoba-PanTARO/tcn
------------------------------------------------------------

tcn = {}

function tcn.register_tcn(texturesize, ratio,
			  subname1, recipeitem1, texture1,
			  subname2, recipeitem2, texture2)
  local nodedef1 = minetest.registered_nodes[recipeitem1]
  local nodedef2 = minetest.registered_nodes[recipeitem2]
  local descbase = nodedef1.description .. " " .. nodedef2.description
  local nodenamebase = "tcn:tcn_" .. subname1 .. "_" .. subname2 .. ratio
  
  minetest.register_node(":" .. nodenamebase .. "_l", table.copy(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_r", table.copy(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_t", table.copy(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_b", table.copy(nodedef1))

  minetest.register_node(":" .. nodenamebase .. "_lr", table.copy(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_lt", table.copy(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_lb", table.copy(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_rt", table.copy(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_rb", table.copy(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_tb", table.copy(nodedef1))

  minetest.register_node(":" .. nodenamebase .. "_lrt", table.copy(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_lrb", table.copy(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_ltb", table.copy(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_rtb", table.copy(nodedef1))

  minetest.register_node(":" .. nodenamebase .. "_lrtb", table.copy(nodedef1))
  ----------------------------------------------------------
  
  minetest.override_item(nodenamebase .. "_l", {
    description = descbase .. " L",
    tiles = {
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 .. ":" ..
	texturesize * ratio .. ",0=" .. texture1,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 .. ":" ..
	texturesize * ratio .. ",0=" .. texture1,
      texture1,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 .. ":" ..
	texturesize * (1 - ratio) .. ",0=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 .. ":" ..
	texturesize * ratio .. ",0=" .. texture1,
    },
    paramtype2 = "facedir",
  })
  
  minetest.override_item(nodenamebase .. "_r", {
    description = descbase .. " R",
    tiles = {
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 .. ":" ..
	texturesize * (1 - ratio) .. ",0=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 .. ":" ..
	texturesize * (1 - ratio) .. ",0=" .. texture2,
      texture2,
      texture1,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 .. ":" ..
	texturesize * ratio .. ",0=" .. texture1,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 .. ":" ..
	texturesize * (1 - ratio) .. ",0=" .. texture2,
    },
    paramtype2 = "facedir",
  })

  minetest.override_item(nodenamebase .. "_t", {
    description = descbase .. " T",
    tiles = {
      texture2,
      texture1,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 .. ":" ..
	"0," .. texturesize * ratio .. "=" .. texture1,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 .. ":" ..
	"0," .. texturesize * ratio .. "=" .. texture1,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 .. ":" ..
	"0," .. texturesize * ratio .. "=" .. texture1,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 .. ":" ..
	"0," .. texturesize * ratio .. "=" .. texture1,
    },
    paramtype2 = "facedir",
  })

  minetest.override_item(nodenamebase .. "_b", {
    description = descbase .. " B",
    tiles = {
      texture1,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 .. ":" ..
	"0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 .. ":" ..
	"0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 .. ":" ..
	"0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 .. ":" ..
	"0," .. texturesize * (1 - ratio) .. "=" .. texture2,
    },
    paramtype2 = "facedir",
  })

  ------------------------------------------------------------
  
  minetest.override_item(nodenamebase .. "_lr", {
    description = descbase .. " LR",
    tiles = {
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. ",0=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. ",0=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
      texture2,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. ",0=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. ",0=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
    },
    paramtype2 = "facedir",
  })

  minetest.override_item(nodenamebase .. "_lt", {
    description = descbase .. " LT",
    tiles = {
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. ",0=" .. texture1,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 .. ":" ..
	"0," .. texturesize * ratio .. "=" .. texture1,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. "0," .. texturesize * ratio .. "=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. "," .. texturesize * ratio .. "=" .. texture1,
    },
    paramtype2 = "facedir",
  })

  minetest.override_item(nodenamebase .. "_lb", {
    description = descbase .. " LB",
    tiles = {
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. ",0=" .. texture1,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 .. ":" ..
	"0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 ..
	":" .. "0," .. texturesize * (1 - ratio) .. "=" .. texture2 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. ",0=" .. texture1 ..
	":" .. "0," .. texturesize * (1 - ratio) .. "=" .. texture2,
    },
    paramtype2 = "facedir",
  })

  minetest.override_item(nodenamebase .. "_rt", {
    description = descbase .. " RT",
    tiles = {
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 .. ":" ..
	"0," .. texturesize * ratio .. "=" .. texture1,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. "," .. texturesize * ratio .. "=" .. texture1,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. "0," .. texturesize * ratio .. "=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
    },
    paramtype2 = "facedir",
  })

  minetest.override_item(nodenamebase .. "_rb", {
    description = descbase .. " RB",
    tiles = {
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
      texture2,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 .. ":" ..
	"0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. ",0=" .. texture1 ..
	":" .. "0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture1 ..
	":" .. "0," .. texturesize * (1 - ratio) .. "=" .. texture2 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
    },
    paramtype2 = "facedir",
  })

  minetest.override_item(nodenamebase .. "_tb", {
    description = descbase .. " TB",
    tiles = {
      texture2,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":0," .. texturesize * ratio .. "=" .. texture1 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":0," .. texturesize * ratio .. "=" .. texture1 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":0," .. texturesize * ratio .. "=" .. texture1 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":0," .. texturesize * ratio .. "=" .. texture1 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2,
    },
    paramtype2 = "facedir",
  })

  ------------------------------------------------------------

  minetest.override_item(nodenamebase .. "_lrt", {
    description = descbase .. " LRT",
    tiles = {
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. ",0=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
      texture2,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. "," .. texturesize * ratio .. "=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. "," .. texturesize * ratio .. "=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
    },
    paramtype2 = "facedir",
  })

  minetest.override_item(nodenamebase .. "_lrb", {
    description = descbase .. " LRB",
    tiles = {
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. ",0=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
      texture2,
      texture2,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. ",0=" .. texture1 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. ",0=" .. texture1 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2,
    },
    paramtype2 = "facedir",
  })

  minetest.override_item(nodenamebase .. "_ltb", {
    description = descbase .. " LTB",
    tiles = {
      texture2,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":0," .. texturesize * ratio .. "=" .. texture1 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":0," .. texturesize * ratio .. "=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. "," .. texturesize * ratio .. "=" .. texture1 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2,
    },
    paramtype2 = "facedir",
  })

  minetest.override_item(nodenamebase .. "_rtb", {
    description = descbase .. " RTB",
    tiles = {
      texture2,
      texture2,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":0," .. texturesize * ratio .. "=" .. texture1 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. "," .. texturesize * ratio .. "=" .. texture1 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":0," .. texturesize * ratio .. "=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2,
    },
    paramtype2 = "facedir",
  })

  minetest.override_item(nodenamebase .. "_lrtb", {
    description = descbase .. " LRTB",
    tiles = {
      texture2,
      texture2,
      texture2,
      texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. "," .. texturesize * ratio .. "=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2,
      "[combine:" .. texturesize .. "x" .. texturesize .. ":0,0=" .. texture2 ..
	":" .. texturesize * ratio .. "," .. texturesize * ratio .. "=" .. texture1 ..
	":" .. texturesize * (1 - ratio) .. ",0=" .. texture2 ..
	":0," .. texturesize * (1 - ratio) .. "=" .. texture2,
    },
    paramtype2 = "facedir",
  })

  ----------------------------------------------------------

  minetest.register_craft({
    output = nodenamebase .. "_l",
    recipe = {
      {recipeitem2, recipeitem1}
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_r",
    recipe = {
      {recipeitem1, recipeitem2}
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_t",
    recipe = {
      {recipeitem2},
      {recipeitem1}
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_b",
    recipe = {
      {recipeitem1},
      {recipeitem2}
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_lr",
    recipe = {
      {recipeitem2, recipeitem1, recipeitem2},
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_lt",
    recipe = {
      {"", recipeitem2},
      {recipeitem2, recipeitem1},
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_lb",
    recipe = {
      {recipeitem2, recipeitem1},
      {"", recipeitem2},
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_rt",
    recipe = {
      {recipeitem2, ""},
      {recipeitem1, recipeitem2},
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_rb",
    recipe = {
      {recipeitem1, recipeitem2},
      {recipeitem2, ""},
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_tb",
    recipe = {
      {recipeitem2},
      {recipeitem1},
      {recipeitem2},
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_lrt",
    recipe = {
      {"", recipeitem2, ""},
      {recipeitem2, recipeitem1, recipeitem2},
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_lrb",
    recipe = {
      {recipeitem2, recipeitem1, recipeitem2},
      {"", recipeitem2, ""},
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_ltb",
    recipe = {
      {"", recipeitem2},
      {recipeitem2, recipeitem1},
      {"", recipeitem2},
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_rtb",
    recipe = {
      {recipeitem2, ""},
      {recipeitem1, recipeitem2},
      {recipeitem2, ""},
    },
  })

  minetest.register_craft({
    output = nodenamebase .. "_lrtb",
    recipe = {
      {"", recipeitem2, ""},
      {recipeitem2, recipeitem1, recipeitem2},
      {"", recipeitem2, ""},
    },
  })
end

-- こんな感じで使う.
-- ↓↓↓
-- tcn.register_tcn(16, 1/4, "wood", "default:wood", "default_wood.png", "stone", "default:tree", "default_tree.png")
