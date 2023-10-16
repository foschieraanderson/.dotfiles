# Copyright (c) 2023 Anderson Foschiera
import os
import subprocess

from libqtile import bar, hook, layout, widget
from libqtile.command import lazy
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.utils import guess_terminal

mod = "mod4"  # SUPER
mod1 = "mod1"  # ALT
term = guess_terminal()
browser = "vivaldi-stable"
file_manager = "alacritty -e ranger"


# ===========
### KEYS ###
# ===========
keys = [
    # Launch applications
    Key([mod], "Return", lazy.spawn(term), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch web browser"),
    Key([mod], "f", lazy.spawn(file_manager), desc="Launch file manager"),
    Key([mod], "m", lazy.spawn("rofi -show drun"), desc="Launch application menu"),
    # Rofi
    Key([mod], "r", lazy.spawn("rofi -show drun"), desc="Run application launcher"),
    Key(
        [mod, "shift"],
        "r",
        lazy.spawn("rofi -show filebrowser"),
        desc="Launch Rofi file browser",
    ),
    ## Rofi Power Menu
    Key(
        [mod, "control"],
        "Delete",
        lazy.spawn(
            "rofi -show powermenu -modi 'powermenu:~/.config/rofi/rofi-power-menu --choices=shutdown/reboot/suspend/hibernate/logout'"
        ),
        desc="Run power menu",
    ),
    ## rofi-network-menu
    Key([mod, "shift"], "w", lazy.spawn("./.config/rofi/rofi-wifi-menu")),
    ## Volume settings
    Key(
        [mod, mod1],
        "m",
        lazy.spawn("pamixer -t", desc="Switch between mute and unmute"),
    ),
    Key([mod, mod1], "equal", lazy.spawn("pamixer -i 2"), desc="Increase the volume"),
    Key([mod, mod1], "minus", lazy.spawn("pamixer -d 2"), desc="Decrease the volume"),
    # Brightness settings
    Key(
        [mod, "control"],
        "equal",
        lazy.spawn("brightnessctl set +3%"),
        desc="Increase the brightness",
    ),
    Key(
        [mod, "control"],
        "minus",
        lazy.spawn("brightnessctl set 3%-"),
        desc="Decrease the brightness",
    ),
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between columns
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    Key(
        [mod, "shift"],
        "return",
        lazy.layout.toggle_split(),
        desc="Toggle split window stack",
    ),
    # Toggle floating or fullscreen windows
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating window"),
    Key([mod], "z", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen window"),
    # Other basic actions
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    # Key([mod], "tab", lazy.next_layout(), desc="Toggle next layout"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
]


def window_to_previous_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen is True:
            qtile.cmd_to_screen(i - 1)


def window_to_next_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen is True:
            qtile.cmd_to_screen(i + 1)


keys.extend(
    [
        # MOVE WINDOW TO NEXT SCREEN
        Key(
            [mod, "shift"],
            "Right",
            lazy.function(window_to_next_screen, switch_screen=True),
        ),
        Key(
            [mod, "shift"],
            "Left",
            lazy.function(window_to_previous_screen, switch_screen=True),
        ),
    ]
)


# ============
### MOUSE ###
# ============
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# =============
### GROUPS ###
# =============
group_keys = "1234567"
group_icons = ["󰲋", "", "", "", "", "󱢡", ""]
# group_icons = ["󰅬", "󰴜", "󰎄", "󰉋", "󱁴"]
groups = [Group(i) for i in group_icons]

for g, k in zip(groups, group_keys):
    keys.extend(
        [
            Key(
                [mod],
                k,
                lazy.group[g.name].toscreen(),
                desc=f"Switch to group {g.name}",
            ),
            Key(
                [mod, "shift"],
                k,
                lazy.window.togroup(g.name, switch_group=True),
                desc=f"Switch to & move focused window to group {g.name}",
            ),
            Key([mod1, "shift"], "Tab", lazy.screen.prev_group()),
            Key([mod1], "Tab", lazy.screen.next_group()),
        ]
    )


# =============
### COLORS ###
# =============
theme = {
    "rosewater": "#F5E0DC",
    "flamingo": "#F2CDCD",
    "pink": "#F5C2E7",
    "mauve": "#CBA6F7",
    "red": "#F38BA8",
    "maroon": "#EBA0AC",
    "peach": "#FAB387",
    "yellow": "#F9E2AF",
    "green": "#A6E3A1",
    "teal": "#94E2D5",
    "sky": "#89DCEB",
    "sapphire": "#74C7EC",
    "blue": "#89B4FA",
    "lavender": "#B4BEFE",
    "text": "#CDD6F4",
    "subtext1": "#BAC2DE",
    "subtext0": "#A6ADC8",
    "overlay2": "#9399B2",
    "overlay1": "#7F849C",
    "overlay0": "#6C7086",
    "surface2": "#585B70",
    "surface1": "#45475A",
    "surface0": "#313244",
    "base": "#1E1E2E",
    "mantle": "#181825",
    "crust": "#11111B",
    "white": "#FFFFFF",
}

# ==============
### LAYOUTS ###
# ==============
layout_theme = {
    "border_width": 2,
    "margin": 5,
    "border_focus": theme["subtext0"],
    "border_normal": theme["base"],
}

layouts = [
    # layout.MonadTall(**layout_theme),
    layout.Columns(**layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.Spiral(**layout_theme),
    # layout.MonadWide(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.Tile(**layout_theme),
    # layout.TreeTab(**layout_theme),
    # layout.VerticalTile(),
    # layout.Zoomy(**layout_theme),
]


# ==============
### WIDGETS ###
# ==============
def sep(op, fg, bg):
    flag = "" if op else ""
    return widget.TextBox(
        text=flag, padding=0, fontsize=28, foreground=fg, background=bg
    )


def init_widgets_defaults():
    return {
        "font": "JetBrains Mono",
        "fontsize": 14,
        "padding": 4,
        "background": theme["base"],
    }


widget_defaults = init_widgets_defaults()


def init_widgets_list():
    widgets = [
        widget.TextBox(
            "󱘊",
            fontsize=22,
            padding=8,
            background=theme["base"],
            foreground=theme["green"],
        ),
        widget.Spacer(length=10, background=theme["base"]),
        widget.GroupBox(
            fontsize=16,
            margin_y=2,
            margin_x=0,
            padding_y=0,
            padding_x=8,
            borderwidth=2,
            rounded=True,
            active=theme["blue"],
            inactive=theme["text"],
            highlight_method="text",
            highlight_color=theme["blue"],
            this_current_screen_border=theme["blue"],
            other_screen_border=theme["text"],
            background=theme["base"],
            foreground=theme["text"],
        ),
        widget.Spacer(length=20, background=theme["base"]),
        widget.Prompt(),
        widget.WindowName(),
        widget.Notify(),
        widget.Moc(),
        widget.TextBox(
            "󰕾",
            fontsize=20,
            padding=8,
            background=theme["base"],
            foreground=theme["yellow"],
            mouse_callbacks={"Button1": lazy.spawn("pamixer -t")},
        ),
        widget.PulseVolume(background=theme["base"], foreground=theme["yellow"]),
        widget.Sep(linewidth=0, padding=8, background=theme["base"]),
        widget.TextBox(
            "󰸗",
            fontsize=18,
            padding=8,
            background=theme["base"],
            foreground=theme["peach"],
        ),
        widget.Clock(
            format="%d/%m/%Y", background=theme["base"], foreground=theme["peach"]
        ),
        widget.Sep(linewidth=0, padding=8, background=theme["base"]),
        widget.TextBox(
            "󰅐",
            fontsize=18,
            padding=8,
            background=theme["base"],
            foreground=theme["mauve"],
        ),
        widget.Clock(
            format="%H:%M", background=theme["base"], foreground=theme["mauve"]
        ),
        widget.Sep(linewidth=0, padding=8, background=theme["base"]),
        widget.Sep(linewidth=0, padding=8, background=theme["base"]),
        widget.TextBox(
            "󰇙",
            fontsize=18,
            padding=0,
            background=theme["base"],
            foreground=theme["surface2"],
        ),
        widget.Sep(linewidth=0, padding=8, background=theme["base"]),
        widget.TextBox(
            "",
            background=theme["base"],
            foreground=theme["red"],
            fontsize=22,
            padding=5,
            mouse_callbacks={
                "Button1": lazy.spawn(
                    "rofi -show powermenu -modi 'powermenu:~/.config/rofi/rofi-power-menu --choices=shutdown/reboot/suspend/hibernate/logout'"
                )
            },
        ),
        widget.Sep(linewidth=0, padding=8, background=theme["base"]),
    ]
    return widgets


widgets_list = init_widgets_list()


# ==============
### SCREENS ###
# ==============
def init_widgets_screen1():
    widgets_screen = init_widgets_list()
    return widgets_screen


def init_widgets_screen2():
    widgets_screen = init_widgets_list()
    return widgets_screen


widgets_screen1 = init_widgets_screen1()
widgets_screen2 = init_widgets_screen2()


def init_screens():
    return [
        Screen(
            top=bar.Bar(
                widgets=init_widgets_screen1(),
                size=32,
                margin=[5, 5, 0, 5],
                opacity=0.95,
            )
        ),
        Screen(
            top=bar.Bar(
                widgets=init_widgets_screen2(),
                size=32,
                margin=[5, 5, 0, 5],
                opacity=0.95,
            )
        ),
    ]


screens = init_screens()


# ======================
### FLOATING LAYOUT ###
# ======================
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

wmname = "Qtile"


# ============
### HOOKS ###
# ============
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~")
    subprocess.run([home + "/.config/qtile/autostart.sh"])
