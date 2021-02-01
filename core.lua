local addonName, ST = ...
local addon = LibStub("AceAddon-3.0"):NewAddon(ST, addonName, "AceConsole-3.0", "AceEvent-3.0", "AceComm-3.0", "AceHook-3.0", "AceSerializer-3.0")
_G.ST = ST

ST._ChatString = "[ST]:"

-- DROPDOWN WITH LIST OF ALL PACKAGES
local function OnPackageDropdownSelect(self, arg1, arg2, checked)
	ST.currBuffPackage = arg1
	UIDropDownMenu_SetText(_G["ST_PackageDropdown"], ST.currBuffPackage)
end

function CreatePackageDropdown(dropdown, level, menuList)
	local info = UIDropDownMenu_CreateInfo()
	for buffPackageName,_ in ST:pairsByKeys(ST.buffPackages) do
		local selected = (buffPackageName == ST.currBuffPackage)
		info.func = OnPackageDropdownSelect
		info.text, info.arg1, info.checked = buffPackageName, buffPackageName, selected
		UIDropDownMenu_AddButton(info)
	end
	UIDropDownMenu_SetText(dropdown, ST.currBuffPackage)
	UIDropDownMenu_JustifyText(dropdown, "LEFT")
end

-- Called when the addon is loaded
function ST:OnInitialize()
	-- TODO Maybe setup options here?
	UIDropDownMenu_Initialize(_G["ST_PackageDropdown"], CreatePackageDropdown)

	-- Add console command listener
	self:RegisterChatCommand("st", "processConsoleCommand")
end

function ST:processConsoleCommand(cmd)
	cmd = cmd:lower()
	if cmd == "" then -- Toggle visibility
		ST_MainFrame:SetShown(not ST_MainFrame:IsVisible())
	elseif cmd == "show" then
		ST_MainFrame:Show()
	elseif cmd == "hide" then
		ST_MainFrame:Hide()
	elseif cmd == "print" then
		ST:printConsumableOverview(ST.currBuffPackage)
	else
		ST:Print("") -- Print just our addon name first
		print("prefix: /st - shows/hides main frame")
		print(" - show - shows the main frame")
		print(" - hide - hide the main frame")
		print(" - print - print a summary of the required buffs in the current buff package")
	end
end