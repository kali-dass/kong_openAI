# Kong Chat GPT Open AI example with Konnect

This is sample Chat GPT with kong.
- Create Konnect DP in kubernetes with helm example
- Chat GPT openAI API shrinked version for chatting purpose only
- Example openAI API readme file for quick start
- APIOps example to take the openAI API specs and auto deploy
    - Run lint
    - Run test
    - Deploy to Kong
    - Enable service hub
    - Add Readme to developer portal

## Folders

### konnect_dp
| folder | purpose |
|:------:|:------:|
|certs| store the konnect dp cert from Konnect |
| helm_values | example helm values to create DP|
| `setup.sh` | kubernetes commands to create ns, load cert as secret and install using helm |

### specs
| folder | purpose |
|:------:|:------:|
|`openai.yaml`| full openAI api spec |
|`openai_completion.yaml`| reducved openAI api spec for chat only |

### docs
| folder | purpose |
|:------:|:------:|
|[openai.md](https://github.com/kali-dass/kong_openAI/blob/main/docs/openai.md)| Load the details to Konnect Developer Portal used as user guide |

### apiops
| folder | purpose |
|:------:|:------:|
|`apiops.sh`| APIOps commands for |
- Run Inso lint on openAI spec 
- inso test to run a test on openAI spec 
- Generate Kong Deck from openAI spec 
- Deploy Chat GPT OpenAI spec to Konnect 