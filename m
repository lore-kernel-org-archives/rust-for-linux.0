Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993935;
	b=ihu6HEEgjLjtdqAVHKge9kq1FaNS06YSX+BwMZWrJ4iYanQ+RXB7cr31xPUuo5r8bSZJ
	 4Tu68miVC7o/i18w9LQs2MdwYR8bAE7saYKvqezxpk/vtYdvIE10XSV+Wk7XZnacY8AFr
	 Yxp1ij/qDKw/rpNFQ2F5f8jEziEtSDNJQrM25X0Cjnp8aNZgc4JJZ5lEcOQ4gRcEO+B2E
	 CI6mJgZhu2rFDsPtp2hQqYacJJLGTtOPjwcP+LSzrBN1JKQT4K3XOYydRD9Kr1LFzcqcw
	 tvOaVUWmXu25EF2XNU2J4yBHoiV47+Xf0zzY43xp3gIBo0+1c9mcYJjDVAm+uV1Xnjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iQl8YGiFsFcU441hb/5cUGvukVssclT4Jhbsc8PIwH8=;
	b=32VGJT2wSCnpc67Qt9O6X0lyANGrTeSaoEK0hLVciHdwUGu009cqUKYutkXE3MzYCMXH
	 dmKfG4pRPd8XZKID3qATS1TyZ+kU4/fMAYppOSW/ExsV/7c0mOE/DFJ43cw3Ps65/WvxW
	 UcnrPOcHELnoBF6D3yV8svzFHpTfjnJLIUz9DmQlziPTEsYTLUoHBnEh1jpQsdPMW0uPx
	 3y/+w3TsjCJWNJFuFKNO6u7wV2tdcGLMfwaueg+TrlZStSb+cxmjDgmplvcsHl0B/hFyt
	 jTz1lBkuLpbCF/17Nme+/Zju48ER6PFjxfyrUEoCB3vEK6FI65qUV2694cIh8Kent/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kAB6s67+;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8DD606A32C
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 19:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D8DD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kAB6s67+
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3704d30b84fso675697eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 11:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793993933; x=1794598733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iQl8YGiFsFcU441hb/5cUGvukVssclT4Jhbsc8PIwH8=;
        b=kAB6s67+ZWFGloz0/fsmsPCRV4nic5sD+Uf2lhfDSYSNL4SzzLMrHSy6EpEaldojVF
         wIYmFjeJZeVlq/dNwymHGYiQw8MkfGpYYCmnvLIIWBxYCLk5mIoX7g00DDNgOJVmMa3b
         PmhHCiNB1kITt/GvsFzYXKMzWBgLZxuIvWUYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993933; x=1794598733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQl8YGiFsFcU441hb/5cUGvukVssclT4Jhbsc8PIwH8=;
        b=JUVUog4LN62Cp3wB5sMJAud04KwdIYpLMQilW3XGYTh/mqEcjjr9Uz3oKXl0en5xID
         YEIWmt9eD4UcLnoWNbnqoI+VPtntEXM8yGBVrbyJTLmiFbhorz8JU7zr3mrJSkGjlAiA
         PlXpFLqUfHl77hOAtGX3xADZ5l/MwEcBiDm7EShvBVfSgy4S9j2fc1asz1TSpvqr1snA
         Js6ympmL8cxyG22fVan7UTgoPOztHy/QshJt1OOcRch4vqQSX6/d7hdVP2zZjZyd/u9B
         CpkY6/ixSTd6XDB6BqJkSW+zF79mXSi5S/5njUgIWf+pRCOhfAhoMwgKxEr5x/LtPXNc
         Yb8w==
X-Forwarded-Encrypted: i=1; AL+hErELWJjhRfvw1r8Mi3eInk7pLSERVmFZ/BWsuTHKNzG6GZ6wb/nmedqGBGbmNWZMcwQlYCkPUwYjcc0qjG0OMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z97YZ7ryVdn2xkHncv5K6dyHGZsvjv4s3Mlikp68yffbiVBh9it
	UvFwng/WREyBWzT9Zr6D8+3yLwTmsTd/qOmEDAF5yYKlC6+Mna5qWHQVgZ2hi2bpBA==
