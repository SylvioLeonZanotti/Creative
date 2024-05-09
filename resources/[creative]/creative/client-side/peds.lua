-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local localPeds = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	{ -- Ammunation (Framework)
		Distance = 100,
		Coords = { 120.8,-3021.49,7.04,260.79 },
		Model = "ig_dale" ,
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Mercado Central
		Distance = 50,
		Coords = { 46.65,-1749.7,29.62,51.03 },
		Model = "ig_cletus",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Mercado Central
		Distance = 50,
		Coords = { 2747.31,3473.07,55.67,249.45 },
		Model = "ig_cletus",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Mercado Central
		Distance = 50,
		Coords = { 833.15,-942.31,26.47,82.21 },
		Model = "ig_cletus",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammunation (Framework)
		Distance = 12,
		Coords = { 1692.28,3760.94,34.69,229.61 },
		Model = "ig_dale" ,
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammunation (Framework)
		Distance = 12,
		Coords = { 253.79,-50.5,69.94,68.04 },
		Model = "ig_dale" ,
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammunation (Framework)
		Distance = 12,
		Coords = { 842.41,-1035.28,28.19,0.0 },
		Model = "ig_dale" ,
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammunation (Framework)
		Distance = 12,
		Coords = { -331.62,6084.93,31.46,226.78 },
		Model = "ig_dale" ,
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammunation (Framework)
		Distance = 12,
		Coords = { -662.29,-933.62,21.82,181.42 },
		Model = "ig_dale" ,
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammunation (Framework)
		Distance = 12,
		Coords = { -1304.17,-394.62,36.7,73.71 },
		Model = "ig_dale" ,
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammunation (Framework)
		Distance = 12,
		Coords = { -1118.95,2699.73,18.55,223.94 },
		Model = "ig_dale" ,
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammunation (Framework)
		Distance = 12,
		Coords = { 2567.98,292.65,108.73,0.0 },
		Model = "ig_dale" ,
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammunation (Framework)
		Distance = 12,
		Coords = { -3173.51,1088.38,20.84,249.45 },
		Model = "ig_dale" ,
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammunation (Framework)
		Distance = 12,
		Coords = { 22.59,-1105.54,29.79,155.91 },
		Model = "ig_dale" ,
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammunation (Framework)
		Distance = 12,
		Coords = { 810.22,-2158.99,29.62,0.0 },
		Model = "ig_dale" ,
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},

	{ -- Departament (Framework)
		Distance = 10,
		Coords = { 24.49,-1346.08,29.49,272.13 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { 2556.04,380.89,108.61,0.0 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { 1164.82,-323.63,69.2,99.22 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { -706.16,-914.55,19.21,90.71 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { -47.39,-1758.63,29.42,51.03 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { 372.86,327.53,103.56,257.96 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 6,
		Coords = { -3243.38,1000.11,12.82,0.0 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 6,
		Coords = { 1728.39,6416.21,35.03,246.62 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 6,
		Coords = { 549.2,2670.22,42.16,96.38 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 6,
		Coords = { 1959.54,3741.01,32.33,303.31 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 6,
		Coords = { 2677.07,3279.95,55.23,334.49 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 6,
		Coords = { 1697.35,4923.46,42.06,328.82 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 6,
		Coords = { -1819.55,793.51,138.08,133.23 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { 1392.03,3606.1,34.98,204.1 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { -2966.41,391.59,15.05,85.04 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { -3040.04,584.22,7.9,19.85 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { 1134.33,-983.09,46.4,277.8 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { 1165.26,2710.79,38.15,178.59 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { -1486.77,-377.56,40.15,133.23 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { -1221.42,-907.91,12.32,31.19 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament (Framework)
		Distance = 10,
		Coords = { 812.46,-781.18,26.17,269.3 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},

	{ -- Animal Park (Center)
		Distance = 15,
		Coords = { 562.29,2741.57,42.87,189.93 },
		Model = "a_f_y_eastsa_03",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cassino (Center)
		Distance = 25,
		Coords = { 1108.9,228.52,-49.44,181.42 },
		Model = "s_f_y_casino_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cassino (Center)
		Distance = 25,
		Coords = { 991.65,31.71,71.46,36.86 },
		Model = "s_f_y_casino_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cassino (Center)
		Distance = 25,
		Coords = { 990.41,30.06,71.46,87.88 },
		Model = "s_f_y_casino_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Concessionária (Center)
		Distance = 25,
		Coords = { -56.94,-1098.77,26.42,25.52 },
		Model = "ig_siemonyetarian",
		anim = { "amb@prop_human_bum_shopping_cart@male@base","base" }
	},
	{ -- Pharmacy Store (Center)
		Distance = 30,
		Coords = { -172.89,6381.32,31.48,223.94 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pharmacy Store (Center)
		Distance = 30,
		Coords = { 1690.07,3581.68,35.62,212.6 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pharmacy Store (Center)
		Distance = 15,
		Coords = { 326.5,-1074.43,29.47,0.0 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pharmacy Store (Center)
		Distance = 15,
		Coords = { 114.39,-4.85,67.82,204.1 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Premium (Center)
		Distance = 20,
		Coords = { -1083.15,-245.88,37.76,209.77 },
		Model = "ig_barry",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Prisão (Center)
		Distance = 100,
		Coords = { 1818.73,2596.25,45.7,141.74 },
		Model = "s_m_m_prisguard_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Properties (Center)
	    Distance = 100,
		Coords = { 1655.27,4874.31,42.04,280.63 },
		Model = "mp_f_boatstaff_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Properties (Center)
	    Distance = 100,
		Coords = { -308.09,-163.93,40.42,238.12 },
		Model = "mp_f_boatstaff_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Townhall (Center)
		Distance = 30,
		Coords = { -542.87,-198.35,38.23,65.2 },
		Model = "ig_barry",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Townhall (Center)
		Distance = 30,
		Coords = { -551.27,-203.09,38.23,343.0 },
		Model = "ig_barry",
		anim = { "anim@heists@prison_heistig1_p1_guard_checks_bus","loop" }
	},

	{ -- Barman (Ilegal)
		Distance = 15,
		Coords = { 2194.73,5581.52,53.36,184.26 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a","idle_a_bartender" }
	},
	{ -- Barman (Ilegal)
		Distance = 15,
		Coords = { 1420.99,6336.16,23.32,269.3 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a","idle_a_bartender" }
	},
	{ -- Barman (Ilegal)
		Distance = 15,
		Coords = { 336.64,-1989.09,24.2,48.19 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a","idle_a_bartender" }
	},
	{ -- Barman (Ilegal)
		Distance = 15,
		Coords = { -157.19,-1611.54,33.65,249.45 },
		Model = "u_f_y_bikerchic",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a","idle_a_bartender" }
	},
	{ -- Barman (Ilegal)
		Distance = 15,
		Coords = { 987.83,-95.28,74.85,223.94 },
		Model = "g_f_y_lost_01",
		anim = { "anim@amb@clubhouse@bar@drink@idle_a","idle_a_bartender" }
	},
	{ -- Lester (Ilegal)
		Distance = 10,
		Coords = { 1272.26,-1711.54,54.76,34.02 },
		Model = "ig_lestercrest",
		anim = { "anim@heists@prison_heiststation@cop_reactions","cop_b_idle" }
	},
	{ -- Ilegal
		Distance = 100,
		Coords = { 487.56,-1456.11,29.28,272.13 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal
		Distance = 100,
		Coords = { 154.66,-1472.9,29.35,325.99 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal
		Distance = 100,
		Coords = { -653.36,-1502.26,5.24,215.44 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal
		Distance = 100,
		Coords = { 389.69,-942.1,29.42,175.75 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Criminal (Ilegal)
		Distance = 100,
		Coords = { -195.15,3651.33,51.73,334.49 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Criminal (Ilegal)
		Distance = 100,
		Coords = { 904.34,3656.56,32.57,274.97 },
		Model = "g_m_y_ballaeast_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Criminal (Ilegal)
		Distance = 100,
		Coords = { 2450.88,3759.53,41.7,334.49 },
		Model = "g_m_y_ballasout_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Criminal (Ilegal)
		Distance = 100,
		Coords = { 1901.86,4925.07,48.86,153.08 },
		Model = "g_m_y_famca_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Danger (Ilegal)
		Distance = 100,
		Coords = { 1045.13,-2510.32,28.46,0.0 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Informations (Ilegal)
		Distance = 100,
		Coords = { -95.09,-2767.85,6.08,93.55 },
		Model = "ig_beverly",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},

	{ -- Chiliad (Routes)
		Distance = 10,
		Coords = { 1388.83,-2088.54,52.6,39.69 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Families (Routes)
		Distance = 10,
		Coords = { -147.85,-1605.83,35.03 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Highways (Routes)
		Distance = 10,
		Coords = { 1426.74,6326.66,23.86,0.0 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Vagos (Routes)
		Distance = 10,
		Coords = { 330.07,-2014.33,22.39,277.8 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Barragem (Routes)
		Distance = 10,
		Coords = { 1313.29,-143.11,115.76,266.46 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Farol (Routes)
		Distance = 10,
		Coords = { 3235.61,5115.88,15.82,113.39 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Parque (Routes)
		Distance = 10,
		Coords = { 412.21,732.51,199.45,232.45 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Sandy (Routes)
		Distance = 10,
		Coords = { 2136.72,3982.87,34.32,308.98 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Petróleo (Routes)
		Distance = 10,
		Coords = { 1458.41,-2437.19,66.12,354.34 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Praia-1 (Routes)
		Distance = 10,
		Coords = { -3098.8,1428.45,27.01,45.36 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Praia-2 (Routes)
		Distance = 10,
		Coords = { -3102.03,1679.39,37.68,212.6 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Zancudo (Routes)
		Distance = 10,
		Coords = { -627.44,2204.64,126.14,229.61 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Madrazzo (Routes)
		Distance = 10,
		Coords = { 1393.4,1141.01,109.74,178.59 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Playboy (Routes)
		Distance = 10,
		Coords = { -1518.71,74.75,56.92,99.22 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- TheSouth (Routes)
		Distance = 10,
		Coords = { 983.71,-90.85,74.85,218.27 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Vineyard (Routes)
		Distance = 10,
		Coords = { -1865.69,2062.96,135.44,79.38 },
		Model = "g_m_y_ballaorig_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},

	{ -- DigitalDen (Market)
		Distance = 25,
		Coords = { -1232.05,-1439.69,4.36,218.27 },
		Model = "a_m_y_business_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Brewery (Market)
		Distance = 25,
		Coords = { -1225.06,-1439.93,4.36,121.89 },
		Model = "a_f_y_business_04",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cool Beans (Market)
		Distance = 25,
		Coords = { -1215.81,-1468.6,4.36,306.15 },
		Model = "a_f_m_ktown_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Masquerade (Market)
		Distance = 25,
		Coords = { -1219.72,-1431.09,4.36,221.11 },
		Model = "u_m_m_streetart_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pop's Pills (Market)
		Distance = 25,
		Coords = { -1195.99,-1458.47,4.38,34.02 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pop's Pills (Market)
		Distance = 25,
		Coords = { -1198.76,-1460.3,4.36,36.86 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- PRO Bikes (Market)
		Distance = 25,
		Coords = { -1225.04,-1434.83,4.36,221.11 },
		Model = "a_m_y_cyclist_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Truthorganic (Market)
		Distance = 25,
		Coords = { -1206.44,-1460.05,4.36,308.98 },
		Model = "s_m_m_cntrybar_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- LD Organies (Market)
		Distance = 25,
		Coords = { -1211.01,-1464.93,4.36,308.98 },
		Model = "ig_lamardavis",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},

	{ -- Bus (Works)
		Distance = 50,
		Coords = { 453.47,-602.34,28.59,266.46 },
		Model = "a_m_y_business_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cemitery (Works)
		Distance = 100,
		Coords = { -1745.92,-204.83,57.39,320.32 },
		Model = "g_m_m_armboss_01",
		anim = { "timetable@trevor@smoking_meth@base","base" }
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2440.58,4736.35,34.29,317.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2432.5,4744.58,34.31,317.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2424.47,4752.37,34.31,317.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2416.28,4760.8,34.31,317.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2408.6,4768.88,34.31,317.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2400.32,4777.48,34.53,317.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2432.46,4802.66,34.83,137.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2440.62,4794.22,34.66,137.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2448.65,4786.57,34.64,137.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2456.88,4778.08,34.49,137.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2464.53,4770.04,34.37,137.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2473.38,4760.98,34.31,137.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2495.03,4762.77,34.37,137.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2503.13,4754.08,34.31,137.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2511.34,4746.04,34.31,137.50 },
		Model = "a_c_cow"
	},
	{ -- Cow (Works)
		Distance = 100,
		Coords = { 2519.56,4737.35,34.29,137.50 },
		Model = "a_c_cow"
	},
	{ -- Fishing (Works)
		Distance = 30,
		Coords = { -1592.47,-1005.24,13.02,229.61 },
		Model = "a_f_y_eastsa_03",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Hunting (Works)
		Distance = 10,
		Coords = { -679.13,5839.52,17.32,226.78 },
		Model = "ig_hunter",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Hunting (Works)
		Distance = 50,
		Coords = { -1593.08,5202.9,4.31,297.64 },
		Model = "a_m_o_ktown_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Impound (Works)
		Distance = 30,
		Coords = { -193.23,-1162.39,23.67,274.97 },
		Model = "g_m_m_armboss_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Impound (Works)
		Distance = 100,
		Coords = { -273.96,6121.63,31.41,130.4 },
		Model = "g_m_m_armboss_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Impound (Works)
		Distance = 100,
		Coords = { 1737.95,3709.1,34.14,19.85 },
		Model = "g_m_m_armboss_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Jewelry (Works)
		Distance = 15,
		Coords = { -628.79,-238.7,38.05,311.82 },
		Model = "cs_gurk",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Lumberman (Works)
		Distance = 50,
		Coords = { 1961.61,5179.26,47.94,277.8 },
		Model = "a_m_o_ktown_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},	
	{ -- Recycling (Works)
		Distance = 50,
		Coords = { -428.54,-1728.29,19.78,70.87 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Recycling (Works)
		Distance = 50,
		Coords = { 180.07,2793.29,45.65,283.47 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Recycling (Works)
		Distance = 50,
		Coords = { -195.42,6264.62,31.49,42.52 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Transporter (Works)
		Distance = 20,
		Coords = { 264.74,219.99,101.67,343.0 },
		Model = "ig_casey",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Trash (Works)
		Distance = 50,
		Coords = { 82.98,-1553.55,29.59,51.03 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Trash (Works)
		Distance = 50,
		Coords = { 287.77,2843.9,44.7,121.89 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Trash (Works)
		Distance = 50,
		Coords = { -413.97,6171.58,31.48,320.32 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Trucker (Works)
		Distance = 100,
		Coords = { 1239.87,-3257.2,7.09,274.97 },
		Model = "s_m_m_trucker_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Trucker (Works)
		Distance = 100,
		Coords = { 474.78,-1318.27,29.2,300.48 },
		Model = "s_m_m_trucker_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADLIST
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)

		for Number = 1,#List do
			local Distance = #(Coords - vec3(List[Number]["Coords"][1],List[Number]["Coords"][2],List[Number]["Coords"][3]))
			if Distance <= List[Number]["Distance"] then
				if not localPeds[Number] then
					if LoadModel(List[Number]["Model"]) then
						localPeds[Number] = CreatePed(4,List[Number]["Model"],List[Number]["Coords"][1],List[Number]["Coords"][2],List[Number]["Coords"][3] - 1,List[Number]["Coords"][4],false,false)
						SetPedArmour(localPeds[Number],100)
						SetEntityInvincible(localPeds[Number],true)
						FreezeEntityPosition(localPeds[Number],true)
						SetBlockingOfNonTemporaryEvents(localPeds[Number],true)

						SetModelAsNoLongerNeeded(List[Number]["Model"])

						if List[Number]["Model"] == "s_f_y_casino_01" then
							SetPedDefaultComponentVariation(localPeds[Number])
							SetPedComponentVariation(localPeds[Number],0,3,0,0)
							SetPedComponentVariation(localPeds[Number],1,0,0,0)
							SetPedComponentVariation(localPeds[Number],2,3,0,0)
							SetPedComponentVariation(localPeds[Number],3,0,1,0)
							SetPedComponentVariation(localPeds[Number],4,1,0,0)
							SetPedComponentVariation(localPeds[Number],6,1,0,0)
							SetPedComponentVariation(localPeds[Number],7,1,0,0)
							SetPedComponentVariation(localPeds[Number],8,0,0,0)
							SetPedComponentVariation(localPeds[Number],10,0,0,0)
							SetPedComponentVariation(localPeds[Number],11,0,0,0)
							SetPedPropIndex(localPeds[Number],1,0,0,false)
						end

						if List[Number]["anim"] ~= nil then
							if LoadAnim(List[Number]["anim"][1]) then
								TaskPlayAnim(localPeds[Number],List[Number]["anim"][1],List[Number]["anim"][2],4.0,4.0,-1,1,0,0,0,0)
							end
						end
					end
				end
			else
				if localPeds[Number] then
					if DoesEntityExist(localPeds[Number]) then
						DeleteEntity(localPeds[Number])
					end

					localPeds[Number] = nil
				end
			end
		end

		Wait(1000)
	end
end)