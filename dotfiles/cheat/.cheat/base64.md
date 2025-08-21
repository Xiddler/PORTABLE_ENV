# FRONTMATTER
Opened 2025-06-14


# base64 
# =============================================================================================================

                                                                                                                               donagh@donagh-satellitep50c
❯ echo "Donagh McCarthy" > floot.txt

❯ cat floot.txt
Donagh McCarthy

Encode plaintext file
❯ base64 floot.txt > enfloot.txt

❯ cat enfloot.txt
RG9uYWdoIE1jQ2FydGh5Cg==

Decode encoded file
❯ base64 -d enfloot.txt
Donagh McCarthy



ENCODE AN IMAGE

❯ base64 bird.png > bird_64.txt



# =============================================================================================================
# FOOTNOTES

