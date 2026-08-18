Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F442836A6
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066436; cv=none; b=OqdB96YBpSu49O4627bUtldCCqX2NB66mBhSUCd1pJ9FwZaueaa7aV9UVO0Izui5P5Pft0DRwz/E4FIedCxSQKKf2oEw/1I8x0bHGbx5aXbINimPLTtFEYht8SAyeBVprk8gL+pu5vvvjK3cZaABuxucaXwER537Y3bUkNe85Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066436; c=relaxed/simple;
	bh=lVVGyoI0yNkmpTkc1xzUBaTF6I8x9HnW591ib48kPo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ihAcES+lQK117Rqie9F1cZtyzLPlHYHXMNYIS7heDLykE32rRvYFs7UbqA6JBpaxCbOJ/GbhHRIunPNm3Pz6W8Nr+tcr9+HWH6Q/gGNnrIcqdPb7Kv8yVmcsh7KyVe/yDm3KH5Eoe25piJMppmIbuDouVXqk3N0YZWwZsJTp/+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnEtkvT6; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnEtkvT6"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c197e7e4e94so813926466b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 08:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787066433; x=1787671233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7/V3zTAw391qLVLvjrhLrPuXnBwusW56ARNxgO7nP0=;
        b=MnEtkvT6n7mudbx2as2X7eOZhlITcm47M7YOg+ZH+xk4bRgmUU+ovDZWK+QC3Kid+n
         D8al3fpfnstEzXzhhGjOCNwCSJ9FSAtXQrYspdzpYH+iBF+OhyT2pBIQc7jfOkgP8i+B
         PXxzpNWENHsLDFW/IhzbedjKWNgFrRkXN/e9k+EWMlqRNONkENXAQUY179tI/geqGfdD
         wP+20LnDp5Gub8S9r6dN5Y8eGkgP3SgN3Za1dYbl9P6ZcHqKD17R/wvEps6RBi8VimN0
         TrfsNbhiix4qaPZMe8pltBAuIIGteF1aFLdqZ9abN2AmDL5C4TTq62rzUP5La4h0qK/N
         K/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787066433; x=1787671233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7/V3zTAw391qLVLvjrhLrPuXnBwusW56ARNxgO7nP0=;
        b=b7SET85lJy+hGLFWZLtdUoYsMgKJtXVxHhK0Fpt2axEPuycs+ygq35IK9g/ChZq4Ax
         ASO7azP+bDKAgRJhmIIaVUiimwcJi6w+St/xfdRmtVgiGKqvP3cZPXO6DiFBzw5LgymB
         Vlr9j8/5OU3h2heZ0JN77LSODcQOCECA2uKjj6F6A0TK9TP8ww4G8gxhzuueM32gCTMX
         QcSI4nGW2G95+Tfl4MF71qcz0M6g6S450kI75LgPJiaofN/L0fuLdak10HRWZpIhzsuk
         Gh+3BoZh+MT/NjIw89M+dKohN9xYM3zjY3yfzqhw1Z4nhv6ZC+Af3nezo2bZ0yCtaKA1
         a2nQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp13tvKcU5/rl93raaYqWmvXZVjYrZsWLOeeG0wTvImNaYKvlMKvKx2NhoqnaWeEPwvrWi7V1t4e6pSRxouxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMCct7CjoMdXHpDdri6giDVZuSUW3IfcP/bM2XjdD4d0Q1lYMV
	b40WfBECqHB0xi3o1zVTPsrwUDOhal4UW31nKcroTNHl0Un4pB5mS350
