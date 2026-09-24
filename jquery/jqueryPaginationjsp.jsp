<html>
<head>
<title>jQuery pagination</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
.page {
	margin-top: 50px;
}

table, th, td {
	border: 1px solid black;
}

#data {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#data td, #data th {
	border: 1px solid #ddd;
	padding: 8px;
}

#data tr:nth-child(even) {
	background-color: #f2f2f2;
}

#data tr:hover {
	background-color: #ddd;
}

#data th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: maroon;;
	color: white;
}

h2 {
	color: green;
}

#nav a {
	color: blue;
	font-size: 20px;
	margin-top: 22px;
	font-weight: 600;
}

a:hover, a:visited, a:link, a:active {
	text-decoration: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js">
	
</script>
<script>
	 

	function callPagination(){ 
		var rowsShown = 2;
		var rowsTotal = $('#data tbody tr').length;
		var numPages = rowsTotal / rowsShown;
		$('#nav').html('');
		for (i = 0; i < numPages; i++) {
			var pageNum = i + 1;
			$('#nav').append(
					'<a href="#" rel="'+i+'">' + pageNum + '</a> ');
		}
		$('#data tbody tr').hide();
		$('#data tbody tr').slice(0, rowsShown).show();
		$('#nav a:first').addClass('active');
		$('#nav a').bind(
				'click',
				function() {
					$('#nav a').removeClass('active');
					$(this).addClass('active');
					var currPage = $(this).attr('rel');
					var startItem = currPage * rowsShown;
					var endItem = startItem + rowsShown;
					$('#data tbody tr').css('opacity', '0.0').hide()
							.slice(startItem, endItem).css('display',
									'table-row').animate({
								opacity : 1
							}, 300);
				});
	}
	function openAddNewDialog() {
		$("#addnewdiaolog").show();
	}
	function closeModal(){
		console.log("Close called");
		$("#addnewdiaolog").hide();
	}
	
	function addRecord(){
		console.log($("#name").val());
		console.log($("#contact").val());
		console.log($("#address").val());
		
		var tbRow = "<tr><td>"+ $("#name").val() +"</td><td>"+ $("#contact").val() +"</td><td>"+ $("#address").val() +"</td></tr>";
		$("#contacttbid").prepend(tbRow);
		callPagination();
		clearElements();
		closeModal();	
	}
	
	function clearElements(){
		$("#name").val('');
		$("#contact").val('');
		$("#address").val('');
	}
</script>

</head>
<body>

	<div class="container">
		<div class="page" align="center">
			<div class="inline-flex">

				<h2>
					<b>JQuery Pagination </b>
				</h2>

				<button onclick="openAddNewDialog()" class="btn-primary float-end">Add
					new</button>
			</div>

			<table id="data" align="center">
				<thead>
					<tr>
						<th>Name</th>
						<th>Contact</th>
						<th>Address</th>
					</tr>
				</thead>
				<tbody id="contacttbid"> 
				</tbody>

			</table>
			<div id="nav"></div>
		</div>
		
		<div id="addnewdiaolog" class="modal"  >
		<div class="modal-dialog d-flex justify-content-center">
			<div class="modal-content w-75">
				<div class="modal-header">
					<h5 class="modal-title" id="addnewdiaolog">Add New</h5>
					
					<button type="button"  
						class="btn-close" onclick="closeModal()"></button>
						
				</div>
				<div class="modal-body p-4">
					<form>
						<!-- Email input -->
						<div data-mdb-input-init class="form-outline mb-4">
							<input type="text" id="name" class="form-control" /> <label
								class="form-label" for="name1">Name</label>
						</div>

						<!-- password input -->
						<div data-mdb-input-init class="form-outline mb-4">
							<input type="tel" id="contact" class="form-control" /> <label
								class="form-label" for="contact">Contact</label>
						</div>

						<div data-mdb-input-init class="form-outline mb-4">
							<input type="text" id="address" class="form-control" /> <label
								class="form-label" for="address1">Address</label>
						</div>


						<!-- Submit button -->
						<button type="button" data-mdb-button-init data-mdb-ripple-init
							class="btn btn-primary btn-block" onclick="addRecord()">Login</button>
					</form>
				</div>
			</div>
		</div> 
	</div>
	</div>

	
</body>
</html>
