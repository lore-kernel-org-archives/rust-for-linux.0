Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F792322B8B
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783069; cv=none; b=PHOBMz3ZrTkR8GxMlEFNGlosNFDZ6CKl+WdNbVKd7xSzOF4VJbWjMPGFdntDKHJLMrOqoh/GDNdxUP3ASsAWbcxaSLzD79NrkESlmHkzUaa+qs2TgIBjEbCuKJRn2WhJ1rKxdSlTIfsWUt6bLHeEKn8i9crc0wxX18FSxsTXxgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783069; c=relaxed/simple;
	bh=Pps4IBNQOEPIeVXcRuKPdqW1iuZzmjtBAm5yYAEp4ig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lnr05fpcGF/5b0ikv716T5yCtLhZeonCUjJNJWRYGH7FFbiBB1dwUvHizwV4Ivgf9JXSOdmnyEjaKeXwRnvGl/mMrXLtsYZX5Uzd0T8Vw9hev0ErEQxzITrebGt9omdT1IaLMfbVjG31S32Ynm6FE7Fai6eW8gSSDRpwr0o75nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b4lNEPux; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b4lNEPux"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4806865a01bso15280225e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 06:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769783066; x=1770387866; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh9S7yV54xV/K3laFzFwLiYnpQQhQ4Nm8f/AYMtVUuA=;
        b=b4lNEPuxse4hozUz0YfHaQC2vZqc/Yg1dCHV/RWRjeOBegiJ+N/r3Oyq6/uEGq6dXl
         W9XaTI2K2/yadX4nAlBeBs4N2WJOPES/1/XXQezSsANw5nxx4Ya/yeu28F5zqzrzMUro
         b0435oR/35M/aGDxNRR8A6F5PvTsGE9+5OwKL4hlwbkadb2Yej5teSFtdDW/NCwkIg21
         VtrcCYWP5xeYPViWDrm8jUsU+fiGQ48U6PNS83ZspwU2h5siPZVe3cpvtxYe2wAkRuRW
         YMKXj3+AaYEoO4L4ofoNMOQm6vnharHQXr3nXF1XHtUKnYBlSC0kkhA1vbH0NDWsTz8n
         4JIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769783066; x=1770387866;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh9S7yV54xV/K3laFzFwLiYnpQQhQ4Nm8f/AYMtVUuA=;
        b=u/hCBdENHUTo2ykimJP3rZQ9ZApY27qZO6ZJHe82motrUp5BFEjjnhVAUVJjY+hB1Y
         NfS6lF1PLDM1J1EyOjn7j0STBD3rLRjbUERbtWdHFSO/eMNJnIXtUgKdOkMO9bVPuP07
         2GTzJVv8PE1bU46J1LOFmB8zHlMvMSVsb45zSwYKbsseKxl7IYgYRvOWpmo4HniXzqMr
         Hvv78s38Z/38YZG1YU4ytJ+htLIfp2FDfkm1yvqUaXFWQOCC9E/bFTY0M6jDmKOta+uf
         3oiLc1/lCuwFZn4FfGTjNmbZmF6XfVo903ko1p3Fay8uvYczG10i3nHjF+ri9j1ejMdW
         JP6A==
X-Forwarded-Encrypted: i=1; AJvYcCVEaeOW4nJcjjeegLUn5J7yS6Vx03y+7FLV4h2T+XAWys4iCaqoJdMMBP36GKAOBekQONzgxD1P1+GfUc/VJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR5M00UUdYKQhtL8tMX2qSdKpv1mptwefnV6HJTzLMbRTOd4lB
	82c7dyqFrC2tNHjRE00wvePGYD8OoN3ME8McOuKZ0MlTV5AGinE+CKsPSK6M5D03c5VfiGWlnO+
	f09k4BOhnJ+xPf+8cPw==
X-Received: from wmbhi15.prod.google.com ([2002:a05:600c:534f:b0:480:6b05:6b8e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b2f:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-482db48c8a2mr36951215e9.19.1769783066519;
 Fri, 30 Jan 2026 06:24:26 -0800 (PST)
Date: Fri, 30 Jan 2026 14:24:11 +0000
In-Reply-To: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2790; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=/ynqDc2nL4j3GmY/nB7jtyhKdp90gurfdQg25PJaHYI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpfL8SCH4OjJAHyDSphTaLdJMNdcF+hUYl/QxDy
 Jl9WyDfD3CJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXy/EgAKCRAEWL7uWMY5
 RpAAD/9aqNKc1ryV2T6NERDr2GzUvpb5oetrSoGiMEv2TW+otQ+VvrJMKBTBLkXOpz56mIZ3R8X
 aSvRLQlYOL4DxXUVf7DICLvVF4lzEWsfc4NGGE9dMJkY98AJ5z+Xr3mGFDnftzX8wU/w/UaDZjl
 lTvxvdIrtRoXX7/awedOx/WGXHqyn+x1jQMgflEwaFlexQBcp1lkTjzMp4e8x090xPeZ9YZk5XM
 kiahskQQlPWCdaiX9iqQ1E2GTPYBsZto2PXYrzjeYwTELo0ebcVUjI86asMqAGesaDy9HQj/+6n
 rnN3+3rEvNJTMm4fgxaPtFItLFgQrLnWtdNjLfGXf6ayH/ZMq1MZM1tsNov1XJ+xo8mRiHs1nSQ
 gk9jk1TebJegcNhvp6RnyudUCZpYFKEbREe6BaOtqGgV6hXBG7nPo9Nr9PlCjVO7kA51rsL9cPb
 ri/PptsrdKIIMNV9bRzNK5+EVBVoO85H3SghP5OcOOgTucFjREpXzrZAiYFS5bHe9bk+9ksZFWZ
 E+HVuLxRbwXdy5oCUdr/dlQYsLU9Ds101wWgIWG6vNYS6134JuqIPzVnafKUhs4l0Jq9hrT3Sch
 nriDL7JwNU04A964jcfOziktOxTw42Miiykz9s/4hCx/M3xpdyS4PfDqdzxXa51k1wY3yLpuKvk n0pxGwBXwACvH8A==
X-Mailer: b4 0.14.2
Message-ID: <20260130-gpuvm-rust-v4-2-8364d104ff40@google.com>
Subject: [PATCH v4 2/6] rust: helpers: Add bindings/wrappers for dma_resv_lock
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
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Taken from:
https://lore.kernel.org/all/20251202220924.520644-3-lyude@redhat.com/
with __rust_helper added.
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/dma-resv.c         | 14 ++++++++++++++
 rust/helpers/helpers.c          |  1 +
 4 files changed, 17 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 618becae72985b9dfdca8469ee48d4752fd0ca41..8d44728261ffa82fc36fa0c5df3b11a5bfb4339b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7467,6 +7467,7 @@ L:	rust-for-linux@vger.kernel.org
 S:	Supported
 W:	https://rust-for-linux.com
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
+F:	rust/helpers/dma-resv.c
 F:	rust/helpers/dma.c
 F:	rust/helpers/scatterlist.c
 F:	rust/kernel/dma.rs
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
index 0000000000000000000000000000000000000000..71914d8241e297511fdf7770336756c3e953a4f4
--- /dev/null
+++ b/rust/helpers/dma-resv.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-resv.h>
+
+__rust_helper
+int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
+{
+	return dma_resv_lock(obj, ctx);
+}
+
+__rust_helper void rust_helper_dma_resv_unlock(struct dma_resv *obj)
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
2.53.0.rc1.225.gd81095ad13-goog

