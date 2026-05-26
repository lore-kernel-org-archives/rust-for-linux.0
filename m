Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E227421F17;
	Tue, 26 May 2026 18:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820757; cv=none; b=qw8uXoKNJqFhU2fwZJJXyje38QxpDnMMRAT797wGMW4bR/7PP5aETgW+Z8evUGGasy4ZAB3HXKSX1Pht0xfkDf5bJ0bdJlNLBFT0Cxjit1hAYBDOoH03DDwHsK+9azKpqNQIOqIpllvFcptvW/7nEWDhhs5OHbk31yxi9iI+xlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820757; c=relaxed/simple;
	bh=HIPAI+gUYy/tezJYVYGax62hlmgvOHncbMGVwJG2+vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NfnbOcWce1zbSNDSZiMAPtybzWfurThF9Zx+HJQvcw53fT76RPtMAO6YZzwyjiJqPGtzk+q6p69EqwsoeamLbv7oyFHPlcN+EzNgrpQpTcBmyRwVRhxvPlxAlvlUHk/ZO0JmtcMOzV0hqrDeLw/rvxBune8Vbth1FtJWz9TSxTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiAdqfeo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiAdqfeo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05191F00A3D;
	Tue, 26 May 2026 18:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779820756;
	bh=i6JQKpUTWXOUpG1pnzJDmEEx4U1fiyb87oZZbyIFwa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OiAdqfeoGQoLs2L+12cvseOho9mYaCvUGkix4gLFyMnB/nF4wZxAyMbNPxjBEy7+b
	 HNu3W9OdhTOhqF24N1DHORpPdcDWnrqIziFHx2vU9Dwq4lf9zQM26Jdihurz9RawBW
	 Pw/GwZnxyYM/yPZ4vP15Ga6hKsX0R6PhFyXDdat4VncM/D+Bh7usYEvmrBLJAKdcrZ
	 U8IygNdrnRfKxTUHvHHLL/RhXAA7iPJNaMywcxKLjDpW4Wk3J3dHQ5Kesh07Fusrzz
	 dAXFeDiolsjZAuBLdSmeTth7wXQIAsG7jXTrh/3YZIrwx0xkkk7gQ8Sp9hs0RuShMH
	 sfxJFyRhshLZQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 14:39:07 -0400
Subject: [PATCH v2 1/5] rust: binder: use strict provenance APIs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-binder-strict-provenance-v2-1-a41d89c29bc5@kernel.org>
References: <20260526-binder-strict-provenance-v2-0-a41d89c29bc5@kernel.org>
In-Reply-To: <20260526-binder-strict-provenance-v2-0-a41d89c29bc5@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Tamir Duberstein <tamird@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047; i=tamird@kernel.org;
 h=from:subject:message-id; bh=HIPAI+gUYy/tezJYVYGax62hlmgvOHncbMGVwJG2+vw=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFmiL87fy7ulcr9IWmN19Y2tx8Rir1qIqB1JE9qlYVW/q
 Fuo4lJlx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKmev4nhf+7OSoXzW6QYdv5/HWzzRkUn8tzjIK8ETeX0dk17NqlnCxkZHu7c/dZ
 ok8nBZOG7jO4cJ36EnrV3MTrS/KV9W9m8e+I+XAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Replace the pointer-to-integer conversions in the Binder Rust driver
with calls to the strict provenance APIs.

The strict provenance APIs were stabilized in Rust 1.84.0 [1]. Since
commit f32fb9c58a5b ("rust: bump Rust minimum supported version to
1.85.0 (Debian Trixie)"), the minimum supported Rust version is 1.85.0,
so no polyfills are needed.

Link: https://blog.rust-lang.org/2025/01/09/Rust-1.84.0.html#strict-provenance-apis [1]
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Assisted-by: Codex:gpt-5
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 drivers/android/binder/node.rs             | 2 +-
 drivers/android/binder/rust_binder_main.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 69f757ff7461..d710940c3c8f 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -321,7 +321,7 @@ pub(crate) unsafe fn remove_node_info(
     /// An id that is unique across all binder nodes on the system. Used as the key in the
     /// `by_node` map.
     pub(crate) fn global_id(&self) -> usize {
-        self as *const Node as usize
+        (self as *const Node).addr()
     }
 
     pub(crate) fn get_id(&self) -> (u64, u64) {
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index dc1941cd2407..d487638266e3 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -511,7 +511,7 @@ unsafe impl<T> Sync for AssertSync<T> {}
     _: *mut kernel::ffi::c_void,
 ) -> kernel::ffi::c_int {
     // SAFETY: Accessing the private field of `seq_file` is okay.
-    let pid = (unsafe { (*ptr).private }) as usize as Pid;
+    let pid = unsafe { (*ptr).private }.addr() as Pid;
     // SAFETY: The caller ensures that the pointer is valid and exclusive for the duration in which
     // this method is called.
     let m = unsafe { SeqFile::from_raw(ptr) };

-- 
2.54.0

