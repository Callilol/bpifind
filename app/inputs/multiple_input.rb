class MultipleInput < SimpleForm::Inputs::Base
  def input
		test = ['test', 'test']
		template.content_tag :div, :class => 'input-append pull-left' do
			multiple_field = @builder.select(attribute_name, "<option>1</option><option>2</option><option>3</option><option>4</option>".html_safe, :multiple => "multiple")
		end
  end
end
