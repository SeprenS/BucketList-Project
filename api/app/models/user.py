from fastapi_users_db_sqlalchemy import SQLAlchemyBaseUserTable
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship

from app.core.db import Base


class User(SQLAlchemyBaseUserTable[int], Base):
    nickname = Column(String(50), unique=True)
    writen_goals = relationship("Goal", back_populates="goal_author")
    favorite_goals = relationship("FavoriteGoals", back_populates="user")
    comments = relationship("Comment", back_populates="author")
