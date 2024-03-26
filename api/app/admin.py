from sqladmin import Admin, ModelView

from app.core.db import engine
from app.models.user import User
from app.main import app


class UserAdmin(ModelView, model=User):
    column_list = [User.id, User.nickname, User.email, User.is_superuser]


admin = Admin(app=app, engine=engine)

admin.add_view(UserAdmin)
