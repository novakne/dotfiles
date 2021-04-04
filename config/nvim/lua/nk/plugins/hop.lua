-- [ Hop ]
if packer_plugins['hop.nvim'] and packer_plugins['hop.nvim'].loaded then

    local utils = require 'nk.utils'
    local map = utils.bind

    map('n', 'fw', '<CMD>lua require"hop".hint_words()<CR>')
    map('n', 'fp', '<CMD>lua require"hop".hint_patterns()<CR>')
    map('n', 'fc', '<CMD>lua require"hop".hint_char1()<CR>')
    map('n', 'f$', '<CMD>lua require"hop".hint_char2()<CR>')

end

