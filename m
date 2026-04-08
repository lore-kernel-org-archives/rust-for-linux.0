Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4743890E7
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637149; cv=none; b=mAVivVR6FvXy+lW6cZzCpyap7nS7EykocVuvDFFa4Rvab+Go3IqDCyiwCvnUOhmQvYxapWMS6ivM7gJdh4pUaBLnSFI9zSR25rNATvq/SigAZC6CB1MjiBmZANSnR5XuO3msD8W1v1SaoRMHXw26z+Rj4W9eELVgybo+ZOW19YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637149; c=relaxed/simple;
	bh=wci7le9h1LpQXNgtXZg4XVYpmfUBKH6BCtl+hz78Lfw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GE9xywX3z2A1g7f/YLUPWPuSPvYl13rw8sqsjuBBGNRSy21K17VmQ6Llk2gwYJlVSdo0JH6gOqQKZmiBaf33fuKNiUvY1i+N2uqM4zeqf+RPznTcdHwKduWa8Qk5U34FCz/DZMJ2uMOyQp7VNtR94SniCf1gXe66Wjh1BGBUPNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OULdpTln; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OULdpTln"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43b9b8e3af6so5358576f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775637147; x=1776241947; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9Uj72E/5HEbuzpRNlEo97Kbz1MHWubhYMw6Gvh/728=;
        b=OULdpTlnVCDduBPlGExZWqEoTUjIBZPfWurYdiR/PDIB5aOHcO9lr1tt1xZltk1Nr+
         lIpq+sG2zyd/ds1BCMvm3uB/IxWjG0MWdQmX5Uk8ErYY+/xZmWRs46cwnEb3bByJA0rY
         i5Ezpp5KgGi9fKwfeN88JiPzVYMmdNjPCT+pvKg0zftzZkurCBKO6JAu2+1+zQRHWSl7
         sVFh07CZBjOcq/2hQSrcwFcLgn3m5MO/Atm254r4+EUHloi9ACg/Ne85GWBdCpO+9OY0
         14Z019iUsfsk47gL0kERWrym0ykz6bVnxivTUGdYAZb/mRt9ik4yasr4z7avvRfDLHas
         +gcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775637147; x=1776241947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9Uj72E/5HEbuzpRNlEo97Kbz1MHWubhYMw6Gvh/728=;
        b=A+FLDv9lv1OpibxxryGdeTMdS1CvGh2A6uITKCkxyGR+HtsRsISh1LyLMyKBcYpRSQ
         F7lxrZWHuuVLjUYBEjpVkUs9xp1JR+1XhaFXFmYiOLLjczArfO8Mq2ZTUjLT7FWXvN4Z
         tocyWJ10Yzu6qQwYH9c6o/iwotPpkeGKWbScmBgY/2wOmf810cEBF2aRsOSlvR4X6Lx3
         WHI0zic1GHoR2pdl8VCA5iTxqgvwLeQvAFgxy1T3EyQCVherlHO7GtgB56TLpq42Q+99
         nollTAAwEGKo5oSMsLhug4gHFzAraPuXW41rhuwXQNMQz24stW/l8k2vgAWZoxZwtuwb
         25cw==
X-Forwarded-Encrypted: i=1; AJvYcCWkJdak5kA8LE/n70pWYc6klqTxeVKNSpJXnCjNTbacKJsF0Ca5UHVHGNUq+dcGjjciOhwHpy8Pdcu6QwB13Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS2EY7+BLuigNq7nefIsI+nA1KSXmKMCA9alFnqBbzVowkVWeY
	XgG6krjkpbTnd4G3/qALrmk0BxfnX3sjNfkYj29C2UOZGraso7NjKESVHFTS5n1Hm6jZlfy6O2H
	SlbecmM7wQ6uTSIfNlA==
X-Received: from wroz12.prod.google.com ([2002:adf:f1cc:0:b0:439:b9ad:6599])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64e6:0:b0:43d:740:fb37 with SMTP id ffacd0b85a97d-43d292cd110mr29402509f8f.24.1775637146677;
 Wed, 08 Apr 2026 01:32:26 -0700 (PDT)
Date: Wed, 08 Apr 2026 08:32:16 +0000
In-Reply-To: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=846; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=wci7le9h1LpQXNgtXZg4XVYpmfUBKH6BCtl+hz78Lfw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp1hKWD5EjhG46W626xQ0DsRPJfdbtTLMTOQPst
 JQBJO27wEWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCadYSlgAKCRAEWL7uWMY5
 RncCD/4+9/eYG4RUgoLUxawTtLG28tjzL4U3sNr55odfflRChLodXfskJk8q/nWrws0Sx6FIfJZ
 Mec3cMW9K5S8ES71aiEhUh0phU/CILz63L4NboyQTxbN7+A5JRoOFNvg26SBqqGmy58Gx/pRFIS
 wodt75Fpt0aMTG2JK85WdhKXRs77Hemp5upqMbTTxsH/Kfwi0T9Hnn+GgCTedDVBhG4ydVUKgoV
 /+BuKyw73IIz0ZJMCaUcAhoRS/tM1n4IJipmQlV6F6pSNi6UdhQsAZONMYzZ4vLZaedy1OjE2m5
 BzeAKHUsiqOfog8IbHTB8FXmjDqawmhA+yD/v1XaVUFUJEyPNZPH4mC2m6JlxFqCpmK7w5DwSRy
 NDvnu0TLs3b3YRitQjAclC61vZTNsJcL8sfVeOj0frpqZPZ+yERyGFFWHtIN0K1IQ95HflAAgQ0
 DBa2u2mLiEotwCb9HcOdU6dQktBlu76PKxQi/SLp3S5ivtxbgNpg/Vmb/eodMEbpagl36VEMmT5
 OZtEBwuc9vGiNE4ugyEQsiOQctDaxnw6zxV4s5lxUuh2VIMhxK0cdw7TEvBZIiJ5ImKvhqVLSvo
 kBaDFAhXN1YIwExsDTI3Cr5YyuRjltAfivoS6KJzRYOek7oiqg9tQDOtmM4YGLimMZU93H5vaux IWMQUVBDgSic9vw==
X-Mailer: b4 0.14.3
Message-ID: <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com>
Subject: [PATCH v3 1/2] rust: kasan: KASAN+RUST requires clang
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

Kernel KASAN involves passing various llvm/gcc specific arguments to
the C and Rust compiler. Since these arguments differ between llvm and
gcc, it's not safe to mix an llvm-based rustc with a gcc build when
kasan is enabled.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 init/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/Kconfig b/init/Kconfig
index 444ce811ea67..1d41c7c5e986 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2179,6 +2179,7 @@ config RUST
 	depends on !CFI || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI
 	depends on !CALL_PADDING || RUSTC_VERSION >= 108100
+	depends on !KASAN || CC_IS_CLANG
 	depends on !KASAN_SW_TAGS
 	depends on !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >= 108300
 	help

-- 
2.53.0.1213.gd9a14994de-goog

