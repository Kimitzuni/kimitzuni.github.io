#!/bin/bash

DateFormat_File="$(date +'%-d_%-m_%Y')"
DateFormat_DATE="$(date +'%A, %-d %B %Y')"
DateFormat_CSV="$(date +'%B %-d %Y')"

printf ">>> Blog Title: "
read title

filename_safe="$(echo "$title" | sed 's/[!\,\.\$\"]//g;s/ /_/g')"
filename="blog/${DateFormat_File}__$filename_safe.php"

cat << EOF > $filename
<!DOCTYPE html>
<?php
\$head_contents = file_get_contents("global-head.php");
echo \$head_contents
?>
		<title>$title | Rebecca White</title>
	</head>

	<body>
		<h1>Rebecca White</h1>
		<div class="left">
		<h2>$title</h2>
		<p>$DateFormat_DATE</p>
		<hr>

		
	</div>

<?php
\$navbar = file_get_contents("navbar.php");
echo \$navbar ?>
	</body>
</html>
EOF

echo ",$DateFormat_CSV,$title,$DateFormat_File" >> blog/blog-posts.csv
sort -m blog/blog-posts.csv > /tmp/temp-sort
tac /tmp/temp-sort > blog/blog-posts.csv
