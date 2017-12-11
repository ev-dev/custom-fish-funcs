function nest
	function hello
    echo "hello $argv"
    wait 
  end

  function greeting
    echo " have a $argv day."
  end

  hello "John"; and greeting "great"
end
