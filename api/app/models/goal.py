from sqlalchemy import Column, ForeignKey, Integer, String, Text
from sqlalchemy.orm import relationship

from app.core.db import Base
from app.models.goal_tag import GoalTag


class Goal(Base):
    goal_author = relationship("User", back_populates="writen_goals")
    goal_author_id = Column(Integer, ForeignKey("user.id"))
    favorite_records = relationship("FavoriteGoals", back_populates="goal")
    comments = relationship("Comment", back_populates="goal")
    text = Column(Text)
    title = Column(String(200))
    tags = relationship("Tag", secondary=GoalTag, backref="Goal")
