class BookingPolicy < ApplicationPolicy
  def create?
    user
  end

  def update?
    record.user == user
  end
  
  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
      # O que vai ser mostrado para os usuários em geral:
      # scope.where(user: user)
    end
  end
end
