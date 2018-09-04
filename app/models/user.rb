class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  require 'cpf_cnpj'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :occurrences
  has_one :avatar
  has_many :notifications
  has_many :comments

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :postal_code, presence: true
  validates :phone, presence: true
  validate  :valid_cpf

  private

  def valid_cpf
    unless CPF.valid?(cpf)
      errors.add(:cpf, 'CPF Inválido')
    end
  end
end
