Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676788;
	b=O4MbKRibroYMJ0BXHzQxEKa7HNWq5X06Xx7K3lyCFdh4dd/moPNn1GPx0Rq0yAsLC5OU
	 M2dsW06j7mDvUF3h8MF2rl4e+mo9N/ZphJrgR3z2iVa50WvxJ0CpDZQB988FL8xnUNScN
	 pXONhcVcMnJGyV7otzIH+u0iXhExDvpSaqdSv34yKmkAFX38Ie8os+oFU9AaD/PPE+q4Z
	 6mtbQ68BHiNAHka8XJnMeW8opNJy+MmrPyeCqxLR0+uiPVPnFgihzvwpXo3y2hfGhi282
	 s4SrTTJy3WPUvNiWHQfp8fJO1OSmlayXD2bP1GxLhraGjbUBdj8pQMsGUDhYh0Rb+eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jhi7KnvQg/ef26FZ0fjFP3sB7to+GK9JhPoowHUG2aI=;
	b=KudR+a8KJKd/SIKqm+lZ/U5fjQ7Wi41De2sVv+TV0qS/QzSB8TB9e475MPAgcGAi7FEq
	 3o1cwbBztWrRbNKkHnFM+TobG6C9V2YuP7F7+qpXRZ+AC2+xi07SQRwgAVRxawu/JShwk
	 04SviRbRaXyVnyFuDGtXdof9MHwsd1gveO8sFA/tOKbaGjWEJl+DdnHMCrl+5oxqzfStf
	 22+bNF3AmPCdXNmK/JL4j62f6lMqJcZYhO2/J/rFn83OeqXdXD8lXvn1mdSV7jji/6Q/P
	 W+JKNyUgz8dQ6qrPXxGht+/MYh7D2xDUrG7huNzi63GQ29AtLaB2Y7BsKn7SK0Mv8+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tN3Uz5gr;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F696606AF44
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 13:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F696606AF44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tN3Uz5gr
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso17520855e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792676786; x=1793281586; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhi7KnvQg/ef26FZ0fjFP3sB7to+GK9JhPoowHUG2aI=;
        b=tN3Uz5grjx7CcyduL6odIgLUErqwxhtXcyD9deghEE2i4CUL2QgAI6UlwU3iNtiJcc
         OPW1bCUMwJO6PEf2Tcqft3V8SjMy8eCXRg9J1ev3VM5AKFkIb1O3O1zzmYVJYDymBYg/
         v7TuxJpvfkjSTwHVI5cvUUCpwHsFLB1g85oSBoXfRR/vl/m0VGS/WlzmmlBQK57XPAHe
         siCEafNIn4WKCilI9k2zrCEuhQM7RLa1pKwh2ppjXAHD6fwNjBua96ANIby1xAaRoU0M
         xHvLCWIfOSAa4zGtZUvkVV5FSqdcef24qyLsCR+Tdh0MPRK5ulon/ci8HHw7D/DAdBeG
         N67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676786; x=1793281586;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhi7KnvQg/ef26FZ0fjFP3sB7to+GK9JhPoowHUG2aI=;
        b=SEJfOAELkUWJo+H212YkeRLDTgkujCXFcNNySNK8LH+2mbJbz5Uf513HWbL/AD5EnN
         UdiRGXa4SuUPNnl2k46s3aICEpmm2Y9WkeN+Z4VregQqpmaDY5wCBq6i7lTzcZWmNxi6
         yo55JIG+9Ka5VzekBbwkDeVIw1e9X2R6us8eTnykVBrJYfDp3lTxYTJXNh4LanjLMUwN
         BttLfUVyWHgLRqARWJWeKHhhEpCBKNSLOYY5/o7Z3Sbnf5v9nr319HPAvsSAgaxuZRMn
         AwssPmIgdVgdy70dQESlILTUUFnfCWLHc4bxVaB+eCMcxUwxuDZS2gwDejK8vKiMbeaU
         I2Mg==
X-Forwarded-Encrypted: i=1; AKwUvBx0OEcbKAUQDZrv8y6/4uQAf21bLCDyC+5ASLjrjowU5rhQWxKG78arvZ8/KYFMqCeeF1thybUL9mva0csbJA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKSMR+OpEwQXYuqU7YNLAs3j6kBIe32Ool2MWqxxmVYgTdGtpBf
	ICSOl4XTSnuGYoP5x5V+6mSZcHMbBU4BPlXTL+/A7lbN9RoBj51SORYNwQaRLJIUiJh+uHJv12w
	W5FtYCp/UZ6STmQ==
X-Received: from wmbb5.prod.google.com ([2002:a05:600c:5885:b0:4a0:2531:678c])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e83:b0:4a1:6425:be69 with SMTP id 5b1f17b1804b1-4a1fdb078camr110397605e9.17.1792676786249;
 Thu, 22 Oct 2026 06:46:26 -0700 (PDT)
