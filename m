Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725121;
	b=fldUm1n/QMEPbyrSrfwe+qSEaVKduHcXuz3jIgO9WzKbMjj9GOxQPNjGflB2YibJeId9
	 r7lpmhP81eHu81cPHnluYLMSc6qwo+0wpiLfE+UYsek3ql4PgdtXJ6ePMo3ofGrnE4YhF
	 w45U1cuaKxUOLGetgP3na+yE4PBPFcmGHA8e82OdV3aPH8u47wLwAHYRh+wpWmjy8DiSY
	 80+d+aJtGAI7AQo6eEHbvsA4yVg/DDM9S9LsSCO7COJ9ESgDDNiZXlDm9FNp2C98vArgW
	 +rrNfyJX3zdQsCju+X6hfMb4IIdpo1j5R+J86ctDjAxHGpc29LbdqRUAkAnm6jCcAkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=cB/uJ9JF5Syzr4R9tW2xkH2SOBbaa3OatLasyEOcwaI=;
	b=k5+hdA2O43w+DB/kNbbExSGySU/gD6QKtxIDZCrAdk/DL86cExSB1mw7ktMEniv3Cky0
	 gcmtX2exaRhnMRbQ7HA7FwAXwGJfkcEDd1ImS5xiIhbxhlY6WpbiGllNr705MQfIjIp+S
	 dtejoSrDsGHRFXrD282k3u3kmOq5BWyYCYCuTIr8AO+wC0to6mz6Rdf+HlAuW5oMNH2Lb
	 vNEVrafAJN0di2WzOO2b+4Xf0gH8k1CttUb282cniulsxJJO8o7ZpkEWWHiIXBq94KzWo
	 3Coa3EQ5zb/umx0Vp5bZGPJfu9CM5FmABNSgivURNKYWVNYxjUe70B2cSrRFIW8EVMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FLUTQY5G;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0E2606A328
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 16:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0E2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FLUTQY5G
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48fbd0e703cso268879f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 08:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793725119; x=1794329919; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cB/uJ9JF5Syzr4R9tW2xkH2SOBbaa3OatLasyEOcwaI=;
        b=FLUTQY5GLbmQN42drUAeAFdCY0Stv422tGNPbY+1Oi5Z0/EFuy/VQ7GRQNOQ34uxtq
         8Rf2V2kGUFSutgBaQrafoHrraWU0hu0NNx+1S8jo3HRdcAIWPso+eqVCntwhkFR5OkB/
         hgO1MYtICioZBtiTnB4zO2pBIcUawwbphdJTboUujSNa5Ye4sT+SzSQGBhqmdBh4gdng
         6oxnsxXFVRl6OJsn8rxr9dCDMZhQ2w+2Ebk/cwGvcanNnH4n3cSrCEwcipFW0VZ+EvVe
         U6etAEgS7nuVCzyCldRQqTBrFhUU3vIZeVQQpe1fQS/wXaGTjhhWunSVOzIIwjgLrMho
         CTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725119; x=1794329919;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cB/uJ9JF5Syzr4R9tW2xkH2SOBbaa3OatLasyEOcwaI=;
        b=S0ZfRgYj8Nrp4pfLuOnJdrFhlsDe1zIFescjDCRyXrMhARVaUcza/gfKueT+CM7VH+
         uIzjf2IoRvZFhaC+UOhUIkZWzKZYTf7MUefjrJXdKLVxPlAcoefOa5obcbLpXl6VajpZ
         SnMwv9wx8rxaijN8y2FpIjeXpJY9kcmIXvnOB4iyKdK4HXtfNc2CLqsCiuZDUprUOjnD
         0A43E850i7UxKha9id8fHTUEDcmlUhcqx2uzX3OXoIxSbiCyIazP5wVm+qA9ANAJIGKW
         Xl48+B7w1ym2eFOzxTyPptlUis9kXh7rU6wTOMk1rGl8Qc1wrXLKCpj0lPFhjuYo0wZG
         fWpw==
