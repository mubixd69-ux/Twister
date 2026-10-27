extends Control

@onready var stats_label: RichTextLabel = $StatsLabel

@export_file("*.tscn") var next_level_scene: String

func _ready() -> void:
	var coins = GameManager.coins_collected
	var formatted_time = snappedf(GameManager.level_time, 0.1)
	
	stats_label.bbcode_enabled = true
	
	stats_label.text = "[b]Level Completed[/b]\n\n\nCoins Collected: %d\n\nTime Spent: %.1fs" % [coins, formatted_time]
	
	stats_label.visible_characters = 0
	
	var total_characters = stats_label.text.length()
	var duration = total_characters * 0.05
	
	var tween = create_tween()
	
	tween.tween_interval(1.0)
	
	tween.tween_property(stats_label, "visible_characters", total_characters, duration)
