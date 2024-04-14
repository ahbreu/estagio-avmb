from sqlalchemy.orm import DeclarativeBase, mapped_column, relationship
from sqlalchemy import String, ForeignKey, Integer

class BaseModel(DeclarativeBase):
    pass

class Comunidades(BaseModel):
    __tablename__ = "comunidades"
    
    idcomunidades = mapped_column(Integer, primary_key=True)
    nome = mapped_column(String)
    
    colecoes = relationship("Colecoes", back_populates="comunidadePai")
    
class Colecoes(BaseModel):
    __tablename__ = "colecoes"
    
    idcolecoes = mapped_column(Integer, primary_key=True)
    nome = mapped_column(String)
    comunidades_idcomunidades = mapped_column(Integer, ForeignKey("comunidades.idcomunidades"))
    
    comunidadePai = relationship("Comunidades", foreign_keys=[comunidades_idcomunidades], back_populates="colecoes")
    itens = relationship("Itens", back_populates="colecaoPai")
    
class Itens(BaseModel):
    __tablename__ = "itens"
    
    iditens = mapped_column(Integer, primary_key=True)
    nome = mapped_column(String)
    colecoes_idcolecoes = mapped_column(Integer, ForeignKey("colecoes.idcolecoes"))
    
    colecaoPai = relationship("Colecoes", foreign_keys=[colecoes_idcolecoes], back_populates="itens")
    bitstreams = relationship("Bitstreams", back_populates="itemPai")
    
class Bitstreams(BaseModel):
    __tablename__ = "bitstreams"
    
    idbitstreams = mapped_column(Integer, primary_key=True)
    nomeArquivo = mapped_column(String)
    pacote = mapped_column(String)
    itens_iditens = mapped_column(Integer, ForeignKey("itens.iditens"))
    
    itemPai = relationship("Itens", foreign_keys=[itens_iditens], back_populates="")