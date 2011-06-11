module ApplicationHelper

def ae_some_html(s) 
    # converting newlines 
    s.gsub!(/\r\n?/, "\n") 
 
    # escaping HTML to entities 
    s = s.to_s.gsub('&', '&amp;').gsub('<', '&lt;').gsub('>', '&gt;') 
 
    # blockquote tag support 
    s.gsub!(/\n?&lt;blockquote&gt;\n*(.+?)\n*&lt;\/blockquote&gt;/im, "<blockquote>\\1</blockquote>") 
 
    # other tags: b, i, em, strong, u 
    %w(b i em strong u).each { |x|
         s.gsub!(Regexp.new('&lt;(' + x + ')&gt;(.+?)&lt;/('+x+')&gt;',
                 Regexp::MULTILINE|Regexp::IGNORECASE), 
                 "<\\1>\\2</\\1>") 
        } 
 
    # A tag support 
    # href="" attribute auto-adds http:// 
    s = s.gsub(/&lt;a.+?href\s*=\s*['"](.+?)["'].*?&gt;(.+?)&lt;\/a&gt;/im) { |x|
            '<a href="' + ($1.index('://') ? $1 : 'http://'+$1) + "\">" + $2 + "</a>" 
          } 
 
    # replacing newlines to <br> ans <p> tags 
    # wrapping text into paragraph 
    s = "<p>" + s.gsub(/\n\n+/, "</p>\n\n<p>").
            gsub(/([^\n]\n)(?=[^\n])/, '\1<br />') + "</p>" 
 
    s      
end 









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
  _html = %{<label for="show">Show:</label><br />}
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
