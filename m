Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D73ACA48
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774958981; cv=none; b=kNuz+RPdCIVh9pCrEQhwSBGgq1Pmczwpo2CA86Ho9cUNKHp/F+rZ9UeYTBlQuEp7wCHb0claBHOdaad2F4DkikoKq2S6YFEdzml/PP6XBYMpEMoF4Zz6mcafOACD+orwsXohaRnVyafZu3PjNuOQ0Ub7gGUrz4cq4TnK38ZfExE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774958981; c=relaxed/simple;
	bh=wV4enVuhg3e84+4NenFbA40n2JgAal9ACwmd/KfHdgg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Z9WPPT/GdFQXBeZcekT4zOL/xV/5uRFvCTWZ+7P6+WIp+PaySREaLA/ZOoulfMGng4XbfENktFrhZ75TP7b+BgfgXBZNsZFvfHKJLSX+UIlftUvCtAH50SXG7s3+c+dsWa2O+a4kpxhQWP+cHoTqP/j4Xxb6+BG3f8xc6WevOlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nKYRqt/P; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nKYRqt/P"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so51631225e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 05:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774958978; x=1775563778; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cke73iuOs7NesM44ZZUjsyGg5Z47ORqSakwVW7CmRSQ=;
        b=nKYRqt/PBCsMpZ/dyVre3jM/C//xMY4qgcH73QQQHLsR92dEsSiA/XkELETX20ifGm
         Ixb8AMc+4tUAiFKXRzxegu8pPBvvwYMpxsdaKHa+lQGHdI57GjiSi/DvP8THdGBzP37s
         vfA3abAp1tYO2fYZO3g+doEVbAJD2m+UyOfcvd8IdBCzKN8lOKBKVMWi7wM7rwEUBrwN
         1XRKka82M7bPx2qnCp+2XmDBURyGDxTJEPSvQaZGNWSdXmP/j+ODAyC2cX9kTmZY68dk
         TyxOHZFlzJtZjQx6bAle7ah0nMZIo6d1yi8NDGPaUocLVtsEV5RJHgw0eeHMOFFvLxcb
         E3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774958978; x=1775563778;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cke73iuOs7NesM44ZZUjsyGg5Z47ORqSakwVW7CmRSQ=;
        b=lDgpfmopMGH5wp2/DaUnfLAmidQqD8EQyD0rUChc0xC9YUIjCYNHVxkntYG8DPnk1o
         gT+t3dznM8swBH/MNXxIaucq0rq+HrbB7Fhg/OO7Q9fBE3TFm5i6yq6Ed4ssb+x9Kjdh
         F7idSWzyZHmF9FIvRPm4O7lb7acb6fU/m6siFjsjyIUFJYly7LequUR37NM7OSO8GIle
         1nuI81mi7hsQaI1UDzJBdl1Pwu8pN5zzxLcGcBad0GyhshsNfKhUrqW3ZFmyAyRLN9di
         aL/9o9UGgV0a/5vdeGwYRs/ir1GAFKBRmSWR6gl0r33x4+CF0Ewk4jk9zpUU/FqLx4ja
         T95w==
X-Forwarded-Encrypted: i=1; AJvYcCW9ODTEv1q2PaB6tb12tbpE227xbDiUgxoK84/iYXdQ7h1DSPoQGl2DB7E4uyl49PF272GKpSXobY2RoqPqqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2N/QyYlJzu0cejZgmDjbw/FRFPT44wj/3w9XhTm8KjjDuCGFT
	mfu+k42kL4FOJ6oG7uEwuwqLyv+GIPGlat106NLCy4NyfAzSEk1nFeqtj9r2uoqUbIFqea3jkvh
	x5XOSF6FdTg60RVyVRA==
X-Received: from wmri9-n1.prod.google.com ([2002:a05:600c:8a09:10b0:487:3881:c015])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4744:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-48727d5a2e4mr269041575e9.7.1774958977458;
 Tue, 31 Mar 2026 05:09:37 -0700 (PDT)
Date: Tue, 31 Mar 2026 12:09:29 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHi5y2kC/32Nyw6CMBBFf4XM2jG1DZC48j8Mi7FMS31Q0ymoI
 fy7gHuXJzn33AmEU2CBYzFB4jFIiP0CeleA7aj3jKFdGLTSlTK6xBsJ9ZgGySgvzOQFbUnOOaO
 4MgTL8JnYhfcWPTc/luFyZZvX0mp0QXJMn+11PKze34PxgArr1lBdlVRropOP0d95b+MDmnmev +wocw3HAAAA
