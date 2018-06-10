import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  var element = document.getElementById("hoa-don-nhap-form")
  if (element != null) {

    var id = element.dataset.id
    var hoa_don_nhap = JSON.parse(element.dataset.hoaDonNhap)
    var cthd_nhaps_attributes = JSON.parse(element.dataset.cthdNhapsAttributes)
    cthd_nhaps_attributes.forEach(function(cthd) { cthd._destroy = null })
    hoa_don_nhap.cthd_nhaps_attributes = cthd_nhaps_attributes

    var app = new Vue({
      el: element,
      data: function() {
        return { id: id, hoa_don_nhap: hoa_don_nhap }
      },

      computed: {

        totalBill: function() {
          return this.hoa_don_nhap.cthd_nhaps_attributes.reduce(function(total, cthd_nhap){
            return total + cthd_nhap.thanh_tien;
          },0);
        },

        valid: function() {
          return hoa_don_nhap.ngaynhap != null && hoa_don_nhap.nha_cung_cap_id != null
        },
      },

      methods: {

        addCthd: function() {
          this.hoa_don_nhap.cthd_nhaps_attributes.push({
            id: null,
            hang_hoa_id: null,
            so_luong_nhap: "",
            gia_nhap: "",
            _destroy: null,
          })
        },

        removeCthd: function(index) {
          var cthd = this.hoa_don_nhap.cthd_nhaps_attributes[index]

          if (cthd.id == null) {
            this.hoa_don_nhap.cthd_nhaps_attributes.splice(index,1)
          } else {
            this.hoa_don_nhap.cthd_nhaps_attributes[index]._destroy = "1"
          }
        },

        undoRemove: function(index) {
          this.hoa_don_nhap.cthd_nhaps_attributes[index]._destroy = null
        },

        saveBill: function() {
          // Create a new bill
          if (this.id == "null") {
            this.$http.post('/admin/hoa_don_nhaps', { hoa_don_nhap: this.hoa_don_nhap }).then(response => {
              Turbolinks.visit(`/admin/hoa_don_nhaps/`)
            }, response => {
              console.log(response)
            })
          // Edit an existing bill
          } else {
            this.$http.put(`/admin/hoa_don_nhaps/${this.id}`, { hoa_don_nhap: this.hoa_don_nhap }).then(response => {
              Turbolinks.visit(`/admin/hoa_don_nhaps/`)
            }, response => {
              console.log(response)
            })
          }
        },

        formatPrice(value) {
          let val = (value/1).toFixed(0).replace('.', ',')
          return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
        },
      },
    })
  }
})