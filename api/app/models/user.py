from fastapi_users_db_sqlalchemy import SQLAlchemyBaseUserTable
from sqlalchemy import Column, String

from app.core.db import Base


class User(SQLAlchemyBaseUserTable[int], Base):
    nickname = Column(String(50), unique=True)
