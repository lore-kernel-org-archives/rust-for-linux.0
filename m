Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485727;
	b=49DhwNBmz5AqeyioptXQ2zbMz8c2YIeDKG1ZVpRvksXMsBxugGQnb1OInN8sk3Q+UusF
	 yKAyXUXGnizudh50PKE/F0n7AaHtfwXlhfBVeK8zJdqFeiXRN3rXssibHmis0tsNefFvj
	 8+CKODbfi/mIJwqr1IAMM6qt7SlPV4P6PWwHZ4/DW2MYxnmpqwTb39UUbkbyTetxs8kBU
	 wxGSpBHJ5g5QZ1KaAWisqenjfe5U53DSjH+f5ZOGNIzCPN+Mn+J9mpttcsa76rOiZhCF+
	 qTP3X1sYAUdTUZFC/p+EqsoSiU3N9Nccr/5n9o9q3Buz4DT60bMifcqNr+2T4Sm68pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FvB6uUHpvivnG+q2Vm3/jD8POQaqPZwRk2B4zcgonZc=;
	b=yRKNbJIdIZPQIlOeNtpk/y+7QUiTN0Csru5gPNhktOYEXVjNqZR0Qjnt1QzV+l06xaaV
	 roRDdwMjgv6akHzRvY4G5BfmQxB1qZ+xAaUxffKvV5CeHyZWreekiNK1xqo+uKGhAPpk9
	 C67BXjYqFDqDiI+f1CXPyksff7wBMQ/xcgRe54GNiuUSUKW9KZftkZOZE0qUEulbcey7F
	 EcmZy2gi7Iq6HcUkTZ2wWWTQl4vFIgAuN9OZQQuSpOKCryZLTS9kZ0NATs7ifiVmytlNt
	 ZRE7qclVTDZNLPIJWuwhV/UG87wFYdthkniC0ZSDJDjwTdIAbDlz0OkPtpkh1OTF3ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KBdlIXTd;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42088606A31C
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 12:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42088606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KBdlIXTd
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so34161205e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 04:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794485725; x=1795090525; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvB6uUHpvivnG+q2Vm3/jD8POQaqPZwRk2B4zcgonZc=;
        b=KBdlIXTd2dY+RihcsZYPxMUVDOD3qsJDlUJhaGne8+eVD6CRldrzSEcSc3tkN7jP/Q
         DSFwmw02G6cRAEMKEp1uirvgOSyLnINZ+K9FE0a1m/SzezLomfenOs/EqOyVpLNSqiM8
         Yw2fgJfK/9pstrW7s2gqezli+t1UVmXLCkSAR9FmMwthBKSDYFnYOFNSZerVk61yow/l
         s6JyJwDaRNNPUlZ2wKklsFk7dnKMMfGrlWntr23vz1PYfMBY3pdv3CDOzAFqJCgYbJ0+
         F34xQHoMW3SP4m7dvATKnVrWoncEmBsMUVm/a0lXdG6fNZLHqLtJXitln63i9oYnW7Jo
         BKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485725; x=1795090525;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FvB6uUHpvivnG+q2Vm3/jD8POQaqPZwRk2B4zcgonZc=;
        b=H46yv1rnIzM0ilkDATe/GSy083XQTyqJHDJ7H4TAa0uushf3eIXRPdVRv4og0YzJqC
         f8fCAqGC1AqHqinERIlzl8ptQctYtNV30roUuhJE8Mv8nqevHv3hHlL/iWS9BaYuPGt+
         cA8f6MGSFykNcL9GrOXCq3c1Tqb/vOLSqBNKv9ey/oqoPiHrkqyfoDmQVKotvplGaYxy
         UbCIb8F3Lp3bnpZh1EGM/8L3gyJY37JapA6rkuY5SKdJuv0R1QAxlrqFALX1crac4YSi
         ssVEIvo3xr4oXDrwqMwqt4ileLuSY+OStzxt3eIjXiOwTjhoiLw3URWopMD+vdUggqHx
         WGpg==
X-Forwarded-Encrypted: i=1; AL+hErHU0RyDE+ZWDEvSq6UVTCBfDLTArg1S4iOUIbZkuXpoudRqMuYwcPayVJGVAl8A0Rq7zO0vXGIcV0UI6mMTYQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ocyvPIAMssm0pb/3eK8xpxsgCUzORNhN8SjKI42CIiKn3jYyC
	36bjSL9sJwPrbP7QQvPU3gzySQ74JRzgTouOCpS6elugoP4jz1rOIOXE1hamSq4gwwCfwKvXgFP
	5QKD0YBWe7MPozQ==
X-Received: from wmba9.prod.google.com ([2002:a05:600c:6dc9:b0:4a1:b748:caa2])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3554:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ba0937ded6mr99563065e9.31.1794485724216;
 Thu, 12 Nov 2026 04:15:24 -0800 (PST)
Date: Thu, 12 Nov 2026 12:15:11 +0000
In-Reply-To: <20261112121512.1670347-1-gprocida@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112121512.1670347-1-gprocida@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112121512.1670347-4-gprocida@google.com>
Subject: [PATCH v5 3/4] gpu: nova-core: convert nova_core_exports.c to assembly
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

