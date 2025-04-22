Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6A5214236
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315572; cv=none; b=XB0yLECHOndbrQwx8b5KnRMHOcgVLj8mibi7DuUz0ag+bbwAI7nuFsW9F8M4jU2TdDPwMWgn7QZmAdBQQYN9lIZq1F3+VbvJMTOjA/2NY9y8RXaKgK99Zvu0SgCqM8sJ1m6PM8BGh5ID4ccXHnyhDDIK0TEzuzPjJoRPNGy8WqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315572; c=relaxed/simple;
	bh=GWW1hjokZB4jc7H3QwDWktdHZ8wac6bK/vXMX0acnE8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PIAAG4Mb5jDfEBFYm4NdkXOy1W03ACQiQzSqdLNlQLffZd5a6QSSYyC6ZTzOa8KHez5twMtASkRgM1oY4O00jqBnnO++GPE2eHYjt+wowbLQAxYJvLyNS4e0op/8Q8/GUUgBB/HV20zDlcHIJNsdban89ThL5UAM5Rj2QLiY4BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t4NaX2hk; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t4NaX2hk"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39c30f26e31so2724751f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 02:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745315569; x=1745920369; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n1b7J+UNfonWdLeszOqonYjrmWvS3LamWs4ixsdchvY=;
        b=t4NaX2hksZsE2vCgNOyE2CplJ+1KoQ9L8VBpbpwhgQfi/MQ4dpma8veDqRBJwyTBJj
         DfUm6Brhv27eETa5GWLZmWeqU9szlYULSi0RwI6ctLqbQlZaMPIRkTVUfO+PUn+UU+By
         UxMr1OxG3VgocoT6xmrmCEmBXbd69euP66b1bnmQ/sEfw/59lVSRX+GCCtKqtcffrZKN
         ruG1nPFUEekLFFL+emdmeyAmCSJNcEG7mRRXCoGJG+iHZLocES0AVrTSNQOpBsOpdhQi
         1mrWeItDdzF44+aASLkTm0pnIfTIvjYnHXjhXEwVSC55u0HoYIJfBKFXs//k1OEHS4mk
         yHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315569; x=1745920369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1b7J+UNfonWdLeszOqonYjrmWvS3LamWs4ixsdchvY=;
        b=UDBRcwIHaWUkGQ5cUtYFIaSiL1pf5Ee0PmtwPAenpUwzR6+TNSJFBPy+KVGyeIB5VO
         dlRiSMm5lC72Yt1flMaCOzktI81LhAV8Go6cH6v4js6NWXy66B+4klTWFcKLLkSPzeWB
         Bu+xFajoU39LkSOn1neeQzHsEwcz3iHnNj+/numDebV+C+J5nM81c9vrLXq9K9e01bc/
         y2/yHKcB7FblPR06YwCMDJNfVP49g324XFyVZUGtI36O9cTRBSkabOi3YMwdkKQNEjXq
         PZ9ZUrZiRp6wXNkg1lmSkfw538XvITHgx74nABB4jnD7vx3wUVzNbQXruS4GgwSBcCTI
         zeLw==
X-Forwarded-Encrypted: i=1; AJvYcCWC2msKqP0wwCutbgqoTL6rBqNSmDoMEXTUHReW3DQjGIWtKqo3YtxNFpL5vhl6MjW4555B9WG3h9H42nbINQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAEnAA5Oj4+uQZhyvpBDZKdw7MhKbu9yFuy9+WFZgnVF9ewkd0
	yXWUFYZwf+MnSNmDwsKF+6A1X1NIrGbeFYG/1qhEQx76wSCQeAL5nz/PFIgoITw+F59en9gNkCT
	o4dldBtz3udk3yw==
