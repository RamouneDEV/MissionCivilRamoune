Config = {

    drawDistance = 15.0,
    itrDistance = 1.5,

    pedModel = "u_m_m_vince",

    PositionPedInteraction = {
        {x = -8.5074415206909, y = -1080.0323486328, z = 26.047241210938, h = 152.30212402344},
    }, 


    PosiblesMission = {
        {label = "Livraison véhicule standard", price = 5000, modelVehicle = "sultan", spawn = {x = -13.372365951538, y = -1090.2810058594, z = 27.04310798645, h = 160.91539001465}, positionGPS = vector3(125.30093383789, 6389.1684570313, 29.233274459839), modelVehicleFinish = "faggio"},
        {label = "Livraison véhicule de moderne", price = 10000, modelVehicle = "sultanrs", spawn = {x = -13.372365951538, y = -1090.2810058594, z = 27.04310798645, h = 160.91539001465}, positionGPS = vector3(125.30093383789, 6389.1684570313, 29.233274459839), modelVehicleFinish = "sanchez"},
        {label = "Livraison véhicule de luxe", price = 15000, modelVehicle = "adder", spawn = {x = -13.372365951538, y = -1090.2810058594, z = 27.04310798645, h = 160.91539001465}, positionGPS = vector3(125.30093383789, 6389.1684570313, 29.233274459839), modelVehicleFinish = "panto"},
    },


    Notification = {
        ShowHelpNotificationFinish = "Appuyez sur ~INPUT_CONTEXT~ pour terminer la mission",
        ShowHelpNotification = "Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu des missions",
        ShowNotificationFinish = "Vous avez terminé la mission voilà un véhicule pour rentrer chez vous",
    },

    AdvancedNotification = {
        ["debutMission"] = {
            title = "Mission",
            subject = "Vous avez accepté la mission",
            msg = "Vous devez vous rendre au point indiqué sur votre GPS",
            icon = "CHAR_LESTER_DEATHWISH",
        },
        ["finMission"] = {
            title = "Mission",
            subject = "Vous avez terminé la mission",
            msg = "Vous avez gagné ~g~",
            icon = "CHAR_LESTER_DEATHWISH",
        },
        ["wrongVehicle"] = {
            title = "Mission",
            subject = "Vous n'avez pas le bon véhicule",
            msg = "Vous devez vous rendre au point indiqué sur votre GPS",
            icon = "CHAR_LESTER_DEATHWISH",
        },
    },


    Blip = {
        -- Blip ped interaction
        BlipName = "[Intérimaire] Mission civile",
        Sprite = 466,
        Color = 1,
        ScaleBlip = 0.8,
        -- Blip GPS Mission
        BlipNameGPS = "[Intérimaire] Livraison",
        SpriteGPS = 227,
        ColorGPS = 5,
        ScaleBlipGPS = 0.8,
        BlipAlpha = 200,
    }
}