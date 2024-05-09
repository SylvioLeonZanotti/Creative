-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
List = {
	-- Framework
	["Dress"] = {
		["List"] = {
			["backpack"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 15,
				["require"] = {
					["fabric"] = 25
				}
			},
			["fabric"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 3,
				["require"] = {
					["animalpelt"] = 4,
					["rubber"] = 3
				}
			},
			["sewingkit"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 3,
				["require"] = {
					["rubber"] = 35,
					["plastic"] = 35
				}
			},
		}
	},
	["Food"] = {
		["List"] = {
			["hamburger2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["meatA"] = 1,
					["bread"] = 2,
					["ketchup"] = 1
				}
			},
			["hamburger3"] = {
				["amount"] = 3,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["meatB"] = 1,
					["bread"] = 2,
					["ketchup"] = 1
				}
			},
			["orangejuice"] = {
				["amount"] = 3,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["water"] = 1,
					["orange"] = 9
				}
			},
			["tangejuice"] = {
				["amount"] = 3,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["water"] = 1,
					["tange"] = 9
				}
			},
		}
	},
	["Lixeiro"] = {
		["List"] = {
			["aluminum"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["recyclable"] = 6
				}
			},
			["rubber"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["recyclable"] = 4
				}
			},
			["sheetmetal"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["recyclable"] = 25
				}
			},
			["copper"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["recyclable"] = 6
				}
			},
			["techtrash"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["recyclable"] = 30
				}
			},
			["tarp"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["recyclable"] = 35
				}
			},
			["roadsigns"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["recyclable"] = 25
				}
			},
			["plastic"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["recyclable"] = 4
				}
			},
			["glass"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["recyclable"] = 4
				}
			},
			["fabric"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["recyclable"] = 35
				}
			}
		}
	},
	["Mining"] = {
		["List"] = {
			["lead_pure"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["lead_ore"] = 1
				}
			},
			["copper_pure"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_ore"] = 1
				}
			},
			["tin_pure"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_ore"] = 1
				}
			},
			["iron_pure"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["iron_ore"] = 1
				}
			},
			["gold_pure"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["gold_ore"] = 1
				}
			},
			["diamond_pure"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["diamond_ore"] = 1
				}
			},
			["sulfur_pure"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["sulfur_ore"] = 1
				}
			},
			["emerald_pure"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["emerald_ore"] = 1
				}
			},
			["ruby_pure"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["ruby_ore"] = 1
				}
			},
			["sapphire_pure"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["sapphire_ore"] = 1
				}
			}
		}
	},
	["Money"] = {
		["List"] = {
			["dollars"] = {
				["amount"] = 1300,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["dollarsroll"] = 2000
				}
			}
		}
	},
	-- Restaurants
	["Pearls"] = {
		["perm"] = "Pearls",
		["List"] = {
			["hamburger4"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["meatA"] = 1,
					["bread"] = 2,
					["ketchup"] = 1
				}
			},
			["hamburger5"] = {
				["amount"] = 3,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["meatB"] = 1,
					["bread"] = 2,
					["ketchup"] = 1
				}
			},
			["hamburger6"] = {
				["amount"] = 3,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["meatC"] = 1,
					["bread"] = 2,
					["ketchup"] = 1
				}
			},
			["hamburger7"] = {
				["amount"] = 3,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["meatS"] = 1,
					["bread"] = 2,
					["ketchup"] = 1
				}
			},
			["grapejuice"] = {
				["amount"] = 3,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["water"] = 1,
					["grape"] = 9
				}
			},
			["strawberryjuice"] = {
				["amount"] = 3,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["water"] = 1,
					["strawberry"] = 9
				}
			},
			["bananajuice"] = {
				["amount"] = 3,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["water"] = 1,
					["banana"] = 9
				}
			},
			["passionjuice"] = {
				["amount"] = 3,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["water"] = 1,
					["passion"] = 9
				}
			}
		}
	},
	-- Contraband
	["Chiliad"] = {
		["perm"] = "Chiliad",
		["List"] = {
			["c4"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4,
					["explosives"] = 1
				}
			},
			["handcuff"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["aluminum"] = 15,
					["iron_pure"] = 6
				}
			},
			["credential"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["dollarsroll"] = 500
				}
			},
			["vest"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["fabric"] = 3,
					["sheetmetal"] = 3
				}
			},
			["hood"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["fabric"] = 6,
					["tarp"] = 3
				}
			}
		}
	},
	["Families"] = {
		["perm"] = "Families",
		["List"] = {
			["c4"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4,
					["explosives"] = 1
				}
			},
			["handcuff"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["aluminum"] = 15,
					["iron_pure"] = 6
				}
			},
			["credential"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 10,
				["require"] = {
					["dollarsroll"] = 500
				}
			},
			["vest"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["fabric"] = 3,
					["sheetmetal"] = 3
				}
			},
			["hood"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["fabric"] = 6,
					["tarp"] = 3
				}
			}
		}
	},
	["Highways"] = {
		["perm"] = "Highways",
		["List"] = {
			["attachsFlashlight"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsCrosshair"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsSilencer"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsMagazine"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsGrip"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsMuzzleHeavy"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsBarrel"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsMuzzleFat"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["card01"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4
				}
			},
			["card02"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4
				}
			},
			["card03"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4
				}
			},
			["card04"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4
				}
			},
			["card05"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4
				}
			},
			["card05"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4
				}
			}
		}
	},
	["Vagos"] = {
		["perm"] = "Vagos",
		["List"] = {
			["attachsFlashlight"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsCrosshair"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsSilencer"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsMagazine"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsGrip"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsMuzzleHeavy"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsBarrel"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["attachsMuzzleFat"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["tin_pure"] = 4,
					["glass"] = 4,
					["plastic"] = 4
				}
			},
			["card01"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4
				}
			},
			["card02"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4
				}
			},
			["card03"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4
				}
			},
			["card04"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4
				}
			},
			["card05"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["plastic"] = 8,
					["techtrash"] = 4
				}
			}
		}
	},
	-- Favelas
	["Barragem"] = {
		["perm"] = "Barragem",
		["List"] = {
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 18,
					["iron_pure"] = 18,
					["pistolbody"] = 1
				}
			},
			["WEAPON_APPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 20,
					["iron_pure"] = 20,
					["pistolbody"] = 1
				}
			},
			["WEAPON_SNSPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 13,
					["iron_pure"] = 13,
					["pistolbody"] = 1
				}
			},
			["WEAPON_SNSPISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 13,
					["iron_pure"] = 13,
					["pistolbody"] = 1
				}
			},
			["WEAPON_MACHINEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 1
				}
			},
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 1
				}
			},
			["WEAPON_MICROSMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 2
				}
			},
			["WEAPON_SMG_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 2
				}
			},
			["WEAPON_GUSENBERG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 1
				}
			},
			["WEAPON_COMPACTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 40,
					["iron_pure"] = 40,
					["smgbody"] = 1
				}
			},
		    ["WEAPON_ASSAULTSMG"] = {
			 	["amount"] = 1,
			 	["destroy"] = false,
			 	["craftable"] = true,
			 	["time"] = 2,
			 	["require"] = {
			 		["copper_pure"] = 40,
			 		["iron_pure"] = 40,
			 		["smgbody"] = 2
			 	}
			},
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 50,
					["iron_pure"] = 50,
					["riflebody"] = 4
				}
			},
			["WEAPON_SPECIALCARBINE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 50,
					["iron_pure"] = 50,
					["riflebody"] = 5
				}
			},
			["WEAPON_ASSAULTRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 50,
					["iron_pure"] = 50,
					["riflebody"] = 5
				}
			},
			["WEAPON_SPECIALCARBINE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 55,
					["iron_pure"] = 55,
					["riflebody"] = 6
				}
			}
		}
	},
	["Farol"] = {
		["perm"] = "Farol",
		["List"] = {
			["cocaine"] = {
				["amount"] = 5,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["wheatflour"] = 2
				}
			}
		}
	},
	["Parque"] = {
		["perm"] = "Parque",
		["List"] = {
			["metadone"] = {
				["amount"] = 5,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["wheatflour"] = 2
				}
			}
		}
	},
	["Sandy"] = {
		["perm"] = "Sandy",
		["List"] = {
			["heroin"] = {
				["amount"] = 5,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["wheatflour"] = 2
				}
			}
		}
	},
	["Petroleo"] = {
		["perm"] = "Petroleo",
		["List"] = {
			["WEAPON_PISTOL_AMMO"] = {
				["amount"] = 10,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["lead_pure"] = 2,
					["copper_pure"] = 2,
					["gunpowder"] = 1
				}
			},
			["WEAPON_SMG_AMMO"] = {
				["amount"] = 10,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["lead_pure"] = 2,
					["copper_pure"] = 2,
					["gunpowder"] = 2
				}
			},
			["WEAPON_RIFLE_AMMO"] = {
				["amount"] = 10,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["lead_pure"] = 2,
					["copper_pure"] = 2,
					["gunpowder"] = 3
				}
			},
			["WEAPON_SHOTGUN_AMMO"] = {
				["amount"] = 10,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["lead_pure"] = 3,
					["copper_pure"] = 3,
					["gunpowder"] = 5
				}
			},
			["sonhodokadu"] = {
				["amount"] = 5,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 0,
				["require"] = {
					["wheatflour"] = 2
				}
			}
		}
	},
	["Praia-1"] = {
		["perm"] = "Praia-1",
		["List"] = {
			["joint"] = {
				["amount"] = 5,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["wheatflour"] = 2
				}
			}
		}
	},
	["Praia-2"] = {
		["perm"] = "Praia-2",
		["List"] = {
			["oxy"] = {
				["amount"] = 5,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["wheatflour"] = 2
				}
			}
		}
	},
	["Zancudo"] = {
		["perm"] = "Zancudo",
		["List"] = {
			["lean"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["wheatflour"] = 2
				}
			}
		}
	},
	-- Mafias
	["Madrazzo"] = {
		["perm"] = "Madrazzo",
		["List"] = {
			["WEAPON_PISTOL_AMMO"] = {
				["amount"] = 10,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["lead_pure"] = 2,
					["copper_pure"] = 2,
					["gunpowder"] = 1
				}
			},
			["WEAPON_SMG_AMMO"] = {
				["amount"] = 10,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["lead_pure"] = 2,
					["copper_pure"] = 2,
					["gunpowder"] = 2
				}
			},
			["WEAPON_RIFLE_AMMO"] = {
				["amount"] = 10,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["lead_pure"] = 2,
					["copper_pure"] = 2,
					["gunpowder"] = 3
				}
			},
			["WEAPON_SHOTGUN_AMMO"] = {
				["amount"] = 10,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["lead_pure"] = 3,
					["copper_pure"] = 3,
					["gunpowder"] = 5
				}
			}
		}
	},
	["Playboy"] = {
		["perm"] = "Playboy",
		["List"] = {
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 18,
					["iron_pure"] = 18,
					["pistolbody"] = 1
				}
			},
			["WEAPON_APPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 20,
					["iron_pure"] = 20,
					["pistolbody"] = 1
				}
			},
			["WEAPON_SNSPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 13,
					["iron_pure"] = 13,
					["pistolbody"] = 1
				}
			},
			["WEAPON_SNSPISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 13,
					["iron_pure"] = 13,
					["pistolbody"] = 1
				}
			},
			["WEAPON_MACHINEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 1
				}
			},
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 1
				}
			},
			["WEAPON_MICROSMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 2
				}
			},
			["WEAPON_SMG_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 2
				}
			},
			["WEAPON_GUSENBERG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 1
				}
			},
			["WEAPON_COMPACTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 40,
					["iron_pure"] = 40,
					["smgbody"] = 1
				}
			},
		    ["WEAPON_ASSAULTSMG"] = {
			 	["amount"] = 1,
			 	["destroy"] = false,
			 	["craftable"] = true,
			 	["time"] = 2,
			 	["require"] = {
			 		["copper_pure"] = 40,
			 		["iron_pure"] = 40,
			 		["smgbody"] = 2
			 	}
			},
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 50,
					["iron_pure"] = 50,
					["riflebody"] = 4
				}
			},
			["WEAPON_SPECIALCARBINE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 50,
					["iron_pure"] = 50,
					["riflebody"] = 5
				}
			},
			["WEAPON_ASSAULTRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 50,
					["iron_pure"] = 50,
					["riflebody"] = 5
				}
			},
			["WEAPON_SPECIALCARBINE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 55,
					["iron_pure"] = 55,
					["riflebody"] = 6
				}
			}
		}
	},
	["TheSouth"] = {
		["perm"] = "TheSouth",
		["List"] = {
			["WEAPON_PISTOL_AMMO"] = {
				["amount"] = 10,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["lead_pure"] = 2,
					["copper_pure"] = 2,
					["gunpowder"] = 1
				}
			},
			["WEAPON_SMG_AMMO"] = {
				["amount"] = 10,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["lead_pure"] = 2,
					["copper_pure"] = 2,
					["gunpowder"] = 2
				}
			},
			["WEAPON_RIFLE_AMMO"] = {
				["amount"] = 10,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["lead_pure"] = 2,
					["copper_pure"] = 2,
					["gunpowder"] = 3
				}
			},
			["WEAPON_SHOTGUN_AMMO"] = {
				["amount"] = 10,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["lead_pure"] = 3,
					["copper_pure"] = 3,
					["gunpowder"] = 5
				}
			}
		}
	},
	["Vineyard"] = {
		["perm"] = "Vineyard",
		["List"] = {
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 18,
					["iron_pure"] = 18,
					["pistolbody"] = 1
				}
			},
			["WEAPON_APPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 20,
					["iron_pure"] = 20,
					["pistolbody"] = 1
				}
			},
			["WEAPON_SNSPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 13,
					["iron_pure"] = 13,
					["pistolbody"] = 1
				}
			},
			["WEAPON_SNSPISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 13,
					["iron_pure"] = 13,
					["pistolbody"] = 1
				}
			},
			["WEAPON_MACHINEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 1
				}
			},
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 1
				}
			},
			["WEAPON_MICROSMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 2
				}
			},
			["WEAPON_SMG_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 2
				}
			},
			["WEAPON_GUSENBERG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 30,
					["iron_pure"] = 30,
					["smgbody"] = 1
				}
			},
			["WEAPON_COMPACTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 40,
					["iron_pure"] = 40,
					["smgbody"] = 1
				}
			},
		    ["WEAPON_ASSAULTSMG"] = {
			 	["amount"] = 1,
			 	["destroy"] = false,
			 	["craftable"] = true,
			 	["time"] = 2,
			 	["require"] = {
			 		["copper_pure"] = 40,
			 		["iron_pure"] = 40,
			 		["smgbody"] = 2
			 	}
			},
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 50,
					["iron_pure"] = 50,
					["riflebody"] = 4
				}
			},
			["WEAPON_SPECIALCARBINE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 50,
					["iron_pure"] = 50,
					["riflebody"] = 5
				}
			},
			["WEAPON_ASSAULTRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 50,
					["iron_pure"] = 50,
					["riflebody"] = 5
				}
			},
			["WEAPON_SPECIALCARBINE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["craftable"] = true,
				["time"] = 2,
				["require"] = {
					["copper_pure"] = 55,
					["iron_pure"] = 55,
					["riflebody"] = 6
				}
			}
		}
	}
}