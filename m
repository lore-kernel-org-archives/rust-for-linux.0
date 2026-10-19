Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422793;
	b=QJZJM264DpWr7V5UuGkBfoiFCRLQTrrEPFQjvNB/DXlONW0yuwgvQA4mDy3QLFMds51t
	 XAVQ9c9zJV+0XwmVWM7ufgTjui0Gp61MevW2SvZLrhbUS+Y7fBSEw4FkJReinyMitnDlf
	 qDke5efo8YcgjQakOO3Rd23RFdx/kenKJHzVFH+AU2Vo66efjQDwCoYHujqglr1HGdYCM
	 9iwp+CEc2T9jZOLFolB2BK16hRYckIqBrzrZ/QkZoRspAv8hxOhI/0zmF1dxEQSRWxNhx
	 GWuwk5OlDMBXL7QmaAUmYJTwa+AhOFv4X/EzuiNHOBEKgJwWkeL8KIUJFBQX9n0KpkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5qWO6J48nxVZILfrpJVnMwQqaE0CaqDei+P4CSqfCX8=;
	b=HDTZpKc4paaotbcwuJM8YaPq66nbRqWg/dcyDUWmSSHRAju9dczP3/y6YCWw8FkItXk2
	 svhV8C40HUi86L1F+MUx4KtHm9qxEh+vfKn+QnBJJ17oGZi6MwCGs+vd+i/4ZlQILZsr5
	 4ahIRgTha6YXzMKuo6Y7YpCV9Z3GuoZrpST7uA3pwLrnuczAN7Qx7nahNX4Oak2INzAK7
	 YhSPE9SD7Tsr0smP3X7Wzjervb45X6yFMJ7cD+xbk+wYfHl0nAHHAXzI8cdGBsZEkzLwX
	 LhdFukghZqrLM6oBB7VWbsybWSiy/DgoAGesW2+DY50ugs7ITRAh3ErZrh+sAaLGCUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=v2HB9bW8;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DBE609A559
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 15:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8DBE609A559
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=v2HB9bW8
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48b00febba3so2023917f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 08:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792422791; x=1793027591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5qWO6J48nxVZILfrpJVnMwQqaE0CaqDei+P4CSqfCX8=;
        b=v2HB9bW8JqQeud+Y2geqQSQ72yjz/WYlrMx/+aleSfpRn9P0N69f02PT7ueHeby7OA
         rbIzAvQLdr0QT+7YuDrjOAdtwrLKpH7L/Iv0LXiupMDvUc9Us2FYtUWaFuK4WkATq7Rf
         yZJVzhoJPPvFd9ZDaIipouWtbO/Z9070XCYs1wZqbIp+3ZDLOSvbnIqb3FGJ8e/qbQje
         N8BwqgSTYvv39NbsL0cNBnRc5ONNfHHVicB2wBKPAUpH80WWteAZDF8DcA1T8kcyXBXZ
         wQNhVhmDABLRwjF699si2h4xLhtv+uL7o8LfFEgUwhLW8dkzDtVS53BcvanDNxlhVEZM
         nv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422791; x=1793027591;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5qWO6J48nxVZILfrpJVnMwQqaE0CaqDei+P4CSqfCX8=;
        b=YuJIw7LNYXSgXNpVzt7CWUZP19BuDtYTzLSideiJTfUSD6zY0qXflwlNYJX/mvCIFW
         JV+bDCyALI2SsIz8jrMreX8E1iy2G7ARzEjb84jpX/ZXCFdSO8qiJHzaHhvDHX+I6EbS
         AwrYdr0DaBLgvFG+H9kqR6bT0dAn+dzAMRxglS5oXVCw9reJTIt4BPpoFUzm+wlfN2Ft
         2Y/s7O0AE8BD9hu4WzTsI1i1lmf4BggsavIA4msHsu/luVu4yU77gcC1O/LhLGBqooD0
         JKR/jenXD+nBY8bZL0yQxN1wzV0cHq12dSkY7zDIYCwMXYLPJuHcvJiqKmh7Wqh3Vlxf
         VvCw==
