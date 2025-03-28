#!/usr/bin/env python3
import random

themes = [
    "capitalism", "Pokémon existentialism", "anime regrets", "vending machines",
    "NFT funerals", "haunted mall food courts", "late-stage nostalgia",
    "digital soul compression", "waifus in denial", "post-human intimacy"
]

templates = [
    "A {theme} ritual disguised as a children's show",
    "Pikachu reenacting the fall of Rome in {theme} lighting",
    "Ash realizing the gym badges were metaphors for {theme}",
    "A vending machine filled with {theme}",
    "Team Rocket unionizes against {theme}",
    "A cursed TED Talk titled '{theme}: A Love Story'",
    "Anime girl lost in recursive {theme}",
]

def generate_prompt():
    theme = random.choice(themes)
    template = random.choice(templates)
    return template.format(theme=theme)

if __name__ == "__main__":
    print("🎲 " + generate_prompt())