X-Forwarded-Encrypted: i=1; AKwUvBwAaKWZKKmypRDyEmWUUknWnCkLY60LfRtw0dbpmRy13+7RJK9Q2X2Hinzgm1+8aLRPDw0MGPDiz2ia/B7dnw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/NOWgWKOQDRkrzFKm2ThvJ9vfDgSdNvqEI4gGoejOmTtl9lpas
	YEugd/dT6Fko6nNxOVZioq9YWRfyu6O3e7Y5zvb2GCWMXeovuY8XOZuXuxLgYwUnyD45atIQEDL
	I285RnnckOMRTdA==
X-Received: from wrqy15.prod.google.com ([2002:a5d:470f:0:b0:48b:11d7:5207])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40dc:b0:48d:e61d:68da with SMTP id ffacd0b85a97d-48e6e2fa50dmr31484652f8f.20.1793725119082;
 Tue, 03 Nov 2026 08:58:39 -0800 (PST)
Date: Tue,  3 Nov 2026 16:58:32 +0000
In-Reply-To: <CAGvU0Hm04LXTywU0eL6KN4=SoOAC+LU3BKqENnLR-WV-sHsuNA@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <CAGvU0Hm04LXTywU0eL6KN4=SoOAC+LU3BKqENnLR-WV-sHsuNA@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103165833.418845-2-gprocida@google.com>
Subject: [PATCH v4 1/2] rust: move EXPORT_SYMBOL_RUST_GPL to include/linux/export.h
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

Update `scripts/misc-check` to recognize `EXPORT_SYMBOL_RUST_GPL()` and
reference it in `nova_core_exports.c`'s header comment so `W=2` builds
do not warn about an unused `<linux/export.h>` include.

Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 drivers/gpu/nova-core/nova_core_exports.c |  5 ++---
 include/linux/export.h                    | 13 +++++++++++++
 rust/exports.c                            | 12 +-----------
 scripts/misc-check                        |  4 ++--
 4 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core_exports.c b/drivers/gpu/nova-core/nova_core_exports.c
index 6e80ca9792ee..51858f376c7b 100644
--- a/drivers/gpu/nova-core/nova_core_exports.c
+++ b/drivers/gpu/nova-core/nova_core_exports.c
@@ -2,7 +2,8 @@
 // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 /*
- * Exports Rust symbols from the `nova_core` crate for use by dependent modules.
+ * Exports Rust symbols from the `nova_core` crate for use by dependent modules
+ * via `EXPORT_SYMBOL_RUST_GPL()`.
  *
  * This is a workaround until the build system supports Rust cross-module
  * dependencies natively.
@@ -10,6 +11,4 @@
 
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
diff --git a/scripts/misc-check b/scripts/misc-check
index 40e5a4b01ff4..bb30247f93de 100755
--- a/scripts/misc-check
+++ b/scripts/misc-check
@@ -45,7 +45,7 @@ check_tracked_ignored_files () {
 # does not automatically fix it.
 check_missing_include_linux_export_h () {
 
-	git -C "${srctree:-.}" grep --files-with-matches -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_FOR_MODULES)\(.*\)' \
+	git -C "${srctree:-.}" grep --files-with-matches -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_FOR_MODULES|_RUST_GPL)\(.*\)' \
 	    -- '*.[ch]' :^tools/ :^include/linux/export.h |
 	xargs -r git -C "${srctree:-.}" grep --files-without-match '#include[[:space:]]*<linux/export\.h>' |
 	xargs -r printf "%s: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing\n" >&2
@@ -58,7 +58,7 @@ check_unnecessary_include_linux_export_h () {
 
 	git -C "${srctree:-.}" grep --files-with-matches '#include[[:space:]]*<linux/export\.h>' \
 	    -- '*.[c]' :^tools/ |
-	xargs -r git -C "${srctree:-.}" grep --files-without-match -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_FOR_MODULES)\(.*\)' |
+	xargs -r git -C "${srctree:-.}" grep --files-without-match -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_FOR_MODULES|_RUST_GPL)\(.*\)' |
 	xargs -r printf "%s: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present\n" >&2
 }
 
-- 
2.56.0.385.gac671c819a-goog

