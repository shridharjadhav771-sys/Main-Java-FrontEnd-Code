<!DOCTYPE html>
<html>
<head>
<title>AJAX Example</title>

<script>
function loadData(){

    var xhr = new XMLHttpRequest();

    xhr.open("GET","HelloServlet",true);

    xhr.onreadystatechange = function(){
        if(xhr.readyState==4 && xhr.status==200){
            document.getElementById("result").innerHTML =
                xhr.responseText;
        }
    };

    xhr.send();
}
</script>

</head>
<body>

<h2>AJAX Example</h2>

<button onclick="loadData()">Get Data</button>

<div id="result"></div>

</body>
</html>
