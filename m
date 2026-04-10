Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95933DFC60
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 21:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856992; cv=none; b=bDXnwF4RpIgz6JR8HMxbXw+1NMan6izNQwqE+cZ5OqIyWy0CUlJ3y7n9r7jlG5yjsxys/SPv+lLS7Eto+kGn7DbDKN32nnhkSo6wb4W/QvkhvqM3x5mr9PgbElrUslBDSHG15Q9zy2FVHbK5UIviF+PJ3dSJ/wakpR/+/4xvq7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856992; c=relaxed/simple;
	bh=FHBR4Wnqy/ydHjiZKFZpGeMrvO4ZgH/nNhnHVQU7j4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NKzMSXUkeBdMxQVtVsLQKxbFXspNBUnxj1aGgA96J85OvoH1+DBnmLYj57LM0WXZujLnV2AbgZwQWL6HOkNz9oKm0eHFbtaoT3zZp8hYNNjYNnUk6LMiyY6koMundU49wy466hrXzMEHK+OvncTCkMVdUrnfI+xtrL8uiO9RfJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/9eqKRy; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/9eqKRy"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f1f6103afso66076b3a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 14:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775856989; x=1776461789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kY8tNpZZWpISJZ66yxQbfZrkvSCDqL724L2ETykFfw=;
        b=A/9eqKRyDCSXzrefsdDxmEQ6XVGgvwrdyCdJqpEsR3AzQDUmce7MMeSJLtLVZG7GCb
         lpA2tAh3MxquIMuz/+E4j7Fp8wXe4TgPVLRVCi3LI5WDmTny7ZIWMlzqBtRu7beWArZi
         +yjCht1GSerzTygfXGWYNp+fZw/ZecfMbzy6xiYOH/XDDOQwdwcwbBAOu4YAzukkOBeM
         2iPYPlYuew8eQ/WuAZn29D0TL7qB5aevChSbWnA9WhERdWFmWuVtSFUtS7ZRv4Rs+Ezs
         netD+X+yPyMhyAh1lRKsHGl3Kb0E/A4SYgYf6jciYtrhWClr3g5K9PrP1b41AgFKcWf7
         g3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856989; x=1776461789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kY8tNpZZWpISJZ66yxQbfZrkvSCDqL724L2ETykFfw=;
        b=URV49bEttmQzSM7IVsQLlnPitbWPAEV1vDJvLdupLhU2g9Q1udVQxiMooVdB4S6wmS
         xIbQ4MIlKFAFivwLpBIAXwOZrSQ8+/tFWSidhb3Hl5dWPB5LnM49lWO7UgLTcIOPjmY1
         h5mxHrYMbzW578pfIVxiq+SkvlAFc6gPyuB4oUu1Kq5hdY4OoZjsqetw0MrFlH+DgqpV
         rC8aGaSs8kBuESwmtAfJJfl04oG+q0zGsSv6NQIBQZ2ywTX8A4DKdZ8gsquJLRm4cBO0
         ZgP3oBYPvhlFuG6UWbogrscXRTCK4MUSIvNHfRBTkLBkKouRAQqYFQInNEtrsDQT/vQ1
         pkHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa2RkkTVQWIEAFBqqJtLtDfP//VpR0uKb10+dwE2uNKAmrogybLLegLd1j8/NAEbHQbkDSJ9c/7Tj/FsFrhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhgJfJLe+LJ6+PO+Dr0fKO78nT8ioZKEwPebFvJyR78Plqc1T9
	/f02nuwq5pbAjfyCCqddy2miHunSii0dN+iDscgXW6xPTo6MLwfR5aZe
