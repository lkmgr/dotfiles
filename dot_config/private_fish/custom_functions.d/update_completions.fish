function update_completions
    if type -q chezmoi
        chezmoi completion fish --output ~/.config/fish/completions/chezmoi.fish
    end
    if type -q flux
        flux completion fish > ~/.config/fish/completions/flux.fish
    end
    if type -q helm
        helm completion fish > ~/.config/fish/completions/helm.fish
    end
    if type -q kustomize
        kustomize completion fish > ~/.config/fish/completions/kustomize.fish
    end
    if type -q kubectl
        kubectl completion fish > ~/.config/fish/completions/kubectl.fish
    end
    if type -q stern
        stern --completion fish > ~/.config/fish/completions/stern.fish
    end

    # velero completion fish > ~/.config/fish/completions/velero.fish
end
