function add_charm(charm)
{
  local charms = state.world1_charms;
  charms[charm] = true;
  update_charms();
}

function level2_init()
{
  foreach(name in ["blue", "green", "orange", "red"])
  {
    add_charm(name);
  }
  Tux.deactivate();
  Effect.sixteen_to_nine(2);
  Text.set_text(translate("---Insert Cutscene Here---"));
  Tux.walk(100);
  Text.fade_in(2);
  wait(4);
  Text.fade_out(1);
  wait(1);
  Effect.four_to_three();
  Tux.activate();
}

/***************************************
 * Handling of the "keys" in the world *
 ***************************************/
if(! ("world1_charms" in state))
	state.world1_charms <- {}
	
local charms = state.world1_charms;
foreach(name in ["blue", "green", "orange", "red"])
{
  if(! (name in charms))
    charms[name] <- false;
}

/// this function updates the key images (call this if tux has collected a key)
function update_charms()
{
	local charms = state.world1_charms;
	foreach(name in ["blue", "green", "orange", "red"])
	{
	  charm[name].set_action(charms[name] ? "display" : "outline");
	}
}

if(! ("charm" in this))
 charm <- {};

local x = 10;
local y = 100;

foreach(name in ["blue", "green", "orange", "red"])
{
  if(! (name in charm) ) {
    charm[name] <- FloatingImage("levels/dt_reimagined/images/objects/charms/charm_" + name + ".sprite");
    charm[name].set_anchor_point(ANCHOR_TOP_LEFT);
    charm[name].set_pos(x, y);
    charm[name].set_visible(true);
  }
  x += 50;
}

update_charms();