X-Gm-Gg: AYBFou0KyZY5TSl4uRnSUvqgiTuBCq+2h7SdeEX1J4wlNphr/0buvHlS7IrX2j43V25
	mdYhz66TUKquwYRlBoUguN0fBcG3MuB3tC8zc0FvoaW5RCm3OiTubNrCq+BglF0kDDt2yJJpI5l
	cqBaahpO9o62Ocay6uq0G8B2qr/RXcBui0XJCvOt5kfDIRX3QRpYuGMAgiRwVHCqeqf/Lqm6Qcc
	CPjbt3abc+zaMOUX3BlUhYpUHuZO2F78O5wCojkS1qIx5BwtOBo7AvHcRvyXoomaY2UV27RlC/u
	F38p3IfImcICLpPkpsd/HrrdOEKS7lCD6QmdLdehF7+BcYLSWL7Jd+GC9gEizaY5MuMRuDkVSOU
	OITvT9bHw5vUp3cqTI4fCly2T636hOATnZgARffTl7kdG9MwyO7gppFkTY8u7fHBAnYH3t5UU/j
	4yojnpvhEdd61leZV1Avk4NifgfK2utyX15jDqFTr2ykyqU1mzmS447N4IKMUKy/4mDTjhKm6JN
	mak1hj4zEZE8fDNQOs10GEPEX6jZexAa4IyO0bZaD5aJLsHShO7cpfbjn1sBY36s7PemRpcY1Gr
	44j2QPp5+EKzCemgpS9YkZAgczNQIYWbdp875iiDF9Tn6miS1snYwqRYHXKFRthiU2ZqZqNAtO0
	LVrPQRMHcOArFaw==
X-Received: by 2002:a05:7301:fc83:b0:36c:b1a9:542 with SMTP id 5a478bee46e88-36f75d21bd8mr4376444eec.29.1793993933018;
        Fri, 06 Nov 2026 11:38:53 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:57b2:a393:143e:afa7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651c57asm9045755eec.2.2026.11.06.11.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:38:52 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Yabin Cui <yabinc@google.com>,
	Han Wang <nesthanwang@google.com>,
	Nilanjana Basu <nilanjana.basu87@gmail.com>,
	Snehasish Kumar <snehasishk@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
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
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
Date: Fri,  6 Nov 2026 11:38:01 -0800
Message-ID: <20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
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

Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
automatically passes -mllvm -sample-profile-use-profi whenever
-fprofile-sample-use is specified, enabling LLVM's flow-based profile
inference algorithm (Profi) by default.

However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
flow-sensitive discriminators (FS-AFDO), and Profi has known issues with
FS-AFDO that degrade runtime performance compared to LLVM's original
profile propagation algorithm. In addition, Profi's min-cost max-flow
solver (applyFlowInference) can hit pathological compile times (30+
minutes or hangs) on certain kernel control-flow graphs when profiles
drift slightly or when combined with GCOV [3].

Pass -fno-sample-profile-use-profi to disable Profi and restore the
original profile propagation behavior that kernel AutoFDO was tested
with. Guard the flag with clang-min-version 210000 since it was
introduced in Clang 21 alongside the default change, whereas
CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
used to probe for the flag because cc-option invokes Clang with -Werror
but without -fprofile-sample-use, causing Clang to fail the probe with
-Werror,-Wunused-command-line-argument.

Although SampleProfileUseProfi currently defaults to false in the LLVM
backend and is only enabled by the Clang driver, explicitly pass
-Cllvm-args=-sample-profile-use-profi=false in RUSTFLAGS_AUTOFDO_CLANG
and --mllvm=-sample-profile-use-profi=false in KBUILD_LDFLAGS as well so
that C, Rust, and ThinLTO flags remain consistent even if rustc or LLVM
defaults change in the future. Unlike the Clang driver flag
-fno-sample-profile-use-profi (added in Clang 21), the underlying LLVM
-sample-profile-use-profi option was introduced in LLVM 14, which
predates the LLVM 17+ requirement of CONFIG_AUTOFDO_CLANG, so no version
checks are needed for the Rust or linker flags.

Cc: stable@vger.kernel.org
Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
Suggested-by: Rong Xu <xur@google.com>
Reviewed-by: Rong Xu <xur@google.com>
Reviewed-by: Snehasish Kumar <snehasishk@google.com>
Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef25522aa17c2a71003 [1]
Link: https://lore.kernel.org/r/CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com [2]
Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
v1: https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid

Changes in v2:
- Explicitly disable Profi in RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS
  as well (Rong Xu, Nick Desaulniers)

 scripts/Makefile.autofdo | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 57a3aba6ffc2..55fda66ad960 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -13,13 +13,16 @@ endif
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+  CFLAGS_AUTOFDO_CLANG += $(if $(call clang-min-version,210000),-fno-sample-profile-use-profi)
   RUSTFLAGS_AUTOFDO_CLANG += -Zprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
   RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-split-machine-functions
+  RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-sample-profile-use-profi=false
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
   ifdef CLANG_AUTOFDO_PROFILE
     KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
+    KBUILD_LDFLAGS += --mllvm=-sample-profile-use-profi=false
   endif
   KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
   KBUILD_LDFLAGS += $(call ld-option,-plugin-opt=-function-splitting=all,-plugin-opt=-split-machine-functions)
-- 
2.56.0.455.g6c5a503b38-goog

