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

  def sum_all_concepts_weight
    concepts.sum(:weight)
  end
  
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
    total_weigth = self.sum_all_concepts_weight
    progress = 0.0
    concepts.each do |c|
      progress += (c.get_progress * c.weight)/total_weigth
    end
    return progress
  end
  
  def get_project_progress_100
    self.get_project_progress * 100
  end
  
end
