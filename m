Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F289387373
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 21:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856983; cv=none; b=CA2LZiwU7d4G3q0pAGlzNGPwc887NHJ1ImZsLE4EfzTnMv3PN67vpOBz/KS7sbdi8VRNOLqU8RqUJgApGt9jebs3c1dInwtf7vTipejy9+Ebwrgpt5uA+6JtwqkTd8gn4A9hkGdgdvxq5E8lfl0SevRclMyFp1hLWeeG+nK/DPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856983; c=relaxed/simple;
	bh=BETYXv/iPQABug1OuKQYEFZYT26teVkAoSalVy+DWvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGQGifSmyFFu6w0BBk3236V1QoPs9qC+7+HSVNSslXDFTr/njeJ06+To1cl4jlBIFRqMiEG2ygxPxINHfn9Q3b85JzsMfQrdUVb2SGdkNowwoeXO6tp7qGsKyBZREtEvmnylq7YqfPBdvsb9yQboyH2FCE9fPKxtuZf7/7RperM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7ImcGtJ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7ImcGtJ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82ce49785a0so1197607b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 14:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775856981; x=1776461781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSa2drr2d72jbSnbpnPMy5VtafgWDLdLn9PYujy+71c=;
        b=U7ImcGtJiF823NKtD4IWUpdWdAJelNVWB1noqW/OogAgKb4ptbCiYjbyeuzT2FNSoH
         e/lnYpP8UzzybujVDStRdz+xHx72RBVGctA5EWt88gFY9D+G2qVUeSxNm4AkaM9HbJQV
         Bkoh16vGwDrTsfzzClHvxNijb2GCn57rpU+2W1diCL5VZhNNGAkeglCfNSUeuY7e+kW9
         rF9rsh5BKRXXjUgMU0QizzfxYqMkzzeFcAVg5YtFFkx8L1pyUHS8/S0xZC7gyylyi4lS
         qEyBEOIfnhwzeY7Qao4Cwjwu0gmSVPXom1GfDO7hCp5oFzDKlcfYAIP67fuLvF8+M5P5
         lKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856981; x=1776461781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LSa2drr2d72jbSnbpnPMy5VtafgWDLdLn9PYujy+71c=;
        b=SYNuOVQkl6D6nim/EWZ5UqZ3SR+sJkF/DM9sYdmtab00DGxAsglSO8lSuVQCOLZjkH
         Uq74t2HXg3qwR1VdIfMJVyBjIEU3FMxRL9XQmEi4gxFBHc+K9P3NgmnR16uk5IsyAt4m
         FZz1ryIHhvbrZPKsM2zghbnM9vteirVhLxqvkdzyIW112QNykTGoUgIHz5Lm21VSqt2L
         GRjyIFG7QKRXLJqdHQyL1ZyXVzwNajFDmruMJjGUSPBOoO3ldp0OObXu/UuWfUY7NLYP
         17TJOmHC0QmDQnGT6lIMUBAZI2URiPT7W1DTCt99zlUnLUYQam+gT0S/kAFGa8NHc/mM
         sDJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYvFmoIUNFPIvEm1aLArVvWXcksX4VexEVhka4uQdf4Wss8ot3C1dq6MKJIH8X7EgV+6XxZRjrgWCOOtVr1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsQDDYIjUMXSK+I38bi86SJJOiKnnXUDUqREybm5NG0qEiAcCE
	hyjTgBqyYtEBRxUYItWyjJb56VJUNHPpSVykmVuJaqbJhWcyYdPmTCBu
X-Gm-Gg: AeBDiesxbi3Z77Ax2Sa9V1A92WaSrYnZgbKGitXvd/kfHgfR1DX1xfuIkVT8zF67qKS
	FpyCokcQ9VJkISzd2ZENOR3jCD8RJA2Z4uXNZPdks0IkaEJPA2mgHZcbPhPH11pvjUD9Xo7EYYA
	u6r9gQ6a0UF7rrTNuiRpTSK7fLRv7hb4SkSOocKZQd6MBviMUUoEROdi6sXCOc43STJMGw9hEF9
	C1/dMM/pPZs/J6gnyLCZy4ADe//PbjLi1gu68EK9lJGcO1vXggbd+W+41c/jNzksW99tPe8TCxS
	rUnUjpL7ITMTfCtzldSOejRXFiTcwOxaANyff5u40RmruSqwt3lFCcANthzrmU9C1xgR0sj1qYs
	NtfRmDYFU0H5E1IlI5S1j+ledezbwn/AidG8U5Eg82HflzieI6k+ez34PAg5FiGKR7/qWSBfTtM
	YPVuwOYsWN+oBrt53oGLZ9mTEI5W3vFx+Kk89ddvAzzBNR
