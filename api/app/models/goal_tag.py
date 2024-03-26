from sqlalchemy import Column, ForeignKey, Integer, Table

from app.core.db import Base

GoalTag = Table(
    'goaltag',
    Base.metadata,
    Column('id', Integer, primary_key=True),
    Column('goal_id', Integer, ForeignKey('goal.id')),
    Column('tag_id', Integer, ForeignKey('tag.id')),
)