Date: Thu, 22 Oct 2026 14:46:17 +0100
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
Message-ID: <20261022134617.228229-3-gprocida@google.com>
Subject: [PATCH v2 2/2] rust: exports: emit ___EXPORT_SYMBOL without C declarations
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

Define `EXPORT_SYMBOL_RUST_GPL(sym)` using `___EXPORT_SYMBOL` directly:

	asm(__stringify(___EXPORT_SYMBOL(sym, "GPL", "")))

matching the `__ASSEMBLY__` path.

Previously, `EXPORT_SYMBOL_RUST_GPL(sym)` declared `extern int sym;` so
that it could invoke `EXPORT_SYMBOL_GPL(sym)`, which required `sym` to
be a declared C identifier for `typeof(sym)`, `__ADDRESSABLE(sym)`, and
(when `CONFIG_GENDWARFKSYMS` is enabled) `__GENDWARFKSYMS_EXPORT(sym)`.

This resulted in the compiler emitting DWARF debug information in
`rust/exports.o` and `drivers/gpu/nova-core/nova_core_exports.o`
describing every exported Rust symbol, functions and data alike, as a C
`int` variable.

Although `rust/Makefile` sets `skip_gendwarfksyms = 1` on `exports.o`
and `drivers/gpu/Makefile` runs `gendwarfksyms` on `nova_core.o` rather
than `nova_core_exports.o`, the bogus `int` DWARF entries were still
present in `vmlinux` and `nova-core.ko`, where they conflicted with the
true DWARF types emitted by `rustc` and confused DWARF consumers such as
debuggers and ABI analysis tools.

Omitting the C-level wrappers from `__EXPORT_SYMBOL` is safe because:
- `__GENDWARFKSYMS_EXPORT(sym)` is unneeded because `gendwarfksyms` runs
  directly on the defining Rust and helper object files rather than on
  `rust/exports.o` or `nova_core_exports.o`.
- `extern int sym;`, `extern typeof(sym) sym;`, and `__ADDRESSABLE(sym)`
  have no effect in `rust/exports.c` or `nova_core_exports.c`: the
  symbols are already emitted in separate translation units (scraped via
  `nm --defined-only`), the fake `extern int` declaration never produced
  kCFI function type IDs, and `___EXPORT_SYMBOL` already emits a
  `.quad`/`.long` reference to `sym` in `.export_symbol` that satisfies
  both ELF linking and LTO module-asm symbol resolution.
- `DEFAULT_SYMBOL_NAMESPACE`, `__DISABLE_EXPORTS`, and `__GENKSYMS__`
  are not used by `rust/exports.c` or `nova_core_exports.c`.

Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 drivers/gpu/Makefile   | 4 ++--
 include/linux/export.h | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index e372fc02139f..1269ce862ad2 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -47,8 +47,8 @@ $(obj)/nova-core/nova_core_exports.o: $(obj)/nova-core/exports_nova_core_generat
 CFLAGS_nova-core/nova_core_exports.o := -I $(objtree)/$(obj)/nova-core
 
 ifdef CONFIG_MODVERSIONS
-# The C export shim declares Rust symbols as `extern int`, so reuse its export
-# list but generate symbol CRCs from the Rust object instead of the shim's DWARF.
+# The C export shim has no DWARF type info for Rust symbols, so reuse
+# its export list but generate symbol CRCs from the Rust object.
 $(obj)/nova-core/nova_core_exports.o: private cmd_gensymtypes_c = \
 	$(call getexportsymbols,\1) | \
 	$(objtree)/scripts/gendwarfksyms/gendwarfksyms \
diff --git a/include/linux/export.h b/include/linux/export.h
index 4aeb422d86af..2a0362cc54e1 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -94,16 +94,17 @@
 #define EXPORT_SYMBOL_FOR_MODULES(sym, mods) __EXPORT_SYMBOL(sym, "GPL", "module:" mods)
 
 /*
- * A hack to export Rust symbols for loadable modules without having to redo
- * the entire `EXPORT_SYMBOL_GPL` logic in Rust.
+ * Export Rust symbols for loadable modules without having to redo the entire
+ * `EXPORT_SYMBOL_GPL` logic in Rust.
  *
  * This requires Rust's new/future `v0` mangling scheme because the default one
  * ("legacy") uses invalid characters for C identifiers (thus we cannot use the
  * `EXPORT_SYMBOL_*` macros).
  *
  * All symbols are exported as GPL-only to guarantee no GPL-only feature is
- * accidentally exposed.
+ * accidentally exposed. There is no support for symbol namespaces.
  */
-#define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
+#define EXPORT_SYMBOL_RUST_GPL(sym)				\
+	asm(__stringify(___EXPORT_SYMBOL(sym, "GPL", "")))
 
 #endif /* _LINUX_EXPORT_H */
-- 
2.56.0.218.g1ec904b173-goog

