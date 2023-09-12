"""Improve history access so I can skip over functions.
   Courtesy of https://stackoverflow.com/a/53525144/4755520
"""

from IPython import get_ipython
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus, ViNavigationMode
from prompt_toolkit.key_binding.bindings.named_commands import get_by_name
from prompt_toolkit.clipboard.pyperclip import PyperclipClipboard

ip = get_ipython()
# if getattr(ip, "pt_app", None):
#     ip.pt_app.clipboard = PyperclipClipboard()
registry = ip.pt_app.key_bindings
ph = get_by_name('previous-history')
nh = get_by_name('next-history')
registry.add_binding('K',
                     filter=(HasFocus(DEFAULT_BUFFER) &
                             ViNavigationMode()))(ph)
registry.add_binding('J',
                     filter=(HasFocus(DEFAULT_BUFFER) &
                             ViNavigationMode()))(nh)
