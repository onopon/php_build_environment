<?php

echo("HOGE\n");
var_dump(ast\parse_code('<?php echo("HOGE");', $version=90));
