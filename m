Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D987E3FE65B
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538759; cv=none; b=dS2zm8vdozIxQrUxeRxdMZ3a/pGoY4Bn5j4CaJcQ5CKCcCn5yaSbqjH2Ox40v+IyO5GcId2XzhliqjKl97NOaoZRroQ9Ie8gET1vWuUnLttCwCiV1LRyGoSdFETBGGCh+Jl6ACu1Xrlp93Y4pN9rhaZP8FKTLxdik2CqEdU5YQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538759; c=relaxed/simple;
	bh=8ETadglAjaG7AHLMZ/ghtdaqP5Ysza0qOceDqwHbL0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nYkL9r8enWLXXPB/+JQke17HGRn+mVUKIVEKoQrNnjr7mwJgXc3wCFsQQzp2XTHivxKal/jp+rhEiNKxAID6zTAnSqPP9x/yoC1U4rbj4zIbdIlABH0qfvGEc7G3j+fGYbz5DS73P3OPgc0tAe9l09VcWy6Y1g3Yh9RayMqC+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iFEixd76; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iFEixd76"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-486f830f4e4so12547305e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774538756; x=1775143556; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGI812ogRgf7xjY2uKTJWNIiKDkrlv+vQMBI465KlG4=;
        b=iFEixd76BDnznuT5z9nf02Mzc98hpwQDTYCPzFBV03wjuuxVqsmfIVSQ1pqVdS0mMG
         B1skKvNk5AXk0LUXQQUtwMOMtjUXymGUfF6Gfp7XsXE+NSO7cECy/Wm94Q3+yk5mRVZS
         T/YzamzfxozyZUwAKeYDTEYMzI44ahLAxCSaRzDQcG9OVAy9SMHk5QsjjbZQ+i7Jvwmw
         jcMU1WMb2pw/VH1kpYdS6lKd5JZYmdMI1yMSbdLbwAWBuBXGPI59HRKT6myJbDFKh4GW
         K1UO4VQ+Y43QS+n3j+8nVYyxufTiBKSaji+fJ/x1FY2X9Zr0IVcDSEtLzp0IW+mktxyX
         8ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538756; x=1775143556;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGI812ogRgf7xjY2uKTJWNIiKDkrlv+vQMBI465KlG4=;
        b=cg2mVvIWM3Wzp702uPBSqJkzTo9J3eKM1AUrssuz9iSweaOySLbl7esOKWKxYGJlzt
         Hf1ell8hKdd8xEaUYsKO7xMvQ6l0av524AMu9XD5bi1OGG3bYW9omHicw53HPkruGreM
         V7huLFUNgwM3mQQPzGO1bv8BebjzxKrsoHNTQrjoueP5gsdQSSOGrcZsFYkoNJoyOrgC
         HC82ngQ9TeLhBZ35EDP8+EAIDvMsboO740XNs+2IgHw8QY+QjYmJsZ7o715vaCvt2oYm
         IRCzU6P+YF4PCt1bzguunuQcqPkS5pC+SX1DIMftlasMapj1YRK9pnseDxOdktNNUwfs
         yGBw==
X-Forwarded-Encrypted: i=1; AJvYcCVQpZuKs2ySwcaAn6PyxFAWnG6/MS+mOGvy8m8O6vOup4hTCGGUMwbj8+VVGlw+b9dU5yNkyEanhToVQddnHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMqg4PQfTJIFujomuzWssfZ4G/+q4xU0swV+x+PG4VsGGUz82S
	NhINfN/817wlVlBz7fSkI3phDNdStJhG98AE7qjBbKEe09v3Yj4+RxeYG54NNN6RUoGOJMefBLd
	1eN7Hp4Zr1uautBd+HA==
X-Received: from wmsk8-n2.prod.google.com ([2002:a05:600d:8488:20b0:483:6cc0:9daf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c5:b0:487:467:4276 with SMTP id 5b1f17b1804b1-487160ab146mr116334945e9.30.1774538756267;
 Thu, 26 Mar 2026 08:25:56 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:25:36 +0000
In-Reply-To: <20260326-drm-rust-next-fix-aref-v1-0-7f6f58d2828a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-drm-rust-next-fix-aref-v1-0-7f6f58d2828a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=891; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=8ETadglAjaG7AHLMZ/ghtdaqP5Ysza0qOceDqwHbL0k=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpxVABHNAGQa6Y/giqeifOnyYAZavwDyC4n21IH
 nfASus7yRCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacVQAQAKCRAEWL7uWMY5
 Rk+fD/9ZmJclSHvBZCxLoRTkDpgIuciOQJ6vLTB0kGsN4F6NHU9YJJiv8T3av5opWjHbwO1TD/V
 xVJqjqsQTA6XtxkhuyuG1bkDprPCbbS4Ov7R/so49fqtdvD7J7wosm6jxKJNQ4R/84hjwNepgt3
 JS6mbNFawhn5yXNeoqpGUuApD+v40ieMCWkF5Nxt2WcpxqMjQalOsuiqexuegOjVsAAbKm4Qp6q
 ykaMkMgHXDUCZzY2QRyMN8tdPnADOvGM4T9Ib1aVLmeS8TM8rImO8pqFaIPuiJEvZ0+ElREcsSy
 FpbH4K3SNFdMLIrSJ1y6U7RNHoYAV/ERPey7PLEs4RghjXkMPdInBne5GjZzPbqEpBQtTtPjLTq
 /DIu4rdTN0zq87aYfg/34Q0bGeiBBQfnWPKLfibPcS/NFOn6Ifm7yu6z03tAlcfVWGvRl6KlM+C
 dWdFa5Nj/vjUC+IlBvFNDaZlBKuAb07aUEI9HuqKJyUXEFpkWmD8Y6jqFJpGNBbKFopISUBYG7S
 KrpW5B7+U3ZwQ8IvZ8VFzCIXQsRFRXuPxvv5/a6kCEXUuSoGDZnqm9wTan50A7dFPIsuMlvPbgX
 lBAvl/qOTFKRn6QtxsE8ytT7p4U48aqaubSM8IHt9ZdOTh00fda6S15IQtMUWis8KLxen4WDyCG 1g8UORg/BkD6tJA==
X-Mailer: b4 0.14.3
Message-ID: <20260326-drm-rust-next-fix-aref-v1-1-7f6f58d2828a@google.com>
Subject: [PATCH drm-rust-next 1/2] rust: workqueue: use new sync::aref path
 for imports
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

ARef and AlwaysRefCounted are being moved to sync::aref, and the
re-exports under types are planned to be removed. Thus, update imports
to the new path.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/workqueue.rs | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 4ee4ff567197..019feafd3459 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -189,10 +189,12 @@
     alloc::{AllocError, Flags},
     container_of,
     prelude::*,
-    sync::Arc,
-    sync::LockClassKey,
+    sync::{
+        aref::{ARef, AlwaysRefCounted},
+        Arc, LockClassKey,
+    },
     time::Jiffies,
-    types::{ARef, AlwaysRefCounted, Opaque},
+    types::Opaque,
 };
 use core::{marker::PhantomData, ptr::NonNull};
 

-- 
2.53.0.1018.g2bb0e51243-goog

