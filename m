Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C0A33B6E9;
	Sun, 11 Jan 2026 12:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768134458; cv=none; b=LKcdUoFZcz6WU9gDttPl7yylWNy6QFtxKCruqDUuQF8Kux43VLOYAgL8/Ef0AO/49aByC1PMZgBfdW+ayARZzQ5El+w1D95njp3y3+Xdax8fi74F1QUCImQPVjJj8uyZw4kDTHqJ9e6/bNi3bJLtaOWOra3R9ZyetcKqfmaLoTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768134458; c=relaxed/simple;
	bh=fiTdFBsXRKS7QUXZgj3432420snOzkMiEoEAmm70DdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fh7X7IvFdY5C7XgZ8bNkjSFNtKgmELg+/Vt+SGdGHNEHt9VEjlY2hkKpgQzR/37GyPA3fdTcgBL7nBeecqO864wyqEUsEkh/Ia0u/k4tEiZEN5rSojQ7eYiAaT9h+CtgsED5ucBb3r866cOvqrUwlB0EGTCyU93PG6/FZkX0ios=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXmPGUS4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXmPGUS4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DB8C4CEF7;
	Sun, 11 Jan 2026 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768134457;
	bh=fiTdFBsXRKS7QUXZgj3432420snOzkMiEoEAmm70DdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PXmPGUS4RcRduOlSpD5sJOsMEEZ5X+OSqWtX2m5uWcq4fFXgWriUGZN+pY6c0A4kK
	 q9/H3Ar6UoJeNdaYWBV+SCVQQEmxMyG6/nsBBWvpOA/oo8AtGxJtsl8TBykkGeAuIt
	 YBM0uf1eRbhju44NdFDs6S9oKmpiIhFYX1ZkP7ykeUyiuArz8u6VR0UVSuekbyK6k5
	 A71UXxbGj9BZzUrhEIrCLEcZorIlCzM9clCLPLIac9wNT5Cdx9FPexegjVPF9GA0G5
	 cgG4FkSubuawqhkF2QhbMeiIfuyC+HW7P+1S7scxKBMQGR1owwYhOUO33615r9HHoT
	 aebWjDFaM5cJg==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/15] rust: init: use `#[default_error(err)]` for the initializer macros
Date: Sun, 11 Jan 2026 13:25:09 +0100
Message-ID: <20260111122554.2662175-12-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111122554.2662175-1-lossin@kernel.org>
References: <20260111122554.2662175-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initializer macros should use this attribute instead of manually parsing
the macro's input. This is because the syntax is now parsed using `syn`,
which permits more complex constructs to be parsed. In addition, this
ensures that the kernel's initializer marcos will have the exact same
syntax as the ones from pin-init.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v2: none
---
 rust/kernel/init.rs | 40 ++++++++++++----------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 917f7ef001fd..7a0d4559d7b5 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -219,20 +219,12 @@ fn init<E>(init: impl Init<T, E>, flags: Flags) -> error::Result<Self>
 /// [`Error`]: crate::error::Error
 #[macro_export]
 macro_rules! try_init {
-    ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
-        $($fields:tt)*
-    }) => {
-        ::pin_init::init!($(&$this in)? $t $(::<$($generics),*>)? {
-            $($fields)*
-        }? $crate::error::Error)
-    };
-    ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
-        $($fields:tt)*
-    }? $err:ty) => {
-        ::pin_init::init!($(&$this in)? $t $(::<$($generics),*>)? {
-            $($fields)*
-        }? $err)
-    };
+    ($($args:tt)*) => {
+        ::pin_init::init!(
+            #[default_error($crate::error::Error)]
+            $($args)*
+        )
+    }
 }
 
 /// Construct an in-place, fallible pinned initializer for `struct`s.
@@ -279,18 +271,10 @@ macro_rules! try_init {
 /// [`Error`]: crate::error::Error
 #[macro_export]
 macro_rules! try_pin_init {
-    ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
-        $($fields:tt)*
-    }) => {
-        ::pin_init::pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
-            $($fields)*
-        }? $crate::error::Error)
-    };
-    ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
-        $($fields:tt)*
-    }? $err:ty) => {
-        ::pin_init::pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
-            $($fields)*
-        }? $err)
-    };
+    ($($args:tt)*) => {
+        ::pin_init::pin_init!(
+            #[default_error($crate::error::Error)]
+            $($args)*
+        )
+    }
 }
-- 
2.52.0