Like `rust/exports.c` before it, `nova_core_exports.c` defined
`EXPORT_SYMBOL_RUST_GPL(sym)` with `extern int sym;` so that it could
invoke the C `EXPORT_SYMBOL_GPL(sym)` macro. This emitted bogus `int`
DWARF debug information in `nova_core_exports.o` and `nova-core.ko` for
every exported Rust symbol, conflicting with the DWARF types emitted by
`rustc`.

Convert `nova_core_exports.c` to `nova_core_exports.S`, emit
`EXPORT_SYMBOL_GPL(sym)` directly in `exports_nova_core_generated.h`
and switch the include path and `MODVERSIONS` symbol-versioning hook in
`drivers/gpu/Makefile` from the `.c` rules (`CFLAGS_*` /
`cmd_gensymtypes_c`) to the `.S` rules (`AFLAGS_*` /
`cmd_gensymtypes_S`).

Also set `private cmd_gen_symversions_S = $(call gen_symversions,S)`
under `CONFIG_MODVERSIONS`. Kbuild normally defines
`cmd_gen_symversions_S` only under `CONFIG_ASM_MODVERSIONS` (which
requires `<asm/asm-prototypes.h>` and is not selected on 32-bit `arm`),
whereas `nova_core_exports.o` generates CRCs directly from `nova_core.o`
via `gendwarfksyms` without needing `<asm/asm-prototypes.h>`. Although
`NOVA_CORE` currently depends on `64BIT`, keeping the `MODVERSIONS`
override self-contained avoids an implicit `CONFIG_ASM_MODVERSIONS`
dependency if `64BIT` is ever relaxed or the pattern is reused by
another Rust module.

This removes the last definition and use of `EXPORT_SYMBOL_RUST_GPL`.

Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 drivers/gpu/Makefile                                  | 11 ++++++-----
 .../{nova_core_exports.c => nova_core_exports.S}      |  8 +++-----
 2 files changed, 9 insertions(+), 10 deletions(-)
 rename drivers/gpu/nova-core/{nova_core_exports.c => nova_core_exports.S} (62%)

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index e372fc02139f..49205525d2a5 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -36,7 +36,7 @@ rust_needed_exports = \
 
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
-	$(call rust_needed_exports,$<,$(nova-core-export-deps),EXPORT_SYMBOL_RUST_GPL(%s);\n) > $@
+	$(call rust_needed_exports,$<,$(nova-core-export-deps),EXPORT_SYMBOL_GPL(%s)\n) > $@
 
 $(obj)/nova-core/exports_nova_core_generated.h: $(obj)/nova-core/nova_core.o $(nova-core-export-deps) FORCE
 	$(call if_changed,exports)
@@ -44,12 +44,13 @@ $(obj)/nova-core/exports_nova_core_generated.h: $(obj)/nova-core/nova_core.o $(n
 targets += nova-core/exports_nova_core_generated.h
 
 $(obj)/nova-core/nova_core_exports.o: $(obj)/nova-core/exports_nova_core_generated.h
-CFLAGS_nova-core/nova_core_exports.o := -I $(objtree)/$(obj)/nova-core
+AFLAGS_nova-core/nova_core_exports.o := -I $(objtree)/$(obj)/nova-core
 
 ifdef CONFIG_MODVERSIONS
-# The C export shim declares Rust symbols as `extern int`, so reuse its export
-# list but generate symbol CRCs from the Rust object instead of the shim's DWARF.
-$(obj)/nova-core/nova_core_exports.o: private cmd_gensymtypes_c = \
+# The assembly export shim has no DWARF type info for Rust symbols, so reuse
+# its export list but generate symbol CRCs from the Rust object.
+$(obj)/nova-core/nova_core_exports.o: private cmd_gen_symversions_S = $(call gen_symversions,S)
+$(obj)/nova-core/nova_core_exports.o: private cmd_gensymtypes_S = \
 	$(call getexportsymbols,\1) | \
 	$(objtree)/scripts/gendwarfksyms/gendwarfksyms \
 		$(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable) \
diff --git a/drivers/gpu/nova-core/nova_core_exports.c b/drivers/gpu/nova-core/nova_core_exports.S
similarity index 62%
rename from drivers/gpu/nova-core/nova_core_exports.c
rename to drivers/gpu/nova-core/nova_core_exports.S
index 6e80ca9792ee..90a9f709ed38 100644
--- a/drivers/gpu/nova-core/nova_core_exports.c
+++ b/drivers/gpu/nova-core/nova_core_exports.S
@@ -1,7 +1,7 @@
-// SPDX-License-Identifier: GPL-2.0
-// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
-
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
+ * SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
  * Exports Rust symbols from the `nova_core` crate for use by dependent modules.
  *
  * This is a workaround until the build system supports Rust cross-module
@@ -10,6 +10,4 @@
 
 #include <linux/export.h>
 
-#define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
-
 #include "exports_nova_core_generated.h"
-- 
2.56.0.567.gdb80ae8cd5-goog

