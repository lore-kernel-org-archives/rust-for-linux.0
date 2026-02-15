Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4219B23A9B3;
	Sun, 15 Feb 2026 20:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771187247; cv=none; b=bedcPdXuJvjrSGDBMDOHY4rzh0D/ZprT6k5DJVO48gmKoFyDpxtBLAvdLu2mYsFfepnfhHTEPDx1zcAQ5sXDvO+nwgDQ2cwD+qKl0XrV0upPfv7XgJrbJ3hT2dFnipUU4k6I/UtTj5CXMnMoL2LIDskeqRU4nrL71Eo9L2WWxNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771187247; c=relaxed/simple;
	bh=fn/Ni+o4CLg4jY8z1oUp+39/bgrJ6KTxMOI9nncIJRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QhVOGCnaOqa4BNtawV7wHebqss3iggX40T5hNSa+iDAMogNuvIC1vWIbKbECfFov1C2/MZ88Vsv4/OqIuqMHt/p/9l5TghDu1eYF7mUVhrlWNvWjiI8wAnbmRLehtPhJtfZNwxYLHHm+Bk0DwgKytK14vfte/iOdR/bXYG09DgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUDbOyA/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUDbOyA/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C58C4CEF7;
	Sun, 15 Feb 2026 20:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771187246;
	bh=fn/Ni+o4CLg4jY8z1oUp+39/bgrJ6KTxMOI9nncIJRE=;
	h=From:Date:Subject:To:Cc:From;
	b=XUDbOyA/AglJdkSoj/8qcETDbWD3J0nMxQsdmb1hXhB3Nsz3WYcnqXrnZLrM9t7yV
	 l2OfhfMP5Lk+wJBWQP1n3TqyT6ra58lXTDBZcHB8U/6XOvUfFHQPIMstuhUQgyY9dZ
	 Jdp/vXdq3R94yeAqV86PfQ5Lfkh9/3BJ8OW7Evhf8USVWqjTEuWQHs0wW7mXrqElsu
	 7nE/MXP7tSFOJgnNEEgCNJFOZ8GctLYwju0cwhUP+qORFWUnNWTyh4QmY9hMaFMfMc
	 bPgQ1LrecPttGKEcJTU6ej66Eyyh7/XEsfHqQxm3xex+kRu6afvHg7uLGREcRsgLMv
	 ElldmtbIIIJbw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:27:17 +0100
Subject: [PATCH] rust: sync: add lazy initialization methods to SetOnce
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
X-B4-Tracking: v=1; b=H4sIACUskmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0NT3eLUEt38vORU3ZzEqkrdZHPjtGRjk0RT0xRLJaCegqLUtMwKsHn
 RsbW1AIDnQ4lfAAAA
X-Change-ID: 20260215-set-once-lazy-c73fc34a55d9
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4306; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=fn/Ni+o4CLg4jY8z1oUp+39/bgrJ6KTxMOI9nncIJRE=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkiwlI/SfiAEdvx1t+MY5z2A8jpRhTJ0lJG9zl
 +mJcD3Va5SJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIsJQAKCRDhuBo+eShj
 d7rqD/0Q/Sm+0PLQ8xnPP8jxf2qtdJNi3xI3r0tQZAPkx+fAyHfBOuWanSwA52VUxZaz+yO22m+
 XLidmQ0iC9JrLiOJCniLVshE73zQ16W0Yu8MMVIeRLgOqwES76lz9sNg8zxdLumbGiczARVjJ8d
 jUsyvEvtoDVUfL2jKqcnzFpB1U8IMLBzqwLOhIwj5HVQOjtp46c5mkDoGyzckfwDK0ew1pe5HfS
 zgrkpM3bzT4/uo/q/SvZ/YqFmPrLvNO3Gf6wqBSIZE3v+Uxpw+GHn4fhV1asmPFx456HueTlOvy
 G8admmu0SQeIbAp2C+Gg/1XhBf0/MDFBfh98uDFHyCtJH+51b4tTg07pUYDGKqrPPSALOIdXmwQ
 af3q/dxdOtVE9nnX6lTltfU3zejH7NkQc8mVLgfYUzk/tKTrW60AJVTRLLAq2mRgH/wOZL2Uxpl
 u+ImPc4GABLCSXXJtIB8enzJbbUXEZA8dxB/ZXVZ7P7qT2o3NenMhWyN/QjqWBpOyq9gnocsTZN
 aOu6Ae7in7DiIf45dOJ/QlXDbMwMMwg/QFQth6/NK9ElHcKu9EqPjd//vVi3QR5BjxdyZGLBl1E
 AQXjjO9K8JT2q0rm4bqENXh8+wQVx8CqwusDMwjI5HNoe4DYS/T1zbwEnYT/DOKkiE5h3vTtRsb
 ZkMk9+0+49zGr5g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add methods to get a reference to the contained value or populate the
