-- Theme: Kosmikoa
-- Author: Novakane

local M = {}

local colors = {
  base00  = '#232227',
  base01  = '#444349',
  base02  = '#636268',
  base03  = '#78767c',
  base04  = '#a19fa6',
  base05  = '#c0bec5',
  base06  = '#e2e1e8',
  base07  = '#f0eef5',

  red01     = '#f63d81',
  red02     = '#f86298',
  red03     = '#fa90b6',

  pink01    = '#fc65b0',
  pink02    = '#fb93c8',
  pink03    = '#fbbede',

  orange01  = '#f5939c',
  orange02  = '#f8af88',
  orange03  = '#fbceb7',

  yellow01  = '#e8ec77',
  yellow02  = '#eff29e',
  yellow03  = '#f5f6c4',
  ts_yellow = '#eecb69',

  green01   = '#00e2a7',
  green02   = '#7deac0',
  green03   = '#b5f2d9',
  ts_green  = '#00c6b2',

  blue01    = '#57bbf4',
  blue02    = '#6ac7f6',
  blue03    = '#8fd7fa',

  magenta01 = '#8273e5',
  magenta02 = '#a79bee',
  magenta03 = '#cbc3f4',

  cyan01    = '#4db9c8',
  cyan02    = '#67ced8',
  cyan03    = '#b7eaee',

  test = '#ff0000'
}

-- [ Terminal ]
local term_colors = {
  terminal_color_0  = colors.base01,
  terminal_color_1  = colors.red01,
  terminal_color_2  = colors.green01,
  terminal_color_3  = colors.yellow01,
  terminal_color_4  = colors.blue01,
  terminal_color_5  = colors.magenta01,
  terminal_color_6  = colors.cyan01,
  terminal_color_7  = colors.base06,
  terminal_color_8  = colors.base02,
  terminal_color_9  = colors.red01,
  terminal_color_10 = colors.green01,
  terminal_color_11 = colors.yellow01,
  terminal_color_12 = colors.blue01,
  terminal_color_13 = colors.magenta01,
  terminal_color_14 = colors.cyan01,
  terminal_color_15 = colors.base07,
}

local highlight = function(group, color)
  local guifg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
  local guibg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
  local attr = color.attr and 'gui=' .. color.attr or 'gui=NONE'
  local sp = color.sp and 'guisp=' .. color.sp or ''
  local cmd = ('highlight! %s %s %s %s %s'):format(group, guifg, guibg, attr, sp)

  vim.cmd(cmd)
end

