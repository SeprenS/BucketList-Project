from sqlalchemy import Column, ForeignKey, Integer

from app.core.db import Base


class GoalTag(Base):
    goal_id = Column(Integer, ForeignKey("goal.id"))
    tag_id = Column(Integer, ForeignKey("tag.id"))
