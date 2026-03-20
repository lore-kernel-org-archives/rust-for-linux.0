Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D4A3BC667
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022923; cv=none; b=XMCh/W6+UJ5sOmFoVx1AGorHKpnjOWJuXa+BnvmSwnso+APdgiWwv9zttDzbtIh/5pCD+Z0NBnWpzJfvsgSAS9/ca+DF0wTmiBsMX8Ti4+s5JKhW8LTgdfkqTNssvu47aF9cIStr6J6aFVBWZmF9/9RExcLiymR+96GIslXcKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022923; c=relaxed/simple;
	bh=XUmjxiTs2bIlSFXMWUx0wXAStM3lUYmp8iN8+KzcPzM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lU876dKJBwvknut2bdNf9zj7kIgrFMw7FmcEnyooFYOJt7CIxsz6IsqsHTP5I2PSSJokvR4IbIuNCkt2iJTGjPIu8oTnqSeBJme19Kiu3qvmNPN2b8DcI6lHQeCgjQAPNFO/N2Qd2/VkvGJJNm1B7wdTDK8wQ+1dn9gErDDXcGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wc10DcwA; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wc10DcwA"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso6998295e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 09:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774022919; x=1774627719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BAV0UN0oxOpyXD+zO9adlHObupqiFm/cwhTS5hHbNM=;
        b=Wc10DcwA/uN5kvqM/E7H+2h5OQAJf6uMiH0OBLGp2t+ndpIfa9+f3aqpfaKHWvdjY8
         VurVnCVuANwVptrvkPflCWRc4o12i2M9/XRlq63NnodHla/5Hu/1y9mnn4L/aNh15Dzc
         LsC4xUhCqVg8KDOjsuYrYW6FJOGOTBJCvgUShQdvA+eSIUJkrnMo8jLw1zkhR/AhKZPF
         LkK5V9znpoizgXRh6VEoDQ9ywNPMVLas0Qfa3eVlydumAFxmvyxue/070e0XsNhS+xRA
         K8mdkQ/4XfSEs1Y4xrA6P2EzIyplB+0dX3YmVc/Yj/4IQo3fV/d7hGSj9P0Q+1aFogHK
         s0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022919; x=1774627719;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/BAV0UN0oxOpyXD+zO9adlHObupqiFm/cwhTS5hHbNM=;
        b=aAW3M9H+C5QK/zS0CFHsewWY04AFewegsg/nrAu52VYQSQ3uH8Q5sApqhZDEM+cwDN
         OtR65zGv8+DdOmF/x34ufcXh2Uh/GEZ9cVODwUO1IJOMFcW7qgW9RgV9EF1OXxTmcd3i
         zBk0hILzOLEgElmGVAPKG7ihzZsoc1/wyIuj658esIWpXNa+4FgL23WCmcBJM22xTPcE
         ZsKHQLNa/qDFN4Ce6W/pkAPyGafKJXSDGX/wNB/QYmbE6uD+sll3TgWln1b9kExNS49k
         n7UJ9W6uK4qOPykSvRcD2gJ0YT+rpeEeqROX0IWwyqUe6OCyp/6bP9Idt0M/cDrdvC12
         R5uA==
X-Forwarded-Encrypted: i=1; AJvYcCUpS+XSAIcWnusNlb40mzAbQDCJTM+BGH6dz8bnbkmYqicJsHjYwh9F1Di5Fpw4ct1Ebev0Ggdk+xilNVBgOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX10nhDt3xIMFxD4hKMVK3SA0Yb3DiOfmh+1CNuLnIOuKMJJ0d
	GQYMxE0TW6sm9pgfVHXWHZhCpKC5v21dm0UyDSwzbOQfucvPT0GN3slddBr7IIjnKHhn8qJ51gX
	GVDnsft9aqO/gVRtsAg==
X-Received: from wmej19.prod.google.com ([2002:a05:600c:42d3:b0:485:4f4a:bd87])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5291:b0:485:4278:24fb with SMTP id 5b1f17b1804b1-486ff04d6afmr53214535e9.32.1774022919337;
 Fri, 20 Mar 2026 09:08:39 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:08:26 +0000
