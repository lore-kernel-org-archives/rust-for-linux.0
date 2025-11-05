Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C84239FCE
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 23:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762383749; cv=none; b=TeKb3UVh/wcPJ7ugdhIsOdmRwSZlxRhElr4GA6Y0mR92/e0ryuO015IVIMv+q/EbTufchovcPSc8dWLaSxhQAiG1m/bp+PdjUlmnzPXDBcfWYG2JKb6eaWKv9S7f58ONr7E+wYop3jPvyRiAJBgVyXC+tmEa/Wb2B3Vzp9Fj8d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762383749; c=relaxed/simple;
	bh=O+TJ1giWcgX8q8AVGe652HR0hPyTAH9TmZB/EtY9dHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/4hdUtcC/KX52/v8R7fqDDF8qTAfUxDCNBqlyT3QZYHnrhw3liLgFlCL386JJvJciT4E+GfecEWtDVSJ0p3Yp4fQV0FMALu4Rz8X7JOthj/EQinqggjxp+cLMfovXBbwh7PCZtegGk32v30v1c+szkHFxTGSXRaqTlx/hqsCk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CS/LjCIE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS/LjCIE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-295ceaf8dacso3673875ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 15:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762383747; x=1762988547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwAIlG6TTHwluLnC19ePK0hNp9oFcPVSx2rVuCQMRhQ=;
        b=CS/LjCIEyPP388iMN8FFCVk34LhhJxphqF3MPao06xoHOEpgOn8h1fvlcGhow8QCkt
         1/k46yMUxVes7BTiLVTXutBhUu601LmL1RPM7dqRxGt0exuUdDzZIqSw/tZRxB7OYgsp
         NCW/b6/9Uknyhaq5RS8HsgwdVoKGj4VDMQwimHw44rG+UpvKF/zsCwPwRQuZp0uGbncg
         +mRtE4xqcZ28wBgdEy/rPvCkVtf2sJkUtBRyRt/obR1Ohi/lf2zAOpvn+g2Te9fzBXtX
         lkdlTIL+lDkd9UuF1rpGXzymvFuW2XHErONL9tNlcNvqB17acJfK38vpoimasYY+ABsc
         3S5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762383747; x=1762988547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwAIlG6TTHwluLnC19ePK0hNp9oFcPVSx2rVuCQMRhQ=;
        b=ehO9SKk+6JkvKncELVoWvDiFhrYyup7IHL3t8+92Xfu/cMHU9e0+Pg5TnfjPeC9+IK
         YalrghaHbLrL25YCNqCbZ5yACItBhMMrQGUVDwVQfIN12dimdgWz+G5xCXgV4WcKjLRq
         9SLfkCmpPeA3oBJ9RA57rJIq13Ewp9S0P1T6NXJToLE6UVDpEwvm/Cq8uV9mWPSoIMjE
         HQSWV9VjHavAV1aTtVy80Vp0eTFOwPOlwcxUwDGebuWPPbdeKanukpl4rVmF5zwPcaH8
         iOV6RZ/GHltQpN1fTLbxw0CsM5TuJ+03yF4bqVjg6CWHL4wc4VJeErADTDCHkIjJab5D
         K4Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVxaxpxPJ6podNFbkXdzYXlbQGamNwknfY+MsX1S00ot/gS3eZW3uE45YAi6T2kwaBwNFTLF0G3EcWOl5ETww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaA/s+2vHgVyzDWpLD+C8yQ4sRhzMhb3o/DZY1eU9UON3qkVZ/
	tTQHp15v7OFDWT2opDUPHNLSZiC3LNvsOaRAKZf4JG8v97z4b6BXpXg3
