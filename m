Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11483A1E8D
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 19:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766776515; cv=none; b=LTDd1ynSwS4c/aPfxZIUgT00zBhXLqcukOoaxMyhf9npA0aFGZQ0K+HAcSwgZ1U50d3neFGGPQZ9s3SQuyfATfn18lZlhTS0cXUYMIcdnFFuDtE/bmtcXvwoapucbkCWgqdCiPgrH+cT+8/LNlnogioUkG1aMUUyMEvEsZOVxEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766776515; c=relaxed/simple;
	bh=ldHNZ5zeLjLocyFIc9O/h8jKxqQSgOapyv1qPGU77Fo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=j8iSbXDc/pTxlnH5j1e39raVb8i1JwD76ETDjXAa4hQ/qZtmvyWFz32np8Dn0cJT/T7sPEKKbTkXg6hAMbrFvFWYpWurzvW3jSqeq+sxzlLITNzU6kB7wRpWxUZMLu/BNgC9+XloxL8TRex50BCDviRi7O5aV+q/PmL4Zllv/co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oFfkPzYH; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oFfkPzYH"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a13be531b2so163965485ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 11:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766776513; x=1767381313; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=weEMOWYESYSkGvv81grjrd8FZAwXr5djWkPIclluMOE=;
        b=oFfkPzYHBJUje2rUO12LAFjiHcZ7tYGXqJ1csc5V3+LjPAG9ExDFBRL97c9YXAWIUk
         /J+Y/l974MOwYcT0gUc1NqSi9KpB3w1nueS8egG1emX5h/VRqx62Ex4c+zfAa1pSGyQ/
         gWj8Wg1rcFj+iz6m2ttBCv6GrqFVOWscA5g+QEFSTNa9+c4fvQ59cbafrh5pJ39Q1lwA
         /nI0w+DvTrhkC3Js6w2IVCA6YjyM8XqsqazafrxppFG9NnqSaeA/I+Y3i8ly/10uE9rd
         6UvE7s1wcMg2wdLP1wh+Bc+VN1MY6cYFWckhk/J5kJMtVoxiSNkgTrTYMMbYdBkFuGea
         RkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766776513; x=1767381313;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weEMOWYESYSkGvv81grjrd8FZAwXr5djWkPIclluMOE=;
        b=AU8fHbPBguGXJZkmRzgzX7WURv4Lom+uG3ScFRjZZ9/nTJ65atXid02sgSxKafIEH3
         gbtWhE9Y4YycVORd259Fb09xJZ57EK9AFzQPI+IZEJ0mc6m6RMqjoJp5LheMqYw2amg8
         s0SXrJa2eKXEid3fJdrqxW7F5dWTQXm5Ey5VI53D70UVCx/oUUxM+vM+pEeoo3DPjBHv
         1G974RX7zudnLhW9r5T4/5TrC7+gv7uKFwrEr1ljNzjAPgrkXhM/0i/lWfYAkiw7TapS
         T8XRp7eOR+m3vXPcGRNqKtnSnp+kpt19F1aI67Ujp25EkcgdB+8bIeU34NPT9oP26rG6
         i9YA==
X-Forwarded-Encrypted: i=1; AJvYcCWJWGn7TkUGDj9Jmv2hJaBL3jI+uDu7UOXLn4zPtaI2GNyaZhy2mzHABAYEf86xANvb6L4iEP6/A/kyozz5Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP6JgDNUGnD6A8iuOeJgAeBBLJmlYuH2q4DGZ5zrYJsv17IsF/
	G5aIjmDQYpUNtBVPolL3CaRT4TLxEngikxuz2OvVK9XDBl5HRAR7MJMdEuujDOdr7+EGjS3pNzx
	MNgfuRYDL4w==
X-Google-Smtp-Source: AGHT+IEopp/DkG8i8YupdroHeNkpycOMhglqBoR6OYA1arX2qogCXmC+6fA68Zbq402j3/+Hq4KpPa4sVCLY
X-Received: from dlbbt4.prod.google.com ([2002:a05:7022:984:b0:11f:4501:52c4])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:258d:b0:11a:3734:3db3
 with SMTP id a92af1059eb24-121722f3ed1mr26210860c88.32.1766776512874; Fri, 26
 Dec 2025 11:15:12 -0800 (PST)
Date: Fri, 26 Dec 2025 19:15:10 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAL3eTmkC/1WMQQ6CMBBFr0JmbU1nhCKuvIdxAe0ATZSSljQSw
 t0tuJHl+z/vLRDYWw5wyxbwHG2wbkhwOWWg+3roWFiTGEhSgZIqURsjeJi8G2fRFiUjccOIEpI
 xem7tZ689nol7Gybn5z0ecVt/HUI6dCIKFFzK2mCjK62Ke+dc9+Kzdm/YQpH+ZXWUKcm5uSrVp jcv84O8rusXmBtqBuQAAAA=
X-Change-Id: 20251029-add-entropy-f57e12ebe110
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766776511; l=2293;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=ldHNZ5zeLjLocyFIc9O/h8jKxqQSgOapyv1qPGU77Fo=; b=G/xqDZrLBAz7oFDv0/3ZcSk+1lnR0jJc6L02D0JBb3w2OKY1pEZt/hzMZlgw+mJvMIgrSZItz
 r59z+d7bLBED3w3+R6UoEayU1BEtV9UUNuuBLQzc4u3s2tBWdWDPCKM
X-Mailer: b4 0.14.2
Message-ID: <20251226-add-entropy-v3-1-a3440823a07d@google.com>
Subject: [PATCH v3] rust: Add support for feeding entropy to randomness pool
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Adds just enough support to allow device drivers to feed entropy to the
central pool.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Changes in v3:
- Fixed doclink to be srctree-based instead of relative.
- Switched to prelude import instead of fine-grained imports.
- Link to v2: https://lore.kernel.org/r/20251216-add-entropy-v2-1-4d866f251474@google.com

Changes in v2:
- Added more details in the docs about the API, specifically about it
  not crediting entropy and when it ought to be used.
- Link to v1: https://lore.kernel.org/r/20251212-add-entropy-v1-1-e70ad1bc9c65@google.com
---
 rust/kernel/lib.rs  |  1 +
 rust/kernel/rand.rs | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf12004286962985a068665443dc22c389a2..bf64752d276b0bdea06ac0de8a5e219190129377 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -130,6 +130,7 @@
 pub mod ptr;
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
+pub mod rand;
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
diff --git a/rust/kernel/rand.rs b/rust/kernel/rand.rs
new file mode 100644
index 0000000000000000000000000000000000000000..3e0aef2f53af122f510b34c4743a20452aaad9ad
--- /dev/null
+++ b/rust/kernel/rand.rs
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Randomness.
+//!
+//! C header: [`include/linux/random.h`](srctree/include/linux/random.h)
+
+use crate::prelude::*;
+
+/// Adds the given buffer to the entropy pool, but does not credit any entropy.
+///
+/// This is intended for use mixing in data that is likely to differ between devices or boots, but
+/// may otherwise be predictable. Examples include MAC addresses or RTC values. This slightly
+/// improves randomness in entropy-constrained environments (especially common for embedded
+/// devices).
+pub fn add_device_randomness(buf: &[u8]) {
+    // SAFETY: We just need the pointer to be valid for the length, which a slice provides.
+    unsafe { bindings::add_device_randomness(buf.as_ptr().cast::<c_void>(), buf.len()) };
+}

---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251029-add-entropy-f57e12ebe110

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

