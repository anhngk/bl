inputValidation = ->
  $('#hoa-don-nhap-form').validate
    rules:
      'ngaynhap':
        required: true
      'nha_cung_cap':
        required: true

@HoaDonNhap =
  init: ->
    $ ->
      inputValidation()