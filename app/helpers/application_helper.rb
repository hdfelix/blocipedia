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
end
