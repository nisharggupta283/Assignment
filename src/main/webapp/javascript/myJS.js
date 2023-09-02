var pageNo = 1;

function callChangeDiv(id, flag) {
	if (flag == 2) {
		$('#see-entire-list').hide();
		$('#see-entire-list').removeClass('active');
		$('#see-single-list').show("slow");
		$(`#${id}`).addClass('active');
	} else if (flag == 1) {
		$('#see-single-list').hide();
		$('#see-entire-list').show("slow");
		$(`#${id}`).addClass('active');
		$('#see-single-list').removeClass('active');
	}
}

function callNextPage() {
	pageNo++;
	callAjexMethod();
	if (pageNo > 1)
		$('#previous').removeAttr('class').attr('class', 'page-item');
	else
		$("#previous").attr("class", 'disabled');
}
function callPrevPage() {
	pageNo--;
	callAjexMethod();
	if (pageNo > 1)
		$('#previous').removeAttr('class').attr('class', 'page-item');
	else
		$("#previous").attr("class", 'disabled page-item');
}
function populateData(data) {
	$('#to-delete').remove();
	tbody = $('<tbody/>', { id: 'to-delete' });

	let count = '';
	for (let i = 0; i < data.length; i++) {
		count = count == 'active-row' ? '' : 'active-row';
		tr = $('<tr/>', { class: count });
		for (x of data[i]) {
			tr.append($('<td/>', { text: x }));
		}
		tbody.append(tr);
	}
	$('#to-append').append(tbody);
	$('#page-no').text('Page No:' + pageNo);
}
function callAjexMethod() {
	$.ajax({
		type: "GET",
		url: "/csv/csvdata?id=" + id + "&pageNo=" + pageNo + "&flag=" + 1,
		dataType: "JSON",
		cache: false,
		async: false,
		error: function(err) {
			alert('Error occured see console to check more');
			console.log(err);
		},
		success: function(data) {
			console.log(data);
			data = JSON.parse(JSON.stringify(data));
			populateData(data);
		},
	});
}

function goToPage(id) {
	location.href = '/csv/csvdata?id=' + id + '&random=' + Math.random();
}

var callAutoFillMethod = function(e, val = '') {

	let filter = e.value;
	if (val)
		filter = val;

	if (filter && filter.length >= 2) {
		$.ajax({
			type: "GET",
			url: "/Mypcot/AjexServletS?mode=likeDetails&select=" + $('#single-filter').val() + "&input=" + filter,
			dataType: "JSON",
			cache: false,
			async: false,
			error: function(err) {
				alert('Error occured see console to check more');
				console.log(err);
			},
			success: function(data) {
				console.log(data);
				data = JSON.parse(JSON.stringify(data));
				recordAutoFill(data);
			},
		});
	}
}
function recordAutoFill(data) {
	$("#filter-input2").autocomplete({
		source: data,
		select: callAfterAutoSelection,
	});
}
function callAfterAutoSelection(event, ui) {
	console.log(event.target);
	console.log(ui.item.value);
	getSingleUSerDate(ui.item.value);
}
var getSingleUSerDate = function(val) {

	val = val.substring(val.indexOf('{') + 1, val.lastIndexOf('}'));
	$.ajax({
		type: "POST",
		url: "/Mypcot/AjexServletS?mode=afterSelect&selected-value=" + val,
		dataType: "JSON",
		cache: false,
		async: false,
		error: function(err) {
			alert('Error occured see console to check more');
			console.log(err);
		},
		success: function(data) {
			console.log(data);
			data = JSON.parse(JSON.stringify(data));
			$('#DOB').text(data.DOB);
			$('#PHONE').text(data.PHONE);
			$('#GENDER').text(data.GENDER);
			$('#ID').text(data.ID);
			$('#NAME').text(data.NAME);
			$('#EMAIL').text(data.EMAIL);
		}
	});
}
var callDelete = function(e) {
	$.ajax({
		type: "POST",
		url: "/Mypcot/AjexServletS?mode=deleteOne&id=" + e.id,
		dataType: "JSON",
		cache: false,
		async: false,
		error: function(err) {
			alert('Error occured see console to check more');
			console.log(err);
		},
		success: function(data) {
			console.log(data);
			$(`#tr${e.id}`).remove();
		}
	});
}