In-Reply-To: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2619; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=9MaSYeQMVsO/xbbV7cBT0cy87FW81cANB6QK+J3LWZk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpvXEClNe6r8Fk87JnvEfKv8OUplzwJoPGzIoGr
 3cMu7WCI+6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCab1xAgAKCRAEWL7uWMY5
 RhH/D/9TrPthCru1C4LRuKvU6ahTZweO8txlFbO6CbGuDachWky66rslljqV7IqQsMd0y+JrJ1G
 SgzuIT2lcF/BLpHi5xsHV55YemywXjL5hcw8qd/XirPkt/fK+Jk6AqjGBUGOmp8RJOvCbhvLyEn
 8H33yDXFid4QqQC59tU2miqHhb3ZLyWEu7LHQCeMGXWAhIJ18viTkhaKczyBRLAw6FTFkVOTVcs
 nWqP2jVMg6Ma4BMbd1kHM9iTMG4HdLW1ruYoYQDGESlFUsnCBJod73ZZOwUIi03SMZL2oi8PUQs
 cE6lYtphUfeRwjGkW+ghdy0XtvBQRD31bdThgJ//Akx6uxPh06E4pS+iKPyRj/ZTP+ABgQNPOQx
 8/vps2cnyJ9iTPGdeb47dOlrzEWxMW5uRK83h+hem3XKhoiimoeQwBRkWU2ZomsaIrw22wRoVHd
 /jr1ndvB1s53AtyJzCasjJ/kIM0+pqaG+l5mWL+v+ZjvknmPbj1U4pdciQprcHOroOLPG6scQQZ
 /L5LcOdowEj2115j0LTMFuoIIQA3SCMHuE3ixpv6jJYq5UkxIVh121kF3jwDKWg1B0xkVqlZuz3
 8XKsd/AGdZsssHMwAIiziHdUi8fDRymqF1m5MvIE9tsNwcMXz5Ulq81v1FeWXV3joAc4hJIDod0 SelsXQkWve0JR5A==
X-Mailer: b4 0.14.3
Message-ID: <20260320-gpuvm-rust-v5-2-76fd44f17a87@google.com>
Subject: [PATCH v5 2/6] rust: helpers: Add bindings/wrappers for dma_resv_lock
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From: Asahi Lina <lina+kernel@asahilina.net>

This is just for basic usage in the DRM shmem abstractions for implied
locking, not intended as a full DMA Reservation abstraction yet.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Janne Grunau <j@jannau.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Taken from:
https://lore.kernel.org/all/20251202220924.520644-3-lyude@redhat.com/
with __rust_helper and MAINTAINERS file added.
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/dma-resv.c         | 14 ++++++++++++++
 rust/helpers/helpers.c          |  1 +
 4 files changed, 17 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b40923a18066..5d013a36f46f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7534,6 +7534,7 @@ F:	include/linux/*fence.h
 F:	include/linux/dma-buf.h
 F:	include/linux/dma-buf/
 F:	include/linux/dma-resv.h
+F:	rust/helpers/dma-resv.c
 K:	\bdma_(?:buf|fence|resv)\b
=20
 DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index ef0f010c268b..47279e993934 100644
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
index 000000000000..71914d8241e2
--- /dev/null
+++ b/rust/helpers/dma-resv.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-resv.h>
+
+__rust_helper
+int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx =
*ctx)
+{
+	return dma_resv_lock(obj, ctx);
+}
+
+__rust_helper void rust_helper_dma_resv_unlock(struct dma_resv *obj)
+{
+	dma_resv_unlock(obj);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index a83060f8500c..fa56d62c9014 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -28,6 +28,7 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#include "dma-resv.c"
 #include "drm.c"
 #include "drm_gpuvm.c"
 #include "err.c"

--=20
2.53.0.959.g497ff81fa9-goog