X-Gm-Gg: AR+sD13ShA08KFfQk0D9cbGaI5o1zjIzAMJBmYXdQ/7IcU9WTsp+TO5w9QgMfUl34rK
	awl6Wg/vIyyOm5fIaL3dvAJ+rGL8CgQQORG8G5POkdDzBdnMhpajR20jGXXyaW2fb4hX3JaXkSm
	0qmi+EF/Tha0yRogyG6ABVFQ0etCMRnYGPi33mskW7c0/jp943iDtrOn05ib1iYrHKRU7DEfopO
	Ca1mGuHbTktOs+10NTFVCMEsni9Lkc3Urhykusxlgh6XbHk3zkI6fnJLlAOT3SaqlibjHTS5see
	Q+7OZNkdkwxHZ8fRCyE95aomFQ2t1Q2lSw4g2/VZIr+CgQQpXv5cuaY9+t2B8Qsa36W+ZWz0FDr
	POq7AFfpvrwCiw8vsYS1+eFmUqYAJD0x2wg02tIvn0O6jgEHmJn7jeQWsBacXMsgo1S6+Cke7i+
	/m5usIMZFd0XzY6JvPcLoWRbHvPPYf6fD0/xrJOFalFrX7LJIjSGPCjQg9lp1Laf214nCbCW/ua
	gI/xNb6ND/tJ4DWuDSM9C+3
X-Received: by 2002:a17:907:c78b:b0:c1f:e09d:12 with SMTP id a640c23a62f3a-c212a395aeemr1639036766b.25.1787066433278;
        Tue, 18 Aug 2026 08:20:33 -0700 (PDT)
Received: from [127.0.0.2] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea1e64sm213893266b.21.2026.08.18.08.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:20:32 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 18 Aug 2026 17:20:21 +0200
Subject: [PATCH 1/2] rust: kunit: add config to fail kunit tests if a
 lockdep warning is triggered
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-lockdep-kunit-v1-1-66ceb1a272e3@gmail.com>
References: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com>
In-Reply-To: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787066429; l=2312;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=lVVGyoI0yNkmpTkc1xzUBaTF6I8x9HnW591ib48kPo8=;
 b=HGj1MbpngcLllNXMzXP2g3dYt2CDx0pP7ylYtXc5j2qZLhGojjgg1devKpZTqDNF8zhU1MGSr
 QAC9vK7vhL5D8eocII5w0+NRlmFq8CaiMmzljBtgXGeYDW259aG9FH8
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

When running KUnit tests and a lockdep warning is triggered, the test is
still marked as passed based only on if test assertions are true.
Thus, add a Kconfig option CONFIG_RUST_LOCKDEP_KUNIT_DEBUG_LOCKS. When
this option selected, if lockdep triggers during a test, fail the test.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 lib/kunit/Kconfig    | 13 +++++++++++++
 rust/macros/kunit.rs | 10 ++++++++++
 2 files changed, 23 insertions(+)

diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index 94ff8e4089bfb..30bac00c42ce1 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -142,4 +142,17 @@ config KUNIT_UML_PCI
 
 	  If unsure, say N.
 
+config RUST_LOCKDEP_KUNIT_DEBUG_LOCKS
+	bool "Enable extra debug_locks assertion in Rust KUnit tests"
+	depends on RUST
+	depends on LOCKDEP
+	default n
+	help
+	  Adds an extra assertion to each Rust kunit test case that asserts
+	  that the debug_locks flag from `lockdep` is unchanged. This is useful
+	  when writing unit tests that could potentially trigger a lockdep warning,
+	  this makes it so the KUnit test does not succeed if the test assertions are
+	  true, but a lockdep warning is triggered.
+
+	  If unsure, say N.
 endif # KUNIT
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index ae20ed6768f15..d1cd0349f86f0 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -144,9 +144,19 @@ macro_rules! assert_eq {
                 // here to reduce the length of the assert message.
                 #(#cfg_attrs)*
                 {
+                    #[cfg(CONFIG_RUST_LOCKDEP_KUNIT_DEBUG_LOCKS)]
+                    let __debug_locks_snapshot = ::kernel::bindings::debug_locks;
+
                     (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SUCCESS;
                     use ::kernel::kunit::is_test_result_ok;
                     assert!(is_test_result_ok(#test()));
+
+                    #[cfg(CONFIG_RUST_LOCKDEP_KUNIT_DEBUG_LOCKS)]
+                    {
+                        let __debug_locks_ok =
+                            ::kernel::bindings::debug_locks == __debug_locks_snapshot;
+                        assert!(__debug_locks_ok);
+                    }
                 }
             }
         });

-- 
2.51.2