SetOnce if empty. The new `as_ref_or_populate` method accepts a value
directly, while `as_ref_or_populate_with` accepts a fallible closure,
allowing for lazy initialization that may fail. Both methods spin-wait
if another thread is concurrently initializing the container.

Also add `populate_with` which takes a fallible closure and serves as
the implementation basis for the other populate methods.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/set_once.rs | 53 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
index bdba601807d8b..9e3c4be4047f8 100644
--- a/rust/kernel/sync/set_once.rs
+++ b/rust/kernel/sync/set_once.rs
@@ -2,11 +2,14 @@
 
 //! A container that can be initialized at most once.
 
-use super::atomic::{
-    ordering::{Acquire, Relaxed, Release},
-    Atomic,
-};
 use core::{cell::UnsafeCell, mem::MaybeUninit};
+use kernel::{
+    error::Result,
+    sync::atomic::{
+        ordering::{Acquire, Relaxed, Release},
+        Atomic,
+    },
+};
 
 /// A container that can be populated at most once. Thread safe.
 ///
@@ -76,10 +79,46 @@ pub fn as_ref(&self) -> Option<&T> {
         }
     }
 
+    /// Get a reference to the contained object, or populate the [`SetOnce`]
+    /// with the value returned by `callable` and return a reference to that
+    /// object.
+    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Result<T>) -> Result<&T> {
+        if !self.populate_with(callable)? {
+            while self.init.load(Acquire) != 2 {
+                core::hint::spin_loop();
+            }
+        }
+
+        // SAFETY: By the type invariants of `Self`, `self.init == 2` means that `self.value`
+        // is initialized and valid for shared access.
+        Ok(unsafe { &*self.value.get().cast() })
+    }
+
+    /// Get a reference to the contained object, or populate the [`SetOnce`]
+    /// with `value` and return a reference to that object.
+    pub fn as_ref_or_populate(&self, value: T) -> &T {
+        if !self.populate(value) {
+            while self.init.load(Acquire) != 2 {
+                core::hint::spin_loop();
+            }
+        }
+
+        // SAFETY: By the type invariants of `Self`, `self.init == 2` means that `self.value`
+        // is initialized and valid for shared access.
+        unsafe { &*self.value.get().cast() }
+    }
+
     /// Populate the [`SetOnce`].
     ///
     /// Returns `true` if the [`SetOnce`] was successfully populated.
     pub fn populate(&self, value: T) -> bool {
+        self.populate_with(|| Ok(value)).expect("Cannot error")
+    }
+
+    /// Populate the [`SetOnce`] with the value returned by `callable`.
+    ///
+    /// Returns `true` if the [`SetOnce`] was successfully populated.
+    pub fn populate_with(&self, callable: impl FnOnce() -> Result<T>) -> Result<bool> {
         // INVARIANT: If the swap succeeds:
         //  - We increase `init`.
         //  - We write the valid value `1` to `init`.
@@ -88,16 +127,16 @@ pub fn populate(&self, value: T) -> bool {
         if let Ok(0) = self.init.cmpxchg(0, 1, Relaxed) {
             // SAFETY: By the type invariants of `Self`, the fact that we succeeded in writing `1`
             // to `self.init` means we obtained exclusive access to `self.value`.
-            unsafe { core::ptr::write(self.value.get().cast(), value) };
+            unsafe { core::ptr::write(self.value.get().cast(), callable()?) };
             // INVARIANT:
             //  - We increase `init`.
             //  - We write the valid value `2` to `init`.
             //  - We release our exclusive access to `self.value` and it is now valid for shared
             //    access.
             self.init.store(2, Release);
-            true
+            Ok(true)
         } else {
-            false
+            Ok(false)
         }
     }
 

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260215-set-once-lazy-c73fc34a55d9

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


