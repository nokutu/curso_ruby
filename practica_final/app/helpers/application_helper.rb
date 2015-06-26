module ApplicationHelper

  HASHIDS = Hashids.new("Password")

  def new_line i, selected = 0, amount = nil, hours = nil
    ret = ""
    ret += "<tr id = line-#{i}><td>"
    ret += select_tag i.to_s + '[product_id]', options_for_select(products_array, selected: selected), id: "select-#{i}"
    ret += "</td><td>"
    ret += text_field i, :amount, placeholder: '0', id: "amount-#{i}", value: amount
    ret += "</td><td>"
    ret += text_field i, :hours, placeholder: '0', id: "hours-#{i}", value: hours
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

  def encode var
    ApplicationHelper::HASHIDS.encode(var)
  end

  def decode var
    ApplicationHelper::HASHIDS.decode(var)
  end

  def wrong text
    ret = ""
    ret += "<font color='red' id='wrong_code' style='float:right'>Wrong #{text}</font>"
    ret.html_safe
  end
end
