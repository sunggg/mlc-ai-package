IMAGE=mlcaidev/package-cu121:aaf521b
GPU=cuda-12.1
#python3 scripts/sync_package.py --gpu cuda-12.1 --package tvm --package-name spark-tvm-testing --revision masa/contrib-vllm --skip-checkout --skip-conda
#docker/bash.sh --no-gpu $IMAGE ./scripts/build_mlc_ai_wheel_manylinux.sh --gpu $GPU

python scripts/sync_package.py --gpu cuda-12.1 --package mlc-llm --package-name spark-mlc-testing --revision origin/batch-serving --skip-checkout --skip-conda
docker/bash.sh --no-gpu $IMAGE ./scripts/build_mlc_chat_wheel_manylinux.sh --gpu $GPU

cp /home/ubuntu/sung/mlc-ai-package/tvm/python/dist/*.whl /home/ubuntu/clownfish/models/mlc_llm/container/
cp /home/ubuntu/sung/mlc-ai-package/mlc-llm/serve/dist/*.whl /home/ubuntu/clownfish/models/mlc_llm/container/