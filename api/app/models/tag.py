from sqlalchemy import Column, String
from sqlalchemy.orm import relationship

from app.core.db import Base
from app.models.goal_tag import GoalTag


class Tag(Base):
    title = Column(String(20))
    goals_with_tag = relationship("Goal", secondary=GoalTag, back_populates="tags")
