Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9599E2CCB9;
	Fri, 22 May 2026 18:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779476078; cv=none; b=IJh3CilUg+elImvegiS+srHU4wLG9BvuCf2VsI7Yp8hwYXzcCrdO7JzglyymAoWuCVjdNVxiRbihfAcRdIdUE/A26bzKvUTP34QYPb2N4DHb/W9bAkSEfsE0GBAfryAnSwAQ5Nnf1LcjCxPw+M6rC90fm4+biGQ9zRxB5WxHl/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779476078; c=relaxed/simple;
	bh=C28Sygapjp8AoMx9nJYbV8Ce8lFoOZM3Xza8J1JzAjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Dq7AootoaFLweUBEbfyePs9Xf+97XxdCmUwk3tRVJadTv+bdzNLFDoxX/DATatkvcwfeUOmFdyrdJHAmpY51manGxO95cJWweRmWTBB1LnxikASq3yukbL+12HN0354f81Gnk7JfLVLQuiq95oWYcl75v5TCNNVittsQV3zuvL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bewJG9qw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bewJG9qw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20562C2BCB3;
	Fri, 22 May 2026 18:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779476078;
	bh=C28Sygapjp8AoMx9nJYbV8Ce8lFoOZM3Xza8J1JzAjM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=bewJG9qwiHOhAVH4G/7WQJICZgGT5ZvPSM7a9rkT0sDsdIPUVmjGRk2KBQ3s60TBd
	 sH48l/fKfu/v8QbiOAxxLxagKO9AXCC6nphrYPV/qzotD8pY0HxHrFHkaxT96/OANG
	 vlfvayL/+NrDQ7XNwGc7yc7jsmbwEtcGCa+nYfdQMKL+s+p4AT9b3E77L39jeP4ojm
	 4CAqVVII78Lovmp6ahD61xZ/a/buItJkwrNGscRi5xc8+YAELdkREn8TcGvjazyTld
	 HUaXbqGjajnibKkP7+McWSHTFTwiWH+NHBJd01/aSheGWsWmQs7wNKM+zudK2tJG/1
	 I/IleI1UnAbxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EFFCD5BAC;
	Fri, 22 May 2026 18:54:38 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamkalra98.zohomail.in@kernel.org>
Date: Sat, 23 May 2026 00:24:32 +0530
Subject: [PATCH] rust: helpers: add is_vmalloc_addr wrapper for NOMMU
 builds
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-is-vmalloc-addr-build-fix-v1-1-73c919440c41@zohomail.in>
X-B4-Tracking: v=1; b=H4sIAGemEGoC/yXMywqDMBCF4VeRWTtggjXiq4iLXKbtlKgloyKI7
 95Yl9+B8x8glJgEuuKARBsLz1OGKgvwbzu9CDlkg650Uz20RhbcRhvj7NGGkNCtHAM+eUfrfKN
 qp0xrDOT/N1Ge/+1+uC2r+5BfriCc5w9BUuNAfQAAAA==
X-Change-ID: 20260522-is-vmalloc-addr-build-fix-abc614b17877
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Shivam Kalra <shivamkalra98@zohomail.in>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779476076; l=2056;
 i=shivamkalra98@zohomail.in; s=20260402; h=from:subject:message-id;
 bh=LJ4TLD8iJ3hsEvAhMLjG4dWdTD0MC/CjygrBq8gPX58=;
 b=pA2fdl437H22PmNqGMoo/efVY7f1qPypW1Nj6rG9s33a/tAaNMoDjP+i9jW4eAqR2mJpWKZZ2
 tUfMTtlTf7MCyWxWH4enLgjkWWGyMtXJYCZDFuCEalOmzRVNHbkUtJD
X-Developer-Key: i=shivamkalra98@zohomail.in; a=ed25519;
 pk=U8kQSxcte8P8iZ6zB7phIj+Yl+i/5ntifBGuclgypx8=
X-Endpoint-Received: by B4 Relay for shivamkalra98@zohomail.in/20260402
 with auth_id=716
X-Original-From: Shivam Kalra <shivamkalra98@zohomail.in>
Reply-To: shivamkalra98@zohomail.in

From: Shivam Kalra <shivamkalra98@zohomail.in>

Commit 47ac2a4b5cd8 ("rust: kvec: implement shrink_to for KVVec")
introduced a call to bindings::is_vmalloc_addr(). However, this
fails to compile on architectures where CONFIG_MMU is disabled,
resulting in the following build error:

    error[E0425]: cannot find function is_vmalloc_addr in crate bindings

When CONFIG_MMU is not set, is_vmalloc_addr() is defined as a
static inline function in <linux/mm.h> that unconditionally
returns false. Because bindgen skips static inline functions
when generating bindings, the symbol is completely missing from
the Rust bindings crate.

Fix this by providing a C helper wrapper, rust_helper_is_vmalloc_addr(),
in rust/helpers/vmalloc.c. This ensures the function is reliably
exposed to Rust regardless of the MMU configuration. On NOMMU builds,
this allows KVVec::shrink_to() to successfully compile and correctly
route all allocations through the kmalloc realloc path.

Fixes: 47ac2a4b5cd8 ("rust: kvec: implement shrink_to for KVVec")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605220811.LRplxeBR-lkp@intel.com/
Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
---
 rust/helpers/vmalloc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
index 326b030487a2..6aed13292313 100644
--- a/rust/helpers/vmalloc.c
+++ b/rust/helpers/vmalloc.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/mm.h>
 #include <linux/vmalloc.h>
 
 __rust_helper void *__must_check __realloc_size(2)
@@ -8,3 +9,8 @@ rust_helper_vrealloc_node_align(const void *p, size_t size, unsigned long align,
 {
 	return vrealloc_node_align(p, size, align, flags, node);
 }
+
+__rust_helper bool rust_helper_is_vmalloc_addr(const void *x)
+{
+	return is_vmalloc_addr(x);
+}

---
base-commit: 6779b50faa562e6cca1aa6a4649a4d764c6c7e28
change-id: 20260522-is-vmalloc-addr-build-fix-abc614b17877

Best regards,
--  
Shivam Kalra <shivamkalra98@zohomail.in>


