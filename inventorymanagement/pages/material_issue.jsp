<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="session-expire-check.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Material Issue (Challan)</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body class="bg-light">

<div class="container mt-4">

    <div class="card shadow">
        <div class="card-header bg-dark text-white">
            <h5>Material Issue (Challan)</h5>
        </div>

        <div class="card-body">

            <!-- Search -->
            <div class="row mb-3">
                <div class="col-md-4">
                    <input type="text" id="searchMaterialRequest"
                        class="form-control"
                        placeholder="Search by Series...">
                </div>

                <div class="col-md-2">
                    <button id="material_request_search"
                        class="btn btn-dark w-100">
                        Search
                    </button>
                </div>

                <div class="col-md-6 text-end">
                    <button class="btn btn-primary"
                        onclick="openModal()">
                        + Add New
                    </button>
                </div>
            </div>

            <!-- Table -->
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Series</th>
                        <th>Date</th>
                        <th>Issued To</th>
                        <th>Status</th>
                        <th width="200">Action</th>
                    </tr>
                </thead>
                <tbody id="materialTableBody"></tbody>
            </table>

            <!-- Pagination -->
            <div class="text-center">
                <button class="btn btn-secondary"
                    onclick="prevPage()">Previous</button>

                <button class="btn btn-secondary"
                    onclick="nextPage()">Next</button>
            </div>

        </div>
    </div>
</div>

<!-- ================= MODAL ================= -->

<div class="modal fade" id="materialModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header bg-dark text-white">
        <h5 class="modal-title">Material Issue</h5>
        <button type="button" class="btn-close"
            data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">

        <input type="hidden" id="editId">

        <div class="mb-3">
            <input type="text" id="issueSeries"
                class="form-control"
                placeholder="Issue Series">
        </div>

        <div class="mb-3">
            <input type="date" id="issueDate"
                class="form-control">
        </div>

        <div class="mb-3">
            <input type="text" id="issuedTo"
                class="form-control"
                placeholder="Issued To">
        </div>

        <div class="mb-3">
            <select id="status" class="form-control">
                <option value="Open">Open</option>
                <option value="Closed">Closed</option>
            </select>
        </div>

      </div>

      <div class="modal-footer">
        <button id="saveBtn"
            class="btn btn-success"
            onclick="saveRecord()">Save</button>

        <button id="updateBtn"
            class="btn btn-warning"
            style="display:none;"
            onclick="updateRecord()">Update</button>
      </div>

    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>

let currentPage = 1;

$(document).ready(function() {
    loadData();
});

function loadData(keyword = "") {

    $.ajax({
        url: "MaterialIssue",
        type: "GET",
        data: { keyword: keyword, page: currentPage },
        success: function(data) {

            $("#materialTableBody").empty();

            $.each(data, function(i, item) {

                $("#materialTableBody").append(`
                    <tr>
                        <td>${item.issueSeries}</td>
                        <td>${item.issueDate}</td>
                        <td>${item.issuedTo}</td>
                        <td>${item.status}</td>
                        <td>
                            <button class="btn btn-sm btn-info"
                                onclick="editRecord(${item.id},
                                '${item.issueSeries}',
                                '${item.issueDate}',
                                '${item.issuedTo}',
                                '${item.status}')">Edit</button>

                            <button class="btn btn-sm btn-danger"
                                onclick="deleteRecord(${item.id})">Delete</button>

                            <button class="btn btn-sm btn-success"
                                onclick="printChallan(${item.id},
                                '${item.issueSeries}',
                                '${item.issueDate}',
                                '${item.issuedTo}',
                                '${item.status}')">Print</button>
                        </td>
                    </tr>
                `);
            });
        }
    });
}

function openModal() {
    clearForm();
    new bootstrap.Modal(document.getElementById('materialModal')).show();
}

function saveRecord() {

    $.post("MaterialIssue", {
        action: "insert",
        issueSeries: $("#issueSeries").val(),
        issueDate: $("#issueDate").val(),
        issuedTo: $("#issuedTo").val(),
        status: $("#status").val()
    }, function() {

        Swal.fire("Success", "Record saved!", "success");
        loadData();
        bootstrap.Modal.getInstance(
            document.getElementById('materialModal')).hide();
    });
}

function editRecord(id, series, date, issuedTo, status) {

    $("#editId").val(id);
    $("#issueSeries").val(series);
    $("#issueDate").val(date);
    $("#issuedTo").val(issuedTo);
    $("#status").val(status);

    $("#saveBtn").hide();
    $("#updateBtn").show();

    new bootstrap.Modal(document.getElementById('materialModal')).show();
}

function updateRecord() {

    $.post("MaterialIssue", {
        action: "update",
        id: $("#editId").val(),
        issueSeries: $("#issueSeries").val(),
        issueDate: $("#issueDate").val(),
        issuedTo: $("#issuedTo").val(),
        status: $("#status").val()
    }, function() {

        Swal.fire("Updated", "Record updated!", "success");
        loadData();
        bootstrap.Modal.getInstance(
            document.getElementById('materialModal')).hide();
    });
}

function deleteRecord(id) {

    Swal.fire({
        title: "Are you sure?",
        icon: "warning",
        showCancelButton: true
    }).then((result) => {

        if (result.isConfirmed) {

            $.post("MaterialIssue", {
                action: "delete",
                id: id
            }, function() {

                Swal.fire("Deleted", "Record deleted!", "success");
                loadData();
            });
        }
    });
}

function printChallan(id, series, date, issuedTo, status) {

    let rate = 1000;
    let qty = 1;
    let total = rate * qty;
    let gst = total * 0.18;
    let grandTotal = total + gst;

    let win = window.open('', '_blank');

    win.document.write(`
        <html>
        <head>
            <title>Delivery Challan</title>
            <style>
                body { font-family: Arial; padding: 20px; }
                h2 { text-align:center; }
                table { width:100%; border-collapse: collapse; margin-top:20px;}
                table, th, td { border:1px solid black; }
                th, td { padding:8px; text-align:center; }
                .right { text-align:right; }
            </style>
        </head>
        <body>

        <h2>Aerotech IT Solutions</h2>
        <h3 style="text-align:center;">DELIVERY CHALLAN</h3>

        <p><strong>Challan No:</strong> CH-${id}</p>
        <p><strong>Date:</strong> ${date}</p>
        <p><strong>Issued To:</strong> ${issuedTo}</p>

        <table>
            <tr>
                <th>Description</th>
                <th>Qty</th>
                <th>Rate</th>
                <th>Total</th>
            </tr>
            <tr>
                <td>${series}</td>
                <td>${qty}</td>
                <td>${rate}</td>
                <td>${total}</td>
            </tr>
        </table>

        <br>
        <p class="right">GST (18%): ₹${gst.toFixed(2)}</p>
        <p class="right"><strong>Grand Total: ₹${grandTotal.toFixed(2)}</strong></p>

        <br><br>
        <p>Receiver Signature: _____________________</p>

        <script>
            window.print();
        <\/script>

        </body>
        </html>
    `);

    win.document.close();
}

function clearForm() {
    $("#editId").val("");
    $("#issueSeries").val("");
    $("#issueDate").val("");
    $("#issuedTo").val("");
    $("#status").val("Open");
    $("#saveBtn").show();
    $("#updateBtn").hide();
}

$("#material_request_search").click(function() {
    loadData($("#searchMaterialRequest").val());
});

function nextPage() {
    currentPage++;
    loadData();
}

function prevPage() {
    if (currentPage > 1) {
        currentPage--;
        loadData();
    }
}

</script>

</body>
</html>