X-Change-Id: 20260325-kasan-rust-sw-tags-c5afff30e63a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=wV4enVuhg3e84+4NenFbA40n2JgAal9ACwmd/KfHdgg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpy7l8gkHzzw0C5zlq6/o1yTp6OvHyYxyITfBSp
 3Mx3fxF3miJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacu5fAAKCRAEWL7uWMY5
 RtQTD/9E4XgE76LxRFvnnbVAxdxxiM1b2x5Rc9fMvssYagCgOu8J/ljfnb/mhbuotjCDMvJgjg5
 ctqh6i7cZ9EH3yO+gEdLCVeLVUrXgW4Sz69mpcBqIVc6zJkKdmAebXyMU3jctMecANvUPfTgg4C
 2h5asg58AjfWiyUJeXN5GWaaqocfzVdcL4/6R+d73UxXpzu6gSbsZzyU6QEbY1iTfgY0XMDJzoS
 6gZmY3bLAgt0YzytA2Y89HtbFwZgt7GED9jrrWkIz4eDpNOgUY8eu/VBmLmP9shlMK0wNwh/uFT
 MxaVLUtIvYBGv2AF9Gmjk4bHKPE7AWrAGK/r+Z11NL509o4VRK4IWOop+Gk2S/JyEq9FPIq5GLZ
 GtGP1zG0zCGsblZKBwWV6U09JxOt7tJlQ5RkNqepV4kDya/+mkD0jAiyQZAniydedd6LN1DXSNs
 oiFPU7i4UB+S6+54dOtdRolMSc9FTY7nNAf3DGk+a5eT8TJe/G9rjq1DNYsvpT8HTffw4yRO8Vv
 DGSqYyKVDJhIeLWHepSzgWOj+HE/DsEd3AGXCuLC/Eh3MQIL+QmB2PO1oh+4xoempps66VIH+hz
 CnXWvI/O1GlJB6K5AQ7BhOJ2aRKgFqPHEgdTWQvxoNEI98JmTcWBgGU0W+FmyRPgionenS7dwTX hDqp63RhbLPjSJA==
X-Mailer: b4 0.14.3
Message-ID: <20260331-kasan-rust-sw-tags-v2-1-f6765e3e1a2f@google.com>
Subject: [PATCH v2] rust: kasan: add support for Software Tag-Based KASAN
From: Alice Ryhl <aliceryhl@google.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This adds support for Software Tag-Based KASAN (KASAN_SW_TAGS) when
CONFIG_RUST is enabled. This requires that rustc includes support for
the kernel-hwaddress sanitizer, which is available since 1.96.0 [1].

Unlike with clang, we need to pass -Zsanitizer-recover in addition to
-Zsanitizer because the option is not implied automatically.

Link: https://github.com/rust-lang/rust/pull/153049 [1]
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Drop the first patch for -Zsanitizer-recover, and mention why in
  commit message for remaining patch.
- Pick up tags.
- Link to v1: https://lore.kernel.org/r/20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com
---
 init/Kconfig           | 2 +-
 scripts/Makefile.kasan | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 444ce811ea67..545cbe889a52 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2179,7 +2179,7 @@ config RUST
 	depends on !CFI || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI
 	depends on !CALL_PADDING || RUSTC_VERSION >= 108100
-	depends on !KASAN_SW_TAGS
+	depends on !KASAN_SW_TAGS || RUSTC_VERSION >= 109600
 	depends on !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >= 108300
 	help
 	  Enables Rust support in the kernel.
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 0ba2aac3b8dc..91504e81247a 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -71,8 +71,6 @@ ifdef CONFIG_KASAN_SW_TAGS
 
 CFLAGS_KASAN := -fsanitize=kernel-hwaddress
 
-# This sets flags that will enable SW_TAGS KASAN once enabled in Rust. These
-# will not work today, and is guarded against in dependencies for CONFIG_RUST.
 RUSTFLAGS_KASAN := -Zsanitizer=kernel-hwaddress \
 		   -Zsanitizer-recover=kernel-hwaddress
 

---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260325-kasan-rust-sw-tags-c5afff30e63a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