M.set_syntax = function()
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
    Cursor = {fg = colors.base00, bg = colors.base06},
    CursorLine = {bg = colors.base01},
    Error = {fg = colors.red01, bg = colors.base00},
    iCursor = {fg = colors.base00, bg = colors.base05},
    LineNr = {fg = colors.base02, bg = colors.base00},
    MatchParen = {fg = colors.green01, bg = colors.base02},
    NonText = {fg = colors.base02},
    Normal = {fg = colors.base07, bg = colors.base00},
    PMenu = {fg = colors.base05, bg = colors.base01},
    PmenuSbar = {fg = colors.base05, bg = colors.base02},
    PMenuSel = {fg = colors.base01, bg = colors.green01},
    PmenuThumb = {fg = colors.green01, bg = colors.base02},
    RedrawDebugNormal = {fg = colors.base00, bg = colors.base06},
    RedrawDebugClear = {fg = colors.base00, bg = colors.yellow01},
    RedrawDebugComposed = {fg = colors.base00, bg = colors.green01},
    RedrawDebugRecompose = {fg = colors.base00, bg = colors.red01},
    SpecialKey = {fg = colors.base04},
    SpellBad = {
      fg = colors.red01,
      bg = colors.base00,
      attr = 'undercurl',
      sp = colors.red01,
    },
    SpellCap = {
      fg = colors.pink01,
      bg = colors.base00,
      attr = 'undercurl',
      sp = colors.pink01,
    },
    SpellLocal = {
      fg = colors.orange01,
      bg = colors.base00,
      attr = 'undercurl',
      sp = colors.orange01,
    },
    SpellRare = {
      fg = colors.yellow01,
      bg = colors.base00,
      attr = 'undercurl',
      sp = colors.yellow01,
    },
    Visual = {fg = colors.base05, bg = colors.base01, attr = 'bold'},
    VisualNOS = {fg = colors.base03},

    -- [ Neovim support ]
    NvimInternalError = {fg = colors.base00, bg = colors.red01},
    healthError = {fg = colors.red01, bg = colors.base00},
    healthSuccess = {fg = colors.green01, bg = colors.base00},
    healthWarning = {fg = colors.yellow01, bg = colors.base00},
    TermCursorNC = {fg = colors.base01},

    -- [ Gutter ]
    CursorColumn = {fg = colors.base01},
    CursorLineNr = {fg = colors.base05, bg = colors.base00},
    Folded = {fg = colors.base04, bg = colors.base01, attr = 'bold'},
    FoldColumn = {fg = colors.base03, bg = colors.base00},
    SignColumn = {fg = colors.base01, bg = colors.base00},

    -- [ Navigation ]
    Directory = {fg = colors.green01},

    -- [ Prompt / Status ]
    EndOfBuffer = {fg = colors.base01},
    ErrorMsg = {fg = colors.base00, bg = colors.red01},
    ModeMsg = {fg = colors.base04},
    MoreMsg = {fg = colors.base04},
    Question = {fg = colors.base04},
    StatusLine = {fg = colors.base05, bg = colors.base01},
    StatusLineNC = {fg = colors.base04, bg = colors.base01},
    StatusLineTerm = {fg = colors.base05, bg = colors.base01},
    StatusLineTermNC = {fg = colors.base04, bg = colors.base01},
    WarningMsg = {fg = colors.base00, bg = colors.yellow01},
    WildMenu = {fg = colors.yellow01, bg = colors.base01},

    -- [ Search ]
    IncSearch = {fg = colors.base01, bg = colors.yellow01, attr = 'underline'},
    Search = {fg = colors.base01, bg = colors.blue01},

    -- [ Tabs ]
    TabLine = {fg = colors.base04, bg = colors.base01},
    TabLineFill = {fg = colors.base04, bg = colors.base01},
    TabLineSel = {fg = colors.base00, bg = colors.blue01},

    -- [ Window ]
    Title = {fg = colors.base04},
    VertSplit = {fg = colors.base01, bg = colors.base00},

    -- [ Diff ]
    DiffAdd = {fg = colors.green01, bg = colors.base00, attr = 'inverse'},
    DiffChange = {fg = colors.yellow01, bg = colors.base00, attr = 'inverse'},
    DiffDelete = {fg = colors.red01, bg = colors.base00, attr = 'inverse'},
    DiffText = {fg = colors.blue01, bg = colors.base00, attr = 'inverse'},
    -- Legacy groups for official git.vim and diff.vim syntax
    diffAdded = {fg = colors.green01, bg = colors.base00, attr = 'inverse'},
    diffChanged = {fg = colors.yellow01, bg = colors.base00, attr = 'inverse'},
    diffRemoved = {fg = colors.red01, bg = colors.base00, attr = 'inverse'},

    -- [ Quickfix / Location list ]
    qfLineNr = {fg = colors.yellow01},

    -- [ Neovim lsp ]
    LspDiagnosticsDefaultError = {fg = colors.red01},
    LspDiagnosticsDefaultWarning = {fg = colors.yellow01},
    LspDiagnosticsDefaultInformation = {fg = colors.blue01},
    LspDiagnosticsDefaultHint = {fg = colors.blue03},
    LspDiagnosticsUnderlineError = {fg = colors.red01},
    LspDiagnosticsUnderlineWarning = {fg = colors.yellow01},
    LspDiagnosticsUnderlineInformation = {fg = colors.blue01},
    LspDiagnosticsUnderlineHint = {fg = colors.blue03},
    LspDiagErrorBorder = {fg = colors.red01},
    LspDiagWarnBorder = {fg = colors.yellow01},
    LspDiagInforBorder = {fg = colors.blue01},
    LspDiagHintBorder = {fg = colors.blue03},

    -- ------------------------------------------
    -- [ LANGUAGE kosmikoa.base GROUPS ]
    -- ------------------------------------------
    -- ( :help w18 )


    Comment = {fg = colors.base03, attr = 'italic'},

    Constant = {fg = colors.pink01},
    String = {fg = colors.magenta03, attr = 'italic'},
    Character = {fg = colors.pink01},
    Number = {fg = colors.orange02},
    Boolean = {fg = colors.orange01},
    Float = {fg = colors.orange03},

    Identifier = {fg = colors.blue03},
    Function = {fg = colors.yellow01},

    Statement = {fg = colors.magenta02},
    Conditional = {fg = colors.magenta01},
    Repeat = {fg = colors.magenta02},
    Label = {fg = colors.red01},
    Operator = {fg = colors.blue01},
    Keyword = {fg = colors.yellow03},
    Exception = {fg = colors.red01},

    PreProc = {fg = colors.magenta01},
    Include = {fg = colors.green03},
    Define = {fg = colors.blue01},
    Macro = {fg = colors.green01},
    PreCondit = {fg = colors.green02},

    Type = {fg = colors.pink02},
    StorageClass = {fg = colors.pink01},
    Structure = {fg = colors.pink01},
    Typedef = {fg = colors.pink01},

    Special = {fg = colors.cyan01},
    SpecialChar = {fg = colors.cyan02},
    Tag = {fg = colors.base05},
    Delimiter = {fg = colors.base07},
    SpecialComment = {fg = colors.base05, attr = 'italic'},
    Todo = {fg = colors.cyan01, attr = 'bold'},


    -- ------------------------------------------
    -- [ LANGUAGES SPECIFIC ]
    -- ------------------------------------------


    -- [ Css ]
    cssAttributeSelector = {fg = colors.magenta01},
    cssBackgroundProp = {fg = colors.pink02},
    cssBorderProp = {fg = colors.pink02},
    cssBraces = {fg = colors.green01},
    cssClassName = {fg = colors.cyan01},
    cssClassNameDot = {fg = colors.cyan03},
    cssColor = {fg = colors.base05, attr = 'bold'},
    cssFontProp = {fg = colors.red02},
    cssIdentifier = {fg = colors.blue03},
    cssMediaType = {fg = colors.pink03},
    cssSelectorOp = {fg = colors.magenta02},
    cssSelectorOp2 = {fg = colors.yellow02},
    cssTagName = {fg = colors.blue01},
    cssTextProp = {fg = colors.red01},
    cssURL = {fg = colors.green01, attr = 'underline'},

    -- [ Fennel ]
    -- ( https://github.com/bakpakin/fennel.vim )
    FennelSpecialForm = {fg = colors.pink01},
    FennelSymbol = {fg = colors.red02},

    -- [ Go ]
    goBuiltins = {fg = colors.green01},
    goDeclType = {fg = colors.pink02},
    goVar = {fg = colors.red02},
    goVarArgs = {fg = colors.base05, attr = 'bold'},

    -- [ Html ]
    htmlBold = {fg = colors.base05, attr = 'bold'},
    htmlEndTag = {fg = colors.cyan01},
    htmlH1 = {fg = colors.red01},
    htmlH2 = {fg = colors.red02},
    htmlH3 = {fg = colors.pink01},
    htmlH4 = {fg = colors.pink02},
    htmlH5 = {fg = colors.magenta01},
    htmlH6 = {fg = colors.magenta02},
    htmlItalic = {fg = colors.base05, attr = 'italic'},
    htmlLink = {fg = colors.green01, attr = 'underline'},
    htmlTag = {fg = colors.blue01},
    htmlTagN = {fg = colors.blue02},
    htmlTagName = {fg = colors.blue01},
    htmlTitle = {fg = colors.base05},

    -- [ Java ]
    javaCommentTitle = {fg = colors.base05, attr = 'italic'},
    javaDocParam = {fg = colors.cyan02},
    javaDocSeeTagParam = {fg = colors.cyan03},
    javaDocTags = {fg = colors.cyan01, attr = 'bold'},

    -- [ Javascript ]
    -- ( http//github.com/pangloss/vim-javascript )
    jsArrowFunction = {fg = colors.yellow01},
    jsFuncArgs = {fg = colors.base05, attr = 'italic'},
    jsFuncCall = {fg = colors.yellow02},
    jsObjectColon = {fg = colors.blue03},
    jsObjectKey = {fg = colors.blue01},
    jsObjectProp = {fg = colors.cyan01},
    jsVariableDef = {fg = colors.red02},

    -- [ Json ]
    jsonBraces = {fg = colors.green01},
    jsonKeyword = {fg = colors.blue01},
    jsonKeywordMatch = {fg = colors.blue02},

    -- [ Less ]
    --  ( http//github.com/groenewege/vim-less )
    lessVariable = {fg = colors.cyan01},

    -- [ Lua ]
    luaFuncCall = {fg = colors.yellow02},
    luaSpecialValue = {fg = colors.green01},

    -- [ Markdown ]
    -- ( http//github.com/plasticboy/vim-markdown )
    mkdBold = {fg = colors.base05, attr = 'bold'},
    mkdCode = {fg = colors.blue02},
    mkdCodeDelimiter = {fg = colors.blue01},
    mkdCodeEnd = {fg = colors.blue01},
    mkdCodeStart = {fg = colors.blue01},
    mkdHeading = {fg = colors.pink01},
    mkdItalic = {fg = colors.base05, attr = 'italic'},
    mkdLink = {fg = colors.green01},
    mkdListItem = {fg = colors.red01},
    mkdListItemLine = {fg = colors.base06},

    -- [ Php ]
    phpVarSelector = {fg = colors.red02},
    phpIdentifier = {fg = colors.red03},

    -- [ Python ]
    pythonClassVar = {fg = colors.orange01},
    pythonBuiltinType = {fg = colors.pink02},
    pythonFunctionCall = {fg = colors.yellow02},
    pythonStatement = {fg = colors.blue01},

    -- [ Rust ]
    -- ( http//github.com/rust-lang/rust.vim )
    rustArrowCharacter = {fg = colors.green01},
    rustFatRightArrowHead = {fg = colors.yellow02},
    rustFatRightArrowTail = {fg = colors.yellow02},
    rustModPathSep = {fg = colors.base04, attr = 'bold'},
    rustRepeat = {fg = colors.magenta02},
    rustSelf = {fg = colors.cyan01, attr = 'italic'},
    rustStructure = {fg = colors.pink01},

    -- [ Scss ]
    -- ( http//github.com/cakebaker/scss-syntax.vim )
    scssVariable = {fg = colors.cyan01},

    -- [ Shell ]
    shCaseBar = {fg = colors.magenta02},
    shDerefSimple = {fg = colors.blue01},
    shDerefVar = {fg = colors.orange02},
    shSet = {fg = colors.pink02},
    shSetList = {fg = colors.red02},
    shStatement = {fg = colors.yellow02},
    shVariable = {fg = colors.red02},

    -- [ Vim ]
    vimAugroupKey = {fg = colors.orange01},
    vimAutocmd = {fg = colors.orange02},
    vimCommand = {fg = colors.magenta02},
    vimFuncName = {fg = colors.yellow02},
    vimFunction = {fg = colors.yellow01},
    vimLet = {fg = colors.pink02},
    vimNotFunc = {fg = colors.magenta01},
    vimOption = {fg = colors.green01},
    vimUserFunc = {fg = colors.yellow01},
    vimVar = {fg = colors.red02},

    -- [ Xml ]
    xmlProcessingDelim = {fg = colors.green01},
    xmlTag = {fg = colors.blue03},
    xmlTagName = {fg = colors.blue01},

    -- [ Yaml ]
    yamlBlockMappingKey = {fg = colors.blue01},
    yamlFlowIndicator = {fg = colors.green01},
    yamlFlowMappingKey = {fg = colors.blue03},
    yamlFlowMappingMerge = {fg = colors.yellow01},

    -- [ Zig ]
    zigBuiltinFn = {fg = colors.green01},
    zigExecution = {fg = colors.magenta02},
    zigKeyword = {fg = colors.yellow01},
    zigVarDecl = {fg = colors.pink01},

    -- [ Zsh ]
    zshDelimiter = {fg = colors.magenta02},
    zshDeref = {fg = colors.red01},
    zshOption = {fg = colors.green01},
    zshShortDeref = {fg = colors.blue01},
    zshSubst = {fg = colors.orange02},
    zshSubstDelim = {fg = colors.orange03},
    zshVariableDef = {fg = colors.red02},


    -- -------------------------------------------
    -- [ PLUGIN SUPPORT ]
    -- -------------------------------------------


    -- [ Hop ]
    -- ( https://github.com/phaazon/hop.nvim )
    HopNextKey = {fg = colors.pink01},
    HopNextKey1 = {fg = colors.yellow01},
    HopNextKey2 = {fg = colors.blue01},

    -- [ Lspsaga ]
    -- ( https://github.com/glepnir/lspsaga.nvim )
    LineDiagTuncateLine = {fg = colors.base02},
    LspFloatWinBorder = {fg = colors.pink01},
    LspLinesDiagBorder = {fg = colors.red01},
    LspSagaAutoPreview = {fg = colors.pink01},
    LspSagaBorderTitle = {fg = colors.pink01},
    LspSagaCodeActionBorder = {fg = colors.pink01},
    LspSagaCodeActionContent = {fg = colors.base06},
    LspSagaCodeActionTitle = {fg = colors.pink01},
    LspSagaCodeActionTruncateLine = {fg = colors.base02},
    LspSagaDefPreviewBorder = {fg = colors.blue01},
    LspSagaDocTruncateLine = {fg = colors.base02},
    LspSagaFinderSelection = {fg = colors.green01},
    LspSagaHoverBorder = {fg = colors.blue01},
    LspSagaLspFinderBorder = {fg = colors.blue01},
    LspSagaRenameBorder = {fg = colors.pink01},
    LspSagaRenamePromptPrefix = {fg = colors.pink01},
    LspSagaShTruncateLine = {fg = colors.base02},
    LspSagaSignatureHelpBorder= {fg = colors.blue01},
    ProviderTruncateLine = {fg = colors.base02},
    SagaShadow = {fg = colors.base06, bg = colors.base00},


    -- [ Signify ]
    -- ( http//github.com/mhinz/vim-signify )
    SignifyDeleteFirstLine = {fg = colors.red01},
    SignifyLineAdd = {fg = colors.green01},
    SignifyLineChange = {fg = colors.yellow01},
    SignifyLineChangeDelete = {fg = colors.yellow01},
    SignifyLineDelete = {fg = colors.red01},
    SignifyLineDeleteFirstLine = {fg = colors.red01},
    SignifySignAdd = {fg = colors.green01},
    SignifySignChange = {fg = colors.yellow01},
    SignifySignChangeDelete = {fg = colors.yellow01},
    SignifySignDelete = {fg = colors.red01},

    -- [ Telescope ]
    -- ( https://github.com/nvim-telescope/telescope.nvim )
    TelescopeSelection = {fg = colors.yellow01, attr = 'bold'},
    TelescopeSelectionCaret = {fg = colors.pink01},
    TelescopePreviewLine = {fg = colors.orange01},

    -- [ Treesitter ]
    -- ( https://github.com/nvim-treesitter/nvim-treesitter )
    TSKeywordOperator = {fg = colors.blue2},
    TSFuncBuiltin = {fg = colors.green01},
    TSMethod = {fg = colors.yellow02},
    TSKeywordFunction = {fg = colors.pink02},
    TSKeyword = {fg = colors.ts_yellow},
    TSParameter = {fg = colors.base05, attr = 'italic'},
    TSProperty = {fg = colors.base05},
    TSConstMacro = {fg = colors.green01},
    TSInclude = {fg = colors.ts_green},
    -- Nvim-ts-rainbow ( https://github.com/p00f/nvim-ts-rainbow )
    rainbowcol1 = {fg = colors.magenta01},
    rainbowcol2 = {fg = colors.blue01},
    rainbowcol3 = {fg = colors.green01},
    rainbowcol4 = {fg = colors.yellow01},
    rainbowcol5 = {fg = colors.orange01},
    rainbowcol6 = {fg = colors.pink01},
    rainbowcol7 = {fg = colors.red01},
    -- Nvim-treesitter-refactor ( https://github.com/nvim-treesitter/nvim-treesitter-refactor )
    TSDefiniton = {fg = colors.base00, bg = colors.base06, attr = 'bold'},
    TSDefinitionUsage = {fg = colors.red01, attr = 'italic'},
    TSCurrentScope = {bg = colors.base01},
    -- Treesitter-playground ( https://github.com/nvim-treesitter/playground )
    TSPlaygroundFocus = {fg = colors.base00, bg = colors.orange01},

    -- [ Which-key ]
    -- ( https://github.com/liuchengxu/vim-which-key )
    WhichKey = {fg = colors.pink01},
    WhichKeyGroup = {fg = colors.yellow01},
    WhichKeyTrigger = {fg = colors.magenta01},
    WhichKeyName = {fg = colors.base06},
    WhichKeySeperator = {fg = colors.blue01},
    WhichKeyFloating = {bg = colors.base00},
    WhichKeyDesc = {fg = colors.base06},

  }

  return syntax
end


M.setup = function(opts)
  local user_colors = opts or {}
  colors = vim.tbl_deep_extend('force', colors, user_colors.colors or {})

  vim.cmd [[hi clear]]

  if vim.fn.exists('syntax on') then
    vim.cmd [[syntax reset]]
  end

  vim.o.background = 'dark'
  vim.o.termguicolors = true

  for color, value in pairs(term_colors) do
    vim.g[color] = value
  end

  local syntax = M.set_syntax()

  for group, color in pairs(syntax) do
    highlight(group, color)
  end

end


return M

