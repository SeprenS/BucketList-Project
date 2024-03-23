from sqlalchemy import Column, ForeignKey, Integer, Text
from sqlalchemy.orm import relationship

from app.core.db import Base


class Comment(Base):
    goal = relationship("Goal", back_populates="")
    goal_id = Column(Integer, ForeignKey("goal.id"))
    author = relationship("User", back_populates="comments")
    author_id = Column(Integer, ForeignKey("user.id"))
    text = Column(Text)
