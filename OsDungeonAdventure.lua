-- O's Dungeon Adventure (ODA) game
local frameSize = 500 -- ODAframe dimensions
local cellSize = 30 -- For size of each grid cell
local gridRows = math.floor(frameSize / cellSize)
local gridCols = math.floor(frameSize / cellSize)

-- Maps
local mapData = {}
for row = 1, gridRows do
    mapData[row] = {}
    for col = 1, gridCols do
        if row == 1 or row == gridRows or col == 1 or col == gridCols then
            mapData[row][col] = "+" -- Represents walls at the border
        else
            mapData[row][col] = " " -- Empty space
        end
    end
end

-- Grid for the entire map
local function createGrid(ODAframe)
    ODAframe.grid = {}

    for row = 1, gridRows do
        ODAframe.grid[row] = {}
        for col = 1, gridCols do
            local text = ODAframe:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            text:SetPoint("TOPLEFT", ODAframe, "TOPLEFT", (col - 1) * cellSize + 10, - ((row - 1) * cellSize + 30))
            text:SetText(mapData[row][col])
            ODAFrame.grid[row][col] = text
        end
    end
end

local function updateGrid()
    for row = 1, #mapData do
        for col = 1, #mapData[row] do
            ODAframe.grid[row][col]:SetText(mapData[row][col])
        end
    end
end

local function createODABox()
    -- Create the frame
    local ODAframe = CreateFrame("Frame", "ODAFrame", UIParent, "BasicFrameTemplateWithInset")
    ODAframe:SetSize(500, 500)
    ODAframe:SetPoint("CENTER")

    -- Title
    ODAframe.title = ODAframe:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    ODAframe.title:SetPoint("TOP", ODAframe, "TOP", 0, -5)
    ODAframe.title:SetText("O's Dungeon Adventure")

    createGrid(ODAframe)

    ODAframe:Show()
end


        
-- Player actions
mapData[math.floor(gridRows / 2)][math.floor(gridCols / 2)] = "O" -- Starting Position (row, column)
local function playerODA()
    -- Future player movement and attacks
end

-- Enemy actions
local function formidableX()
    -- Future enemy movement and attacks
end

-- Slash commands
SLASH_ODA1 = "/oda"
SlashCmdList["ODA"] = function()
    createODABox()
end
