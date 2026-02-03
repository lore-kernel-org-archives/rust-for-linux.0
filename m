Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617FB302CC0
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 11:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118467; cv=none; b=bPesaMev4aXSMQHprL8ez3D+80BTOuDv2SkRKfN9gVipd0zpJ53kBTYyRI4ScsMQ1Cw23m7p6SIFepo596m6e9gR1DZutDAekey3vi3eFUrznPznGBdtIQrV7Htp/8hcGEhyByJ3Gi3gULu7eeFjR9KTUDBla4DHRozvI9F/Nh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118467; c=relaxed/simple;
	bh=r/0+9qJswzrRb/+EdDwKidCVLUWK29vWT4K+wcArP6I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FphvRfNwrsuc+m5Jblyd0b5doy6649aGQD1GuPgPO3mAF9qsAa4ipCnx1WrzD72TlBi3KtdKZD6sl0Dx9OhozdJQgIvDPEjD00e0QOz5IDbW9yPozIKrzoRs/X1/Jc4orjbJdFXO+p0vmlyUYubylahcDvKn21mh2bOpUEKGidQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XarltsKC; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XarltsKC"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4806fa4a180so47139335e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 03:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770118463; x=1770723263; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wt6rr7j8WqJzmDBy6ebcZd6xKb6YF9nq3jIKBZXTuLo=;
        b=XarltsKCxxiWeolwhhVlgoTUX1iASSNywr4fNTII7cpN1CnHzmwcvzNFAX4TFyLGx4
         A5pM/Sl7n7MjtjrsTZ28plhi1jEppU/4PX5yPw2bh2mzHldXvspC0/9Ue3ClN4Wve2oE
         4wuMX87cS58gq0gjytq8W2zSvtM/qMX5OdlwHi56LC7mazEUGuRCXpDSiC7f05/lYuM8
         /sWRLxYEdAbZSilV6s3Zx4o1rg37B9lIlQIfVRQToo7vNJQvBKK0s2ygOmgwOqc/GiSQ
         6NFGsv/b3PdwwZDzsBsrFG8O7TaosxuwcCm7cLKcWow1zY+52ib9oXaHbDnMV0i177sW
         gdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770118463; x=1770723263;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wt6rr7j8WqJzmDBy6ebcZd6xKb6YF9nq3jIKBZXTuLo=;
        b=QzL+RmvEcAHkqUINZTRZGC6PlOSk4az9aegMd0omugL4dSZFf1YdtiElPI5NXQb/dn
         8CEfVLoyDaiqNWCDmN2emLj2Z3BVuEXpQ/02gHX99x+k597A3ixaXD7WVit+Iv1eZ88k
         WTPrWJnKX9E5wjkafyoAeQijVTiDUW/DNJg+35m1gP4hjElFqGHvqUd29xbe5sxXa2xi
         m2Bd8x7rnD3PIdSyATpjjsai5Ff5gxqMpIXblHmjhuwzj7jK13Tp1pgvx4ZyVo2ADDDA
         S+wCC8BLAeJo8gpwSZbPl1cff2sT4LwMkQ9I6Oon+debJz/g9oW/OeEArTr2MawIS2SQ
         gXQg==
X-Forwarded-Encrypted: i=1; AJvYcCV9G683M1U/Rv9f2HSxC9GRrwWfMuRRvJq1AANW0HqudZopJf2eiYZZkHEz8H/udkq+VzQloCc5iyqbKgD4sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7raO+9U+07BOK17xh7L2YUYZrm+TLnFXn6DGAPZbz57VdPKuK
	WbOFdB6tl103UG9IXeUO0gqcSr9iz0bDd99awUTaUkleMw3PaGtYskzc9kZy2hg3zMeRijCyPVb
	i47Mc1V5t6SXNeOH+JQ==
X-Received: from wmjq2.prod.google.com ([2002:a7b:ce82:0:b0:480:3842:3532])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c20:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-482db4d84d1mr202173045e9.24.1770118462768;
 Tue, 03 Feb 2026 03:34:22 -0800 (PST)
Date: Tue, 03 Feb 2026 11:34:07 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC/dgWkC/3WMwQ7CIBAFf6XZs5hCLbY9+R+mByxb2AShAUM0D
 f8u9u7lJfOSmR0SRsIEU7NDxEyJgq8gTg0sVnmDjHRlEK3oeR1G3pFHZtFtGBMbR7le9EP2yAe o0hZxpfcRvM+VLaVXiJ+jn/nv/ZvKnLVsuI5aYdcpKdXNhGAcnpfwhLmU8gWYaqQZrQAAAA==
