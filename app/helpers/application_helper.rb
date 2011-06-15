module ApplicationHelper


    def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
  end

  
  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
  
  def stylesheet(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end
  
  def select_tag_for_filter(model, nvpairs, params)
  options = { :query => params[:query] }
  _url = url_for(eval("#{model}_url(options)"))
  _html = %{<label for="show">Display:</label>}
  _html << %{<select name="show" id="show"}
  _html << %{onchange="window.location='#{_url}' + '?show=' + this.value">}
  nvpairs.each do |pair|
    _html << %{<option value="#{pair[:scope]}"}
    if params[:show] == pair[:scope] || ((params[:show].nil? || 
params[:show].empty?) && pair[:scope] == "all")
      _html << %{ selected="selected"}
    end
    _html << %{>#{pair[:label]}}
    _html << %{</option>}
  end
  _html << %{</select>}
  _html.html_safe
end

end
