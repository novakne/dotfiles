-- Theme: wht
-- Author: Novakane
-- License: MIT


local wht = {}


local colors = {
  base00 = '#fbf9ff',
  base01 = '#f6f4ff',
  base02 = '#f0eefb',
  base03 = '#e3e1ed',
  base04 = '#c0beca',
  base05 = '#a19fab',
  base06 = '#787681',
  base07 = '#64626d',
  base08 = '#44434d',
  base09 = '#23222b',

  color00 = '#bb397c',
  color01 = '#873fb5',
  color02 = '#3969bb',
}


-- [ Highlighting function ]
local highlight = function(group, color)
  local guifg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
  local guibg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
  local attr = color.attr and 'gui=' .. color.attr or 'gui=NONE'
  local sp = color.sp and 'guisp=' .. color.sp or ''
  local cmd = ('highlight! %s %s %s %s %s'):format(group, guifg, guibg, attr, sp)

  vim.cmd(cmd)

end


-- [ Syntax groups ]
wht.set_syntax = function()
  local syntax = {


    -- ------------------------------------------
    -- [ UI COMPONENTS ]
    -- ------------------------------------------
    -- ( :so $VIMRUNTIME/syntax/hitest.vim )


    -- [ Attributes ]
    Bold = {attr = 'bold'},
    Italic = {attr = 'italic'},
    Underline = {attr = 'underline'},

    -- [ Editor ]
    ColorColumn = {fg = colors.base01},
    Cursor = {fg = colors.base00, bg = colors.base07},
    CursorLine = {bg = colors.base03},
    Error = {fg = colors.color00, bg = colors.base00},
    iCursor = {fg = colors.base00, bg = colors.base07},
    LineNr = {fg = colors.base04, bg = colors.base00},
    MatchParen = {fg = colors.base06, bg = colors.base03},
    NonText = {fg = colors.base03},
    Normal = {fg = colors.base09, bg = colors.base00},
    PMenu = {fg = colors.base07, bg = colors.base01},
    PmenuSbar = {fg = colors.base08, bg = colors.base02},
    PMenuSel = {fg = colors.base01, bg = colors.color02},
    PmenuThumb = {fg = colors.color02, bg = colors.base02},
    RedrawDebugNormal = {fg = colors.base00, bg = colors.base09},
    RedrawDebugClear = {fg = colors.base00, bg = colors.color02},
    RedrawDebugComposed = {fg = colors.base00, bg = colors.color01},
    RedrawDebugRecompose = {fg = colors.base00, bg = colors.color00},
    SpecialKey = {fg = colors.base04},
    SpellBad = {
      fg = colors.color00,
      bg = colors.base00,
      attr = 'undercurl',
      sp = colors.color00,
    },
    SpellCap = {
      fg = colors.color00,
      bg = colors.base00,
      attr = 'undercurl',
      sp = colors.color00,
    },
    SpellLocal = {
      fg = colors.color00,
      bg = colors.base00,
      attr = 'undercurl',
      sp = colors.color00,
    },
    SpellRare = {
      fg = colors.color00,
      bg = colors.base00,
      attr = 'undercurl',
      sp = colors.color00,
    },
    Visual = {fg = colors.base07, bg = colors.base02, attr = 'bold'},
    VisualNOS = {fg = colors.base05},

    -- [ Neovim support ]
    NvimInternalError = {fg = colors.base00, bg = colors.color00},
    healthError = {fg = colors.color00, bg = colors.base00},
    healthSuccess = {fg = colors.base09, bg = colors.base00},
    healthWarning = {fg = colors.color01, bg = colors.base00},
    TermCursorNC = {fg = colors.base01},

    -- [ Gutter ]
    CursorColumn = {fg = colors.base03},
    CursorLineNr = {fg = colors.base07, bg = colors.base00},
    Folded = {fg = colors.base05, bg = colors.base01, attr = 'bold'},
    FoldColumn = {fg = colors.base04, bg = colors.base00},
    SignColumn = {fg = colors.base04, bg = colors.base00},

    -- [ Navigation ]
    Directory = {fg = colors.base07, attr = 'bold'},

    -- [ Prompt / Status ]
    EndOfBuffer = {fg = colors.base01},
    ErrorMsg = {fg = colors.base00, bg = colors.color00},
    ModeMsg = {fg = colors.base06},
    MoreMsg = {fg = colors.base06},
    Question = {fg = colors.base06},
    StatusLine = {fg = colors.base07, bg = colors.base01},
    StatusLineNC = {fg = colors.base06, bg = colors.base01},
    StatusLineTerm = {fg = colors.base07, bg = colors.base01},
    StatusLineTermNC = {fg = colors.base06, bg = colors.base01},
    WarningMsg = {fg = colors.base00, bg = colors.color01},
    WildMenu = {fg = colors.color01, bg = colors.base01},

    -- [ Search ]
    IncSearch = {fg = colors.base00, bg = colors.color01, attr = 'underline'},
    Search = {fg = colors.base00, bg = colors.color02},

    -- [ Tabs ]
    TabLine = {fg = colors.base06, bg = colors.base01},
    TabLineFill = {fg = colors.base06, bg = colors.base01},
    TabLineSel = {fg = colors.base00, bg = colors.color02},

    -- [ Window ]
    Title = {fg = colors.base06},
    VertSplit = {fg = colors.base01, bg = colors.base00},

    -- [ Diff ]
    DiffAdd = {fg = colors.base07, bg = colors.base00, attr = 'inverse'},
    DiffChange = {fg = colors.base07, bg = colors.base00, attr = 'inverse'},
    DiffDelete = {fg = colors.color00, bg = colors.base00, attr = 'inverse'},
    DiffText = {fg = colors.base07, bg = colors.base00, attr = 'inverse'},
    -- Legacy groups for official git.vim and diff.vim syntax
    diffAdded = {fg = colors.base07, bg = colors.base00, attr = 'inverse'},
    diffChanged = {fg = colors.base07, bg = colors.base00, attr = 'inverse'},
    diffRemoved = {fg = colors.color00, bg = colors.base00, attr = 'inverse'},

    -- [ Quickfix / Location list ]
    qfLineNr = {fg = colors.base07},

    -- [ Neovim lsp ]
    LspDiagnosticsDefaultError = {fg = colors.color00},
    LspDiagnosticsDefaultWarning = {fg = colors.color01},
    LspDiagnosticsDefaultInformation = {fg = colors.base07},
    LspDiagnosticsDefaultHint = {fg = colors.base07},
    LspDiagnosticsUnderlineError = {fg = colors.color00},
    LspDiagnosticsUnderlineWarning = {fg = colors.color01},
    LspDiagnosticsUnderlineInformation = {fg = colors.base07},
    LspDiagnosticsUnderlineHint = {fg = colors.base07},
    LspDiagErrorBorder = {fg = colors.color00},
    LspDiagWarnBorder = {fg = colors.color02},
    LspDiagInforBorder = {fg = colors.base07},
    LspDiagHintBorder = {fg = colors.base07},


    -- -------------------------------------------
    -- [ LANGUAGE wht.BASE GROUPS ]
    -- -------------------------------------------
    -- ( :help w18 )


    Comment = {fg = colors.base05, attr = 'italic'},

    Constant = {fg = colors.color00},
    String = {fg = colors.base06, attr = 'italic'},
    Character = {fg = colors.base07, attr = 'bold'},
    Number = {fg = colors.base06},
    Boolean = {fg = colors.base06, attr = 'bold'},
    Float = {fg = colors.base06, attr = 'italic'},

    Identifier = {fg = colors.base07},
    Function = {fg = colors.color01},

    Statement = {fg = colors.base08},
    Conditional = {fg = colors.color02},
    Repeat = {fg = colors.color02},
    Label = {fg = colors.color01},
    Operator = {fg = colors.color02},
    Keyword = {fg = colors.color01},
    Exception = {fg = colors.color00},

    PreProc = {fg = colors.base05},
    Include = {fg = colors.base05},
    Define = {fg = colors.base05},
    Macro = {fg = colors.base05},
    PreCondit = {fg = colors.base05},

    Type = {fg = colors.base07, atrr = 'bold'},
    StorageClass = {fg = colors.base06},
    Structure = {fg = colors.base09, attr = 'bold'},
    Typedef = {fg = colors.base09},

    Special = {fg = colors.base05},
    SpecialChar = {fg = colors.base05},
    Tag = {fg = colors.base05},
    Delimiter = {fg = colors.base05},
    SpecialComment = {fg = colors.base02, attr = 'italic'},
    Todo = {fg = colors.base04, attr = 'underline'},


    -- ------------------------------------------
    -- [ LANGUAGES SPECIFIC ]
    -- ------------------------------------------


--     -- [ C ]
--     cDefine = {fg = colors.color02},

--     -- [ Css ]
--     cssAttributeSelector = {fg = colors.color02},
--     cssBackgroundAttr = {fg = colors.color00},
--     cssBackgroundProp = {fg = colors.color00},
--     cssBorderAttr = {fg = colors.color00},
--     cssBorderProp = {fg = colors.color00},
--     cssBoxAttr = {fg = colors.color00},
--     cssBoxProp = {fg = colors.color00},
--     cssClassName = {fg = colors.color02},
--     cssClassNameDot = {fg = colors.color02},
--     cssColor = {fg = colors.base07},
--     cssFontAttr = {fg = colors.color00},
--     cssFontProp = {fg = colors.color00},
--     cssIdentifier = {fg = colors.color02},
--     cssMediaType = {fg = colors.color00},
--     cssPositioningAttr = {fg = colors.color00},
--     cssPositioningProp = {fg = colors.color00},
--     cssPseudoClassId = {fg = colors.color02},
--     cssSelectorOp = {fg = colors.color02},
--     cssSelectorOp2 = {fg = colors.color01},
--     cssTagName = {fg = colors.color02},
--     cssTextAttr = {fg = colors.color00},
--     cssTextProp = {fg = colors.color00},
--     cssURL = {fg = colors.base07, attr = 'underline'},

--     -- [ Fennel ]
--     -- ( https://github.com/bakpakin/fennel.vim )
--     FennelSpecialForm = {fg = colors.color00},
--     FennelSymbol = {fg = colors.color00},

--     -- [ Go ]
--     goBuiltins = {fg = colors.color02},
--     goDeclType = {fg = colors.color00},
--     goVar = {fg = colors.color00},
--     goVarArgs = {fg = colors.color01},

--     -- [ Html ]
--     htmlArg = {fg = colors.color01},
--     htmlBold = {fg = colors.base07, attr = 'bold'},
--     htmlEndTag = {fg = colors.color02},
--     htmlH1 = {fg = colors.color00},
--     htmlH2 = {fg = colors.color00},
--     htmlH3 = {fg = colors.color00},
--     htmlH4 = {fg = colors.color00},
--     htmlH5 = {fg = colors.color00},
--     htmlH6 = {fg = colors.color00},
--     htmlItalic = {fg = colors.base07, attr = 'italic'},
--     htmlLink = {fg = colors.base07, attr = 'underline'},
--     htmlTag = {fg = colors.color02},
--     htmlTagN = {fg = colors.color02},
--     htmlTagName = {fg = colors.color02},
--     htmlTitle = {fg = colors.base09, attr = 'bold'},

--     -- [ Java ]
--     javaCommentTitle = {fg = colors.base05, attr = 'italic'},
--     javaDocParam = {fg = colors.color02},
--     javaDocSeeTagParam = {fg = colors.color02},
--     javaDocTags = {fg = colors.color02, attr = 'bold'},

--     -- [ Javascript ]
--     -- ( http//github.com/pangloss/vim-javascript )
--     jsArrowFunction = {fg = colors.color01},
--     jsFuncArgs = {fg = colors.color01, attr = 'italic'},
--     jsFuncCall = {fg = colors.color01},
--     jsObjectColon = {fg = colors.color02},
--     jsObjectKey = {fg = colors.color02},
--     jsObjectProp = {fg = colors.color02},
--     jsVariableDef = {fg = colors.base07, attr = 'italic'},

--     -- [ Json ]
--     jsonBraces = {fg = colors.color02},
--     jsonNull = {fg = colors.color00},

--     -- [ Less ]
--     --  ( http//github.com/groenewege/vim-less )
--     lessClassCall = {fg = colors.color01},
--     lessCssAttribute = {fg = colors.color01},
--     lessFunction = {fg = colors.color01},
--     lessVariable = {fg = colors.color02},
--     lessclass = {fg = colors.color02},
--     lessclassChar = {fg = colors.color02},

--     -- [ Lua ]
--     luaFuncCall = {fg = colors.color01},
--     luaSpecialValue = {fg = colors.color01},
--     luaBuiltIn = {fg = colors.color02},

--     -- [ Markdown ]
--     -- ( http//github.com/plasticboy/vim-markdown )
--     mkdBold = {fg = colors.base07, attr = 'bold'},
--     mkdCode = {fg = colors.color02},
--     mkdCodeDelimiter = {fg = colors.color02},
--     mkdCodeEnd = {fg = colors.color02},
--     mkdCodeStart = {fg = colors.color02},
--     mkdHeading = {fg = colors.color00},
--     mkdItalic = {fg = colors.base07, attr = 'italic'},
--     mkdLink = {fg = colors.base07, attr = 'underline'},
--     mkdListItem = {fg = colors.color00},
--     mkdListItemLine = {fg = colors.base06},

--     -- [ Nim ]
--     nimBuiltin = {fg = colors.color02},

--     -- [ Php ]
--     phpVarSelector = {fg = colors.color00},
--     phpIdentifier = {fg = colors.color00},

--     -- [ Python ]
--     pythonClassVar = {fg = colors.color02},
--     pythonBuiltinType = {fg = colors.color02},
--     pythonFunctionCall = {fg = colors.color01},
--     pythonStatement = {fg = colors.color02},

--     -- [ Rust ]
--     -- ( http//github.com/rust-lang/rust.vim )
--     rustArrowCharacter = {fg = colors.color01},
--     rustFatRightArrowHead = {fg = colors.color01},
--     rustFatRightArrowTail = {fg = colors.color01},
--     rustModPathSep = {fg = colors.base07, attr = 'bold'},
--     rustRepeat = {fg = colors.color02},
--     rustSelf = {fg = colors.color02},
--     rustStructure = {fg = colors.color00},


--     -- [ Scss ]
--     -- ( http//github.com/cakebaker/scss-syntax.vim )
--     scssSelectorName = {fg = colors.color02},
--     scssSelectorChar = {fg = colors.color02},
--     scssVariable = {fg = colors.color02},

--     -- [ Shell ]
--     shCaseBar = {fg = colors.color02},
--     shCmdParenRegion = {fg = colors.color01},
--     shDerefPPSleft = {fg = colors.color01},
--     shDerefPPSright = {fg = colors.color01},
--     shDerefSimple = {fg = colors.color00},
--     shDerefSpecial = {fg = colors.color00},
--     shDerefVar = {fg = colors.color00},
--     shDerefVarArray = {fg = colors.color00},
--     shFunctionKey = {fg = colors.color00},
--     shSet = {fg = colors.color00},
--     shSetList = {fg = colors.color00},
--     shVariable = {fg = colors.base07, attr = 'italic'},

--     -- [ Toml ]
--     tomlKey = {fg = colors.color02},
--     tomlTable = {fg = colors.color00},

--     -- [ Typescript ]
--     typescriptVariable = {fg = colors.color00},
--     typescriptOperator = {fg = colors.color02},
--     typescriptVariableDeclaration = {fg = colors.base07},

--     -- [ Vim ]
--     vimAugroupKey = {fg = colors.color00},
--     vimAutocmd = {fg = colors.color00},
--     vimCommand = {fg = colors.color02},
--     vimSubsPat = {fg = colors.color01},
--     vimSubsRep4 = {fg = colors.color01},
--     vimFuncName = {fg = colors.color01},
--     vimFunction = {fg = colors.color01},
--     vimLet = {fg = colors.color00},
--     vimNotFunc = {fg = colors.color02},
--     vimOption = {fg = colors.color02},
--     vimUserFunc = {fg = colors.color01},
--     vimVar = {fg = colors.color00},

--     -- [ Xml ]
--     xmlProcessingDelim = {fg = colors.color02},
--     xmlTag = {fg = colors.color02},
--     xmlTagName = {fg = colors.color02},

--     -- [ Yaml ]
--     yamlBlockMappingKey = {fg = colors.color02},
--     yamlFlowIndicator = {fg = colors.color02},
--     yamlFlowMappingKey = {fg = colors.color02},
--     yamlFlowMappingMerge = {fg = colors.color01},

--     -- [ Zig ]
--     zigBuiltinFn = {fg = colors.color02},
--     zigExecution = {fg = colors.color02},
--     zigKeyword = {fg = colors.color01},
--     zigVarDecl = {fg = colors.color00},

--     -- [ Zsh ]
--     zshDelimiter = {fg = colors.color02},
--     zshDeref = {fg = colors.color00},
--     zshOption = {fg = colors.color02},
--     zshShortDeref = {fg = colors.color02},
--     zshSubst = {fg = colors.color00},
--     zshSubstDelim = {fg = colors.color00},
--     zshVariableDef = {fg = colors.color00},


    -- -------------------------------------------
    -- [ PLUGIN SUPPORT ]
    -- -------------------------------------------


--     -- [ Hop ]
--     -- ( https://github.com/phaazon/hop.nvim )
--     HopNextKey = {fg = colors.color00},
--     HopNextKey1 = {fg = colors.color01},
--     HopNextKey2 = {fg = colors.color02},

--     -- [ Lspsaga ]
--     -- ( https://github.com/glepnir/lspsaga.nvim )
--     LineDiagTuncateLine = {fg = colors.base02},
--     LspFloatWinBorder = {fg = colors.color01},
--     LspLinesDiagBorder = {fg = colors.color00},
--     LspSagaAutoPreview = {fg = colors.color00},
--     LspSagaBorderTitle = {fg = colors.color00},
--     LspSagaCodeActionBorder = {fg = colors.color00},
--     LspSagaCodeActionContent = {fg = colors.base08},
--     LspSagaCodeActionTitle = {fg = colors.color00},
--     LspSagaCodeActionTruncateLine = {fg = colors.base02},
--     LspSagaDefPreviewBorder = {fg = colors.color02},
--     LspSagaDocTruncateLine = {fg = colors.base02},
--     LspSagaFinderSelection = {fg = colors.color02},
--     LspSagaHoverBorder = {fg = colors.color02},
--     LspSagaLspFinderBorder = {fg = colors.color02},
--     LspSagaRenameBorder = {fg = colors.color00},
--     LspSagaRenamePromptPrefix = {fg = colors.color00},
--     LspSagaShTruncateLine = {fg = colors.base02},
--     LspSagaSignatureHelpBorder= {fg = colors.color02},
--     ProviderTruncateLine = {fg = colors.base02},
--     SagaShadow = {fg = colors.base08, bg = colors.base00},


--     -- [ Signify ]
--     -- ( http//github.com/mhinz/vim-signify )
--     SignifyDeleteFirstLine = {fg = colors.color00},
--     SignifyLineAdd = {fg = colors.color02},
--     SignifyLineChange = {fg = colors.color01},
--     SignifyLineChangeDelete = {fg = colors.color01},
--     SignifyLineDelete = {fg = colors.color00},
--     SignifyLineDeleteFirstLine = {fg = colors.color00},
--     SignifySignAdd = {fg = colors.color02},
--     SignifySignChange = {fg = colors.color01},
--     SignifySignChangeDelete = {fg = colors.color01},
--     SignifySignDelete = {fg = colors.color00},

--     -- [ Telescope ]
--     -- ( https://github.com/nvim-telescope/telescope.nvim )
--     TelescopePreviewLine = {fg = colors.color02},
--     TelescopeSelection = {fg = colors.color01},
--     TelescopeSelectionCaret = {fg = colors.color00},

--     -- [ Treesitter ]
--     -- ( https://github.com/nvim-treesitter/nvim-treesitter )
--     TSConstBuiltin = {fg = colors.color02},
--     TSConstMacro = {fg = colors.color02},
--     TSConstant = {fg = colors.color00},
--     TSConstructor = {fg = colors.color00},
--     TSFuncBuiltin = {fg = colors.color02},
--     TSFuncMacro = {fg = colors.color02},
--     TSFunction = {fg = colors.color01},
--     TSInclude = {fg = colors.color02},
--     TSKeyword = {fg = colors.color01},
--     TSKeywordFunction = {fg = colors.color00},
--     TSKeywordOperator = {fg = colors.color02},
--     TSMethod = {fg = colors.color01},
--     TSParameter = {fg = colors.color01, attr = 'italic'},
--     TSParametcolor00eference = {fg = colors.color01, attr = 'italic'},
--     TSProperty = {fg = colors.color02, attr = 'italic'},
--     TSStringEscape = {fg = colors.color02, attr = 'italic'},
--     TSStringRegex = {fg = colors.color02, attr = 'italic'},
--     TSType = {fg = colors.color00},
--     TSTypeBuiltin = {fg = colors.color02},
--     TSVariable = {fg = colors.base07, attr = 'italic'},
--     TSVariableBuiltin = {fg = colors.base07, attr = 'bold'},

--     -- Nvim-ts-rainbow ( https://github.com/p00f/nvim-ts-rainbow )
--     rainbowcol1 = {fg = colors.color02},
--     rainbowcol2 = {fg = colors.color00},
--     rainbowcol3 = {fg = colors.color02},
--     rainbowcol4 = {fg = colors.color00},
--     rainbowcol5 = {fg = colors.color02},
--     rainbowcol6 = {fg = colors.color02},
--     rainbowcol7 = {fg = colors.color01},
--     -- Nvim-treesitter-refactor ( https://github.com/nvim-treesitter/nvim-treesitter-refactor )
--     TSCurrentScope = {bg = colors.base01},
--     TSDefinitionUsage = {fg = colors.color00, attr = 'italic'},
--     TSDefiniton = {fg = colors.base00, bg = colors.base09, attr = 'bold'},
--     -- Treesitter-playground ( https://github.com/nvim-treesitter/playground )
--     TSPlaygroundFocus = {fg = colors.base00, bg = colors.color00},

--     -- [ Which-key ]
--     -- ( https://github.com/liuchengxu/vim-which-key )
--     WhichKey = {fg = colors.color00},
--     WhichKeyDesc = {fg = colors.base09},
--     WhichKeyFloating = {bg = colors.base00},
--     WhichKeyGroup = {fg = colors.color01},
--     WhichKeyName = {fg = colors.base08},
--     WhichKeySeperator = {fg = colors.color02},
--     WhichKeyTrigger = {fg = colors.color02},

  }

  return syntax
end


wht.setup = function(opts)
  local user_colors = opts or {}
  colors = vim.tbl_deep_extend('force', colors, user_colors.colors or {})

  vim.cmd [[hi clear]]

  if vim.fn.exists('syntax on') then
    vim.cmd [[syntax reset]]
  end

  vim.o.background = 'light'
  vim.o.termguicolors = true

  local syntax = wht.set_syntax()

  for group, color in pairs(syntax) do
    highlight(group, color)
  end

end


return wht

