#!/bin/bash

# 1. Process root level configuration markdown files
for file in CHANGELOG.md DATA_DICTIONARY.md README.md ZIP_SCHEMA.md validate_dataset.py; do
    if [ -f "$file" ]; then
        echo "Processing Root File: $file"
        git add "$file"
        git commit -m "Initialize structural configuration: $(basename "$file")"
        git push origin main
    fi
done

# 2. Process the entire Knowledge Base (kb/) directory file by file
for file in kb/*; do
    if [ -f "$file" ]; then
        echo "Processing KB Document: $file"
        git add "$file"
        git commit -m "Ingest domain core documentation: $(basename "$file")"
        git push origin main
    fi
done

# 3. Process the Dataset (data/) directory file by file
for file in data/*; do
    if [ -f "$file" ]; then
        echo "Processing Dataset File: $file"
        git add "$file"
        git commit -m "Seed production tracking matrices: $(basename "$file")"
        git push origin main
    fi
done

# 4. Process Practice files
for file in practice/*; do
    if [ -f "$file" ]; then
        echo "Processing Practice Evaluation: $file"
        git add "$file"
        git commit -m "Deploy evaluation validation module: $(basename "$file")"
        git push origin main
    fi
done

# 5. Process functional utilities (tools/)
for file in tools/*; do
    if [ -f "$file" ]; then
        echo "Processing Tool Module: $file"
        git add "$file"
        git commit -m "Integrate agent function orchestrator: $(basename "$file")"
        git push origin main
    fi
done

echo "=========================================================="
echo "Massive sequence complete! Check your updated contribution graph."

