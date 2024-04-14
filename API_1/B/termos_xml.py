import json
import lxml.etree as ET
import os

def create_xml_element(parent, termos):
    for termo in termos:
        node = ET.SubElement(parent, "node")
        node.set("id", str(termo["idTermo"]))
        node.set("label", termo["termo"])
        
        # Adiciona as categorias
        for categoria in termo["categorias"]:
            cat_node = ET.SubElement(node, "node")
            cat_node.set("id", categoria["codigoCategoria"])
            cat_node.set("label", categoria["descricao"])
            
            # Adiciona a categoria pai, se existir
            if categoria.get("categoriaPai"):
                cat_parent = ET.SubElement(cat_node, "node")
                cat_parent.set("id", categoria["categoriaPai"]["codigoCategoria"])
                cat_parent.set("label", categoria["categoriaPai"]["descricao"])
                isComposedBy = ET.SubElement(cat_node, "isComposedBy")
                isComposedBy.append(cat_parent)
        
        # Adiciona os relacionamentos
        for relacionamento in termo["relacionamentos"]:
            rel_node = ET.SubElement(node, "node")
            rel_node.set("id", str(relacionamento["termoRelacionado"]["idTermo"]))
            rel_node.set("label", relacionamento["termoRelacionado"]["termo"])
            isRelatedTo = ET.SubElement(rel_node, "isRelatedTo")
            isRelatedTo.text = relacionamento["tipoRelacionamento"]["descricao"]
        
        # Adiciona notas, se existirem
        for nota in ["notaAplicativa", "notaExplicativa", "notaHistorica", "fonte"]:
            if termo.get(nota):
                note = ET.SubElement(node, nota)
                note.text = termo[nota]

        # Se houver subtermos, chama a função para criar subelementos
        if "subtermos" in termo:
            create_xml_element(node, termo["subtermos"])

# Carrega os termos do arquivo 'termos.json'
script_dir = os.path.dirname(os.path.abspath(__file__))
termos_file = os.path.join(script_dir, "termos.json")
with open(termos_file, "r", encoding="utf-8") as f:
    termos = json.load(f)

# Cria o elemento raiz do XML
root = ET.Element("node")
root.set("id", "ResearchSubjectCategories")
root.set("label", "Research Subject Categories")

# Chama a função para criar os elementos XML a partir dos dados
create_xml_element(root, termos)

# Cria o XML a partir do elemento raiz
tree = ET.ElementTree(root)

# Salva o XML no mesmo diretório do script
xml_file_path = os.path.join(script_dir, "srsc.xml")
tree.write(xml_file_path, encoding="utf-8", xml_declaration=True)

print("O arquivo XML foi criado com sucesso.")
