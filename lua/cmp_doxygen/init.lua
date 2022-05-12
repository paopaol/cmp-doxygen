local shared = require "nvim-treesitter.textobjects.shared"
local configs = require "nvim-treesitter.configs"


local function is_in_comment_block(query_string)
  local lookahead = configs.get_module("textobjects.select").lookahead
  local lookbehind = configs.get_module("textobjects.select").lookbehind
  local _, textobject = shared.textobject_at_point(
    query_string,
    nil,
    nil,
    { lookahead = lookahead, lookbehind = lookbehind }
  )
  if not textobject then
    return false
  end

  local current_line_num = vim.fn.line('.') - 1
  local current_col_num = vim.fn.col('.') - 1
  -- cursor out of comment block
  if current_line_num < textobject[1] or current_line_num > textobject[3] then
    return false
  end

  -- cursor out of comment block
  if current_line_num == textobject[2] and current_col_num > textobject[4] then
    return false
  end

  return true
end

local source = {}


source.new = function()
  return setmetatable({}, { __index = source })
end

source.get_trigger_characters = function()
  return { '@', '\\' }
end

source.get_keyword_pattern = function()
  return [[\k\+]]
end

function source:is_available()
  if vim.bo.filetype == "cpp" or vim.bo.filetype == "c" then
    return true
  end
  return false
end

source.complete = function(self, params, callback)
  if not is_in_comment_block('@comment.outer') then
    return callback({})
  end


  callback({
    { label = 'arg' },
    { label = 'author' },
    { label = 'authors' },
    { label = 'brief' },
    { label = 'callgraph' },
    { label = 'callergraph' },
    { label = 'date' },
    { label = 'deprecated' },
    { label = 'details' },
    { label = 'docbookonly' },
    { label = 'else' },
    { label = 'endcond' },
    { label = 'enddocbookonly' },
    { label = 'endhtmlonly' },
    { label = 'endif' },
    { label = 'endinternal' },
    { label = 'endlatexonly' },
    { label = 'endlink' },
    { label = 'endmanonly' },
    { label = 'endparblock' },
    { label = 'endrtfonly' },
    { label = 'endsecreflist' },
    { label = 'endxmlonly' },
    { label = 'hideinitializer' },
    { label = 'htmlonly' },
    { label = 'internal' },
    { label = 'invariant' },
    { label = 'latexonly' },
    { label = 'li' },
    { label = 'manonly' },
    { label = 'n' },
    { label = 'nosubgrouping' },
    { label = 'only' },
    { label = 'parblock' },
    { label = 'post' },
    { label = 'pre' },
    { label = 'pivate' },
    { label = 'pivatesection' },
    { label = 'protected' },
    { label = 'protectedsection' },
    { label = 'public' },
    { label = 'publicsection' },
    { label = 'pure' },
    { label = 'remark' },
    { label = 'remarks' },
    { label = 'return' },
    { label = 'returns' },
    { label = 'result' },
    { label = 'rtfonly' },
    { label = 'sa' },
    { label = 'secreflist' },
    { label = 'see' },
    { label = 'short' },
    { label = 'showinitializer' },
    { label = 'since' },
    { label = 'static' },
    { label = 'tableofcontents' },
    { label = 'test' },
    { label = 'version' },
    { label = 'xmlonly' },
    { label = 'a' },
    { label = 'anchor' },
    { label = 'b' },
    { label = 'c' },
    { label = 'cite' },
    { label = 'cond' },
    { label = 'copybrief' },
    { label = 'copydetails' },
    { label = 'copydoc' },
    { label = 'def' },
    { label = 'dir' },
    { label = 'dontinclude' },
    { label = 'e' },
    { label = 'elseif' },
    { label = 'em' },
    { label = 'enum' },
    { label = 'example' },
    { label = 'exception' },
    { label = 'exceptions' },
    { label = 'extends' },
    { label = 'file' },
    { label = 'htmlinclude' },
    { label = 'idlexcept' },
    { label = 'if' },
    { label = 'ifnot' },
    { label = 'implements' },
    { label = 'include' },
    { label = 'includelineno' },
    { label = 'latexinclude' },
    { label = 'link' },
    { label = 'memberof' },
    { label = 'namespace' },
    { label = 'p' },
    { label = 'package' },
    { label = 'property' },
    { label = 'relatedalso' },
    { label = 'relatesalso' },
    { label = 'related' },
    { label = 'relates' },
    { label = 'retval' },
    { label = 'throw' },
    { label = 'throws' },
    { label = 'verbinclude' },
    { label = 'version' },
    { label = 'xrefitem' },
    { label = 'param' },
    { label = 'tparam' },
    { label = 'image' },
    { label = 'addtogroup' },
    { label = 'category' },
    { label = 'class' },
    { label = 'diafile' },
    { label = 'dotfile' },
    { label = 'defgroup' },
    { label = 'interface' },
    { label = 'headerfile' },
    { label = 'mscfile' },
    { label = 'page' },
    { label = 'paragraph' },
    { label = 'prtocol' },
    { label = 'ref' },
    { label = 'section' },
    { label = 'snippet' },
    { label = 'struct' },
    { label = 'subpage' },
    { label = 'subsection' },
    { label = 'subsubsection' },
    { label = 'union' },
    { label = 'weakgroup' },
    { label = 'addindex' },
    { label = 'copyright' },
    { label = 'fn' },
    { label = 'ingroup' },
    { label = 'line' },
    { label = 'mainpage' },
    { label = 'name' },
    { label = 'overload' },
    { label = 'par' },
    { label = 'skip' },
    { label = 'skipline' },
    { label = 'typedef' },
    { label = 'until' },
    { label = 'var' },
    { label = 'vhdlflow' },
    { label = 'endcode' },
    { label = 'endverbatim' },
    { label = 'endmsc' },
    { label = 'enddot' },
    { label = 'note' },
    { label = 'warning' },
    { label = 'attention' },
    { label = 'bug' },
    { label = 'todo' },
  })
end

return source
