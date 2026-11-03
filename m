Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710782;
	b=lY01YFoYnQ4vtv2WdspoUoFFTJwLdmpBDhJTQo/kSF2t53yqkf2gXHFh5Z1kfrmvBCXp
	 jSg9a6ww/tofB4OXu50mtRBjF/u+FFkWuhCXcd8Ne6jr1YlbZu60YUNS/eeMXno8Fdz+0
	 ZalG+JC5QJkaNgPp1EtFILAIFyUvSImXc7dzuqq+Sx/DgTbGzjeu+R+ZzO9s4T9WI+q+o
	 JtBxKEEXVDnjS6k/WGqfdsCNGeqG+cZsDfC/s27Hu2Vrxlnfp9jm0Y3lfnNbEjQDaLTsJ
	 UlhH1a9H5f7JR2fO8NB0wD5G8+tjOYWUfLgD3C6qYUQ0hP0gWbIsz4YFUqF6pdHrCJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XA8gwtcBTdgYB+sh1p56Z459oRwVTCtDjhOE2Ccb1U8=;
	b=DAHlVLH0Mid7YmHRMxpQbrq9ePImgKfQhR1CksU5U4Ioasw68SCYTT6M6cD/NVyGhA+j
	 bRTNX8dHl53k6sjfdhreR39lcoubJXs+fqoVJjh1MAuEQjp1LrM73FRQEgNv0v/lh/Rpj
	 s2cxUB2NPuzBLiZo5qTgLgajjWPgmtowjFKD1xw3lPZp7G7hB9V2VXCT9xG3rfdmVGe6K
	 QESbsehepR6aPbjB4MJQjx2sHY3AX3wVgEtdvWZndtAQBLLRYsLQp5+ACrv+a3dGquTen
	 GDGcRqhCLyubMFzWgCLUnV1CrjC3KQ01h+vJx5SPSHHiZol0AHCjFKkZP76S8FATyxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MuCrWwLd;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223F5606A326
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 12:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 223F5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MuCrWwLd
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso23543655e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 04:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793710780; x=1794315580; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XA8gwtcBTdgYB+sh1p56Z459oRwVTCtDjhOE2Ccb1U8=;
        b=MuCrWwLdN8lWKJqzlvJepW9HZ37onxzXfP0ZCDcuRdeU6CgHtLmHO3ehxudyuiz307
         B8N0ginxAd6niIdXltDEsK5UHC0/GcVSh5bvXtiyO2EXI6e0nl8lAkoWgY6KPA0aWKsw
         9pcwjEvxEVC1IbPQIW1TR7RquNIJJGzV6YIC6Mpa3xd1CoExvSMeDk0GUTkd+JnOsQoh
         wN5sjan+wZoQxdf6ezQnPZnve6uBKZoZQCiZIAnNcARg8fLRLlkc9EWuFcl1SNF9n2IL
         JWat+SpfzchBS8QgzIdnw5HtYe8E5eKc9sgsocgR5LjZFEvtMfyIvIngYQNEnmZ6YO2I
         3cIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710780; x=1794315580;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XA8gwtcBTdgYB+sh1p56Z459oRwVTCtDjhOE2Ccb1U8=;
        b=sV6PWetdyTZL6eAwv7NgreXhctbIHkjE5gveax+jpX1NiI7LJJHOZUAGz3om86d1NZ
         0UpVnuTHtQHMfZGTkafjVEh+acmTfwtHE1yV4zkei4tWMZeExCm+GTJh07OK05uBmEbV
         P+8z2GvpJ1JyecuE1Ix46iVMXhm/p96kLS59eapiPRTEPeqRFij5zzt2Y/kPcXEhKAxt
         rsgzK58SgBrnjIscOTkk13U9URzRyXiQ9BkyIlCF/RqRF/0F8QKQUkFizHcE2iKFqZyr
         tKN8sEzpAaxfcc6xsfTGHfCsLfzFRt2bBeiYjfC6pnKyeNJ9DwLlh0gNzeVzxY/loELY
         PjFA==
X-Forwarded-Encrypted: i=1; AKwUvBzGZ9n2GY1H3R+0j8pGTeEE3WVjOs54NVHqo1+c6AGraxrjTPjBGjw6S2wcTi8+PMAVYXbNBpmG8Moglk1iDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+lqfon/tPI3IqbQlpZl7fe9LzXKGhto6wp6LR11iuvhGEcePR3
	CGdZIBJ0c8vRmwqm803kNF17Ey+c7+Om736IHaOfeXJgvykLZ4D8lnD83vIFwHDJ/Gn7mPFlTg7
	9v7/2fZPYcMVEFQ==
X-Received: from wmhj19.prod.google.com ([2002:a05:600c:3013:b0:4a1:93c0:d3c4])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:474f:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4ac1793ed87mr302225515e9.24.1793710780367;
 Tue, 03 Nov 2026 04:59:40 -0800 (PST)
Date: Tue,  3 Nov 2026 12:58:14 +0000
In-Reply-To: <20261022134617.228229-1-gprocida@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022134617.228229-1-gprocida@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103125814.258105-3-gprocida@google.com>
Subject: [PATCH v3 2/2] rust: exports: emit ___EXPORT_SYMBOL without C declarations
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
2.56.0.385.gac671c819a-goog

