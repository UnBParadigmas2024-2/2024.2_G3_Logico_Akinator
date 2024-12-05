import requests

url = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=151"
response = requests.get(url).json()

entidades = []
tipos = []
alturas = []
pesos = []
cores = []
habitats = []
formatos = []


for pokemon in response["results"]:
    name = pokemon["name"]
    entidades.append(f"entidade({name}).\n")

    details = requests.get(pokemon["url"]).json()

    for type_info in details["types"]:
        tipos.append(f"tipo({name}, {type_info['type']['name']}).\n")
    
    alturas.append(f"altura({name}, {details['height'] / 10}).\n")  # Converter para metros
    
    pesos.append(f"peso({name}, {details['weight'] / 10}).\n")  # Converter para quilogramas

    
    species_url = details["species"]["url"]
    species_info = requests.get(species_url).json()
    
    cor = species_info.get("color", {}).get("name", "unknown")
    cores.append(f"cor({name}, {cor}).\n")
    
    habitat = species_info.get("habitat", {}).get("name", "unknown")
    habitats.append(f"habitat({name}, {habitat}).\n")
    
    formato = species_info.get("shape", {}).get("name", "unknown")
    formatos.append(f"formato({name}, {formato}).\n")

with open("knowledge_base.pl", "w") as file:
    file.write("% Entidades\n")
    file.writelines(entidades) 
    file.write("\n")
    
    file.write("% Tipos\n")
    file.writelines(tipos)     
    file.write("\n")
    
    file.write("% Altura\n")
    file.writelines(alturas)   
    file.write("\n")
    
    file.write("% Peso\n")
    file.writelines(pesos)     
    file.write("\n")
    
    file.write("% Cores\n")
    file.writelines(cores)      
    file.write("\n")
    
    file.write("% Habitats\n")
    file.writelines(habitats)   
    file.write("\n")
    
    file.write("% Formatos\n")
    file.writelines(formatos)   
