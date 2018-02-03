require_relative 'sections'

class AddTaskPage < SitePrism::Section
    element :input_name, 'input[name=title]'
    element :input_date, 'input[name=dueDate]'
    element :input_tags, 'div[class*=tagsinput] input'
    element :submit_button, '#form-submit-button'

    def save(title, date, tags)
        self.input_name.set title
        self.input_date.set date

        tags.each do |t|
            self.input_tags.set t['tag']
            self.input_tags.send_keys :tab
        end
        
        self.submit_button.click
    end
end

class TasksPage < SitePrism::Page
    section :nav, Navbar, '.navbar'
    section :form, AddTaskPage, '#add-task-view'

    element :tasks_view, '#tasks-view'
    element :page_title, '.header-title h3'
    element :add_new, '#insert-button'
    element :search_input, 'input[name=search]'
    element :search_button, '#search-button'
    
    element :delete_yes, '.modal-dialog .btn-danger'
    element :delete_no, '.modal-dialog .btn-default'

    elements :list, 'table tbody tr'
    element :tbody, 'table tbody'

    def request_delete(title)
        res = self.tbody.find('tr', text: title)
        res.find('#delete-button').click
    end

    def search(title)
        self.search_input.set title
        self.search_button.click
    end


end