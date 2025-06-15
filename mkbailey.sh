#!/bin/bash
OUT=${1:-bailey.html}
echo "Creating $OUT"
ls -l
set -x
cat <<________ > $OUT
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bill Bailey</title>
    <meta name="viewport" content="minimum-scale=1,maximum-scale=1,width=device-width">
    <style>
________
        cat bailey.css >> $OUT
        cat <<________ >> $OUT
    </style>
</head>
<body>
    <canvas id="sqCanvas" width="1024" height="768"></canvas>
    <div id="sqSpinner"><div></div></div>
    <div id="sqMessage">
        <h1>Preparing Bill Bailey...</h1>
    </div>
    <script>
________
        cat squeak.min.js >> $OUT
        cat <<________ >> $OUT
    </script>
    <script type="text/base64" id="sqImageData">
________
        base64 -i bailey.zip >> $OUT
        cat <<________ >> $OUT
    </script>
    <script>
________
        cat bailey.js >> $OUT
        cat <<________ >> $OUT
    </script>
</body>
</html>
________
set +x
ls -l $OUT
echo "Done."
