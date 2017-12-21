// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap.min
//= require owl.carousel.min
//= require cocoon
//= require bootstrap-wysihtml5
//= require datatables.min
//= require responsive.bootstrap.min
//= require_tree .

$(document).on('turbolinks:load', function() {
  $("#edit-password-checkbox").change(function(){
		console.log("!!")
		if (this.checked) 
			$("#edit-password").fadeIn();
		else
			$("#edit-password").fadeOut();
	});

  	setTimeout(function(){
  		$(".owl-carousel").owlCarousel({
			loop: true,
			autoWidth: true,
			autoHeight: true,
			lazyLoad: true,
			dots: true,
			autoplay:true,
			stopOnHover : true,
		    autoplayTimeout:5000,
		    autoplayHoverPause:true,
		    autoplaySpeed:1500,
		});

		$('#don_hang_table').DataTable({
    	});

    	$('.data-tables').DataTable({
			"fixedHeader": true,
			"ordering": false,
			"language": {
	            "lengthMenu": "Hiển thị _MENU_ sản phẩm mỗi trang",
	            "zeroRecords": "Chưa có dữ liệu",
	            "info": "Showing page _PAGE_ of _PAGES_",
	            "infoEmpty": "Không tìm thấy dữ liệu",
	            "infoFiltered": "(Lọc ra từ _MAX_ dữ liệu)",
	            "search": "Tìm kiếm:",
	            "info": "Trang _PAGE_ / _PAGES_",
	            "paginate": {
			        "first":      "Đầu",
			        "last":       "Cuối",
			        "next":       "Tiếp theo",
			        "previous":   "Quay lại"
			    },
        	}
    	});
  	},100);

  	$('.wysihtml5').each(function(i, elem) {
      $(elem).wysihtml5({
      	toolbar:{ "fa": true }
      });
    });

});