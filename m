Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485724;
	b=PTlydkNrLDvBZ8hYFmZMDKZMbtWf3NBPXXaIW86cNmisWj3RwcM4ComR16QPfrrJ22el
	 3ukARHWLbYMAU+ki60S05+0lClNC1fm/tOhqy93FGqX8RLZqCHZiv3YEhu6T/A9cJUCAN
	 VNLTmhxchdTdR/C5BLpsKC//jmmQzSL/u2usW/oP/6ZmylJtEXo3yQGgQgudhUgraAz3x
	 cV74s8SNXnBFIL0rQNUJvmRr/DtJHeDLiBQXUgGqoWW8WfkSgtI8UStorwIj9HYbckcNX
	 De5V3wx8zdpVZIPpnUJbW45FlBBls6QhqofdkTnb4Gx4HeXgbdD/QR4eshDDPjslhTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=45z5YfrL9I48bRl1PrF4Vt8PvNpnRKDiwkVvBZd1m84=;
	b=4s4rhUsU7B9TbF1mz3cwZbo9d/FLBiiG4rgCG8m1FKJE3Gry3WLkF2XPhhGQbA8cvHug
	 a6EKZLLfAnt0NQJvwzUx34B4IhQhtIfxd9zUZBddStLaqXt16Pj9NxXBSKNHn0e9lEwYD
	 LMfp5eID5YYUEMM39Ilbnnb4j2wwwa129huQuJyKzrORT45zCiCCLJkB1g7kJnT69lCWq
	 hiuDUG+vI4XI94h37ebyesZSvwz1ryFzWYXKx/9Rcm63bW1SfsTW5Rzdt++o1RL5p+9FV
	 NlNqgM04TBoPNy5eN4ru3DAf/3kLbqwDY6/tGLdxcv873udBw7eBHXK7BfLSmc5stsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X6uVtKQz;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCD8606A333
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 12:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCD8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X6uVtKQz
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a80bd45e1cso23961235e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 04:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794485722; x=1795090522; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45z5YfrL9I48bRl1PrF4Vt8PvNpnRKDiwkVvBZd1m84=;
        b=X6uVtKQzS+1TEA+H1VPRtBhwGUEOnSobHUoaHnDHHAsgGYADbViXWqXwUZOVUNsd/W
         ppWsnVKhWXTlbQjQPtd14r3y0beBTwsWgtSV/E4q48mhImTmnU7LPmYACaEInJXpJBhe
         Fk+edEZhcHms06RcOQ31NssQBGEyYbJoxFEmziQgN2feVogKnYh2gJccjNolvPdt78po
         cOSR2uE1KY5SOnItS0Ldj3ER+YWgPA91pX8sz8PSWG9Sdl/jGyWJu+kGvcn8AWtUMFvx
         AdP6MrhddmRfDqTrPh1+dLV96HYMoqcNyZp+NGSaRvg65VVoxi9mK1YXW5zluSmL2u8p
         OycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485722; x=1795090522;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45z5YfrL9I48bRl1PrF4Vt8PvNpnRKDiwkVvBZd1m84=;
        b=yZU6W3SXSds888ZkBpKXqcJdHM12ACjvgl21hgciWjdsL6YR56iXicrrIcCL8Xj09P
         +wnnCUc9dmekDPR4aNDlCTquxmWdtC1Py6JBKF/iop3pzOOqTjrFTKKb5D9nj8ykKmmQ
         YhRZ20O8YLChfc4L7MBVlngTwf2A/oljaqJ+7PrsJT4BTQJOQtjFKR4nEeE50PeLYaP7
         DubhD0b2Uzewz6jdvxrcmmqz2aFNkdJfdFtulZcZu3aoOc3adHynhUnkFQIt+3BYx9Yy
         F9xk6hWRe6COtnUo5+jpYv1zmCzQIQpVjMuu+T7WNuLnQlVqBxkhyOr7hYmQB1DoK2na
         bdxA==
