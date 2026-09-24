<html>
<head>
<title>jQuery CRUD Operations</title>

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
	background-color: maroon;
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

.modal-content {
	width: 70%;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	let editingIndex = -1;
	$(function(){
		console.log("On load...");
		displayRecords();
	});
	 

	function callPagination() {
		var rowsShown = 10;
		var rowsTotal = $('#data tbody tr').length;
		var numPages = rowsTotal / rowsShown;
		$('#nav').html('');
		for (i = 0; i < numPages; i++) {
			var pageNum = i + 1;
			$('#nav').append('<a href="#" rel="'+i+'">' + pageNum + '</a> ');
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
					$('#data tbody tr').css('opacity', '0.0').hide().slice(
							startItem, endItem).css('display', 'table-row')
							.animate({
								opacity : 1
							}, 300);
				});
	}

	function openAddNewDialog() {
		$("#addnewdialog").show();
		editingIndex = -1;
		clearElements();
	}

	function closeModal() {
		$("#addnewdialog").hide();
	}

	function displayRecords(){
		$.ajax({
			url:"ContactDetails",
			type: "post",
			data:{
				action : "dispaly",
			},
			success:function(data){
				$("#contacttbid").empty();
				var jsonData = eval(data); 
				for(var i=0; i< jsonData.length;i++ ){
					var rData = jsonData[i];
					console.log(rData);
					/* var row = "<tr><td>"+ rData.name +"</td><td>"+ rData.contact +"</td><td>"+ rData.address +"</td></tr>";
					$("#contacttbid").append(row); */
					 var row = "<tr><td>"+ rData.name +"</td><td>"+ rData.contact +"</td><td>"+ rData.address +"</td>";
	                    row += '<td><button onclick="editRecord(this)" class="btn btn-warning">Edit</button> ';
	                    row += '<button onclick="deleteRecord(this)" class="btn btn-danger">Delete</button></td>';
	                    row += "</tr>";
	                    $("#contacttbid").append(row);
				}
				
				callPagination();
			},
			failure:function(data){
				console.log(data);
			}
		}); 
	}
	
	function addRecord() {
		var name = $("#name").val();
		var contact = $("#contact").val();
		var address = $("#address").val();

		$.ajax({
			url : "ContactDetails",
			type : 'post',
			data : {
				action : "insert",
				name : $("#name").val(),
				contact : $("#contact").val(),
				address : $("#address").val() 
			},
			success : function(data) {
				displayRecords();
			},
			error : function(error) {
				alert(error);
			}
		});
		clearElements();
		closeModal();
	}

	function clearElements() {
		$("#name").val('');
		$("#contact").val('');
		$("#address").val('');
	}

	function editRecord(button) {
		var row = $(button).closest("tr");
		editingIndex = row.index();
		$("#name").val(row.find("td").eq(0).text());
		$("#contact").val(row.find("td").eq(1).text());
		$("#address").val(row.find("td").eq(2).text());

		$("#addnewdialog").show();
	}

	/* function deleteRecord(button) {
		var row = $(button).closest("tr");
		row.remove();
		callPagination(); */
	
	 function deleteRecord(button) {
	        var row = $(button).closest("tr");
	        row.remove();
			callPagination();
	        var name = row.find("td").eq(0).text();
	        var contact = row.find("td").eq(1).text();
	        var address = row.find("td").eq(2).text();

	        $.ajax({
	            url : "ContactDetails",
	            type : 'post',
	            data : {
	                action : "delete",
	                name : name,
	                contact : contact,
	                address : address
	            },
	            success : function(data) {
	                displayRecords();  
	            },
	            error : function(error) {
	                alert(error);
	            }
	        });
	    }

	  
	    function updateRecord() {
	        var name = $("#name").val();
	        var contact = $("#contact").val();
	        var address = $("#address").val();

	        $.ajax({
	            url : "ContactDetails",
	            type : 'post',
	            data : {
	                action : "update",
	                name : name,
	                contact : contact,
	                address : address
	            },
	            success : function(data) {
	                displayRecords();  
	            },
	            error : function(error) {
	                alert(error);
	            }
	        });
	        clearElements();
	        closeModal();
	    }
</script>

</head>
<body>

	<div class="container">
		<div class="page" align="center">
			<div class="inline-flex">
				<h2>
					<b>JQuery CRUD Operations</b>
				</h2>
				<button onclick="openAddNewDialog()" class="btn-primary float-end">Add
					New</button>
			</div>

			<table id="data" align="center">
				<thead>
					<tr>
						<th>Name</th>
						<th>Contact</th>
						<th>Address</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody id="contacttbid"></tbody>
			</table>
			<div id="nav"></div>
		</div>


		<div id="addnewdialog" class="modal">
			<div class="modal-dialog d-flex justify-content-center">
				<div class="modal-content w-75">
					<div class="modal-header">
						<h5 class="modal-title">Add New</h5>
						<button type="button" class="btn-close" onclick="closeModal()"></button>
					</div>
					<div class="modal-body p-4">

						<form action="ContactDetails" method="post">
							<div class="form-outline mb-4">
								<input type="text" id="name" class="form-control" /> <label
									class="form-label" for="name1">Name</label>
							</div>

							<div class="form-outline mb-4">
								<input type="tel" id="contact" class="form-control" /> <label
									class="form-label" for="contact">Contact</label>
							</div>

							<div class="form-outline mb-4">
								<input type="text" id="address" class="form-control" /> <label
									class="form-label" for="address1">Address</label>
							</div>

							<button type="button" class="btn btn-primary btn-block"
								onclick="addRecord()">Save</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
