Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894F1316183
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 15:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764776535; cv=none; b=TBISynRzIx3SHJoBwLqF/kEA4YkAxl0dwXnuNsbH/g05WkU+M3AbbTL7XfJAuxty6NBY2TBFthR3pMTMFejVAbfSE20OOx1SwlzbndjgrhopOGdxs0mQpQx+Oq1Epi+VUifCO7FFuU6tXtRwD2FW52znaIjc4o1DwJnNyn36/Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764776535; c=relaxed/simple;
	bh=gSy4VyW/27f4eg97KiqxHlqM6iwMMr4OKCMO8wWGbaE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qG6EbVFcEcNJcQVJ/WH6uUnw5Cq+rqygSt3vuuncqIZNFpZJ8EQ5MdznF0Djb+PR+0UYe57CNFabZENPO6ycWpPQL61VMsMinHYVNBc1xIUWKYHUtwc0uHpvJ1KpbqgkNs7v/fXTK51QSrvJMxQ78PufdZsMkDcfUzsa7UxSjXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a68yHHbV; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a68yHHbV"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b2ffe9335so5377581f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 07:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764776532; x=1765381332; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MEP+Wn06Byq4DDgZJIpuAsLYGWEhw5BHZcDKcmbZNIM=;
        b=a68yHHbVMZVd/qZW4+pap/Ie42A4M4qsIXc8mnR4EpyZLaBIVgCVLojXP3RZAJt55W
         qtTSuad5aPH3w2gZX9A6LVEyn9j86eQhmYixX5drfn+NrrZPczFkcp/qh5IhYeirPlgx
         Sd4s2hVAebrT8LsHsN5AG5BvZMwcCTxHNJfgSvbsrFR8d0t/7D9Iy75t5E7qSFq8FAvp
         YWK32VpXvFf5CCxFf7J1TdUWCc2VUDaZwGbOLgy+Za+zW2jAkzGijPl4mBTluHg8JnzR
         zjmsuHmR5dGgUr7mDwMTy4jjbsuCRlaZRQ24kaBv+7hWfNkVpTy491sN0fT8bhZjATSx
         9XUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764776532; x=1765381332;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MEP+Wn06Byq4DDgZJIpuAsLYGWEhw5BHZcDKcmbZNIM=;
        b=Ssi07X4hmcwJzhKu2QqNERg6R0e8brxWzpNuNRdjjZAjuEeGMxyHHEeUMo4wP87AzB
         4Y02Z2ZgbO3vmNyO0bo5BUe10tPV6Sz1RkfeghSKZH1SigdBGBf93pDmtq0IkwDXyDf6
         EI/pji9HSrI7jP3x/au9NJlUWYCY49eQro9XbQ/lFSAfuHPpq2M1RaI7PBbWTZbNQUqW
         9nHjrIQ0fPHhH+K85EHhDAkYS+JysGbUWDg69zIImDMbbkrGknLnEze+8gyzSFWWr43Y
         U/u7TWGXB0lf327gKSoxHydLeLjZhOdFyJwigbK2FyNiK+rtddIcaPCCGGYxmMPCJUa7
         bZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcq4M60ujQOM0G/Yo7SFJfiVpr6MA7He7m5IzSOhK1uvbvFaV85yO8NHph2NRUs67i5s/YGAbwa18VkFhgpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFKAm1DqkKEhlQqN3zzGbsEUmDfFvIy3Hnn7/23EA556CHRMiv
	7X9Ns7Ll58rELUAA0BLGKGkHiigQTXEAZBpZaciFweLxWn2jtQ9Be6CR8/r8jBT55x38rUU7W7X
	aS/pUtByAdgqBLbCZDg==
X-Google-Smtp-Source: AGHT+IG0BjcCoVsY6hhdZ9svpYuRoUSikDHzNRcc6RwEnC7ZBJ2fRYnmnIa9iDVb0yvUyHDrsenkNTrZfPqdPjU=
X-Received: from wrmt5.prod.google.com ([2002:adf:e445:0:b0:42c:c2d6:287])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:588c:0:b0:42b:3825:2ac8 with SMTP id ffacd0b85a97d-42f731cf4a4mr2891576f8f.59.1764776531978;
 Wed, 03 Dec 2025 07:42:11 -0800 (PST)
Date: Wed, 03 Dec 2025 15:42:06 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE1aMGkC/x3MQQqAIBBG4avErBtQI4KuEi0yf3MgTDQiiO6et
 PwW7z1UkAWFxuahjEuKHLFCtw2tYYkbWFw1GWV6bVTHVs4jFfYSHQfsCZlND6etXTAoRTVMGV7 ufzrN7/sBfcBfdGQAAAA=
