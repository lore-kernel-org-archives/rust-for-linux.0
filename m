Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC09337E5D4;
	Tue, 13 Oct 2026 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880967; cv=none; b=XLuMNeu96n5iiYnGAaAlqXbuMPQ42M6A4nEyb9ArpqHC0kfKmm61giU+16pka056fUNacv1PqsgH/OTpQnIXRLg3jVpZzApNzhevWdNcn8MXsy1bO7s3D5X396epaP8yOMMaOQKiTaPaBPwEJ/9fSo7c8oaaaiwiwh2iKbJf7PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880967; c=relaxed/simple;
	bh=5eHJuGLuYPGt8+pS1pJ5qomf1WR0etqQ6ZIMJt2QHrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BQXzrDwVz18wiI4wDBrWePervEvDTT4cof36IimcvuQ94wn/Cxp8FCL9rqenYKdf3+Ovd0TaRozlHUpPLx0jyQBK6hj/a+OKlwdR/y6H6yrBY7t1xHMgO654LcH/JZ5dEUnOvPGe83Fn+I1rjO/gSCuPu9piR2xm3GWw1E3uq3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=CfN6ACZD; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="CfN6ACZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1791880956;
	bh=5eHJuGLuYPGt8+pS1pJ5qomf1WR0etqQ6ZIMJt2QHrY=;
	h=From:Date:Subject:To:Cc:From;
	b=CfN6ACZDq7A9+fM3naGjDKFwwWbiLKlV6ddzlUzI/TKuehsgSXltJTM0nlHckzchA
	 Xgj+7QK4QSOde0ImUK6QQNOb0lx3uEqY1MBoKJNkwThwofxFOG9yDjWIa9CXsWLd42
	 EDnNlbfKn2+oHlGUqG9f/g7bt9FMfqp7ghQulA6Y=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Oct 2026 10:42:26 +0200
Subject: [PATCH] x86/rust: avoid duplication of RETPOLINE_RUSTFLAGS in
 recursive kbuild
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261013-rust-x86-rethunk-rebuilds-v1-1-d2042a72640b@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQrCMBBEf6Xs2YUkpaH6K+LBJqtdlai7iRRK/
 71RexoezLyZQUmYFA7NDEIfVn6mCnbXQBjP6UrIsTI447w1tkUpmnHqPQrlsaR7zaHwIyr2Lhh
 r9m3no4O6fwldePq5j6c/axluFPJXuDWE3qWe5q22LCtXezVakgAAAA==
X-Change-ID: 20261013-rust-x86-rethunk-rebuilds-82c0109356d2
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791880954; l=1731;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=5eHJuGLuYPGt8+pS1pJ5qomf1WR0etqQ6ZIMJt2QHrY=;
 b=lfMKaxqzlEeIb9R1D21SzJr3xDwGBhL8ZYbaKovGhwzdNOxrUVNkMnXCyRj8C5Phl15DD1c4k
 bRZxaWZ5slIDhUj70ZSXvg4n5chLWq+M6X/ExLERo6Zud+XFgh44bpx
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Currently the only modificiation of REPTOLINE_RUSTFLAGS is an append.
There is no initial (re)set of the value. When kbuild is invoked
recursively, for example through a top-level `make pacman-pkg`
invocation, then the inner instance of kbuild will inherit the value
from the outer one and append the same values again.

Switching between recursive and non-recursive invocations of kbuild in
the same build tree the command line changes and Rust code is rebuilt.
While this is harmless, it is slow and unnecessary.

Replace the append operation with a regular assignment. This avoids the
duplicated values in a recursive kbuild invocation and therefore also
the spurious rebuilds.

RETPOLINE_CFLAGS is not affected as it is always reset to a fixed value
further up in the Makefile.

Fixes: d7868550d573 ("x86/rust: support MITIGATION_RETHUNK")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
This is the only instance of this problem in my kernel configuration.
---
 arch/x86/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 8af6b80cffdd..0973b0262661 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -26,7 +26,7 @@ ifdef CONFIG_MITIGATION_RETHUNK
 RETHUNK_CFLAGS		:= -mfunction-return=thunk-extern
 RETHUNK_RUSTFLAGS	:= -Zfunction-return=thunk-extern
 RETPOLINE_CFLAGS	+= $(RETHUNK_CFLAGS)
-RETPOLINE_RUSTFLAGS	+= $(RETHUNK_RUSTFLAGS)
+RETPOLINE_RUSTFLAGS	:= $(RETHUNK_RUSTFLAGS)
 endif
 
 export RETHUNK_CFLAGS

---
base-commit: 7704c4c5bb127673b4f0ead839919db573559e38
change-id: 20261013-rust-x86-rethunk-rebuilds-82c0109356d2

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

