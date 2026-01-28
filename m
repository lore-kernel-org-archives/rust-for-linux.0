Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEC1191F98;
	Wed, 28 Jan 2026 12:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604482; cv=none; b=cTp13L0v9e3DO1fNu5olBohT27fQzZjpJURgJYnOxYW+iEneQ0wLNNhBGEZc3/Nnt0rFnfFyP3sSswhnYOueOv8TA4OoczPgbbADVAIf7bBzekKixqUxdcDyNnu7GcltteOshqUXaAqltnIBuedzIuUT/Soytg78wpSWsud0LnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604482; c=relaxed/simple;
	bh=7IKzUb7aPUOS9iLZvr/oA8UAML9y/78mMGrVeGEIFRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IIgZeSqI8XaWtz1w9CIMu1N3nwyqRog+3E8pqYo2SvWSAt6e5oa6PKFqp+o43iUpUTeQAYj82PdbIWGIKCW4/If7Vq+ck0JCIvSiz25Fz9Z8kSZ4kpSe06BXunR5CPr3EpKBtprzgq8kVhCcCHdvEKn8qO8L7FPdgf686GWPGws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euv2D0JJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euv2D0JJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B10C4CEF1;
	Wed, 28 Jan 2026 12:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769604482;
	bh=7IKzUb7aPUOS9iLZvr/oA8UAML9y/78mMGrVeGEIFRU=;
	h=From:Date:Subject:To:Cc:From;
	b=euv2D0JJ3TeNtiAlW0RYpalKjtb6G4W1o+GLX0D/+bOnLEsaEMn3SEeafJ7XYA3tj
	 rCUdKREjDBktvPT6Wsul80ZAzMsPGSSCOaWh83F/rDwrq43NqaglpKNceKtQsgjtGX
	 Zwrju3sP9x5PWFtOTORMH01rUPaFKBY3upTjyML13lcDx2x2/Rz6xMQ+vQ1UnTr/CT
	 SSUUHIeQMXOsiISB3lPV8t3z6C1X+QUFZbB06OiE/5AKDpdg7EmzP4tHqq7lzNCAHf
	 mPsF9R6RdZLRPLzyE52qDZru5HZ27i/l0sdI8uqQT5m2HN3KoULvI14GHoAvBo0NKN
	 GygL3Uc+m1B0Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 28 Jan 2026 13:47:11 +0100
Subject: [PATCH] rust: atomic: add fetch_sub
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-atomic-sub-v1-1-f8c6abcbb067@kernel.org>
X-B4-Tracking: v=1; b=H4sIAE4FemkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3cSS/NzMZN3i0iRdo7Q0Q1NLM6OUNEMjJaCGgqLUtMwKsGHRsbW
 1AEjxridcAAAA
X-Change-ID: 20260128-atomic-sub-2ff15962df12
To: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3340; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=7IKzUb7aPUOS9iLZvr/oA8UAML9y/78mMGrVeGEIFRU=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpegVUrJlHJ8yMK1jtD1+c9ImyDNfd2I0yh3BS/
 Shh7c/RWfmJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaXoFVAAKCRDhuBo+eShj
 d5QUEACFXJF5kgS3wIcaKv92Da4np5rfuvBW7in/hT1RsU+cNFdo+f4+23sXYO4Cu2xq5l3jaEK
 sxgIrLcNbtAifAbMrayEvBqLetkMUA84sdmzg3vgKavenncSkZT2ACTbQcZJ9DvvqNTDzpPy3fn
 dPqTQ1NiD7+KZadsrSZXD5w0+7mqeud7C8skCJxRG1oPNT6xjgEkVBxRjrPaQ6D9vOyVpGRygK1
 tkqJ6bknkW8bamOG/K6CQIIIhYjx/Bun0XGRIBBlKOg46zN75mf6ZGBjK/IsiLTmqD6YHaHLOxc
 feo/bAp4PpMpDhUqzYKxBTSryZDozLxqCwQ/BOQo+MFm3pJsZpWCDIFKBKnSWnEqUHcwnc1U3lF
 oDQv+jq4IJazz5fgjC1kMX1zRzdE495TRHV5PV+xf3gVbd3SkiTP2P95ic6iuph3EM4rUiyvcXi
 TMryfERG7kmm952WxdPn6ODCHpYtlhhXMVSAjx0pHU50c+40c22jl51F/s6/7z5livPOKYlQBFz
 OuVjQtPPRy8UhhTRQX+kTm4IV4qT8z8dp0RENBX8lRSBLwYu5aRQ0UOHqAwRvfsH9s9YzV5+G/C
 y+kCcr5UFX+WGFG6O6clBQgtqYlDNw5jRGLZKQh4DAcZTCRJki+6fzRbqc6GdHEtLjhI52eECO8
 xQCVgo3DBbGzo6Q==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add `Atomic::fetch_sub` with implementation and documentation in line with
existing `Atomic::fetch_add` implementation.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/atomic.rs          | 45 +++++++++++++++++++++++++++++++++++++
 rust/kernel/sync/atomic/internal.rs |  5 +++++
 2 files changed, 50 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4aebeacb961a2..aa0b672cef848 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -559,4 +559,49 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
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
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// assert_eq!(30, { x.fetch_sub(12, Acquire); x.load(Relaxed) });
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// assert_eq!(30, { x.fetch_sub(12, Full); x.load(Relaxed) });
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
index 6fdd8e59f45be..7eed8c66efff8 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -261,5 +261,10 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) ->
             // SAFETY: `a.as_ptr()` is valid and properly aligned.
             unsafe { bindings::#call(v, a.as_ptr().cast()) }
         }
+
+        fn fetch_sub[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) -> Self {
+            // SAFETY: `a.as_ptr()` is valid and properly aligned.
+            unsafe { bindings::#call(v, a.as_ptr().cast()) }
+        }
     }
 );

---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260128-atomic-sub-2ff15962df12

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