X-Gm-Gg: AeBDievkCsr6sN/czN9GJROjPJzTLB5ym587qaisrLag/ebhD38jeOTwOQUcg14u5aj
	6vbm84stDIKra3ZqK1MBafxjQATRwdH/UX6TWV9SH0zhZ9O+GvL4vJ3L+pESTrbKYylFu7mGgEu
	XxKzLTAKdgM32dY0wZi8NisxGmbEZ0XSeaK4ImZB7OUiKKvF7xX/NhIYf9zCU3dH3flmsJP5++s
	yZDK40GJqFm36SvPVvDu3P+HRQOC//WbA6kQKa6GL1HLDf4hlDp2yDVYA87kvArIpqgO4IiWm9I
	aJ2IcpkUPjUqDl8Gfja4LWE2Mu1f0alc29Rj78kaiN+gXEhetDER6DceINLcuhb5OoeBknYcI9H
	13L1zrE8R2StpVGS7AUxoDpnUD17by5BudC5sdcgWDh7A9/JgaHjAf1PoC0tuAkt/rxnEmrQ9kq
	0QhKE0aBX/1Mm3SuI9ds8e246Vgs+ZDTGyQqhNTHBXAhJl
X-Received: by 2002:a05:6a00:1827:b0:82c:f041:765d with SMTP id d2e1a72fcca58-82f0c2a1cccmr5690404b3a.16.1775856988978;
        Fri, 10 Apr 2026 14:36:28 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.1.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e3d41sm5111551b3a.48.2026.04.10.14.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:36:28 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Fri, 10 Apr 2026 14:35:38 -0700
Subject: [PATCH v5 8/8] rust: percpu: cache per-CPU pointers in the dynamic
 case
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rust-percpu-v5-8-4292380d7a41@gmail.com>
References: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
In-Reply-To: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Boqun Feng <boqun@kernel.org>
Cc: Tyler Hicks <code@tyhicks.com>, Allen Pais <apais@linux.microsoft.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775856978; l=5201;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=FHBR4Wnqy/ydHjiZKFZpGeMrvO4ZgH/nNhnHVQU7j4U=;
 b=ogoO04gAaNoTx75+C8BHdZL3inRGIgFDQvjKAC93cMw2HAcpU+LGo/rKWNrCe0NdbiWcyOwiV
 B35F+4kaHNtDVfLlWS+JakD7AUAmkILOvgE7I4iFqEvMzB6fhBKWQAz
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Currently, the creation of a `PerCpuNumeric` requires a memory read via
the `Arc` managing the dynamic allocation. While the compiler might be
clever enough to consolidate these reads in some cases, the read must
happen *somewhere*, which, when we're concerning ourselves with
individual instructions, is a very high burden.

Instead, cache the `PerCpuPointer` inside the `DynamicPerCpu` structure;
then, the `Arc` is used solely to manage the allocation.

We might as well also use this speed-up in the standard `get` and
`get_mut` accessors that give a `{Checked,}PerCpuToken`

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/kernel/percpu/dynamic.rs | 34 ++++++++++++++++++----------------
 rust/kernel/percpu/numeric.rs |  4 ++--
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/rust/kernel/percpu/dynamic.rs b/rust/kernel/percpu/dynamic.rs
index a717138b93dc..675210098ed8 100644
--- a/rust/kernel/percpu/dynamic.rs
+++ b/rust/kernel/percpu/dynamic.rs
@@ -101,6 +101,9 @@ pub struct DynamicPerCpu<T> {
     // INVARIANT: The memory location in each CPU's per-CPU area pointed at by the alloc is
     // initialized.
     alloc: Option<Arc<PerCpuAllocation<T>>>,
+    // INVARIANT: `ptr` is the per-CPU pointer managed by `alloc`, which does not change for the
+    // lifetime of `self`.
+    pub(super) ptr: PerCpuPtr<T>,
 }
 
 impl<T: Zeroable> DynamicPerCpu<T> {
@@ -112,9 +115,13 @@ impl<T: Zeroable> DynamicPerCpu<T> {
     pub fn new_zero(flags: Flags) -> Option<Self> {
         let alloc: PerCpuAllocation<T> = PerCpuAllocation::new_zero()?;
 
+        let ptr = alloc.0;
         let arc = Arc::new(alloc, flags).ok()?;
 
-        Some(Self { alloc: Some(arc) })
+        Some(Self {
+            alloc: Some(arc),
+            ptr,
+        })
     }
 }
 
@@ -158,15 +165,10 @@ pub fn new_from(mut initer: impl FnMut(CpuId) -> T, flags: Flags) -> Option<Self
             }
         }
 
