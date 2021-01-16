class SchoolClassesController < ApplicationController
    before_action :set_school_class, only:  [:show, :create, :edit, :update] 
    
    def index
        @school_classes = SchoolClass.all
    end

    def show
        
    end

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.create(class_params)
        if @school_class.save
            redirect_to school_class_path(@school_class)
        else
            render :new
        end
    end

    def edit

    end

    def update
        @school_class.update(class_params)
        if @school_class.save
            redirect_to school_class_path(@school_class)
        else
            render :edit
        end
    end

    private

    def set_school_class
        @school_class = SchoolClass.find_by(id: params[:id])
    end

    def class_params
        params.require(:school_class).permit(:title, :room_number)
    end
end
