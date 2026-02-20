Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE582FFDF4;
	Fri, 20 Feb 2026 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771574809; cv=none; b=VBDgraYTIwY4YWFRbU7A/urIaeVuiR4sZFdSVkeVWv2ZT7u/JxO0/wW77tetG0dYKT7zeJTvq60squsL242mXdNn/DDEajFd4MUjUTqjz4+/5R36aqtRy7PVPqhMrfntt7A3CgNV1dyMSiICfOzxn1D3dyz/p27xxy02ZQ9ivZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771574809; c=relaxed/simple;
	bh=wSOMhlGB0jPhpHM0oJ9fgtUI0vuVFILcd104qPNJfak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ErdqW9kwXZrMMyu3lyewBwH4a2Z37jqaIOYvnX0O1sbbjLw/ygK/zMuHGQ//7OW3XRRQDJXc2u0pSwU6ayZLFVXS0na7ulbO56gsCG8rPe2oj4Hb58NacWCuYhXiKJWIwqAmcSxH70i8D65eY3Rl/mlT7Ti2P38RMKdPPzSDUas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inQGWZC6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inQGWZC6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A216C116C6;
	Fri, 20 Feb 2026 08:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771574808;
	bh=wSOMhlGB0jPhpHM0oJ9fgtUI0vuVFILcd104qPNJfak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=inQGWZC6WHnw6cYEKXGlt2zyYKJ99kTt6lrus/Hx8i1uffzUbdV5hv0usvZqQcnAC
	 YIT+tlLbAfO/93OB6P95uq6cWOYeGQtW7EH9LwZyNgXnHFt2vlpm6bxP7H82kTb9zG
	 dA8+5yTtJhVtniZNMQ/PQtAtp7AbPkPvBdG6QnQsj8xvA7p+qzvcn6Pg/TFnXo1o5d
	 +REBpK38mwY28KQXzQf1pBYfuHAzoQoK3LF+uAwWWAhQehcVXlGt1uETNXZdnzmoX9
	 QOKbDtsEpfaQ3O0uAdCNMeW4R7L/4Y9FpkIK++Wg6mLj4ga39NK3YuS37LXOdGZD1r
	 pIwiZRh4iZdCA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Feb 2026 09:06:20 +0100
Subject: [PATCH v3 1/3] rust: atomic: add fetch_sub
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-atomic-sub-v3-1-e63cbed1d2aa@kernel.org>
References: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org>
In-Reply-To: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org>
To: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3268; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=wSOMhlGB0jPhpHM0oJ9fgtUI0vuVFILcd104qPNJfak=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpmBYAZgUDP7+AeFipDJNrVBsOq8zus4usvOXes
 WbaL41hWNyJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZgWAAAKCRDhuBo+eShj
 d3b1D/9LzFp7PQF1pQhqVK7I0Vgpwjnpg5fsgRN0o2x4uuUJLKRogNK4DGfnNcJO+Evz6VfdHaN
 vGRxcSdBGczujuGj5CcS0Sa0UmAHnrCJdOqYraFcr8rXnT6PU0TZLrSKh+0R0f84hTNZFBAPVec
 jKgUEcvXmAAALWe1+QDYj/tiBgFFgmdJ8Dw8FEcEeY3VTXKZOKcyYlWGgfxS73uKRs/tmhIFRko
 /7IRWby79Uobd/Q3DIRIWqDi6V3t3M+NYvzVQss/axx83jK7c3WjoqvChOiwaJU2k2pr77S2x1Y
 I0G7kgBHw+53qtZp+2lVzozHIgN5GSxqwaPQRscOzC2XzleGJvNwoqN7j2FzgaalWLjjcAL3Ahv
 BMNBywW8GWAw8G1ibzwcVNDQO50/yEmSbBzCw3LPCQUbs1d81xHwM8T63syrWGC72FImKICf/Ns
 mn5UDXY9AKhnbNjVB69GUMeAtZikuBINXYtAX1iQtbcEvMg63qoX9U1Aqtng6AQxGvUqA00JCQo
 y3GiTVZezL4dPVNDwqDCH3bm+4kjQ6R+Qch8Fifn7mIBh2tIzF6W0F4Gjj5dsy5GGGjAeaMy0QG
 +mqVwWHwjayfAXV+kOSMNeDtTVR5o1LS/0np9mfQlaowtzZJykRgGgIC9vCpQYrtsJDNRBHDHJ9
 cHHo0poGeApA8Aw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add `Atomic::fetch_sub` with implementation and documentation in line with
existing `Atomic::fetch_add` implementation.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/atomic.rs          | 43 +++++++++++++++++++++++++++++++++++++
 rust/kernel/sync/atomic/internal.rs |  5 +++++
 2 files changed, 48 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4aebeacb961a2..83e03bb7ecd24 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -559,4 +559,47 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
         // SAFETY: `ret` comes from reading `self.0`, which is a valid `T` per type invariants.
         unsafe { from_repr(ret) }
     }
+
+    /// Atomic fetch and subtract.
+    ///
+    /// Atomically updates `*self` to `(*self).wrapping_sub(v)`, and returns the value of `*self`
+    /// before the update.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::sync::atomic::{Atomic, Acquire, Full, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    /// assert_eq!(42, x.load(Relaxed));
+    /// assert_eq!(42, x.fetch_sub(12, Acquire));
+    /// assert_eq!(30, x.load(Relaxed));
+    ///
+    /// let x = Atomic::new(42);
+    /// assert_eq!(42, x.load(Relaxed));
+    /// assert_eq!(42, x.fetch_sub(12, Full));
+    /// assert_eq!(30, x.load(Relaxed));
+    /// ```
+    #[inline(always)]
+    pub fn fetch_sub<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering) -> T
+    where
+        // Types that support addition also support subtraction.
+        T: AtomicAdd<Rhs>,
+    {
+        let v = T::rhs_into_delta(v);
+
+        // INVARIANT: `self.0` is a valid `T` after `atomic_fetch_sub*()` due to safety requirement
+        // of `AtomicAdd`.
+        let ret = {
+            match Ordering::TYPE {
+                OrderingType::Full => T::Repr::atomic_fetch_sub(&self.0, v),
+                OrderingType::Acquire => T::Repr::atomic_fetch_sub_acquire(&self.0, v),
+                OrderingType::Release => T::Repr::atomic_fetch_sub_release(&self.0, v),
+                OrderingType::Relaxed => T::Repr::atomic_fetch_sub_relaxed(&self.0, v),
+            }
+        };
+
+        // SAFETY: `ret` comes from reading `self.0`, which is a valid `T` per type invariants.
+        unsafe { from_repr(ret) }
+    }
 }
diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 6fdd8e59f45be..a094f704be0ce 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -261,5 +261,10 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) ->
             // SAFETY: `a.as_ptr()` is valid and properly aligned.
             unsafe { bindings::#call(v, a.as_ptr().cast()) }
         }
+
+        fn fetch_sub[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) -> Self {
+            // SAFETY: `a.as_ptr()` guarantees the returned pointer is valid and properly aligned.
+            unsafe { bindings::#call(v, a.as_ptr().cast()) }
+        }
     }
 );

-- 
2.51.2