X-Gm-Gg: ASbGncvPdviM74fQ5uzMp4jq7fxc5FPcOlf3hqtHgahLu/kuCXeBjv5tFWrq98rFMSj
	JXm69dwHO55IbxJMKiiOWgYnf+kEiP0JRGYcKwoPgtlReshEkN4b0WPK5HjoUfK+Y6TM1HOU8ok
	pEHv0//0ETdGmqSYneztu/V+NH346Id8vchKfMJ+weEK+SyOCTrtWrAYRGR+iB0NipgvuRD2t9B
	AHPKji/wdG9UWL+7GjyNqrcaZYJPBSNM41K1rKb64R81ztABCgFWXNEnH2x7S2h9YAR+owi2/9H
	oqe80feCEyh4ml24AflSdnotSkWARlzDOrMK1EHPdXa5Tcucn0ShJdqN8HXW2jhURFKfHv468me
	d11ERKTrKHbvsskkUlJxNVfWyHaG/U5DsAnZl3deX+5KHcGEoxSWyGVi8rgvj/QK4YnGjPzzwkz
	ZLFEjksKOX7PHxzRF2mb3652o=
X-Google-Smtp-Source: AGHT+IE331S/e6OJPAmtF3ZjSt+Kn7kDN7/mWSvZsNxV7o3ouRhjWuYNtynxsbk6GSGpD8SmdbjGKQ==
X-Received: by 2002:a17:902:c401:b0:295:5da6:6014 with SMTP id d9443c01a7336-2962ad2ae93mr63812035ad.22.1762383747306;
        Wed, 05 Nov 2025 15:02:27 -0800 (PST)
Received: from mitchelllevy.localdomain ([131.107.147.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096839asm6325645ad.13.2025.11.05.15.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:02:26 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Wed, 05 Nov 2025 15:01:13 -0800
Subject: [PATCH v4 1/9] rust: cpumask: Add a `Cpumask` iterator
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-rust-percpu-v4-1-984b1470adcb@gmail.com>
References: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
In-Reply-To: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Tyler Hicks <code@tyhicks.com>, Allen Pais <apais@linux.microsoft.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762383744; l=2630;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=O+TJ1giWcgX8q8AVGe652HR0hPyTAH9TmZB/EtY9dHk=;
 b=8IczBPVeTYnGGmDoLSMEmJlu5vzuoGi7eS1E9YY+hxeS+rAglAWrTxtFqNGLBBFPmAYcnTMTJ
 x4pMKIkcfTyAX8RTADOq/K1QFRETacSNE1KN9TEQp5gLyy/1NwS76JQ
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add an iterator for `Cpumask` making use of C's `cpumask_next`.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/helpers/cpumask.c |  5 +++++
 rust/kernel/cpumask.rs | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
index eb10598a0242..d95bfa111191 100644
--- a/rust/helpers/cpumask.c
+++ b/rust/helpers/cpumask.c
@@ -42,6 +42,11 @@ bool rust_helper_cpumask_full(struct cpumask *srcp)
 	return cpumask_full(srcp);
 }
 
+unsigned int rust_helper_cpumask_next(int n, struct cpumask *srcp)
+{
+	return cpumask_next(n, srcp);
+}
+
 unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
 {
 	return cpumask_weight(srcp);
diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index 3fcbff438670..b7401848f59e 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -6,7 +6,7 @@
 
 use crate::{
     alloc::{AllocError, Flags},
-    cpu::CpuId,
+    cpu::{self, CpuId},
     prelude::*,
     types::Opaque,
 };
@@ -161,6 +161,52 @@ pub fn copy(&self, dstp: &mut Self) {
     }
 }
 
+/// Iterator for a `Cpumask`.
+pub struct CpumaskIter<'a> {
+    mask: &'a Cpumask,
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
+        // SAFETY: By the type invariant, `self.mask.as_raw` is a `struct cpumask *`.
+        let next = unsafe {
+            bindings::cpumask_next(
+                if let Some(last) = self.last {
+                    last.try_into().unwrap()
+                } else {
+                    -1
+                },
+                self.mask.as_raw(),
+            )
+        };
+
+        if next == cpu::nr_cpu_ids() {
+            None
+        } else {
+            self.last = Some(next);
+            // SAFETY: `cpumask_next` returns either `nr_cpu_ids` or a valid CPU ID.
+            unsafe { Some(CpuId::from_u32_unchecked(next)) }
+        }
+    }
+}
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

