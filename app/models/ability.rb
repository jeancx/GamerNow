class Ability
  include CanCan::Ability

  def initialize(user)

    # Define abilities for the passed in user here. For example:
    #
    # here are :read, :create, :update and :destroy.
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :create, :read, :update, :to => :cru
    alias_action :create, :read, :to => :cr

    user ||= User.new # guest user (not logged in)

    can :read, :HomeController
    can :read, :PostsController
    can :read, :CompaniesController
    can :read, :GamesController
    can :read, :PlatformsController

    if user.has_role? :admin

      can :manage, :all

    elsif user.has_role? :editor

      can :cru, Game
      can :cru, Image
      can :cru, Video
      can :cru, Post
      can :cru, Slide

      can :crud, PostComment
      can :crud, VideoComment
      can :crud, ImageComment

    elsif user.has_role? :author

      can :read, Category

      can :cr, Game
      can :cr, Platform
      can :cr, Image
      can :cr, Video, :user_id => user.id
      can :cr, Post, :user_id => user.id
      can :cr, Feature

    elsif user.has_role? :user

      can :cr, PostComment
      can :cr, VideoComment
      can :cr, ImageComment
      can [:update, :delete], PostComment
      can [:update, :delete], VideoComment
      can [:update, :delete], ImageComment

    end

  end
end
