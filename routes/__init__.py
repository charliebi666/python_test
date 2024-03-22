from flask import Blueprint, render_template, request, flash

router = Blueprint("router", __name__)


@router.route("/", methods=["GET", "POST"])
def homepage():
    request_context = {"1": "ABC"}
    if request.method == 'POST':
        input_string = request.form.get("user_input")
        flash(input_string + ", Please hire me!")
        # return render_template("base.jinja2", **request_context)
    return render_template("base.jinja2", **request_context)


