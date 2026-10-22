Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676786;
	b=mtlb7r5lqOvNikRAeM//Tgd7r+Nkv3nwwnodaz0W+BEtmjoyVeYPZrjmQ/zD14AX4j9m
	 /7+1JnjHFeC0JlAIkbCbguMp04GyYp/pzu9fBMSHG1s7uxsGuZiIaTW520Gs01V145O3G
	 YsvpfzEyx3UM6HrMFEAcQ+kfad212yemut/lM1AlASwZSEDwHtTa7oFgUf0+su0SQGGAC
	 7SvrLEseHgKMieTKl/4hnqOl5s05wfb2iYbccKI5IbXOzZc/6qZlOktP80d6HF4MqXZ2O
	 skpQ/ilDkswQ7PMnyWqEtC1ph/d3NbW7666EcWCqnDXA1N2s4LqCZZFw2+StO4b3XTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=11ggokIMRypuUy0ebBD2Pma9Z5eDvf39juHTVgfmHlI=;
	b=qC4SCFTp2sUZlJhqXBVKTpOhq8JRSTQ3lStSxdXyJXjj+Y4BKGljM/WPkCH6gS2HSMR+
	 y7oT2kahG0SEqMY31uBKWaPRUEFbxgEOGdzymRF2dyNdbCfmQDVfcgWbSzZ319PHKXO7T
	 58jJMGAaALtS3aXHtgxyufdcy6/WCimoiuYVX9LaAacIm5DtWonzp1+zQFiJiFnd6G3zV
	 +dEoZ827Bbrb9HUCmSLLTBsRcEMNggDXKqOTWD1BMona435SYitZ768JHf32UBZUAAfIR
	 n2pBIs1+9HwAqZmB3DQBRvFgxd+8uIkDAn3jkU5p+JPwP2tSZ0/LCpnX8tAHaDqacWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UY8anVZf;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD06960A6F72
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 13:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD06960A6F72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UY8anVZf
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a20fd059ddso338655e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792676784; x=1793281584; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11ggokIMRypuUy0ebBD2Pma9Z5eDvf39juHTVgfmHlI=;
        b=UY8anVZfeba1Oa4XnqIXAtgHOHRwK697WtxnMGwpzGMtB9ehDQL3++wnOCCRbguj/E
         45u97155oBH1P84DgHy1y1go+UYUX9luJ9WDIXlZ0UthCHA3cp1CZfJ3JoJsRioV6w7S
         sv7VQJn9uUelOf4WDLI/beYUon2jMjwE7Q9a1ZRW++BH/DIPfs/Cxzak4iO1ixywJKjB
         r229wCcirlpnnTInw3+u/ap6ILAKAtVeZC3ePFnilm2xMWV7HRQMn8wMGxIu0dPailAr
         PjBZuCxDqA3pqITrUuGLkPst+ws8ULDD3iSWWdbMXRNppIFg6lkw4iNULKDeMRTKS24q
         QsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676784; x=1793281584;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11ggokIMRypuUy0ebBD2Pma9Z5eDvf39juHTVgfmHlI=;
        b=BnvJUojcjZ59ADC+NwssyxQoISBW/OoyWlVW1VrLysu8N/Uhh3KXZMy8R8eB4+/hnP
         0MXKdtVRSxg+0WtGXn7t1N8tR3Gv2GaVRH6HAC8P85o5g82rAofTNqUF/XQVbReZnswX
         wP/cX4UtM+HiCUy+YIb/1OsERIIQ61vlj/z1yrMQmkOFM4FbXxh1P7I89N+ZD/NT+Uzl
         tAi4j+wv/NrTiyTxzB4ycH5UWthKyi1k3bepZxR2YBB2Mdz0yN58Mg5/Ngcuto9ogJJa
         CJtxtD3p+c0jjyLbILNRU7UyzLcWWzZCnV1NAi1QBowe4cddJvpMALD3863OOe4xOYfd
         e4eA==
