module ApplicationHelper

	def form_group_tag(errors, &block)
		if errors.any?
			content_tag :div, capture(&block), class: 'form-group has-error'
		else
			content_tag :div, capture(&block), class: 'form-group'
		end
	end

	def markdown(text)
		renderer = Redcarpet::Render::HTML.new
		extensions = { fenced_code_blocks: true, tables: true }
		redcarpet = Redcarpet::Markdown.new(renderer, extensions)
		(redcarpet.render text).html_safe
	end

	def wiki_collaborators
		users = User.all
		collab = []
		users.each do |u|
			collab << u unless u.id == current_user.id
		end	
		collab
	end

	def collab_wiki_owner(wiki)
		wiki_owner = ""
		unless wiki.user_id == nil
			u_name = User.find(wiki.user_id).name
			wiki_owner = "(#{u_name}'s wiki)"  
		end	
		wiki_owner
	end

	def collab_area(&block)
		content = with_output_buffer(&block)
		content_tag(:div, content)
	end
end
