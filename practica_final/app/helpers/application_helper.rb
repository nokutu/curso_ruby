module ApplicationHelper
  def new_line(i)
    ret = ""
    ret += "<tr><td>"
    ret += select_tag i.to_s + '[product_id]', options_for_select(products_array)
    ret += "</td><td>"
    ret += text_field i, :amount, placeholder: '0'
    ret += "</td><td>"
    ret += text_field i, :hours, placeholder: '0'
    ret += "</td><td style='vertical-align: middle'>"
    ret += "<a class='btn btn-danger' href='/deleteline/#{i}'>Delete<i class='glyphicon glyphicon-trash'></i></a></td></tr>"
    escape_javascript ret.html_safe
  end

  def products_array
    @products = Product.all.order(:name)
    arr = [["Select a product", nil]]
    @products.each do |product|
      arr += [[product.name, product.id]]
    end
    arr
  end
end
