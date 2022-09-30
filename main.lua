local re = ""
local c = game.Lighting
local fname = game.PlaceId..".rbxlx"
a = tick()
rconsoleprint("Started!\n")
writefile(fname,'<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4"><Item class="Lighting"><Properties><Color3 name="Ambient"><R>'..c.Ambient.R..'</R><G>'..c.Ambient.G..'</G><B>'..c.Ambient.B..'</B></Color3><Color3 name="ColorShift_Bottom"><R>'..c.ColorShift_Bottom.R..'</R><G>'..c.ColorShift_Bottom.G..'</G><B>'..c.ColorShift_Bottom.B..'</B></Color3><Color3 name="ColorShift_Top"><R>'..c.ColorShift_Top.R..'</R><G>'..c.ColorShift_Top.G..'</G><B>'..c.ColorShift_Top.B..'</B></Color3><Color3 name="FogColor"><R>'..c.FogColor.R..'</R><G>'..c.FogColor.G..'</G><B>'..c.FogColor.B..'</B></Color3><Color3 name="OutdoorAmbient"><R>'..c.OutdoorAmbient.R..'</R><G>'..c.OutdoorAmbient.G..'</G><B>'..c.OutdoorAmbient.B..'</B></Color3><float name="FogEnd">'..c.FogEnd..'</float><float name="FogStart">'..c.FogStart..'</float><float name="GeographicLatitude">'..c.GeographicLatitude..'</float><bool name="GlobalShadows">'..tostring(c.GlobalShadows)..'</bool><float name="Brightness">'..c.Brightness..'</float><float name="EnvironmentDiffuseScale">'..c.EnvironmentDiffuseScale..'</float><float name="EnvironmentSpecularScale">'..c.EnvironmentSpecularScale..'</float><float name="ExposureCompensation">'..c.ExposureCompensation..'</float><bool name="Outlines">'..tostring(c.Outlines)..'</bool><float name="ShadowSoftness">'..c.ShadowSoftness..'</float><string name="TimeOfDay">'..c.TimeOfDay..'</string></Properties>')
valid = {
        ["Atmosphere"] = function(d)
            return "<float name=\"Density\">"..d.Density.."</float><float name=\"Offset\">"..d.Offset.."</float><Color3 name=\"Color\"><R>".. d.Color.R/255 .."</R><G>".. d.Color.G/255 .."</G><B>".. d.Color.B/255 .."</B></Color3><Color3 name=\"Decay\"><R>".. d.Decay.R/255 .."</R><G>".. d.Decay.G/255 .."</G><B>".. d.Decay.B/255 .."</B></Color3><float name=\"Glare\">"..d.Glare.."</float><float name=\"Haze\">"..d.Haze.."</float>"
        end,
        ["Sky"] = function(d)
            return '<float name="MoonAngularSize">'..d.MoonAngularSize..'</float><bool name="CelestialBodiesShown">'..tostring(d.CelestialBodiesShown)..'</bool><int name="StarCount">'..d.StarCount..'</int><float name="SunAngularSize">'..d.SunAngularSize..'</float><Content name="SkyboxBk"><url>'..d.SkyboxBk..'</url></Content><Content name="SkyboxDn"><url>'..d.SkyboxDn..'</url></Content><Content name="SkyboxFt"><url>'..d.SkyboxFt..'</url></Content><Content name="SkyboxLf"><url>'..d.SkyboxLf..'</url></Content><Content name="SkyboxRt"><url>'..d.SkyboxRt..'</url></Content><Content name="SkyboxUp"><url>'..d.SkyboxUp..'</url></Content><Content name="SunTextureId"><url>'..d.SunTextureId..'</url></Content>'
        end,
        ["BloomEffect"] = function(d)
            return '<float name="Intensity">'..d.Intensity..'</float><float name="Size">'..d.Size..'</float><float name="Threshold">'..d.Threshold..'</float>'
        end, 
        ["BlurEffect"] = function(d)
            return '<float name="Size">'..d.Size..'</float>'
        end, 
        ["ColorCorrectionEffect"] = function(d)
            return '<float name="Brightness">'..d.Brightness..'</float><float name="Contrast">'..d.Contrast..'</float><float name="Saturation">'..d.Saturation..'</float><Color3 name="TintColor"><R>'..d.TintColor.R/255 ..'</R><G>'..d.TintColor.R/255 ..'</G><B>'..d.TintColor.R/255 ..'</B></Color3>'
        end, 
        ["DepthOfFieldEffect"] = function(d)
            return '<float name="FarIntensity">'..d.FarIntensity..'</float><float name="FocusDistance">'..d.FocusDistance..'</float><float name="InFocusRadius">'..d.InFocusRadius..'</float><float name="NearIntensity">'..d.NearIntensity..'</float>'
        end,
        ["SunRaysEffect"] = function(d)
            return '<float name="Intensity">'..d.Intensity..'</float><float name="Spread">'..d.Spread..'</float>'
        end}
for i,v in next, game.Lighting:GetDescendants() do
    if valid[v.ClassName] ~= nil then
        appendfile(fname,'<Item class="'..v.ClassName..'"><Properties>'.. valid[v.ClassName](v) ..'</Properties></Item>')
    end
end
appendfile(fname,"</Item></roblox>")
rconsoleprint("Finished in "..tick()-a.." seconds!\n")
rconsoleprint("saved to "..fname)