X-Received: by 2002:aa7:9a84:0:b0:82c:8c6a:682b with SMTP id d2e1a72fcca58-82f0c169cb8mr5207029b3a.19.1775856981518;
        Fri, 10 Apr 2026 14:36:21 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.1.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e3d41sm5111551b3a.48.2026.04.10.14.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:36:21 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Fri, 10 Apr 2026 14:35:31 -0700
Subject: [PATCH v5 1/8] rust: cpumask: Add a `Cpumask` iterator
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rust-percpu-v5-1-4292380d7a41@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775856978; l=2878;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=BETYXv/iPQABug1OuKQYEFZYT26teVkAoSalVy+DWvg=;
 b=XwjVmH2pYFv3eafAe1fjdPZKz8H5eTGdm8cmz3xV4HYLP+EHPiCfuzPJVwN/Yjd+JMCLv6Wnp
 AS9Kw9gl3CcAMjDQbDNlLeQK3O9aaHxYfUQ5eZRr2Un5733dXgLh4dI
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add an iterator for `Cpumask` making use of C's `cpumask_next`.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/helpers/cpumask.c |  6 ++++++
 rust/kernel/cpumask.rs | 51 +++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
index 5deced5b975e..76990e14dfdd 100644
--- a/rust/helpers/cpumask.c
+++ b/rust/helpers/cpumask.c
@@ -50,6 +50,12 @@ bool rust_helper_cpumask_full(struct cpumask *srcp)
 	return cpumask_full(srcp);
 }
 
+__rust_helper
+unsigned int rust_helper_cpumask_next(int n, struct cpumask *srcp)
+{
+	return cpumask_next(n, srcp);
+}
+
 __rust_helper
 unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
 {
diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index 44bb36636ee3..b74a3fccf4b4 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -14,7 +14,10 @@
 #[cfg(CONFIG_CPUMASK_OFFSTACK)]
 use core::ptr::{self, NonNull};
 
-use core::ops::{Deref, DerefMut};
+use core::{
+    iter::FusedIterator,
+    ops::{Deref, DerefMut},
+};
 
 /// A CPU Mask.
 ///
@@ -161,6 +164,52 @@ pub fn copy(&self, dstp: &mut Self) {
     }
 }
 
+/// Iterator for a `Cpumask`.
+pub struct CpumaskIter<'a> {
+    mask: &'a Cpumask,
+    /// [`None`] if no bits have been returned yet, or the index of the last bit returned by the
+    /// iterator. Equal to [`kernel::cpu::nr_cpu_ids()`] when the iterator has been exhausted.
+    last: Option<u32>,
+}
+
+impl<'a> CpumaskIter<'a> {
+    /// Creates a new `CpumaskIter` for the given `Cpumask`.
+    fn new(mask: &'a Cpumask) -> CpumaskIter<'a> {
+        Self { mask, last: None }
+    }
+}
+
+impl<'a> Iterator for CpumaskIter<'a> {
+    type Item = CpuId;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        // cpumask_next WARNs if the first argument is >= nr_cpu_ids when CONFIG_DEBUG_PER_CPU_MAPS
+        // is set. So, early out in that case
+        if let Some(last) = self.last {
+            if last >= kernel::cpu::nr_cpu_ids() {
+                return None;
+            }
+        }
+
+        // SAFETY: By the type invariant, `self.mask.as_raw` is a `struct cpumask *`.
+        let next = unsafe {
+            bindings::cpumask_next(self.last.map_or(-1, |l| l as i32), self.mask.as_raw())
+        };
+
+        self.last = Some(next);
+        CpuId::from_u32(next)
+    }
+}
+
+impl<'a> FusedIterator for CpumaskIter<'a> {}
+
+impl Cpumask {
+    /// Returns an iterator over the set bits in the cpumask.
+    pub fn iter(&self) -> CpumaskIter<'_> {
+        CpumaskIter::new(self)
+    }
+}
+
 /// A CPU Mask pointer.
 ///
 /// Rust abstraction for the C `struct cpumask_var_t`.

-- 
2.34.1

