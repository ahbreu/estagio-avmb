import lxml.etree as ET
import os
import sys

# Obter o diretório do script
script_dir = os.path.dirname(sys.argv[0]) if getattr(sys, 'frozen', False) else os.path.dirname(os.path.abspath(__file__))

# Caminho para o arquivo XML
xml_file = os.path.join(script_dir, "srsc.xml")

# Caminho para o arquivo XSD
xsd_file = os.path.join(script_dir, "controlledvocabulary.xsd")

# Carregar o arquivo XML
xml_doc = ET.parse(xml_file)

# Carregar o arquivo XSD
xsd_doc = ET.parse(xsd_file)

# Criar um validador XSD
xsd = ET.XMLSchema(xsd_doc)

# Validar o arquivo XML com o validador XSD
is_valid = xsd.validate(xml_doc)

# Verificar se houve algum erro de validação
if is_valid:
    print("O arquivo XML é válido de acordo com o XSD.")
else:
    print("O arquivo XML não é válido de acordo com o XSD. Os seguintes erros foram encontrados:")
    for error in xsd.error_log:
        print(error)
