Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843187;
	b=SKYZ34KE2JtDBXvOzKu+wygUhhWpyDKfTHcg3bQvIDNYzXRQ1doke1tP2p+EUyI5mAlT
	 Ca4N8bHUYlNOnVW/oVxtDsYwG+FXbZryS/ojW1R5Wbk6aKMRRn7uwz51cBi2sjMlZOBYx
	 lnhf8MHWSmWlgoJQMa84zjkdZwFU2rs7ZNCaJsjCvxXzq6RBCsTqd8WjHhvQdcYFyGOLA
	 Ak/Q4SajvRaJPfjTKerS6O3f0xZzQ0f87vhjmFcmwMpYi0S5iMi5VGwpmMmslXLeTFsYb
	 rIdgtao/9q79qMumoMvikDQJ9opph8kbUApMsPGwhlzV6Nv1+Xu6x5IfNZX7+0kowrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ATA0RCqsuqMmSXCAjjT1HB7LWYQ+QvBN0eEjjs3jy80=;
	b=t97If9i3amMjPPk/9nUniV2Bf2BfnuRxNaUvLSIO/4LdxyyZUZ2oaJJv1sop70vF4bCQ
	 xdN0AxUKFGrA0zcnC8ttlRTyfCq0Hq8TdMnQLNmLs9ZyJgfoHqIRpu4HLUWt7MCFgkTNh
	 +wQvqeZHAP1ThPgxtMQAO9ylCjusRarG35XatJ+MGaxsEVL/iMs0B5tzpvgF3HvOeEl5K
	 9E6O9fpNbyfkoo//P7o/tdUT55avUEYHHS2DKnyVqWzWglgGJ0yAeSnWfCP0HmPYCC38r
	 vT2cXnH9j+P8F/e5RlZr9rULroMnwG+M/Pg9ckiHZ4zXVT/7yo44G9Xt7gtEOihMYJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bfrd9fgZ;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FECF606A328
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 01:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FECF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bfrd9fgZ
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-353804b591eso2610910eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Nov 2026 17:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793843186; x=1794447986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ATA0RCqsuqMmSXCAjjT1HB7LWYQ+QvBN0eEjjs3jy80=;
        b=bfrd9fgZy4LBHnQAHVc71JMJV8ryNmcC6xNxLsVu2wHE0ba8GqSQtLm0q54nSOVx3E
         ncXjltEpYpKSRWfzD4dqMhc3ymm3M1xmg4vSJl3JlnCha5HbYwJTZ+c5I2MHvBwHvAiz
         u7HPa3+NeD7ZluSt2XsmJ1VNALNHtZLRE6jGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793843186; x=1794447986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATA0RCqsuqMmSXCAjjT1HB7LWYQ+QvBN0eEjjs3jy80=;
        b=c+5Y0+lXb2sh3uUdNztaPXgsB8UouIlZnLHdh/8coQiLedmB7m+EzE69bHMU9hUsiZ
         4V1QWKzJZtn9xJKciRRe7iChu20A65xQaz+mi10Su+msbIQCnyj06FOD2qQb9Uh7GynS
         BjTXlbVDhEAmQ/bhrw5g8Dtdg0de1FtBuvZPZXYw6yFugn8J4pstl2RZcKtsYCyZHTzI
         /s++kxBZwoNOwnfz37bIlcGBLXTzLCHOXlsmkmiK50Q2oxNcTcyXA6j7oW4YwzwDTBwX
         uLoywrFObZyMiBgWIfzMSuiTrEHSMh7eIkzR+l1ZSxb68ZbKpZNqhr7vCOm/MOnoJK2T
         lXZA==
X-Forwarded-Encrypted: i=1; AKwUvBxBZJw7gY8jCGL2py+z4WdBK4JvjrrFDLcM6KYMuRrRe/KxrGakLzBt1z300t4jmSLr8Xi7HjY1TR76OP3ExQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+AEQno1N8dt2xXPmispgcWz0OaR4Fd8zbgbJ99HOYgy54fbbmZ
	56pQbiMCNw2DTqVgcNy6kNfSUjIWvmM3ZY2rgrKsn/OWc3SGGQqr4ntVwr/PTJG/Dw==
