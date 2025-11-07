local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Hyperion",
   Icon = 0,
   LoadingTitle = "Hyperion External",
   LoadingSubtitle = "By Xdblaze",
   ShowText = "Hyperion",
   Theme = "Default",

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Hyperion",
      FileName = "Settings"
   },

   Discord = {
      Enabled = true,
      Invite = "TPWvr56gZz",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No Method Of Obtaining The Key Is Provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"XD"}
   }
})

local Tab = Window:CreateTab("Execute", "code")

local sourcecode = ""
local Input = Tab:CreateInput({
   Name = "Source",
   CurrentValue = "print('Hello World!')",
   PlaceholderText = "",
   RemoveTextAfterFocusLost = false,
   Flag = "Source",
   Callback = function(Text)
       sourcecode = Text
   end,
})

local Button = Tab:CreateButton({
   Name = "Execute",
   Callback = function()
       if sourcecode and sourcecode ~= "" then
           local success, result = pcall(function()
               return loadstring(sourcecode, "execute")()
           end)
           
           if not success then
               Rayfield:Notify({
                   Title = "Execution Error",
                   Content = result,
                   Duration = 6.5,
                   Image = 0
               })
           end
       else
           Rayfield:Notify({
               Title = "Error",
               Content = "No Code To Execute!",
               Duration = 3,
               Image = 0
           })
       end
   end,
})
