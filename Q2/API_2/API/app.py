from flask import Flask, request, Response
from sqlalchemy import delete,create_engine
from sqlalchemy.orm import Session
from models import *
import json

app = Flask(__name__)

def connectDb():
    engine = create_engine("mysql+pymysql://root:avmb123@database/poc")
    return Session(engine)

@app.route("/")
def index():
    return """
        <b>(GET) /comunidades: </b>Retorna uma lista com todas as comunidades<br />
        <b>(GET) /comunidades?id=<i>&lt;id&gt;</i>: </b>Retorna uma lista com todas as coleções da comunidade de id <i>id</i><br />
        <b>(GET) /colecoes: </b>Retorna todas as coleções<br />
        <b>(GET) /colecoes?id=<i>&lt;id&gt;</i>: </b>Retorna uma lista com todos os itens da coleção de id <i>id</i><br />
        <b>(GET) /itens: </b>Retorna uma lista com todos os itens<br />
        <b>(GET) /itens?id=<i>&lt;id&gt;</i>: </b>Retorna uma lista com todos os bitstreams do item de id <i>id</i><br />
        <b>(GET) /bitstreams: </b>Retorna uma lista com todos os bitstreams<br />
        <b>(DELETE) /bitstreams?id=<i>&lt;id&gt;</i>: </b>Remove o bitstream de id <i>id</i> do banco de dados
    """
    
@app.route("/comunidades")
def getComunidades():
    id = request.args.get("id", default=-1, type=int)
    with connectDb() as session:
        if id == -1:
            comunidades = session.query(Comunidades)
            resposta = []
            for row in comunidades:
                resposta.append({"id": row.idcomunidades, "comunidade": row.nome})
        else:
            colecoes = session.query(Colecoes).join(Comunidades, Comunidades.idcomunidades == Colecoes.comunidades_idcomunidades).filter(Comunidades.idcomunidades == id)
            resposta = []
            for row in colecoes:
                resposta.append({"id": row.idcolecoes, "colecao": row.nome})
    return json.dumps(resposta)

@app.route("/colecoes")
def getColecoes():
    id = request.args.get("id", default=-1, type=int)
    with connectDb() as session:
        if id == -1:
            colecoes = session.query(Colecoes)
            resposta = []
            for row in colecoes:
                resposta.append({"id": row.idcolecoes, "colecao": row.nome})
        else:
            itens = session.query(Itens).join(Colecoes, Colecoes.idcolecoes == Itens.colecoes_idcolecoes).filter(Colecoes.idcolecoes == id)
            resposta = []
            for row in itens:
                resposta.append({"id": row.iditens, "item": row.nome})
    return json.dumps(resposta)

@app.route("/itens")
def getItens():
    id = request.args.get("id", default=-1, type=int)
    with connectDb() as session:
        if id == -1:
            itens = session.query(Itens)
            resposta = []
            for row in itens:
                resposta.append({"id": row.iditens, "item": row.nome})
        else:
            itens = session.query(Bitstreams).join(Itens, Bitstreams.itens_iditens == Itens.iditens).filter(Itens.iditens == id)
            resposta = []
            for row in itens:
                resposta.append({"id": row.idbitstreams, "nomeArquivo": row.nomeArquivo, "pacote": row.pacote})
    return json.dumps(resposta)

@app.route("/bitstreams", methods=["GET"])
def getBitstreamss():
    id = request.args.get("id", default=-1, type=int)
    with connectDb() as session:
        if id == -1:
            bitstreams = session.query(Bitstreams)
            resposta = []
            for row in bitstreams:
                resposta.append({"id": row.idbitstreams, "nomeArquivo": row.nomeArquivo, "pacote": row.pacote})
        else:
            return Response({"Método não permitido"}, status=405)
    return json.dumps(resposta)

@app.route("/bitstreams", methods=["DELETE"])
def deleteBitstreamss():
    id = request.args.get("id", default=-1, type=int)
    with connectDb() as session:
        if id != -1:
            session.execute(delete(Bitstreams).where(Bitstreams.idbitstreams == id))
            session.commit()
            return Response(json.dumps({"mensagem": f"Bitstream de id {id} removido com sucesso"}), status=200)
        else:
            return Response(json.dumps({"mensagem": "Método não permitido"}), status=405)
    
if __name__ == "__main__":
    app.run(host="0.0.0.0")