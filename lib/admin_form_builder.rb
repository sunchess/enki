class AdminFormBuilder < ActionView::Helpers::FormBuilder
  def wrap(&proc)
    @template.concat(<<-EOS, @proc.binding)
      <table class="form">
        #{@template.capture(self, &proc)}
      </table>  
    EOS
  end

  def break(title)
    "<tr class='breaker btop'><td colspan='2'>#{title}</td></tr>"
  end

  def text_field(attribute, options = {})
    wrap_field(attribute, super)
  end

  def text_area(attribute, options = {})
    wrap_field(attribute, super)
  end

  def submit_with_cancel(cancel_path)
    ret = <<-EOS    
        <tr><td colspan="2">
          <div class="submit_area">
            #{@template.submit_tag((@object.new_record? ? 'Create' : 'Edit') + ' ' + @object_name, :class => 'submit')}
            or 
            #{@template.link_to("cancel and return to #{@object_name} list", cancel_path)}
          </div>
        </td>
        </tr>
    EOS
  end

  protected

  def wrap_field(attribute, field)
    ret = <<-EOS
      <tr>
        <td class="labels"><label for=''>#{attribute.titleize}</label></td>
        <td class="fields">#{field}</td>
      </tr>  
    EOS
  end
end