X-Forwarded-Encrypted: i=1; AKwUvBwJD+lK0G5KwDzWRHwgpcbz4SNah01EzdQJzFo/ooFppWe6edKhGb76Z13GmoFAE6lIXvdCa3mO4Nr1I4TA9g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4kPkLzx0ujffOYkIKF1XqbmDl+nJB8hWrZbZj9UiR53LqFn3k
	ro1NjfhR+EJEBidVHhH54i2/1yLyFs1AniLqReN2y1cq46EvJePmwAw9nROvYi27kk62RFyR3hr
	atyhOaP0ZjROqTw==
X-Received: from wmer22.prod.google.com ([2002:a05:600c:4356:b0:4a2:fdd:ce6d])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e15:b0:4a1:e11f:b2d5 with SMTP id 5b1f17b1804b1-4a1fd8a85bfmr97893685e9.2.1792676783783;
 Thu, 22 Oct 2026 06:46:23 -0700 (PDT)
Date: Thu, 22 Oct 2026 14:46:16 +0100
In-Reply-To: <CANiq72mN9JYVitqgsZ2GkdmPVWqHZpJ-WNMNviiHV6C7gQMUwA@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <CANiq72mN9JYVitqgsZ2GkdmPVWqHZpJ-WNMNviiHV6C7gQMUwA@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022134617.228229-2-gprocida@google.com>
Subject: [PATCH v2 1/2] rust: move EXPORT_SYMBOL_RUST_GPL to include/linux/export.h
From: Giuliano Procida <gprocida@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, linux-modules@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"

Move identical definitions of `EXPORT_SYMBOL_RUST_GPL` to
`include/linux/export.h` from:

- `rust/exports.c`
- `drivers/gpu/nova-core/nova_core_exports.c`

Both files already include `<linux/export.h>`.

Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 drivers/gpu/nova-core/nova_core_exports.c |  2 --
 include/linux/export.h                    | 13 +++++++++++++
 rust/exports.c                            | 12 +-----------
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core_exports.c b/drivers/gpu/nova-core/nova_core_exports.c
index 6e80ca9792ee..480472b039db 100644
--- a/drivers/gpu/nova-core/nova_core_exports.c
+++ b/drivers/gpu/nova-core/nova_core_exports.c
@@ -10,6 +10,4 @@
 
 #include <linux/export.h>
 
-#define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
-
 #include "exports_nova_core_generated.h"
diff --git a/include/linux/export.h b/include/linux/export.h
index a686fd0ba406..4aeb422d86af 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -93,4 +93,17 @@
 
 #define EXPORT_SYMBOL_FOR_MODULES(sym, mods) __EXPORT_SYMBOL(sym, "GPL", "module:" mods)
 
+/*
+ * A hack to export Rust symbols for loadable modules without having to redo
+ * the entire `EXPORT_SYMBOL_GPL` logic in Rust.
+ *
+ * This requires Rust's new/future `v0` mangling scheme because the default one
+ * ("legacy") uses invalid characters for C identifiers (thus we cannot use the
+ * `EXPORT_SYMBOL_*` macros).
+ *
+ * All symbols are exported as GPL-only to guarantee no GPL-only feature is
+ * accidentally exposed.
+ */
+#define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
+
 #endif /* _LINUX_EXPORT_H */
diff --git a/rust/exports.c b/rust/exports.c
index 1b52460b0f4e..8b2dd4aa1f92 100644
--- a/rust/exports.c
+++ b/rust/exports.c
@@ -1,20 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * A hack to export Rust symbols for loadable modules without having to redo
- * the entire `include/linux/export.h` logic in Rust.
- *
- * This requires Rust's new/future `v0` mangling scheme because the default one
- * ("legacy") uses invalid characters for C identifiers (thus we cannot use the
- * `EXPORT_SYMBOL_*` macros).
- *
- * All symbols are exported as GPL-only to guarantee no GPL-only feature is
- * accidentally exposed.
+ * Export symbols from the `rust/` crates and C helpers for loadable modules.
  */
 
 #include <linux/export.h>
 
-#define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
-
 #include "exports_core_generated.h"
 #include "exports_bindings_generated.h"
 #include "exports_kernel_generated.h"
-- 
2.56.0.218.g1ec904b173-goog

