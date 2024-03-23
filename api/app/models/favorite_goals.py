from sqlalchemy import Boolean, Column, ForeignKey, Integer
from sqlalchemy.orm import relationship

from app.core.db import Base


class FavoriteGoals(Base):
    user = relationship("User", back_populates="favorite_goals")
    user_id = Column(Integer, ForeignKey("user.id"))
    goal = relationship("Goal", back_populates="favorite_records")
    goal_id = Column(Integer, ForeignKey("goal.id"))
    is_completed = Column(Boolean, default=False)