X-Google-Smtp-Source: AGHT+IH+cVV9twzU1vHTbSct4nZOgZGmFSdJykADxGQWVUDv4tibjvkEOH1AsMUFz6pZR7bdKz+sIniR61DT3yk=
X-Received: from wmbfo18.prod.google.com ([2002:a05:600c:6912:b0:43d:522a:45e8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40de:b0:39e:e438:8e32 with SMTP id ffacd0b85a97d-39efbb09208mr10899224f8f.55.1745315569002;
 Tue, 22 Apr 2025 02:52:49 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:52:21 +0000
In-Reply-To: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=GWW1hjokZB4jc7H3QwDWktdHZ8wac6bK/vXMX0acnE8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoB2bgmj5mzsyklfjuCQ+MElH2I0ssL9Murx59B
 0pcUIgBWoeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaAdm4AAKCRAEWL7uWMY5
 Rj/UEACM0Wb6Q5fhB3bzfKaeO8kiKdbbrZnecj0/MDszzWQ9m8CIWhg/jrtNZ2aQOeaA9sOHDNu
 pXubzPjWoOcGJkc7iUPwxmsKBR8Hr2WFboblw7S2FLxH3+9MTCA8VDZnK6nJUz2HymrHJD71Tw4
 FW5NdnKStp3dNezeDIqXyYrL2vlBN/tgqwhllmUMU7EnFLNxg+DFbeUv7MVqN8Rv1suaQlgjqaq
 EZNpWcD0/LgzBWnBoJlV/EdUGWYpkVJ0OsfnHdrXQM13/Lo3Dv/20gRhwyP+YWhmys3YosJHgjg
 HsjRL5kCwnf75pquh9MZK4kXHOcp5+6J/+CjRmVQ80+deCLc296cXoUp4deE5ddJ0TvPjVz5tbL
 5cQPxPaf2npNTehftZmbiJ2Q45n4Oxp+DHGQj6KvatWoL6rMaFtmyMpk20bow1uJ9ZVLDLuhzyX
 KDxyRwneSlcaITfFauYRDvZvFEMKQA36FYwB9FLcN7/qQvo4uQgzPzWv1+bONDH9F0M/M6qcDDo
 0tTDR0AH/EdWIZ5SAL3/jk6NqHMoLStsmJYabdPPrMBkpH7COmhezygm7mFnikgqiOJZKXoOSFa
 O237mA0LVuJKJzWj/IXTYBOCy0VLinghXokee6+suCUPN2f5vZG4hH2p/mBjfPQx1mhs6KyQ2fu uVQOEjWJGeIrE1A==
X-Mailer: b4 0.14.2
Message-ID: <20250422-vec-methods-v3-6-deff5eea568a@google.com>
Subject: [PATCH v3 6/7] rust: alloc: add Vec::remove
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This is needed by Rust Binder in the range allocator, and by upcoming
GPU drivers during firmware initialization.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 2f894eac02212d15d902fe6702d6155f3128997c..2f28fda793e13841b59e83f34681e71ac815aff2 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -386,6 +386,37 @@ pub fn pop(&mut self) -> Option<T> {
         Some(unsafe { removed.read() })
     }
 
+    /// Removes the element at the given index.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3]?;
+    /// assert_eq!(v.remove(1), 2);
+    /// assert_eq!(v, [1, 3]);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn remove(&mut self, i: usize) -> T {
+        // INVARIANT: This breaks the invariants by invalidating the value at index `i`, but we
+        // restore the invariants below.
+        // SAFETY: Since `&self[i]` did not result in a panic, the value at index `i` is valid.
+        let value = unsafe { ptr::read(&self[i]) };
+
+        // SAFETY: Since the above access did not panic, the length is at least one.
+        unsafe { self.dec_len(1) };
+
+        // SAFETY: We checked that `i` is in-bounds.
+        let p = unsafe { self.as_mut_ptr().add(i) };
+
+        // INVARIANT: This restores the Vec invariants by moving the valid values into the region
+        // that is required to hold valid values.
+        // SAFETY: `p.add(1).add(self.len - i - 1)` is `i+1+len-i-1 == len` elements after the
+        // beginning of the vector, so this is in-bounds of the vector.
+        unsafe { ptr::copy(p.add(1), p, self.len - i - 1) };
+
+        value
+    }
+
     /// Creates a new [`Vec`] instance with at least the given capacity.
     ///
     /// # Examples

-- 
2.49.0.805.g082f7c87e0-goog

