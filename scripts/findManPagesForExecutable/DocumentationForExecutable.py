from dataclasses import dataclass

@dataclass(frozen=True)
class DocumentationForExecutable():
    executable: str
    documentation: str

    def __str__(self):
        return self.executable + " produces summary: " + self.documentation
