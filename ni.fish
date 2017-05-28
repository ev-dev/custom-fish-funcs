function showNodePath --argument context
    set nodePaths (which -a node)
    if test "$context" = "-s"
        ls -H $nodePaths[2]
        readlink $nodePaths[2]
    else if test "$context" = "-u"
        ls -H $nodePaths[1]
        readlink $nodePaths[1]
    end
end