X-Change-Id: 20251203-bitops-find-helper-25ed1bbae700
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3585; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=gSy4VyW/27f4eg97KiqxHlqM6iwMMr4OKCMO8wWGbaE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpMFpTOjoUI5c5Mct3YEyHa1U41PSAXApWpuhz+
 Oz0Iq/56xOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaTBaUwAKCRAEWL7uWMY5
 Rjg3EACbMF0kOfNa+XIzw2UPvvEWar4fZ+P/bdV98wWErw+4nVomkoG7ODTCc7+87PrgiSf0DBd
 Nh2ZdgUnNiTDKzlBSMMXz/r/Nr9cGillGxNtQjmI14HIuTWZz6gyQolprvPaoHtMlyE32IXjVW8
 JjewPCclyRVcoGjvcBG5g+upgtWSGNg1MX3PczSobJKXithTEcVyOALr5anAQcGbk/HmxgBRnZr
 UD+Qbavaj7ATU19qckIKp7ugKH2yw3eKoE3O7gYAGKUyA2PhPNxG4aR2UZUFqZo7ycDwD2IkD5S
 c64iENtWrGv9iEkGHI4ngVpeGOijEUCRBpCj5i/TfdTAFe+IbapfCMP9DMkMw2GXFP4OypF5L35
 1xdXsa8YrOqYgprvfZwEqHe6n5aPULtTssxtcF8K34TqCuGBiFySNYvaGTJPREnxt0PXAsv/o3G
 xG2XAS6c+rAxpWi8zFHomyhh4qLr/okVBsOdu5pcCxe6EFvltG9SRtcHfKH1lVvScQtBVFLlLiF
 CacF96eD6FRl8Tj/KcbCN97fXCwbvwCUMY/qUrtiaOoELlkw33NtIJYPh9WpFMfUb+c9mEjTkgw
 L6+muAruv0/HZpbmWS3kXG0XI1/BtsML4U6aBB8YTMmxsoWFqLntxGkdjT1h7j+9ZcIjGrEaD0S dyolcUD3PoJcX5Q==
X-Mailer: b4 0.14.2
Message-ID: <20251203-bitops-find-helper-v1-1-5193deb57766@google.com>
Subject: [PATCH] rust: bitops: add helpers for _find_* functions
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

On 32-bit ARM, _find_next_bit does not exist because ARM provides that
function through a #define instead. This means that Rust, which calls
the underscored version, fails to find it. This triggers errors:

	ld.lld: error: undefined symbol: _find_next_bit
	>>> referenced by bitmap.rs:459 (rust/kernel/bitmap.rs:459)
	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_borrow) in archive vmlinux.a
	>>> referenced by bitmap.rs:459 (rust/kernel/bitmap.rs:459)
	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_set_clear_find) in archive vmlinux.a
	>>> referenced by bitmap.rs:459 (rust/kernel/bitmap.rs:459)
	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_set_clear_find) in archive vmlinux.a
	>>> referenced 10 more times

	ld.lld: error: undefined symbol: _find_next_zero_bit
	>>> referenced by bitmap.rs:479 (rust/kernel/bitmap.rs:479)
	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_copy) in archive vmlinux.a
	>>> referenced by bitmap.rs:479 (rust/kernel/bitmap.rs:479)
	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_set_clear_find) in archive vmlinux.a
	>>> referenced by bitmap.rs:479 (rust/kernel/bitmap.rs:479)
	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_owned_bitmap_out_of_bounds) in archive vmlinux.a
	>>> referenced 6 more times

To fix this, add Rust helpers in this particular case.

Fixes: 6cf93a9ed39e ("rust: add bindings for bitops.h")
Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/near/561677301
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/bitops.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/rust/helpers/bitops.c b/rust/helpers/bitops.c
index 5d0861d29d3f0d705a014ae4601685828405f33b..84061af591a261f7268ffe6535282bf3c7608e2d 100644
--- a/rust/helpers/bitops.c
+++ b/rust/helpers/bitops.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/bitops.h>
+#include <linux/find.h>
 
 void rust_helper___set_bit(unsigned long nr, unsigned long *addr)
 {
@@ -21,3 +22,34 @@ void rust_helper_clear_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	clear_bit(nr, addr);
 }
+
+/*
+ * Rust normally calls the single-underscore-prefixed version of these
+ * functions, which are not inlined. However, on some platforms, they do not
+ * exist. In those cases, provide a rust helper for the underscored version.
+ */
+#ifdef find_next_zero_bit
+__rust_helper unsigned long
+rust_helper__find_next_zero_bit(const unsigned long *addr, unsigned long size,
+				unsigned long offset)
+{
+	return find_next_zero_bit(addr, size, offset);
+}
+#endif /* find_next_zero_bit */
+
+#ifdef find_next_bit
+__rust_helper unsigned long
+rust_helper__find_next_bit(const unsigned long *addr, unsigned long size,
+			   unsigned long offset)
+{
+	return find_next_bit(addr, size, offset);
+}
+#endif /* find_next_bit */
+
+#ifdef find_last_bit
+__rust_helper unsigned long
+rust_helper__find_last_bit(const unsigned long *addr, unsigned long size)
+{
+	return find_last_bit(addr, size);
+}
+#endif /* find_last_bit */

---
base-commit: 54e3eae855629702c566bd2e130d9f40e7f35bde
change-id: 20251203-bitops-find-helper-25ed1bbae700

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

