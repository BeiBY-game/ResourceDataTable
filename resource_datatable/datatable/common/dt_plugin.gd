@tool
extends DT_Common
class_name DT_Plugin

## Class that manages all the config, and plugin related information for the plugin

const LOCAL_PATH: String = "res://addons/resource_datatable/"
const LOCAL_CONFIG_PATH: String = "res://addons/resource_datatable/plugin.cfg"

var _config: ConfigFile


signal plugin_off
signal plugin_on

static var _INSTANCE: DT_Plugin

static func delete():
	_INSTANCE = null

static func get_instance() -> DT_Plugin:
	
	if !_INSTANCE:
		_INSTANCE = DT_Plugin.new()
	
	_INSTANCE.load_var()
	return _INSTANCE

# Init

func load_var():
	_config = ConfigFile.new()
	_config.load(LOCAL_CONFIG_PATH)

# Config

func get_version() -> String:
	return _config.get_value("plugin", "version")

func get_name() -> String:
	return _config.get_value("plugin", "name")

func get_dev_debug() -> String:
	return _config.get_value("dev", "debug", "false")

func get_dev_stop_update() -> String:
	return _config.get_value("dev", "stop_update", "false")

func get_dev_stop_backup() -> String:
	return _config.get_value("dev", "stop_backup", "false")

func get_dev_stop_convert() -> String:
	return _config.get_value("dev", "stop_convert", "false")

func get_dev_reset_instance() -> String:
	return _config.get_value("dev", "reset_instance", "false")

func get_dev_force_convert() -> String:
	return _config.get_value("dev", "force_convert", "false")

func get_dev_convert_watchdog_limit() -> String:
	return _config.get_value("dev", "convert_watchdog_limit", "10000")

func get_file_version() -> String:
	return _config.get_value("file", "version")

func get_file_ext() -> String:
	return _config.get_value("file", "ext", ".tableCollection.res")

func get_backup_path() -> String:
	return _config.get_value("backup", "folder", "res://datatable_backup/")

func get_backup_max() -> String:
	return _config.get_value("backup", "max", "3")

func get_backup_suffix() -> String:
	return _config.get_value("backup", "suffix", "_backup")

func get_update_temp_file() -> String:
	return _config.get_value("update", "temp_file", "user://temp_update_datatable.zip")

func get_update_safeguard() -> String:
	return _config.get_value("update", "safeguard", "res://safeguard/safeguard.gd")

# Convert a version number to an actually comparable number
# OC: Nathanhoad (https://github.com/nathanhoad/godot_input_helper/tree/main) under MIT License (see above)
func version_to_number(version: String) -> int:
	
	var bits = version.split(".")
	return bits[0].to_int() * 1000000 + bits[1].to_int() * 1000 + bits[2].to_int()
