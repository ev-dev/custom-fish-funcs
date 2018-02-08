# Defined in - @ line 2
function qgql
	set type 'query'
    getopts $argv | while read -l key value
        switch $key
            case l
                set url "localhost"
            case p
                set port "$value"
            case url
                set url "$value"
            case m
                set type 'mutation'
        end
    end

    set gql (string replace -r -a '[\s\n]+' ' ' "$argv[-1]")
    set gql_request "{ \""$type"\": \""$gql"\" }"
    set full_request_url "http://$url:$port/graphql"

    proc 'executing GraphQL Request'
    set resp (curl -s -X POST -H "Content-Type: application/json" --data "$gql_request" "$full_request_url")

    spin "if test $status -eq 0; echo -e '\n\n'; end"
    echo "$resp" | jq '.data'
end
