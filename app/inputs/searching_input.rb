class SearchingInput < SimpleForm::Inputs::Base
  def input
		template.content_tag :div, :class => 'input-append pull-left' do
			search_field = @builder.text_field(attribute_name, input_html_options.merge(:class => 'span12 collection_search', :value => ''))
			search_field += template.content_tag :i, '', :class => 'add-on icon-search'
		end
  end
end