X-Gm-Message-State: AFq9FYLYCmzC3HddtICGtAAeh6Xfz0w8cRwZMrk/RWT049nTkMzk6WDz
	ZyM9FGFGlJEtnSMTbk3XS2V0VX4k3T1wyhjTEJkym12jHstO8hpB690XrNpNxRzBkLvS8kkyU6C
	m/xwiJw/Itxb3xw==
X-Received: from wmbe12.prod.google.com ([2002:a05:600c:590c:b0:4a1:c745:6233])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fce:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a1d75ac25cmr189567955e9.1.1792422790541;
 Mon, 19 Oct 2026 08:13:10 -0700 (PDT)
Date: Mon, 19 Oct 2026 16:12:43 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261019151243.1595858-1-gprocida@google.com>
Subject: [PATCH] rust: exports: emit ___EXPORT_SYMBOL without C declarations
From: Giuliano Procida <gprocida@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Previously, `EXPORT_SYMBOL_RUST_GPL(sym)` declared `extern int sym;` so
that it could invoke `EXPORT_SYMBOL_GPL(sym)`, which required `sym` to
be a declared C identifier for `typeof(sym)`, `__ADDRESSABLE(sym)`, and
(when `CONFIG_GENDWARFKSYMS` is enabled) `__GENDWARFKSYMS_EXPORT(sym)`.

This resulted in the compiler emiting DWARF debug information in
`rust/exports.o` describing every exported Rust symbol=E2=80=94functions an=
d
data alike, as a C `int` variable.

Although `rust/Makefile` sets `skip_gendwarfksyms =3D 1` on `exports.o`,
the bogus `int` DWARF entries were still present in `vmlinux`, where
they conflicted with the true DWARF types emitted by `rustc` and
confused DWARF consumers such as debuggers and ABI analysis tools.

This change defines `EXPORT_SYMBOL_RUST_GPL(sym)` using
`___EXPORT_SYMBOL` directly:

	asm(__stringify(___EXPORT_SYMBOL(sym, "GPL", "")))

matching the `__ASSEMBLY__` path in `include/linux/export.h`.

Omitting the C-level wrappers from `__EXPORT_SYMBOL` is safe because:
- `__GENDWARFKSYMS_EXPORT(sym)` is unneeded because `gendwarfksyms` runs
  directly on the defining Rust and helper object files and is already
  disabled for `rust/exports.o`.
- `extern int sym;`, `extern typeof(sym) sym;`, and `__ADDRESSABLE(sym)`
  have no effect in `rust/exports.c`: the symbols are already emitted in
  separate translation units (scraped via `nm --defined-only`), the fake
  `extern int` declaration never produced kCFI function type IDs, and
  `___EXPORT_SYMBOL` already emits a `.quad`/`.long` reference to `sym`
  in `.export_symbol` that satisfies both ELF linking and LTO module-asm
  symbol resolution.
- `DEFAULT_SYMBOL_NAMESPACE`, `__DISABLE_EXPORTS`, `__PKVM_HYP__`, and
  `__GENKSYMS__` are not used by `rust/exports.c`.

Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 rust/exports.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/exports.c b/rust/exports.c
index 1b52460b0f4e..7d094d0dea1c 100644
--- a/rust/exports.c
+++ b/rust/exports.c
@@ -1,19 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * A hack to export Rust symbols for loadable modules without having to re=
do
- * the entire `include/linux/export.h` logic in Rust.
+ * Export Rust symbols for loadable modules using similar logic to that in
+ * `include/linux/export.h`.
  *
  * This requires Rust's new/future `v0` mangling scheme because the defaul=
t one
  * ("legacy") uses invalid characters for C identifiers (thus we cannot us=
e the
  * `EXPORT_SYMBOL_*` macros).
  *
  * All symbols are exported as GPL-only to guarantee no GPL-only feature i=
s
- * accidentally exposed.
+ * accidentally exposed. There is no support for symbol namespaces.
  */
=20
 #include <linux/export.h>
=20
-#define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
+#define EXPORT_SYMBOL_RUST_GPL(sym)				\
+	asm(__stringify(___EXPORT_SYMBOL(sym, "GPL", "")))
=20
 #include "exports_core_generated.h"
 #include "exports_bindings_generated.h"
--=20
2.56.0.212.g129ede20d9-goog

