import json

# Load the JSON data from a file
with open("plant_traits.json", "r") as f:
    plant_data = json.load(f)

# Function to get traits of a specific plant
def get_traits(plant_name):
    traits = plant_data.get(plant_name)
    if traits is None:
        print(f"❌ Plant '{plant_name}' not found.")
        return []
    return traits

# Example usage
plant_name = "Strawberry"
traits = get_traits(plant_name)
print(f"🌱 Traits of {plant_name}: {traits}")

# Optional: print total number of plants
print(f"🌿 Total plants: {len(plant_data)}")
