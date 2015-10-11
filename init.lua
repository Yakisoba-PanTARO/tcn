------------------------------------------------------------
-- Texture Combined Nodes - Minetest Utility MOD -
-- 
-- Copyright (c) 2015 Yakisoba-PanTARO
-- https://github.com/Yakisoba-PanTARO/tcn
------------------------------------------------------------

tcn = {}

local function shallowcopy_table(orig)
  local copy = {}
  for orig_key, orig_value in pairs(orig) do
    copy[orig_key] = orig_value
  end
  return copy
end

function tcn.register_tcn(texturesize, ratio,
			  subname1, recipeitem1, texture1,
			  subname2, recipeitem2, texture2)
  local nodedef1 = minetest.registered_nodes[recipeitem1]
  local nodedef2 = minetest.registered_nodes[recipeitem2]
  local descbase = nodedef1.description .. " " .. nodedef2.description
  local nodenamebase = "tcn:tcn_" .. subname1 .. "_" .. subname2 .. ratio
  
  minetest.register_node(":" .. nodenamebase .. "_l", shallowcopy_table(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_r", shallowcopy_table(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_t", shallowcopy_table(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_b", shallowcopy_table(nodedef1))

  minetest.register_node(":" .. nodenamebase .. "_lr", shallowcopy_table(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_lt", shallowcopy_table(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_lb", shallowcopy_table(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_rt", shallowcopy_table(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_rb", shallowcopy_table(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_tb", shallowcopy_table(nodedef1))

  minetest.register_node(":" .. nodenamebase .. "_lrt", shallowcopy_table(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_lrb", shallowcopy_table(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_ltb", shallowcopy_table(nodedef1))
  minetest.register_node(":" .. nodenamebase .. "_rtb", shallowcopy_table(nodedef1))

  minetest.register_node(":" .. nodenamebase .. "_lrtb", shallowcopy_table(nodedef1))

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
end

-- こんな感じで使う.
-- ↓↓↓
-- tcn.register_tcn(16, 1/4, "wood", "default:wood", "default_wood.png", "stone", "default:tree", "default_tree.png")
