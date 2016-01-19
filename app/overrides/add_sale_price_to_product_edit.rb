Deface::Override.new(:virtual_path => 'spree/admin/products/_form',
  :name => 'add_sale_price_to_product_edit',
  :insert_after => "erb[loud]:contains('text_field :price')",
  :text => "
      <div data-hook='admin_product_sale_price'>
        <%= f.field_container :sale_price, class: ['form-group'] do %>
          <%= f.label :sale_price, Spree.t(:sale_price)%>
          <%= f.text_field :sale_price, value: number_to_currency(@product.sale_price, unit: ''), class: 'form-control', disabled: (cannot? :update, Spree::Price) %>
          <%= f.error_message_on :sale_price %>
        <% end %>
      </div>

      <div data-hook='admin_product_sale_start_date'>
        <%= f.field_container :sale_start_date, class: ['form-group'] do %>
          <%= f.label :sale_start_date, Spree.t(:sale_start_date)%>
          <%= f.text_field :sale_start_date, value: datepicker_field_value(@product.sale_start_date), class: 'datepicker form-control' %>
          <%= f.error_message_on :sale_start_date %>
        <% end %>
      </div>

      <div data-hook='admin_product_sale_end_date'>
        <%= f.field_container :sale_end_date, class: ['form-group'] do %>
          <%= f.label :sale_end_date, Spree.t(:sale_end_date)%>
          <%= f.text_field :sale_end_date, value: datepicker_field_value(@product.sale_end_date), class: 'datepicker form-control' %>
          <%= f.error_message_on :sale_end_date %>
        <% end %>
      </div>

  ")
