from plone import api
from plone.dexterity.interfaces import IDexterityContent
from Products.Five.browser import BrowserView
from zope.component import queryAdapter

from .interfaces import IRichTitle


class RichListingView(BrowserView):
    """Rich listing view"""

    @property
    def infos(self):
        brains = api.content.find(
            object_provides=IDexterityContent, sort_on="created", sort_order="ascending"
        )
        objects = [b.getObject() for b in brains]
        infos = []
        for o in objects:
            rich = queryAdapter(o, IRichTitle, "date")
            reversed = queryAdapter(o, IRichTitle, "reverse")
            infos.append(
                {
                    "rich_title": rich.rich_title if rich else o.title,
                    "reversed_title": reversed.reversed_title if reversed else o.title,
                    "url": o.absolute_url(),
                }
            )
        return infos