X-Change-Id: 20251202-inline-helpers-996f4db65e18
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=r/0+9qJswzrRb/+EdDwKidCVLUWK29vWT4K+wcArP6I=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpgd04KSDTy59pIFCvPyqmf0oiuMXWez7Ej7S0v
 Efk/14aHv6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaYHdOAAKCRAEWL7uWMY5
 RoepD/4hC0AzibWqTqtig41zWC+uqMM3eR2aWMM0i25I9KhiHYzJwp+gXTjm/sdMUtX+fmLdomD
 JOOtqTqJRgJb2M6ppRVbT6Zr16NDh2thgm6DmrBDyUDidDREkq6Ka3U57sAP8dr1LUsA4a4wOl1
 IGU4hI3u6+dqf4OaEBSnjjfLEErseNEYr090nMDDZ/uALAI68FtDhxcFDbUTcuzM5qUvAgQkEhb
 s1CRiaOYLsF5YUi+oVfF56c4X/ek8JBXcVe+oBqQQyBTdeE/twj8UzBksin0Kq5fvtOdgBXaJzi
 8mI9ffxQo2D4BrnbbBVi28EOVU0WJ31j8MKrthJHjeJKtuf7nLSMMOMcUD8wOqeB/kNXsMEHbR3
 jrhfVfvFXEqmLCU86/tLNr8sU9I4BYtjIwrjCEBwGQ9rdGzWcSE+BfVvQ8ECDNXhYSBNBramDs5
 GABnreeSJ/GWaIZajEcbzUy8pVe/IONoUyl5bwYcOTd+0Q7o13gGfv//GGGx5GzFqvu7E7WTwkd
 rJvBNgGJd8jgAI6H9e+h4K9C7POeRap4wWVkfVmisaVarpIVsNkkcvIb46ihFwBsHYSKbvEuPA3
 l6Br7+K+wySDSLflrojd8uUlpgesx82SSP1oAJb6ZVTP8iJuKc9sWSRchCqBGagigA03+NGfmuq VDWmoDGJBU6oFcg==
X-Mailer: b4 0.14.2
Message-ID: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
Subject: [PATCH v2 0/3] Inline helpers into Rust without full LTO
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Alice Ryhl <aliceryhl@google.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Currently the only way for Rust code to call a static inline function is
to go through a helper in rust/helpers/. This introduces performance
costs due to additional function calls and also clutters backtraces and
flame graphs with helper symbols.

To get rid of these helper symbols, provide functionality to inline
helpers into Rust using llvm-link. This option complements full LTO, by
being much cheaper and avoiding incompatibility with BTF.

I ran a microbenchmark showing the benefit of this. All the benchmark
does is call refcount_inc() in a loop. This was chosen since refcounting
is quite hot in Binder. The results are that Rust spends 6.35 ns per
call vs 5.73 ns per call in C. When enabling this option, the two
languages become equally fast, and disassembly confirms the exact same
machine code is used (in particular there is no call to
rust_helper_refcount_inc). Benchmarking Binder also results in an
improvement from this change.

This patch is complementary to:
https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Dropped merged patches.
- Generate two copies of helpers.bc, one for built-in and one for modules.
- Remove unused llvm-as tool.
- Add $(cmd_ld_single) to avoid breaking CONFIG_LTO builds (note that
  LTO does not happen over the language boundary, except for helpers).
- Improve Kconfig help message.
- Link to v1: https://lore.kernel.org/r/20251202-inline-helpers-v1-0-879dae33a66a@google.com

---
Gary Guo (3):
      kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
      rust: helpers: #define __rust_helper
      build: rust: provide an option to inline C helpers into Rust

 Makefile               |  3 ++-
 init/Kconfig           | 15 +++++++++++++++
 lib/Kconfig.debug      | 15 +++++++++++++++
 rust/Makefile          | 29 +++++++++++++++++++++++++----
 rust/exports.c         |  5 ++++-
 rust/helpers/helpers.c | 29 +++++++++++++++++++++++++++++
 scripts/Makefile.build |  7 ++++++-
 7 files changed, 96 insertions(+), 7 deletions(-)
---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20251202-inline-helpers-996f4db65e18

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

