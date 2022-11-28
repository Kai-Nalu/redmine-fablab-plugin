# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
resources :workflow_prompts do
    member do
        get 'transition'
        post 'transition', to: 'workflow_prompts#transition_submit'
    end
end

# post '/transition_prompt', to: 'workflow_prompts#transition_prompt', as: 'transition_prompt'
