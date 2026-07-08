Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18B1392C52
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 08:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499178; cv=none; b=rf+myw5UIjgVfLGuaKnO/i3FbVR/8BC+ddc6g+x0iUKRK3zmiccwgMbETjbB/K5/XB4MDyMDjwKM0QrL6BKf8FiJsNKPoV8o29w9NBInqEe38tJWsYE511ltWqNfkPBIQLl3emkGzDYuN8NEKZBU8SA14OqrnCAHJO65hxQ99g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499178; c=relaxed/simple;
	bh=LjMlqvMgecGPg8wVROveeAGR3+uXyQO2X21W2PUKid8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgPXb52TzA7zTTYle1kq3Tu/JWXZ42InYkJ/IiP2nKA2baDSzZPaN5geOAL/eTPCkRXciK9/1ECyknP6BYRUs7tl64YljsZAV5BI4/Grc3sFKgevK7A2QuJyVGtWt2GHcHm0/eH5aAoqYDT4FUvX876J+5Pu8OFvod9Ikdr5kaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mr+tJTvC; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mr+tJTvC"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso4901245ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499174; x=1784103974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXAgQLPERGwooEzHznzvpg6SzocRRloWRn0CUVpxEzA=;
        b=mr+tJTvCSEpZAjAMreqNYfU8sQD2MO11buRCeIe5VDFEGjXWVwsbuM4HyBN+SqPycS
         zpN+teQ5bqF53tC8xpdFomD74Q7KMLMr2uW8cY5n8flGrN3cp4nJ9wBGdHSWFN00kxCw
         IytvhU3aQRt/v4yWLTSsXCLPDe/qjeHRQjr4gqE9uiuW1k2TS4U7wdnnjTYYIptpeB7S
         yYbajSFK7qa0BodCfq6wy0EXoU4zO55vpXvzvnYOssmA2t+HR94kCzpyjg4WDTaGEHiG
         t3lEcWDkL9tujlPkkPhnXVswb17mMNr1hS4nirol8N/AU3x8PJiwDu8+vqMMUMQSltRV
         QdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499174; x=1784103974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXAgQLPERGwooEzHznzvpg6SzocRRloWRn0CUVpxEzA=;
        b=KU+e02caGqli6hjaczZr96rlRVKydZ9B8eTy4YxZaaWaQ/LurrfFhTLoQHbfA+k7aS
         SCWYEb91NQLVPAtCpBa1WImxiTN1bS+UudYihgEruK6AccWJusu2E/G/RxuwR4t1lYbW
         C86V31VX2ycFL1Fs0oSEPMV+FhvOf1bWPznKsXoGI/I591ZH4zTURzHPEzw8W1wIrr85
         9YaHZckjnK9IJKa1AQVcfUA4q6ZhfxO2EMDIYRCpiNKYi8+uxtLT04r8gNJ3DGVcnAqb
         i/GvQRGEWM3KDM2E3eWuAkH2FFrM/yTDPsLyeXdIVtg/mcnVrUDJq/4IDwpI3cE09TZw
         dOFA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5R+5444KX9Umyb+BdSJB4sCuuXtTAisiakgL73OT1wZdyTQhDhnJbiq3lygF88oGk4W26G4cJB0zb6zt5OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGa68rdNfieHbbvlSvYtPxQlRccXkzslwhjCBB5pqbXjEdj7RR
	Y3VnnIoeKSgpDwCdp0DYGOJ2IKplLn12F3SGcxlP2E5i6w4P4uXN1zzO
X-Gm-Gg: AfdE7clPJ4P/zYETv34IcZosPwmmX37kBfePa4LiAUyUVhAACaPflr4gDQNtnNxbw3V
	uwr5fRCBqhmHlnMaLE4qhgNNGoVAW+zXYw/pq1oriJJpCYMVMYIm9bU4pMQ27SjvZUmo2KvYC0j
	gPSxnkPoopDzmujZfeM4N++FIoAnQPump+3N4hws4gf/HGqvMetHCT4ntQyxTHRU+aV+4mxg+M7
	+kTZep0v1pfbTE5pxIqF+UJ26KrZ66XWP8gQuRVdAFpxHkd5TtfMhCmlo0E4IamyV0XjDgwr3om
	y0zvZiSk8ChGlSuGYUU7FFGDxAev4yXJSofij+/mg9QX9vUZzGeRhiByM5IALZ32ikNboKlTcuP
	NoHZOSij3oCUUfJ+quuHZ6lnb7MMK3lbKywNv0aTjcEgQ5Tx305gEDVSQK+tcd7yZjAMYVNfD1O
	6o7xtt23r9aJtUD4C5gK5YG4L9QvnglzMRXYsaRl1dX/04yrkzMcmeV1wTtDeNCk8djg==
X-Received: by 2002:a05:6a21:9148:b0:3b3:f46:1eea with SMTP id adf61e73a8af0-3c0bcbe9c3fmr1852518637.7.1783499173930;
        Wed, 08 Jul 2026 01:26:13 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:26:13 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V17 5/7] rust: Make __udivdi3() and __umoddi3() panic
Date: Wed,  8 Jul 2026 13:54:52 +0530
Message-ID: <20260708082454.1254320-6-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708082454.1254320-1-mkchauras@gmail.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Link Mauve <linkmauve@linkmauve.fr>

The core crate currently depends on these two functions for i64/u64/
i128/u128/core::time::Duration formatting, but we shouldn’t use that in
the kernel so let’s panic if they are ever called.

This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
build on PPC32.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile             | 4 ++++
 rust/compiler_builtins.rs | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 17b2f329c13d..7aa8fcad4c43 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -677,6 +677,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashrti3 \
 		__ashlti3 __lshrti3
 endif
+ifdef CONFIG_PPC32
+	redirect-intrinsics += \
+		__udivdi3 __umoddi3
+endif
 
 ifdef CONFIG_MODVERSIONS
 cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index dd16c1dc899c..fc6b54636dd5 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
     __aeabi_uldivmod,
 });
 
+#[cfg(target_arch = "powerpc")]
+define_panicking_intrinsics!("`u64` division/modulo should not be used", {
+    __udivdi3,
+    __umoddi3,
+});
+
 // NOTE: if you are adding a new intrinsic here, you should also add it to
 // `redirect-intrinsics` in `rust/Makefile`.
-- 
2.55.0

