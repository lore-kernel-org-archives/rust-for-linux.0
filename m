Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317F12C08C8
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 23:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762384589; cv=none; b=K8jvWfvyT8AdKXll85tK78tcIx6ErCqhZO5q4iB8KH4sqqzjE8ClozNDLy4hs0eTLMN4p+MDQAeWqn698EeuKrASoh7Gd2RFDBLXhFPtvPDLsyXn3/BBFnHneGTLar8rfmxwl3MXNc+8+mnIuHqqMABgC1hkYa3ZE1u9rwvxiPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762384589; c=relaxed/simple;
	bh=O+TJ1giWcgX8q8AVGe652HR0hPyTAH9TmZB/EtY9dHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uo8D4++ZlFEzPncKhE5yRkH4ctZmbdYdPFr10j/mLNCnB3CCEiq/lXfpX+si7mRjWh4CH+yXJbdLuFygvIsdO5yiMn0YbqXCzHJO/ECzaUwDhSB3dr4ar4YtZPG6JTXcBfBjG5lf0turgfSj1TwhGVlVYGZ1o8ubl+bFkgagAME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVtUUUh/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVtUUUh/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-294df925292so3666115ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 15:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762384587; x=1762989387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwAIlG6TTHwluLnC19ePK0hNp9oFcPVSx2rVuCQMRhQ=;
        b=BVtUUUh/aDbMLHmIIZEDEYstH8FyN9cBcBDRcNaoeie1FSYuNLgX0mmt6J8yztSVnb
         XwNFGxGV/bt/BUd1veam0dyIYGYk6Hci5+wc+vBjJy/BXQUAGmUpH4F4uwFkh4HakOW1
         NvEhLZasBsPHpVqq6juCtqGtTDAlQKF03RafmsOCuAh9kxI5dRKS09nd7hdDpb2CYHLV
         zCVhOVChyYKM1GirGBTYGphqemQEf9OAcmFhx/xEBgsme81ZziRoXSLEXmf2egHI1iPe
         NZg7zU73/lFXqn7RNDnJxCpe2S4mRManvhNZeME9rO/NLLV2/ggdnGUgC5HIL4snj/RZ
         pypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762384587; x=1762989387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwAIlG6TTHwluLnC19ePK0hNp9oFcPVSx2rVuCQMRhQ=;
        b=HA/NYYUZH/aStb3W+dFV5AkKx1s85cUQr9iUJqn31fSx2+V/hvP9tVUqnQW+uyS+2K
         +yI3Vlk3Hr0RCzAQpScVMUvsMFbq+QncaC7xCNHkXijAmcAbw8z5izAHebSLI6koMW54
         RrwKJQh52IG6fLZ1Gc8GH9G6FmDqj3NJa1wUwCaYMIjCfEbo/C8ciyehS6txIvbxueaA
         hs8qU1XTiF7nClVv6R8u2w7FYbahBwHTJ1nJilJsqZgDmQKZn5KCJmGGZHUfsgu6EOIc
         ooeKAtsYxZXDMkX0OwRnOBYATTHmc0u+8nH9P496/Vg3TqDS1s3W4Zzka8Phk9lqppll
         otZw==
X-Gm-Message-State: AOJu0YzMjGXHXAKRLKuEMe3KEx2bES95ChtNNyaPDrd9pkLhFUcP1LDe
	UALXE50W+pYDTlBVFtiKqhHMQTd2hq8t73OrW8W9z+eXhTofrRPNIzlE
X-Gm-Gg: ASbGncuXhgOXfD16uOgQ38zJe1KdHjep1l5GvHLwbLrKGkUndug8jsI+7w19nnimn/q
	/90QTydmWH8B6VJuL4V0SnlY1UkJA8kg0qaTR4/t+fKUJb/tNDfKIBKy8JItnR7OQxTZKUNcsw7
	B0b5NaMwszZPLzFAyBvfXIxANx2hFu9ZNnE3HY7qCtbAMmlurwjbsx2B+NsDUElDigb8stNgJH5
	J8wx5O0q5mzxJrX68+AqsYGsXeo7HYnNGDvwnB+V1mpRwVlbochzIitbrIvJCk9NRDG+/S2ijk1
	z9my/I9zggbik/7QkHLY2YIUETcInpeKDnsgMTPUkoTjjxAF1/5z443exqd+aPTW7J+zs8rMKUH
	GM26wfXwiKcDUkEkGZHQD6nvJzUphlwAIRzsW4sBdBJaLi7ehfBf0ASB6BFM4qOmKJrINCRX44x
	4t4Jn8n/qrQNURaSAOt8bk
X-Google-Smtp-Source: AGHT+IEepHklLDAxqKXJps4E9hwL8Bs3tisjtWzu/YVvcP91A5CkpsqwgRxYF4+8t3q3DKAyo0BvYA==
X-Received: by 2002:a17:902:ea10:b0:295:24ab:fb08 with SMTP id d9443c01a7336-2962adb27d6mr72654555ad.47.1762384587205;
        Wed, 05 Nov 2025 15:16:27 -0800 (PST)
Received: from mitchelllevy.localdomain ([131.107.1.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93ce0sm6391925ad.88.2025.11.05.15.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:16:26 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Wed, 05 Nov 2025 15:16:14 -0800
Subject: [PATCH 1/2] rust: cpumask: Add a `Cpumask` iterator
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-cpumask-iter-v1-1-7536f906d7ed@gmail.com>
References: <20251105-cpumask-iter-v1-0-7536f906d7ed@gmail.com>
In-Reply-To: <20251105-cpumask-iter-v1-0-7536f906d7ed@gmail.com>
To: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762384584; l=2630;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=O+TJ1giWcgX8q8AVGe652HR0hPyTAH9TmZB/EtY9dHk=;
 b=sTFswU9v+NtwvD+1ATeGBxN3/kjtiLHvd6VJ9Q0ZY2hC8iqQZALO24cBW53aj3K6RF0bQCBqb
 G5lUorisoS2CtF+TJVAineCbVSChP8vZR54FiCfFK5HTHuvH8txb4Wx
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

