extends Control

@onready var stats_label: RichTextLabel = $StatsLabel

@export var is_final_level = false
@export_file("*.tscn") var next_level_scene: String
@export_file("*.tscn") var main_menu_scene: String


var can_continue := false


func _ready() -> void:
	var coins = GameManager.coins_collected
	var formatted_time = snappedf(GameManager.level_time, 0.1)
	
	var title := "Level Completed"
	var footer := ""
	var prompt := "Press any key to continue"
	
	if is_final_level:
		title = "Congratulations!\n\nYou completed the game!"
		footer = "\n\nThanks for playing!"
		prompt = "Press any key to return to the main menu"
	
	stats_label.bbcode_enabled = true
	stats_label.text = (
	"[center][b]%s[/b]\n\nCoins Collected: %d\n\nTime Spent: %.1fs%s\n\n%s[/center]"
	% [title, coins, formatted_time, footer, prompt]
	)
	
	stats_label.visible_characters = 0
	var total_characters = stats_label.get_parsed_text().length()
	var duration = total_characters * 0.05
	
	var tween = create_tween()
	tween.tween_interval(1.0)
	tween.tween_property(stats_label, "visible_characters", total_characters, duration)
	tween.tween_callback(func(): can_continue = true)

func _unhandled_input(event: InputEvent) -> void:
	if not can_continue:
		return
	if event.is_pressed() and not event.is_echo():
		var target := main_menu_scene if is_final_level else next_level_scene
		if target != "":
			get_tree().change_scene_to_file(target)
