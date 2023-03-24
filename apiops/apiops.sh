## Lint the OAS spec
inso lint spec openai_completion.yaml

## Run unit test
inso run test uts_8525ff --env env_env_a81113 --reporter progress

## Generate Kong config using API specs
inso generate config openai_completion.yaml -o openai_deck.yaml --tags "openAI-API"

## Convert to 3.X format
deck convert --from kong-gateway-2.x --to kong-gateway-3.x \
--input-file openai_deck.yaml --output-file konnect.yaml

## Deploy Kong config to Kong and servicehub
deck sync --konnect-token "$PAT" \
--konnect-runtime-group-name default --skip-consumers --konnect-addr "https://us.api.konghq.com" \
--select-tag openAI-API-test,_KonnectService:example --silence-events -s konnect.yaml

## Deploy to runtime group but not servicehub
deck sync --konnect-token "$PAT" \
--konnect-runtime-group-name default --skip-consumers --konnect-addr "https://us.api.konghq.com" \
--select-tag openAI-API-test --silence-events -s konnect.yaml

exit

## deploy using tags
deck sync --konnect-token "$PAT" \
--konnect-runtime-group-name default --konnect-addr "https://us.api.konghq.com" \
--select-tag openAI-API-test --select-tag customer-api-access-consumer

## Check Konnect working
deck ping --konnect-token "$PAT" \
--konnect-addr "https://us.api.konghq.com"


## Download the Kong configuration
deck dump --konnect-token "$PAT" \
--konnect-runtime-group-name default --konnect-addr "https://us.api.konghq.com" \
-o konnect_1.yaml

## Find diff
deck diff --konnect-token "$PAT" --select-tag openAI-API-test \
--konnect-runtime-group-name default --konnect-addr "https://us.api.konghq.com" -s konnect.yaml

## Deploy Kong config to Kong
deck reset --konnect-token "$PAT" \
--konnect-runtime-group-name default --skip-consumers --konnect-addr "https://us.api.konghq.com" \
--select-tag openAI-API-test