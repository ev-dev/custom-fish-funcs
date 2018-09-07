# Defined in - @ line 2
function lines
	set rootDir "$argv[1]"
    set totalLineCount 0
    for file in (/bin/ls -1 "$rootDir")
        set fileRawWc (wc -l "$rootDir/$file")
        set fileLineCount (string replace -r -a '(\s*)([\d]*)( .*)' '$2' "$fileRawWc")
        set totalLineCount (math $totalLineCount + $fileLineCount)
    end
    inf "total line count of dir = $totalLineCount"
end
