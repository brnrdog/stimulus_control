import { Application } from "stimulus";
import { FieldController } from "./FieldController";

const application = Application.start();
application.register("field", FieldController);
