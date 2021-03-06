class TemplatesController < ApplicationController
  before_action :set_template, only: [:edit, :update, :destroy]

  def index
    @templates = Template.order_by_updated_at
  end

  def new
    @template = Template.new
  end

  def edit
  end

  def create
    @template = Template.new template_params

    if @template.save
      redirect_to templates_url, notice: "Template #{@template.name} was successfully created"
    else
      render :new
    end
  end

  def update
    if @template.update template_params
      redirect_to templates_url, notice: "Template #{@template.name} was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @template.destroy
    redirect_to templates_url
  end

  private

  def set_template
    @template = Template.find params[:id]
  end

  def template_params
    params.require(:template).permit(:kind, :name, :title, :body)
  end
end
