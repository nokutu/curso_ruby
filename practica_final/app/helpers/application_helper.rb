module ApplicationHelper
  def new_line(i)
    ret = ""
    ret += "<tr id = line-#{i}><td>"
    ret += select_tag i.to_s + '[product_id]', options_for_select(products_array), id: "select-#{i}"
    ret += "</td><td>"
    ret += text_field i, :amount, placeholder: '0', id: "amount-#{i}"
    ret += "</td><td>"
    ret += text_field i, :hours, placeholder: '0', id: "hours-#{i}"
    ret += "</td><td style='vertical-align: middle'>"
    ret += (link_to "Delete<i class='glyphicon glyphicon-trash'></i>".html_safe, "/deleteline/#{i}",
                                      remote:true, method: 'delete', class: 'btn btn-danger').html_safe
    ret += "</td></tr>"
    escape_javascript ret.html_safe
  end

  def products_array
    @products = Product.all.order(:name)
    arr = [["Select a product", 0]]
    @products.each do |product|
      arr += [[product.name, product.id]]
    end
    arr
  end
end