X-Gm-Gg: AYBFou17ePzvuMK27S4+N2PZg+pjWlddSLue5IU1EJbYJn3sccswJnzMCkAz0oBv9Kp
	BGfTShr3xVZfXxLF8dAKuiYFPDgLvXvPun5FbQHRSGSnq6B5SOYGAfOPb4kEh2oaqGcyLThKE82
	2uiGQYGUpb7JkZ+4dnTA6OxVAF1OgAiejHqbVlzvqgpjOwJURVv6CPREVnJrFvdPkn3+JL3ldxi
	cY9MeQ/pN1hQLJTfG3mwAE6MBOAoMKu9naS17kJx8L0npQFw8r4JpGDHRDCm0lQGt/E1a83PNP8
	4CLcBMVB13nrAdQP0ORYLztPWD1o0D/yRaN4RO6GRpERm1h0BGVaRnwQ6AEcTq0oOwbPFAKVSSD
	k7GaVhWlJovXxXJeeXq3FLFmo1lHlNK5OsLPZH8mFVa0xHu1jiVNwtYSSKHHtrB43TYoQJJovvC
	9kZQq0H6w4a59Ken3ALAg1pMfQ40kOs6K3lRHypLE3fHxInz/dG7bS31n9riXhm8zjBa2pkU6Ck
	MSmThjt0E+bMlqagPh8DOW0dKsqeQ6OXKE1fzxJB3V8w/UelxAq6XR8H3xM2KI4PD6kisxAgauC
	7aVuk1iXlzgyjkhpaJzIWoYM+saQ4CW8hevM+r5T0kZCUseNn0kVPvRZBWJdJ6bKJSU4yPNNhOI
	LpaTv8IxdPA30wQ==
X-Received: by 2002:a05:7300:ae18:b0:369:f035:661 with SMTP id 5a478bee46e88-36a42389027mr22926230eec.15.1793843186083;
        Wed, 04 Nov 2026 17:46:26 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:e268:adf5:686b:4655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm15294011eec.27.2026.11.04.17.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:46:24 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Han Wang <nesthanwang@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Bill Wendling <morbo@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
Date: Wed,  4 Nov 2026 17:45:55 -0800
Message-ID: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Han Wang <nesthanwang@google.com>

AutoFDO profiles are commonly collected on one kernel revision and
reused across subsequent commits or stable merges before a fresh
profile is generated. While AutoFDO uses function-relative line
numbers to tolerate edits above a function, adding or removing lines
inside a function (or an inlined helper) shifts all subsequent
relative line offsets within that function. Without stale profile
salvaging, shifted callsites fail to match their nested inlinee
profiles in SampleProfileLoader (dropping profile-guided inlining for
those callees) and basic block sample counts are misattributed to the
wrong instructions, degrading branch probability estimation and
machine function splitting.

Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
since LLVM 17) for C, Rust, and ThinLTO builds when
CLANG_AUTOFDO_PROFILE is specified. This instructs SampleProfileMatcher
to use lexical callsite anchors within functions to fuzzy-match and
remap shifted line offsets when querying the profile.

While -salvage-stale-profile is not enabled by default in LLVM due to
the minor compile-time/memory cost of sequence-matching callsite
anchors (which is unnecessary when profiles are freshly generated on
the exact commit being built) and the heuristic nature of fuzzy
matching on heavily rewritten functions, enabling it makes sense for
the kernel: hardware PMU profiles are rarely regenerated on every
commit, and anchoring on callsite names is strictly more resilient
than blind line-offset lookup when functions are edited.

As a side benefit, remapping shifted line offsets also avoids feeding
mismatched weights from stale profiles into MIRProfileLoader's flow
inference solver (applyFlowInference), working around a compiler bug
[1] where a small intra-function line shift (such as in
__vm_normal_page() in mm/memory.c) can cause applyFlowInference to
spend 30+ minutes compiling unmap_page_range().

Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [1]
Signed-off-by: Han Wang <nesthanwang@google.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Much of the commit-message justification here is AI-generated. Sorry!
:( Folks who know better, feel free to call bullshit.

Honestly, this patch came about because of AI analysis compiles taking
30 minutes to run (see the clang bug [1]). It seems to work around the
problem. Obviously, we should fix the compiler. That being said, upon
further analysis it seemed like adding this flag was beneficial
anyway, so I'm posting it upstream. If folks disagree, we can simply
drop this patch.

 scripts/Makefile.autofdo | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 57a3aba6ffc2..3b1e65a13ffa 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -13,13 +13,16 @@ endif
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+  CFLAGS_AUTOFDO_CLANG += -mllvm -salvage-stale-profile
   RUSTFLAGS_AUTOFDO_CLANG += -Zprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
   RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-split-machine-functions
+  RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-salvage-stale-profile
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
   ifdef CLANG_AUTOFDO_PROFILE
     KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
+    KBUILD_LDFLAGS += --mllvm=-salvage-stale-profile
   endif
   KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
   KBUILD_LDFLAGS += $(call ld-option,-plugin-opt=-function-splitting=all,-plugin-opt=-split-machine-functions)
-- 
2.56.0.455.g6c5a503b38-goog

