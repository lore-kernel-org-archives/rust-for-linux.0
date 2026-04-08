Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4183A641D
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637151; cv=none; b=DdkM+WYGsmCzPRict3Ozku2hxasVC4KtnP/BBxwFmuty/6dqk3ltfiVKuvau2JkP7p+jqsMfabbI/pgb7vLgBMUpcm8Uld5CorjWIvgGQX5HyMxFm/OgKFhiniEJGlQOBAoioNbdP8neXDCStWnoadjGJmBZ38q/cQUEf5uqwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637151; c=relaxed/simple;
	bh=tk6y7TOYIWgQW/FpQmv39FCi1vkOuWkk3oQ6GYLat74=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hp4PNcixlQqqUF5RJMAwkG2s3RmqsTQtQK8zqzUWATE+o+85YLPzAVUh4J3ejLFMoIFadpIeAbgqzx+kC6kTHGrnJBFgBnO5XzWhO6zyAl7oPDmBi0ToQ/C/tGvAuSx6oQ4QZelc5UDTNH2uC9PtDpRyKQcfRim5GjvkDHOhxiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j4Hcun2J; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j4Hcun2J"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-66f1e24535eso2709292a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 01:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775637148; x=1776241948; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb2UcNuzPdKbHPpFl5h3svrVmsdCd+TIp33nVOmo8A8=;
        b=j4Hcun2JItdUaHBQ+xj+s2s9pwQ6g2OxRloTY/wRViLB7RKRPCBwaUpZSPrRN1E5VI
         DK/EKBIudF4v4gAqk/Hhi68Q7F2C80JdRrSQEoLsoRcspgdouf1S0C5g1hRs9+cobaEI
         H3wESzZDGFVIrNU/Cs+vEKZLchWAwCzVtksu1mzAHBgEhr0tNnGXw51fCJXJ/2xgqqX6
         4YOEvakC0OHNEBUlDmvJQ7arcEIGEx0tT6Sm1UtWseqIdPRSoGQPZhIau27E22ub/qWy
         /XtpsmrBkRXuvOFoFkUbLtxjT3OAlks7kxaOPwufpfobKry3JF+EIy0xQmM6CykCeSCo
         cO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775637148; x=1776241948;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb2UcNuzPdKbHPpFl5h3svrVmsdCd+TIp33nVOmo8A8=;
        b=ltqQnPe6IopHHWX/M2sRaTrU5vcFSWjwZDn5/NUTqrLNrlwM3USwdgoOhYLW04+U4Q
         cKipa6FBTpwB3GuWx8ib1jXEVhN2mLaQ3fSVEeOvOxoRPGW+IkG27z1Wpb5HSshwQmkL
         EITK8zAUESL+hPOiHtaJOji3xorJbDeSJ6kPf1gmPwi53/fK49P5QbPYA4iyFiDBwiIx
         xtmEPKtFF3yyq/o7OGRVwE4AcIp+mcKdZBw/td11q5wLLFrZwXSkB3rK+75cWjOMLuws
         5OS0IrZgBVmQfMKo8vJHGqSDhjr1V2QqrPDwl75Fqa3iCdMYCW69SPfici7B5HZKu+cj
         VcMw==
X-Forwarded-Encrypted: i=1; AJvYcCVPT/YB5PqV76qXWVTGsCAgGiIcE8Hhfx5XOPOF2WFYYVUMluxcJHx8vrRYEYavMWF1VbWvM/5pM+WUzM7Ehw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzucQdsY+VFdLlreNWVf/hmcPffAiUGbYqasaMe1szpDQpedsxs
	WvW8g1RjR2e9KwzHQGkHEUFG/ZvoxcseevkWhDOz/7jXVQiS5z+qi3rZ0DQQuVxYEzXKogeUvrQ
	jm6D0Tt8MKpxOxpryFQ==
X-Received: from edxi26.prod.google.com ([2002:a05:6402:55a:b0:66f:7148:b18d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a0c6:b0:66f:2fff:683a with SMTP id 4fb4d7f45d1cf-66f2fff699cmr3538857a12.4.1775637148233;
 Wed, 08 Apr 2026 01:32:28 -0700 (PDT)
Date: Wed, 08 Apr 2026 08:32:17 +0000
In-Reply-To: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=tk6y7TOYIWgQW/FpQmv39FCi1vkOuWkk3oQ6GYLat74=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp1hKWBPurIEDd6Tqbcel2S/jJm3uXAXZVnBj1G
 6dZYyL7LSmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCadYSlgAKCRAEWL7uWMY5
 RlexD/926trzJjwCHzQ2mRKzubMdpJQy51hNXt0AgxdrcM9hImFJUya1SAz+v2uLxSpCBAECHd9
 6CBekT9oWOAlW5SIq5rTjRd1SlFpdnuHn2gOsQBf6C/yPogtZelp9CpzyoefAp1cvg6wbtUw8Q/
 opVkOeAGQk+QNknhWNkuM4D6AMs7Ff2sLNDRzefwbI5JennszZX7QAsXghyG2e7c3GmTUrlcikn
 GT3qqtQJQtGvmCxjFYR+wkoLRXWhQTSZ6U+Oiy062BQ7rk3KC1C9mPFO9y+6aGyu+VgY2b9U7YE
 fbwzzPXUN5BAr32HPosw3DUgdxJ3+IyPJJo4ieGqO3GLE60FaXaihUl/ZNzvtd+2kuditKsF8nx
 zWTuirIQL2ibKlS7ALpHTLTOQ3gMRfdt543PddhOQYSaUHM1Cme7m8CJ07iNWZt0rNsA1dLF5BA
 u5pPhrR76opAqAlfkM8XEE8uz52nWe6iRi03ISyJFTurJk+LRAZVHjAzBwBJeKcosGgek9oiIw8
 +7dMzdErbr47x6AC1LHYvAKWme2syt1C1mj4TM29UR+68B/hHfwNkIiqaUS2PqFdRovkD0a1eSh
 xIRfTPgDQOpWihhAbB14V0rpr+1LpSlofseFiUeWfeXSfnTns+aoGSezhvsk3+x+nlDta9yLFLh jqrpEzJmCbr6USQ==
X-Mailer: b4 0.14.3
Message-ID: <20260408-kasan-rust-sw-tags-v3-2-e07964d14363@google.com>
Subject: [PATCH v3 2/2] rust: kasan: add support for Software Tag-Based KASAN
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

The kasan makefile uses different names for the flags depending on
whether CC is clang or gcc, but as we require that CC is clang when
using KASAN, we do not need to try to handle mixed gcc/llvm builds when
Rust is enabled.

Link: https://github.com/rust-lang/rust/pull/153049 [1]
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 init/Kconfig           | 2 +-
 scripts/Makefile.kasan | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 1d41c7c5e986..d2edb1dbd2f2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2180,7 +2180,7 @@ config RUST
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI
 	depends on !CALL_PADDING || RUSTC_VERSION >= 108100
 	depends on !KASAN || CC_IS_CLANG
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
 

-- 
2.53.0.1213.gd9a14994de-goog

