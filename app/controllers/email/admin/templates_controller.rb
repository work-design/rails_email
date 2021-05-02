module Email
  class Admin::TemplatesController < Admin::BaseController
    before_action :set_template, only: [:show, :edit, :update, :destroy]

    def index
      q_params = {}
      q_params.merge! default_params

      @templates = Template.default_where(q_params).page(params[:page])
    end

    def new
      @template = Template.new
    end

    def create
      @template = Template.new(template_params)

      unless @template.save
        render :new, locals: { model: @template }, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
      @template.assign_attributes(template_params)

      unless @template.save
        render :edit, locals: { model: @template }, status: :unprocessable_entity
      end
    end

    def destroy
      @template.destroy
    end

    private
    def set_template
      @template = Template.find(params[:id])
    end

    def template_params
      params.fetch(:template, {}).permit(
        :contact,
        :subject,
        :honorific,
        :body,
        :order_prefix,
        :cover
      )
    end

  end
end
