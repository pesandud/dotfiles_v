#!/bin/bash

# Target directory: all top-level dirs in ~
for dir in ~/*/; do
    
    # Strip trailing slash for comparison
    dirname=$(basename "$dir")
    
    # Skip the ~/git directory
    if [ "$dirname" == "git" ]; then
        continue
    fi

    # Check if it's a git repo
    if [ -d "${dir}.git" ]; then
        cd "$dir" || continue

        # Get current origin URL
        old_url=$(git remote get-url origin 2>/dev/null)

        if [[ -n "$old_url" ]]; then
            # Replaces the owner/org part of the GitHub URL with 'pesandud'
            # Works for git@github.com:OLDUSER/repo.git AND https://github.com/OLDUSER/repo.git
            new_url=$(echo "$old_url" | sed -E 's|github\.com[:/][^/]+|github.com:pesandud|; s|github\.com:pesandud/|github.com/pesandud/|' | sed -E 's|github\.com:pesandud|github.com/pesandud|' )
            
            # Simplified regex for standard GitHub patterns
            new_url=$(echo "$old_url" | sed -E 's|(github\.com[:/])[^/]+|\1pesandud|')

            if [ "$old_url" != "$new_url" ]; then
                git remote set-url origin "$new_url"
                echo "✅ Updated: $dirname"
                echo "   $old_url -> $new_url"
            fi
        fi
        
        cd - > /dev/null || exit
    fi
done
