Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7776A3E9F8A
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 11:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768995118; cv=none; b=PruWzBwyfuUqoI6rCsFBDPu1G/vX0EDbIEBFHyfbUN+GIR58myJQBNMBhvVYgLo5YG1pp7a3ruqsJvB1ickrS2TbFNt1pjreDfrbNyyZedTbEPyj/sHL10HRdYKZc2fTJGdTaUqGfZEv9kUsJPJXXOG1Elp8DDB8Gn+NFM/hgCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768995118; c=relaxed/simple;
	bh=P5wAIaRKPh85zJzKZEFPqIhdMETe8VR8WR1ZOlPakyA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GVXtGeo+kmkD3rHztQmoFI62jWUIkL1bSobZa9zn3YluIYtzaVtRndBx73aENvrgMi1k4Ku6MQbegLgQQ8weACK0vAq6DY5fuNGUySdt7rEhG6YiHsNlNckvUf3QRGXrscgNiV90hjT1SKXt13CtkBdmxrKnW1n/WPzbKB4SiuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K5enx0H4; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K5enx0H4"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b8715782415so659430866b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 03:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768995114; x=1769599914; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n0kCZZM6p+E0DmFtSo+zls4mReeu1EP5jRXjRI1bQ8M=;
        b=K5enx0H4dNKr4RxxOpbiKDoyFwfURaBaITEcKyT/Z93mer5uNTkRNpJRtlAkriqwR/
         Nw6PpwCzB/FYGYtAgvex/OEQsh0bUByurI5L6RWWZvWhpIOA8yEiVyyiFT395WJttXjb
         XCP1VnhFO+u0Q3ohGNdtF/X62zxfrewXdZZYGsMMPEM5T2U5tv1k/xd7jMxL1e0z5spo
         BfiTz1+pZlNcwM0ButWGsL7sNpoDeiPvu69A3jN/GWFvc9aBSX+TESQUQdPq1JAlRN7d
         IQWQwk8rkqkDc1vLYfjabnZtEpwVuDqh/ZTjTFFxWhTxx6/sH4bd78tCdck3G4oxCErT
         YzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768995114; x=1769599914;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0kCZZM6p+E0DmFtSo+zls4mReeu1EP5jRXjRI1bQ8M=;
        b=W+kxA/71KVaI5hq/tZphddtfyWRGk8ojjSNr2jLZ0Z1hUG6fNn9VvbSi0exR/B2LNO
         lr3rDzSpfXWv7jHVIehkwlOmqm35eP+i759TeHyFg+Nw8ClwlAXh1RAPyrmPDFZA4c7o
         P2IpyrHIbi9r6DXwjFqO05LuOOUrZQxH4vbZba50+U67wRiG7hw1Ln5YohXJZCWwzfvt
         fFeQyn1WE0RzkEWBRDHCg6VQceIGl3bVAzVaO2vQ+JzAUvGx1k2sb2LbvI5D10U/WyAm
         /ueFEk9Ju7EpjCef8ScUTeU+c1Y/EyiECn6TtQ6d+Mwal23dPzLHXt9JvmC3e0MuckvV
         TGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK8yxUvyKdEyRz7Q1mwy1BNglcwGhDwvCakZjzJDzxSytZntAAWy3o7XTTBmxHFT60hAQgZcNw1Js4Gi8B0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0A7ez0FQNdc/rmvXt7duSHDqvItfLwk/YlhiXa3/K6i69s1wv
	IW/wPuCI8DM2jYq0hhdMfhadpPVZKng8AbKshvwbh0tbXwlFtvSnfy4HwXjISBHr8Ll2/3eQ99f
	N8wsEgmZOUGINTbF66Q==
X-Received: from ejcb5.prod.google.com ([2002:a17:906:36c5:b0:b7c:eb5d:caa1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:6a1b:b0:b80:4108:f826 with SMTP id a640c23a62f3a-b8796aee516mr1388441366b.36.1768995114622;
 Wed, 21 Jan 2026 03:31:54 -0800 (PST)
Date: Wed, 21 Jan 2026 11:31:18 +0000
In-Reply-To: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2156; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=1z0yLHaRNnuMNmurQRoqGqVcNNO3MBwRXrJ8DuvVV9s=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpcLkdj+BPjbRCtGqjLAHynwm2GJjp67dFSVfjd
 anNEQ9bBDqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXC5HQAKCRAEWL7uWMY5
 RjsRD/9Qa7uaYEVUkWWEcDspFV55uc+SZPuy6VeJHSgm6lIpAoBeIe9TRWGXbVwsPtXR8atAqUZ
 6t9+o5o1CyDD4mxImiOl9XaIBPgEFnb7f8p7sk0MdZz1VWVeHT4fb7g8kMaxvixsDBpMKnb6Zn3
 GDiOCx/DeiJc7Iiht2GwFqMhCi1BgX2HBCO6eAcEu2NhHCRU4PgSFRX7Cl0eLt2CDyyPR8wexgE
 yCT7T/XAqsyY2SYt/GEQxk9WadlOQvthMwJR8i3lmjVvcxjpbFHw2NWddFSiW2qASIuV5ld8+ZE
 SJYBqqjFi/6uGnQpMAMP/sTNAI/hkvDgtMUQNVSjlgkBAQ9QBQlNc9tYA66lUpNU0zeHhw4RM3x
 SFjSKvc2VsEeaEjc1StrUJNlI9arTrrTPdDj+/+0XwKNhhSo1BDXO7Lw72bQybhP7rBMyKbJlx7
 kHoswT/MmLHqMOHzcIRkAWrxkXPoFdNeaSoYqZn9DLXnZvC4fonDYEWKRawkmsODIpGtGSiY9PQ
 oxV1f1uEHAXQIbOqd7IVHN6TsgxkuXrtdD9WQ58ZdwaceTVxIIwyTSaYluDseGgYhj5nMnqXgjd
 pEl7iNsF7M9408d6h0GmH2rLYiRVlATdI4a6zywi6m+JA6V2ujhW87RI892nJJDfjwqGryE607x yBAC3Wr9u1PDhqw==
X-Mailer: b4 0.14.2
Message-ID: <20260121-gpuvm-rust-v3-2-dd95c04aec35@google.com>
Subject: [PATCH v3 2/6] rust: helpers: Add bindings/wrappers for dma_resv_lock
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Asahi Lina <lina+kernel@asahilina.net>

This is just for basic usage in the DRM shmem abstractions for implied
locking, not intended as a full DMA Reservation abstraction yet.

Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Taken from:
https://lore.kernel.org/all/20251202220924.520644-3-lyude@redhat.com/
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/dma-resv.c         | 13 +++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 15 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index dd60a5c6b142ec2c5fd6df80279ab6813163791c..ed80dd8088bc60c67b02f7666e602e33158bb962 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -52,6 +52,7 @@
 #include <linux/device/faux.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-resv.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/fdtable.h>
diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
new file mode 100644
index 0000000000000000000000000000000000000000..05501cb814513b483afd0b7f220230d867863c2f
--- /dev/null
+++ b/rust/helpers/dma-resv.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-resv.h>
+
+int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
+{
+	return dma_resv_lock(obj, ctx);
+}
+
+void rust_helper_dma_resv_unlock(struct dma_resv *obj)
+{
+	dma_resv_unlock(obj);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0943d589b7578d3c0e207937f63a5e02719c6146..aae78c938b0b5848b1740fb3f2dc4b7f93b1a760 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -25,6 +25,7 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#include "dma-resv.c"
 #include "drm.c"
 #include "drm_gpuvm.c"
 #include "err.c"

-- 
2.52.0.457.g6b5491de43-goog

