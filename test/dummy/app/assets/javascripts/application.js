class FieldController extends Stimulus.Controller {
  static targets = ["input", "error", "label"];

  initialize() {
    const { dataset } = this.inputTarget;
    this.touched = false;
    this.validations = {
      required: dataset.required === "true",
      minLength: parseInt(dataset.minLength, 10),
      maxLength: parseInt(dataset.maxLength, 10),
      pattern: dataset.pattern,
    };
    this.i18n = {
      validation: {
        minLength: "%{minLength}",
        minLength: "%{maxLength}",
        required: "is rquired",
      },
    };
  }

  validate() {
    const presenceValid = this._validatePresence();
    if (presenceValid) {
      this.invalidate();
      this.errorTarget.innerHTML = this.i18n.validation.required;
      return;
    }

    const minLengthValid = this._validateMinLength();
    if (minLengthValid) {
      this.invalidate();
      this.errorTarget.innerHTML = this.i18n.validation.minLength.replace(
        "%{minLength}",
        this.validations.minLength
      );
      return;
    }

    const maxLength = this._validateMaxLength();
    if (maxLength) {
      this.invalidate();
      this.errorTarget.innerHTML = this.i18n.validation.maxLength.replace(
        "%{maxLength}",
        this.validations.maxLength
      );
      return;
    }

    const pattern = this._validatePattern();
    if (pattern) {
      this.invalidate();
      this.errorTarget.innerHTML = "";
      return;
    }

    this.resetValidation();
  }

  touch() {
    this.touched = true;
  }

  invalidate() {
    this.labelTarget.classList.add("text-red-600");
    this.inputTarget.classList.add("border-red-600");
  }

  resetValidation() {
    this.labelTarget.classList.remove("text-red-600");
    this.inputTarget.classList.remove("border-red-600");
    this.errorTarget.innerHTML = "";
  }

  _validatePattern() {
    const { value } = this.inputTarget;
    const regex = new RegExp(this.validations.pattern);
    const cond = [this.touched, this.validations.pattern, !regex.test(value)];
    return cond.every(Boolean);
  }

  _validatePresence() {
    const { value } = this.inputTarget;
    const cond = [this.touched, this.validations.required, value.length === 0];
    return cond.every(Boolean);
  }

  _validateMinLength() {
    const { value } = this.inputTarget;
    const cond = [
      this.touched,
      this.validations.minLength,
      value.length < this.validations.minLength,
    ];
    return cond.every(Boolean);
  }

  _validateMaxLength() {
    const { value } = this.inputTarget;
    const cond = [
      this.touched,
      this.validations.maxLength,
      value.length > this.validations.maxLength,
    ];
    return cond.every(Boolean);
  }
}

const application = Stimulus.Application.start();
application.register("field", FieldController);
