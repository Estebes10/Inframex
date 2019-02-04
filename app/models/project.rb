class Project < ApplicationRecord
  has_many :user_projects, dependent:   :destroy
  has_many :users, through: :user_projects

  has_many :blogs, dependent:   :destroy
  has_many :concepts, dependent:   :destroy

  validates :name,
    presence: {
      with: true,
      message: "no puede estar vacío"
    },
    uniqueness: {
      with: true,
      message: "Ya existe un registro con este nombre"
    },
    length: {
      maximum: 256,
      message: "no puede ser mayor a 256 caracteres"
    }

  validates :code,
    length: {
      maximum: 32,
      message: "no puede ser mayor a 32 caracteres"
    },
    uniqueness: {
      with: true,
      message: "El código ya existe"
    }

  validates :address,
    length: {
      maximum: 256,
      message: "no puede ser mayor a 256 caracteres"
    }

  validates :client,
    length: {
      maximum: 256,
      message: "no puede ser mayor a 256 caracteres"
    }

  validates :status, inclusion: { in: [ true, false ] }
  
  def get_category_progress(category_id)
    total_concepts = concepts.where("category_id = #{category_id}").count
    progress = 0.0
    concepts.where("category_id = #{category_id}").each do |c|
      progress += c.get_progress
    end
    return (progress/total_concepts)
  end
  
  def get_category_progress_100(category_id)
    self.get_category_progress(category_id) * 100
  end
  
  def get_project_progress
    progress = 0.0
    num_categories = 0
    Category.all.each do |c|
      if !concepts.where(category_id: c.id).blank?
        num_categories += 1
        progress += self.get_category_progress(c.id)
      end
    end
    if num_categories
      return (progress / num_categories)
    else
      return 0
    end
  end
  
  def get_project_progress_100
    self.get_project_progress * 100
  end
  
end
