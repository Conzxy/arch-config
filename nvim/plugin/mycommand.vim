:command AddMudoleComment :normal i
      \/*--------------------------------------------------*/<CR>
      \/*                                                  */<CR>
      \/*--------------------------------------------------*/<CR>
      \<ESC>

:command IncToday :r! date "+\%Y-\%m-\%d"

function SetupDev()
  :Vista!! 
  :NvimTreeToggle
endfunction

:command SetupDev :exec SetupDev()
