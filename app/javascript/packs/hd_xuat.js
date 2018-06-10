import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  var element = document.getElementById("hoa-don-xuat-form")
  if (element != null) {

    var id = element.dataset.id
    var hoa_don_xuat = JSON.parse(element.dataset.hoaDonXuat)
    var cthd_xuats_attributes = JSON.parse(element.dataset.cthdXuatsAttributes)
    cthd_xuats_attributes.forEach(function(cthd) { cthd._destroy = null })
    hoa_don_xuat.cthd_xuats_attributes = cthd_xuats_attributes

    var app = new Vue({
      el: element,
      data: function() {
        return { id: id, hoa_don_xuat: hoa_don_xuat }
      },

      computed: {
        totalBill: function() {
          return this.hoa_don_xuat.cthd_xuats_attributes.reduce(function(total, cthd_xuat){
            return total + cthd_xuat.thanh_tien;
          },0);
        },

        valid: function() {
          return hoa_don_xuat.ngay_xuat != null && hoa_don_xuat.khach_hang_id != null
        },
      },

      methods: {

        addCthd: function() {
          this.hoa_don_xuat.cthd_xuats_attributes.push({
            id: null,
            hang_hoa_id: null,
            so_luong_xuat: "",
            gia_ban: "",
            _destroy: null,
          })
        },

        removeCthd: function(index) {
          var cthd = this.hoa_don_xuat.cthd_xuats_attributes[index]

          if (cthd.id == null) {
            this.hoa_don_xuat.cthd_xuats_attributes.splice(index,1)
          } else {
            this.hoa_don_xuat.cthd_xuats_attributes[index]._destroy = "1"
          }
        },

        undoRemove: function(index) {
          this.hoa_don_xuat.cthd_xuats_attributes[index]._destroy = null
        },

        saveBill: function() {
          // Create a new bill
          if (this.id == "null") {
            this.$http.post('/admin/hoa_don_xuats', { hoa_don_xuat: this.hoa_don_xuat }).then(response => {
              Turbolinks.visit(`/admin/hoa_don_xuats/`)
            }, response => {
              console.log(response)
            })
          // Edit an existing bill
          } else {
            this.$http.put(`/admin/hoa_don_xuats/${this.id}`, { hoa_don_xuat: this.hoa_don_xuat }).then(response => {
              Turbolinks.visit(`/admin/hoa_don_xuats/`)
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