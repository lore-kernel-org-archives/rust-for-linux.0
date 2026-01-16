Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC53E356A22;
	Fri, 16 Jan 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560955; cv=none; b=d/SLoQLYkHvMBwan1KU6OFZ+PCKdFRx4aB/GWAlRWPCWkJWLWGQnNKy5Dry+zhsnucC+jFbsY9wuYdBk+yYhhSkFxA6T6HZ0d1yEtn/S7UaO7rKb2DzxBKqpnXceMSIbips0UeCtSteM9MsL2kWBcH8Dk15GuCREaGyaRgRRRiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560955; c=relaxed/simple;
	bh=nmMLuroM0g1vhgYaajNuwlEGX4J8jLH4/9NeYtTNe30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EmUuz9p0zyOpEGxBuVnHaexA+I3AOxocGTpzw/FJipTKMHFLM3oKp3abGHfW89yesFIm6kLSNlQB5WLvCPXlhGSWOlqQV/nV5cv1CDm3RoLJgfFbYMuCdZPKlHDAhtI6NwXDozAXTCdvccFZm7XFV1o0Q6E5c4NTs95XjrYzmBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOf10bf9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOf10bf9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4C8C19425;
	Fri, 16 Jan 2026 10:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768560955;
	bh=nmMLuroM0g1vhgYaajNuwlEGX4J8jLH4/9NeYtTNe30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nOf10bf9yVedLSqaqnGYM9szkNc0hOqgrNjdMF3Zz5jwTA/wY3Fw/Iih3W+/86rr+
	 Eq9yMPgvJvcTe7SYZnFp7nNHiADZW7kaxMDazJr5QHc5WeyXsWkvDLBQi8vPv2Vc4Q
	 NHpjFHLuSY1TLcXOafDvinN5w8cY7qPJe91gwQCG2EKvjR/aINNYd6krLT32pZsRZK
	 dIzbOKDlwrX+0eodyhXaKXKpvYiCtLzmin6YwigxCDZlU2dh4/o84tb2PxvPMdT7ND
	 BevTWnZ7oiDbzne5TP3K91sOMrxUx6/0yvvePgypysvicUoqLTBjpzX9OLOuQWTSZ6
	 v0Ci9Q/9DWPEg==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/15] rust: pin-init: allow the crate to refer to itself as `pin-init` in doc tests
Date: Fri, 16 Jan 2026 11:54:17 +0100
Message-ID: <20260116105514.3794384-3-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116105514.3794384-1-lossin@kernel.org>
References: <20260116105514.3794384-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `syn` approach requires use of `::pin_init::...` instead of the
`$crate::...` construct available to declarative macros. To be able to
use the `pin_init` crate from itself (which includes doc tests), we have
to declare it as such.

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v4: none
Changes in v3: none
Changes in v2: none
---
 rust/pin-init/src/lib.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 8673008f45d2..0e707f00061f 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -290,6 +290,11 @@
     ptr::{self, NonNull},
 };
 
+// This is used by doc-tests -- the proc-macros expand to `::pin_init::...` and without this the
+// doc-tests wouldn't have an extern crate named `pin_init`.
+#[allow(unused_extern_crates)]
+extern crate self as pin_init;
+
 #[doc(hidden)]
 pub mod __internal;
 #[doc(hidden)]
-- 
2.52.0