X-Forwarded-Encrypted: i=1; AL+hErH15uQ1FZf6Gr8oZV1xKNc2ZWpPf6QShv1+DAXaYc0jGE8a7h3XkaVbA1gjgJNqNforaw7qkvPVzxjEmN5b7Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Urk4hw4L4Kt4aUg8VHgPXGbGzbt/oDVyebfBr7NusiguKrGJB
	Ij6JGe0NsYH5ftqYNKcdA7Un2wHPEkVE8GNfewBx4qtNgsE6kTOxznLz5AffYJTfg6/mzKUCKuP
	0Cx0kTSiX/pgLtQ==
X-Received: from wmbfc17.prod.google.com ([2002:a05:600c:5251:b0:4a3:5d65:cf26])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4513:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4ba0931d928mr93908205e9.3.1794485721754;
 Thu, 12 Nov 2026 04:15:21 -0800 (PST)
Date: Thu, 12 Nov 2026 12:15:10 +0000
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
Message-ID: <20261112121512.1670347-3-gprocida@google.com>
Subject: [PATCH v5 2/4] rust: convert exports.c to assembly
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

Previously, `rust/exports.c` defined `EXPORT_SYMBOL_RUST_GPL(sym)` with
`extern int sym;` so that it could invoke the C `EXPORT_SYMBOL_GPL(sym)`
macro, which requires `sym` to be a declared C identifier in scope for
`typeof(sym)`, `__ADDRESSABLE(sym)` and `__GENDWARFKSYMS_EXPORT(sym)`.

This caused the C compiler to emit DWARF debug information in
`rust/exports.o` describing every exported Rust and helper symbol,
functions and data alike, as a C `int` variable. Those bogus `int` DWARF
entries ended up in `vmlinux`, conflicting with the true DWARF types
emitted by `rustc` and confusing debuggers and ABI analysis tools.

Convert `rust/exports.c` to `rust/exports.S` and emit
`EXPORT_SYMBOL_GPL(sym)` directly. Under `__ASSEMBLY__`,
`<linux/export.h>` expands `EXPORT_SYMBOL_GPL(sym)` straight to
`___EXPORT_SYMBOL(sym, "GPL", ...)` without requiring symbol
declarations or emitting bogus DWARF entries, while also avoiding a C
compilation step.

Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 rust/Makefile                 |  2 +-
 rust/{exports.c => exports.S} | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename rust/{exports.c => exports.S} (72%)

diff --git a/rust/Makefile b/rust/Makefile
index 0ac9ab28cc2b..2e5f5a84bb24 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -564,7 +564,7 @@ rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__(p
 
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
-	$(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n") > $@
+	$(call rust_exports,$<,"EXPORT_SYMBOL_GPL(%s)\n") > $@
 
 $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 	$(call if_changed,exports)
diff --git a/rust/exports.c b/rust/exports.S
similarity index 72%
rename from rust/exports.c
rename to rust/exports.S
index 1b52460b0f4e..e1a6923081fa 100644
--- a/rust/exports.c
+++ b/rust/exports.S
@@ -1,11 +1,11 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * A hack to export Rust symbols for loadable modules without having to redo
  * the entire `include/linux/export.h` logic in Rust.
  *
  * This requires Rust's new/future `v0` mangling scheme because the default one
- * ("legacy") uses invalid characters for C identifiers (thus we cannot use the
- * `EXPORT_SYMBOL_*` macros).
+ * ("legacy") uses invalid characters for C identifiers (thus we could not use
+ * the `EXPORT_SYMBOL_*` macros).
  *
  * All symbols are exported as GPL-only to guarantee no GPL-only feature is
  * accidentally exposed.
@@ -13,8 +13,6 @@
 
 #include <linux/export.h>
 
-#define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
-
 #include "exports_core_generated.h"
 #include "exports_bindings_generated.h"
 #include "exports_kernel_generated.h"
@@ -23,7 +21,7 @@
 #include "exports_helpers_generated.h"
 #endif
 
-// For modules using `rust/build_error.rs`.
+/* For modules using `rust/build_error.rs`. */
 #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
-EXPORT_SYMBOL_RUST_GPL(rust_build_error);
+EXPORT_SYMBOL_GPL(rust_build_error)
 #endif
-- 
2.56.0.567.gdb80ae8cd5-goog

