module ActiveScaffold::Actions
  module Nested

    def self.included(base)
      super
      base.active_scaffold_config.list.columns.each do |column|
        column.set_link('nested', :parameters => {:associations => column.name.to_sym}) if column.association and column.link.nil? and [:has_and_belongs_to_many, :has_many].include?(column.association.macro)
      end
      base.before_filter :include_join_table_actions
    end

    def nested
      return unless insulate { do_nested }

      respond_to do |type|
        type.html { render :partial => 'nested', :layout => true }
        type.js { render :partial => 'nested', :layout => false }
      end
    end

    protected

    def do_nested
      @record = find_if_allowed(params[:id], 'nested')
    end

    def include_join_table_actions
      if active_scaffold_options[:association_reverse]
        active_scaffold_config.create.columns.exclude active_scaffold_options[:association_reverse]
        active_scaffold_config.update.columns.exclude active_scaffold_options[:association_reverse]
        active_scaffold_config.list.columns.exclude active_scaffold_options[:association_reverse]
      end
      if active_scaffold_options[:association_macro] == :has_and_belongs_to_many
        active_scaffold_config.action_links.add('new_existing', :label => _('CREATE_FROM_EXISTING'), :type => :table, :security_method => :add_existing_authorized?) 
        active_scaffold_config.list.columns.exclude active_scaffold_options[:association]
        self.class.module_eval do
          include ActiveScaffold::Actions::Nested::ChildMethods
        end
      end
    end

  end
end

module ActiveScaffold::Actions::Nested
  module ChildMethods
  
    def self.included(base)
      super
      base.verify :method => :post,
                  :only => :add_existing,
                  :redirect_to => { :action => :index }
    end
    
    def new_existing
      return unless insulate { do_new }

#TODO 2007-03-15 (EJM) Level=0 - Create on a hm :through is not working
#TODO 2007-03-14 (EJM) Level=1 - Can we share create_form.rhtml and create_form.rjs somehow?
#TODO 2007-03-14 (EJM) Level=0 - tie in do_destroy_association
#FIXME 2007-03-14 (EJM) Level=0 - Fix rjs errors - :nested cancel's sometimes go somewhere unexpected

      respond_to do |type|
        type.html do
          if successful?
            render(:action => 'add_existing_form', :layout => true)
          else
            return_to_main
          end
        end
        type.js do
          render(:partial => 'add_existing_form', :layout => false)
        end
      end
    end

    def add_existing
      return unless insulate { do_add_existing }

      respond_to do |type|
        type.html do
          if successful?
            flash[:info] = _('CREATED %s', @record.to_label)
            return_to_main
          else
            render(:action => 'add_existing_form', :layout => true)
          end
        end
        type.js do
          if successful?
            render :action => 'add_existing', :layout => false
          else
            render :action => 'form_messages.rjs', :layout => false
          end
        end
        type.xml { render :xml => response_object.to_xml, :content_type => Mime::XML, :status => response_status }
        type.json { render :text => response_object.to_json, :content_type => Mime::JSON, :status => response_status }
        type.yaml { render :text => response_object.to_yaml, :content_type => Mime::YAML, :status => response_status }
      end
    end
  
    protected

    def after_create_save(record)
      if active_scaffold_options[:association_macro] == :has_and_belongs_to_many
        params[:associated_id] = record
        do_add_existing 
      end
    end
    
    def active_scaffold_parent_association
      id = active_scaffold_constraints.find {|k, v| k.to_s.include?(active_scaffold_options[:association])}
      return active_scaffold_options[:parent_model], id[1], active_scaffold_options[:association]
    end

    def do_new
      @record = active_scaffold_config.model.new
    end

    def do_add_existing
      #TODO 2007-03-14 (EJM) Level=0 - What to do about security?
      parent_model, id, association = active_scaffold_parent_association
      parent_record = find_if_allowed(id, 'update', parent_model)
      @record = active_scaffold_config.model.find(params[:associated_id])
      parent_record.send(association) << @record
      parent_record.save
    end
    
    def do_destroy_association
      #TODO 2007-03-14 (EJM) Level=0 - What to do about security?
      parent_model, id, association = active_scaffold_parent_association
      parent_record = find_if_allowed(id, 'update', parent_model)
      @record = parent_record.send("roles").find(params[:id]) 
      @record.destroy
    end
    
  end
end