-        Some(Self { alloc: Some(arc) })
-    }
-}
-
-impl<T> DynamicPerCpu<T> {
-    /// Gets the allocation backing this per-CPU variable.
-    pub(crate) fn alloc(&self) -> &Arc<PerCpuAllocation<T>> {
-        // SAFETY: This type's invariant ensures that `self.alloc` is `Some`.
-        unsafe { self.alloc.as_ref().unwrap_unchecked() }
+        Some(Self {
+            alloc: Some(arc),
+            ptr,
+        })
     }
 }
 
@@ -178,11 +180,11 @@ unsafe fn get_mut(&mut self, guard: CpuGuard) -> PerCpuToken<'_, T> {
         //    exists on the current CPU.
         // 3. The invariants of `DynamicPerCpu` ensure that the contents of the allocation are
         //    initialized on each CPU.
-        // 4. The existence of a reference to the `PerCpuAllocation` ensures that the allocation is
-        //    live.
+        // 4. `&mut self` holds a reference to the `PerCpuAllocation`, so the allocation it manages
+        //    is live.
         // 5. The invariants of `DynamicPerCpu` ensure that the allocation is sized and aligned for
         //    a `T`.
-        unsafe { PerCpuToken::new(guard, &self.alloc.as_ref().unwrap_unchecked().0) }
+        unsafe { PerCpuToken::new(guard, &self.ptr) }
     }
 }
 
@@ -192,11 +194,11 @@ fn get(&self, guard: CpuGuard) -> CheckedPerCpuToken<'_, T> {
         // 1. Invariants of this type assure that `alloc` is `Some`.
         // 2. The invariants of `DynamicPerCpu` ensure that the contents of the allocation are
         //    initialized on each CPU.
-        // 3. The existence of a reference to the `PerCpuAllocation` ensures that the allocation is
-        //    live.
+        // 3. `&mut self` holds a reference to the `PerCpuAllocation`, so the allocation it manages
+        //    is live.
         // 4. The invariants of `DynamicPerCpu` ensure that the allocation is sized and aligned for
         //    a `T`.
-        unsafe { CheckedPerCpuToken::new(guard, &self.alloc.as_ref().unwrap_unchecked().0) }
+        unsafe { CheckedPerCpuToken::new(guard, &self.ptr) }
     }
 }
 
diff --git a/rust/kernel/percpu/numeric.rs b/rust/kernel/percpu/numeric.rs
index 13b4ab4a794d..4841843b05f7 100644
--- a/rust/kernel/percpu/numeric.rs
+++ b/rust/kernel/percpu/numeric.rs
@@ -22,7 +22,7 @@ impl DynamicPerCpu<$ty> {
             pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
                 // The invariant is satisfied because `DynamicPerCpu`'s invariant guarantees that
                 // this pointer is valid and initialized on all CPUs.
-                PerCpuNumeric { ptr: &self.alloc().0 }
+                PerCpuNumeric { ptr: &self.ptr }
             }
         }
         impl StaticPerCpu<$ty> {
@@ -78,7 +78,7 @@ impl DynamicPerCpu<$ty> {
             pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
                 // The invariant is satisfied because `DynamicPerCpu`'s invariant guarantees that
                 // this pointer is valid and initialized on all CPUs.
-                PerCpuNumeric { ptr: &self.alloc().0 }
+                PerCpuNumeric { ptr: &self.ptr }
             }
         }
         impl StaticPerCpu<$ty> {

-- 
2.34.1

