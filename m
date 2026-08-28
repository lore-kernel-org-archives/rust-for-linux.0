Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED85446067
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924161; cv=none; b=LpOJgv8OVClJt9JDoyfZ6a+JhM3SjXGFxtDFF3Re1Q5pVY5oboLNpAh0shhkYyKKgptVYrD1Ehg4TpWAQgok/Ywbb25g28PyfP4KDAApKhxTgw3M6gnJCnhcglofi5d7LOmTJkPskmT2d+/L2Oc1zej79kEUpTXYvhIEL6lVmIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924161; c=relaxed/simple;
	bh=WCsR9VCM6EM/pK1Ie9AXB5kKv/5eMuARZV77BgwnBOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eL//cYjWIjcUEijttvgWtodxR4y7NAjcllJ/oy/QsIB4lnvuCxQdnS1rxP/guTMbWppTIOy4MP6i/OsVe4FwHnT5iuMsytwPE9db8dsZkk3g7IcL7eazJMvuqUpVdfObEffWu44M8kEMCYPP3vrjYxqYnHLL+u6hYZSRznA/Kos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUNoP16t; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUNoP16t"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f3ece23165so1169073a34.0
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 06:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787924148; x=1788528948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7azSlF7fLt4GUE1gmyR6tXZBKTYryqmZmntQXAjAiN4=;
        b=mUNoP16texYk9hocEZ6fglFeMwvkdPFbKvp828u4lO20e9/kkkKLtKei9xp6f1voni
         puh8GfYkWqRNcOHf/z0Pm9kA60STe1XNLrulSLhJ5hqh6KkDE2xCpRT62FuEjHHZRinO
         wkuAHdjoCzHbe8KkILrKXVKi5Ji0cPvP3LcQQN41J4+Za54zuD9C3Zdsh9NQspW71L2f
         iAAzI978UrIh4UbC2ewBVtBrddVIrm+Sm34tpK3nLZOyFuXnRTKIBm8zOspX5SZnvjek
         HbsmAPyoJqIxljlb5cjot1t78KcWv/hDZN7LuGrUaYMnfBxM06AXj/wYVVcvFmgSYh8p
         15Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924148; x=1788528948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7azSlF7fLt4GUE1gmyR6tXZBKTYryqmZmntQXAjAiN4=;
        b=DN3eE3tzFNTtBUTSMMf+KS3/Kz1c3rf1WHY7XNnfrWYqUfe243okqyIptQnZMizZkV
         B5M6CdhFXK4QvS6TBeIsd1i69n2CPPkJVTwxtQ7s9eFnrfvc2argkK+C3Ne1ib4KppCq
         8m7WFiwI8nGlKUgg+oP2lN9sNN55NoYi1UTDzhmZGMPzl9K4jcw0q14N3z+d6Keocwg0
         GcQj4Mw4kGZuKhMmq9N5F3Yr30JyBN5bWfmNpYVX37/nP6PTi4R2U9DMOV0YbDu83Qv8
         D6nCess7a3f4b+zLviBVMCs3sEo5ZOwYf4jaZMYSyzji/qiY413tNkt11PsGYco/kbog
         yaEA==
X-Forwarded-Encrypted: i=1; AHgh+RoL99itgB3xyERxr2FEtcCNdaPnGtTZg4GzjSXQq6sHWwk6cXqCkHafnqxnWtHv5NbRXoJcfdMqD/OvpifNOw==@vger.kernel.org
X-Gm-Message-State: AFuF++mMvK8Sg1CNf8fVEA9Ush9HPTN5FsH3UjTSVVpb+9/tuQEZ++iz
	vSoycYKgX16Iv3eM/Csinn9lE0mOm3CBgObq54ciFceInON+xX6J2UWQ
X-Gm-Gg: AR+sD10r32YlbUtyIzYI7StlNjXlDbEs8L6jj0R/EBDAqTrA80WCxCyRAeIe/9lULTk
	EZHiNVyc6zt053y1pMeEoFqbzHkoIpVT2AlPkrhAnYp5p5XDnnUaPfjpEjg3cp3eA0UPK4Wklwz
	E1+KT2ZdLaM8Fvok2ZMCelK8iF29MaPZt4+0Y1d9Kx9XmYyyYkvebS0r3bd0psi7gqxacZbSqPv
	op+qNGvZUFgCedik/UYSj4WiDn2sn5PaRQM6iKeO83R5Tabi6mR8Z2sHwwYZaRKlPn6hNlaseWC
	2wAAazEg6eweQd/2bUfmIeNA08vkx9KtdoxIYV+OEdQ1yfpO4zHmSTcJS2qWlJnWh3m6sF9rgVH
	OYTlNoZpi4ckmXLoehxSKEJVho5xoOugB6vK9uV3gmtkIDwssWl6p0OQlEZv4HIDgAGjE84SBmU
	mF+OvP6csreQCSDYWJRWKLn8FumErBlDdLnRa4+nhMsKOV6IcE3y3vcPHEryQ=
X-Received: by 2002:a05:6820:7088:10b0:6b1:95fb:81e with SMTP id 006d021491bc7-6b1c67552ccmr4582468eaf.22.1787924147643;
        Fri, 28 Aug 2026 06:35:47 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm5949083eec.28.2026.08.28.06.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:35:47 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH v2] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
Date: Fri, 28 Aug 2026 09:35:43 -0400
Message-ID: <20260828133543.2259029-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`next_bit()` and `next_zero_bit()` use `bitmap_assert!()` to check
that `start` is less than `self.len()`, which panics when
`CONFIG_RUST_BITMAP_HARDENED` is enabled. However, neither function
has a `# Panics` section, and both document that `None` is returned
for exactly the input that triggers the panic.

Update the documentation of `next_bit()` and `next_zero_bit()` to add
the missing `# Panics` sections, add the missing blank doc comment line
before `Returns` in `next_zero_bit()`, and simplify the wording.

Link: https://github.com/Rust-for-Linux/linux/issues/1252
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
Changes in v2:
- Simplify doc wording following feedback from Alice Ryhl.
- Remove extra empty line between Link: and Signed-off-by:.
- Link to v1: https://lore.kernel.org/rust-for-linux/20260827150719.109145-1-georgeandrout13@gmail.com/
---
 rust/kernel/bitmap.rs | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80..b51c8a96f 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -459,7 +459,13 @@ pub fn last_bit(&self) -> Option<usize> {
 
     /// Finds next set bit, starting from `start`.
     ///
-    /// Returns `None` if `start` is greater or equal to `self.nbits`.
+    /// Returns `None` if no bits are set on or after the given index. The
+    /// index `start` must be in bounds.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` is
+    /// out of bounds.
     #[inline]
     pub fn next_bit(&self, start: usize) -> Option<usize> {
         bitmap_assert!(
@@ -479,7 +485,14 @@ pub fn next_bit(&self, start: usize) -> Option<usize> {
     }
 
     /// Finds next zero bit, starting from `start`.
-    /// Returns `None` if `start` is greater than or equal to `self.len()`.
+    ///
+    /// Returns `None` if no bits are zero on or after the given index. The
+    /// index `start` must be in bounds.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` is
+    /// out of bounds.
     #[inline]
     pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
         bitmap_assert!(

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.47.3

