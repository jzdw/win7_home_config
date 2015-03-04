

        " my filetype file
        if exists("did_load_filetypes")
          finish
        endif
        augroup filetypedetect
          au! BufRead,BufNewFile *.spe         setfiletype spectre
          au! BufRead,BufNewFile *.ocn         setfiletype ocean
          au! BufRead,BufNewFile *.awd         setfiletype ocean
          au! BufRead,BufNewFile *.scs         setfiletype spectre 
          au! BufRead,BufNewFile *.il          setfiletype skill
          au! BufRead,BufNewFile *.ile         setfiletype skill
        augroup END


