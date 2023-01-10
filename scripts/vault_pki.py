import hvac
from hvac.api.secrets_engines import Pki
import requests
from dataclasses import dataclass, field
from cryptography import x509
from typing import Any, NewType
from datetime import datetime


@dataclass
class EngineMountConfig:
    path: str

    default_lease_ttl: str
    max_lease_ttl: str

    description: str | None = None

    def mount(self, client: hvac.Client) -> requests.Response:
        "NOT idempotent"
        r: requests.Response = client.sys.enable_secrets_engine(
            "pki",
            self.path,
            self.description,
            config=dict(
                default_lease_ttl=self.default_lease_ttl,
                max_lease_ttl=self.max_lease_ttl,
            ),
        )
        r.raise_for_status()
        return r


def get_pki_at(client: hvac.Client, path: str) -> Pki:
    return getattr(client.secrets, path)


Ttl = NewType("Ttl", str)

End = Ttl | datetime


@dataclass
class GenerateRootRequest:
    issuer_name: str
    cn: str
    end: End
    permitted_dns_domains: list[str] = field(default_factory=list)

    other: dict[str, Any] = field(default_factory=dict)



@dataclass
class RootGenerationSteps:
    """
    this is a separate class just to keep them grouped together.
    still need to figure out how to check the workflow, y'know?
    """

    path: str
    pki: Pki

    @staticmethod
    def gen_root(pki: Pki):
        pki.generate_root()
