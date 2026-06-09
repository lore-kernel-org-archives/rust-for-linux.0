Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D95B3F44EF
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001754; cv=none; b=aWJZp0/qCBhJF+v4uGa2lWtjZvayF6wBd724fHwpA1DkmGgJyGb1DFmecdUirbyhvevDDsrr3PQkYIAJMAIqgIb/ce3HuzMyKGp5ht2oTgHirIY3EbI7dyxrRFZl9oj4BFIA5WsP+9Z7XtiZA4HnZ9sa2fkD4Jq+jcdpBSHJ9Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001754; c=relaxed/simple;
	bh=s8ZHkeiMXFbCIihEUVCP8vH4f/RIb9lyZlXFx4vqp1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rlRhCnORBeBNKBLvy62/GH3GdzGtL7nfXcsF3/embWepaKAa1Aj3i137KvBhpZ1qaq89gLQkFY0YAox6OqdP6oSK967qokxsJFm+mAgKg6BQozEsWLwJQXKZRqo8/+xTQ0XY6kFGTK6UYtrgQWQVmfuhhd9IBrpTufd5857WiMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFWd9LER; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFWd9LER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981861F00893;
	Tue,  9 Jun 2026 10:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781001753;
	bh=1PhhHit6AMLommMPj+pGN+KR/pTiIV6711FD6Z0qBsc=;
	h=From:To:Cc:Subject:Date;
	b=ZFWd9LERrJ6pX0BONiTsEPSHzwkTMHm8+9WY8V16yA6stMAOl7ZVc5CWmeskMnEBx
	 uV48lMnUFumlGuwFynVjKy0lTmG4xUgAtIYlEr6fitt+RoDrhYo6xnXizskUiA1PVO
	 zg/nIliHule9XpIGot1FHrF8Yh0X76dtjjXqEn6Z7MTm/aM0OnX2UWOgdTyMUsTTDd
	 xw30MUYJrmdSV3cScNcSHGSsjiBN1qwPn5BwQG0DAJ9YWprPIqgsQDG1lTfidrdUxS
	 5S0ZG81FjnliMRQdp4eMWAN9xFvm1zTOUbJkQuPQZXAMfOO6L3GlAorLvErYGPY9rJ
	 HjSpSdwSbCraA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/2] rust: str: use the "kernel vertical" imports style
Date: Tue,  9 Jun 2026 12:41:51 +0200
Message-ID: <20260609104152.261145-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Format the Rust prelude to use the "kernel vertical" imports style [1].

No functional changes intended.

Link: https://docs.kernel.org/rust/coding-guidelines.html#imports [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/str.rs | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index a435674f05ea..4eae05e4baf9 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -3,14 +3,28 @@
 //! String representations.
 
 use crate::{
-    alloc::{flags::*, AllocError, KVec},
-    error::{to_result, Result},
-    fmt::{self, Write},
-    prelude::*,
+    alloc::{
+        flags::*,
+        AllocError,
+        KVec, //
+    },
+    error::{
+        to_result,
+        Result, //
+    },
+    fmt::{
+        self,
+        Write, //
+    },
+    prelude::*, //
 };
 use core::{
     marker::PhantomData,
-    ops::{Deref, DerefMut, Index},
+    ops::{
+        Deref,
+        DerefMut,
+        Index, //
+    }, //
 };
 
 pub use crate::prelude::CStr;
-- 
2.54.0

