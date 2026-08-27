Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7547B425
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843254; cv=none; b=GJrqLo14Vh01sJUUEHSrmbmOqFSzIgAV2hBSYmC2+KbGO+qeXcoGVsQcSa5E0/UNGz5uCPrR0WBJIX747VFftOhIoVuW2CF+ttTwZJyezgT9MEayvu0ESOk+r6gUYrjeM334n4e4ZHtsc9IFKI0Oa62VkFIjp0wwHE4ON++SNbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843254; c=relaxed/simple;
	bh=+EfZIk8UyxWw+/QmIoE1JYEi6QngEVZyASlJwP//w6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UGsmPghjW5kIerrUrG7AmV+/+/E8NGMTrTss9edLJoegrGEy6IAPObtPoxqNmKNqTnYHBvdsOOYaFP+h1Kxj4l9/A6D82BkgACNqpeuk8caZB4Hvx6RkiaNFMqnIBeSDNvefK71St3ai6QEvhsWzEy0WGTjnw6dRqZ1uq0Me/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMl7v1gC; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMl7v1gC"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4634d881742so10735fac.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843252; x=1788448052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZAtu4jfJrkcL5si1ce/uQmymWR46x3S6FScFRqvh3U=;
        b=IMl7v1gCcuFJgA8iacy35QKyNuXBIks+FCuCc+RfSQLE1JwrDbDe1tT4n4Jas0tCHs
         UMWOlLtsUFzST0a7yWY+vMbircoUVGQJG4952FhpcCo0tgq6w9x0q8X1l6tWdidA4DNI
         muZBkhyENNEj4K1plHtoJdJl3IRtEYrqFwwLYppCrLURLeTWCA/1wfnWoms885KZzXMN
         RDOsHUshcvQKpuU1fFVIhDa21QcTR5358Dw4PzUoxGO0PJsJa6ZLdx7kf7fnb4hX3Kw9
         2Sr+XTIKAJ8F0kDRCafmI67KlZWIuulPQknSEFBYHJt5WACsGz5o/9h4hQL43vUnFBdk
         6arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843252; x=1788448052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZAtu4jfJrkcL5si1ce/uQmymWR46x3S6FScFRqvh3U=;
        b=avf1S69u97/0B/vHHA5K6cvr3cFVN/m6jnOYZN4Mr4cN0Nt08gs+iFAVpEzE0jJ+dl
         P6IYWUryBJFpHmRsk9w/P59cSoRMFd+Ng1HzoVnb4z2STbC6ViKFhIOzFiXKOfOth5+K
         ZbHSXN27bpG/yNaFUkfSM+OrnI5PON/2sCqe5/3DA+KgODOPmrb092R2X+07bh8QBZCr
         90bsWPuscP87MKFfEtVe8BbMRvYfKYg8mUdLBVwK6jeDaqrcdOVcfIFK8Nx0BKcI9xvf
         SG4Z4lR/7hkjn9F3VKQpQByr3Om1EeNuLizbnlMtziDYrb5HwThzmheY/9VvIfZ9fpSE
         PrWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKyHD+z4PAt/EXqbP6iFvdUEdGbrSwIvklwdkMMLEkkgUowRbhQCbqC/9JPq6n2vk9cze0eIfEqtke7VJgBQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kGwPYlLSs5M8nVQr+fsZ3ZZWTYQcDC+sNqVtEfsUcb1/t1wkVe
	r5ZDoJUr1iAcEjOjsR1/qTydeR7VHm51OAdGCjXCnfmQxXcZeFsSSCYH
X-Gm-Gg: AR+sD10TyRYluUj5TRi8gMvxGB8XVZK++QCFtn4lOraJEpuxpBImw7Kjdd++nU+CNvg
	DKjTQCSW06LotfnE/yh72Z6/C1AdcIJt5O8f7NynJvxgBtMdYZstk8YhpFFpZpzzj2x20F9R4TD
	e/SXuOVB5j6bProhZ3XB289njUTR0BBhoRMXlzi5OTT1tTqxnI3kJYgXZuAzefYeP4WyLPUOyBp
	OSVbviHUZVUANkGIXcKoBNEIY5oEuiNLgCIayESuLc9VKUt22WZYGC1jbo/rdN9gbXc5DrD7DDl
	0rLKIJYFA6sfxDaYf+9msEUu80iojjzeLmE3BatNTose5AojyajGvG7NqXlzRGhEaAe+z+A7/ff
	79sshCz/tyP08ZB5dk+4N++eZiGEgS+UHlI3HRF8Xh9/SuHX/3Ec9Gft0eYNkGKigQ/FHzpuMDG
	t3VWJGubvZAPx28Yg0a2/mOiJLg3jufgkYnc8fmm8Ghr1LfVE9mdMGHq0ym58=
X-Received: by 2002:a05:6820:1504:b0:6b1:ba66:6998 with SMTP id 006d021491bc7-6b1ba667ec1mr3109057eaf.14.1787843252159;
        Thu, 27 Aug 2026 08:07:32 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a907c682sm17009944c88.15.2026.08.27.08.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:07:31 -0700 (PDT)
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
Subject: [PATCH] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
Date: Thu, 27 Aug 2026 11:07:19 -0400
Message-ID: <20260827150719.109145-1-georgeandrout13@gmail.com>
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

Add the missing `# Panics` sections and condition the `None` case on
`CONFIG_RUST_BITMAP_HARDENED` being disabled, matching the style used
by `set_bit()`, `clear_bit()` and their atomic versions in the same
file. Also add the missing blank doc comment line before `Returns` in
`next_zero_bit()`.

Link: https://github.com/Rust-for-Linux/linux/issues/1252

Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
 rust/kernel/bitmap.rs | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80..b33f7ce5c 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -459,7 +459,13 @@ pub fn last_bit(&self) -> Option<usize> {
 
     /// Finds next set bit, starting from `start`.
     ///
-    /// Returns `None` if `start` is greater or equal to `self.nbits`.
+    /// If `CONFIG_RUST_BITMAP_HARDENED` is not enabled and `start` is greater
+    /// than or equal to `self.len()`, returns `None`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` is
+    /// greater than or equal to `self.len()`.
     #[inline]
     pub fn next_bit(&self, start: usize) -> Option<usize> {
         bitmap_assert!(
@@ -479,7 +485,14 @@ pub fn next_bit(&self, start: usize) -> Option<usize> {
     }
 
     /// Finds next zero bit, starting from `start`.
-    /// Returns `None` if `start` is greater than or equal to `self.len()`.
+    ///
+    /// If `CONFIG_RUST_BITMAP_HARDENED` is not enabled and `start` is greater
+    /// than or equal to `self.len()`, returns `None`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` is
+    /// greater than or equal to `self.len()`.
     #[inline]
     pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
         bitmap_assert!(

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.47.3

