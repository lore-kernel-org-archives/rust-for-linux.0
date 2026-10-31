Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416090;
	b=Bf7Hok94bPtjjPaV7LeqfvP+1d40vXSLUVSmQDY1ng11odm+vw8bvAGHOk/+RfvaQWOF
	 DR10ftsEGy7mZqt04WKScBXwbKz3KPoV55OC+10ZG8SCAjai3phcmJGnaq6k1xx4Rf1Hx
	 XpZ8xgh5OiiOa/B9z4VJyuBzB/C/+C6LYpa1W5y9wgRx19OVK46E9PfI6RtTY72Cmx1JK
	 mTYdarUpW2m9cLkSEieox3LNyLQPkPxTUp7HidixQ8415VUCxRegJdQHyFZJDiE8dAG2h
	 WZdLFo/Vjsh3D2geMpbM5Gx+nunGKOAOstPhd63v3CW4s+U/wW9EpEoNeAbBq5e2jnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=f5aloOxgBcfJJK8SvXENQRlRRIiOwSu/Xe/rRaruUWM=;
	b=x2t5axJiZQQUbwegUglGrhR78EeDHnco2yY2H/UInYor9ssc624afSb/FnaXVg0+E/ii
	 eF1HjYgTnePMVJZyVo5aomP8A0qAXTEh8z19iDWYxU8r1tStQmJkrfQxDO6YpmysIK6i0
	 tR9hLWx71zVYMvVvaarH23wyWh8wR07yFxJ1PS0iGxG2xvLS4rmujyh4Ift8aSzVU6x53
	 Q0UdTGGnKyt0Wm2UEuKoPrRmtZXidvhhMjWNOfV1ymuQPhUrtvuofXqyicKMMT1qvMPNG
	 v0/igrC41fqbJnGB3SYtQl140l+KZmgM6bjfnJUN7Df3HlNCLrWorT1eakQ01aIuhXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PR1nKxpi;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C97606A31D
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 03:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C97606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PR1nKxpi
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so1345009b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 20:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793416089; x=1794020889; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5aloOxgBcfJJK8SvXENQRlRRIiOwSu/Xe/rRaruUWM=;
        b=PR1nKxpik6V79K8q/LNhpRQ378eU2tznOaZY+s3r8sZKIvt8BulNk73ToJPdUdYGXl
         dOk8JZKtI2RgGYfrMH0NE1UstYE+cb8Dp1hlUxXV4rM+NofrDb1Cmnh2W+p6ckEM4Nps
         iXPB29uWC+QqEwQvEYj0C50SdGFtMW2Kerfdu9l9kpYRKiBK6AQNMzGt4n01Op6smPla
         dk/x40lhcjPC6/XjCBqyN6DaDkwbZLJjiZ7Zd5pCFUAMmHBngOzO0NaBvxvRW31zPoIo
         IaQ9Z5wHilqcYGEVS3tUZYYtUpy3wrMEiZ8IVR+FQzDwDqYjTZ9IUaVhEOFOniruPdJP
         yE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416089; x=1794020889;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5aloOxgBcfJJK8SvXENQRlRRIiOwSu/Xe/rRaruUWM=;
        b=yHg3wwur2Go3Xx1tlXnDkMFicfb3jSFQaCVhK2FayY/kjdnKEKM/6EyJZDCOn4cdqQ
         hdc1uk2pq3yLaDzj8cCQ/tY3KmXr4HCvINhy7Fp9S95zU3aeaH5J0VMuONboof6KQDU8
         CNYy8R7bgUWt2bXpZdW7koiihwA2w7BjWK9M2Woksv+7n2zxLbZnep0sgq1DQdLkDFgT
         7m4yw9jGGUCbPCdEt3EqAHVU+9dNYcd4y5cz2EVeJdcj1f5rOQxyd8mPbC7/IyYaSmOn
         GxUDzbAk4rz88Ko3GUJ/ijGYlFIklkoS64Bi4yiVw05ZMkd4cNI0WBvL9GKurrMBA7fS
         8Aig==
X-Forwarded-Encrypted: i=1; AKwUvBxNWaGkvSActa1U6IFmDmfA6+dBOm6OtZD1f//s8oq8qCoDZZKO+ITB9AXg7A2lWtD3RzZHWUuFZ6kThBNFjg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJG7m3Us7ffxvHXai6zTh28qaomlN+ZBXmj137KKO0zebHTqRJU
	ISRry3djsOgb3driW7tcyFjwkEwjtk1Os2cN3PSZ83YAOO9nIBts4QR/WagG3gB59UqHiN2HWJM
	Svwl5/kTjq96QeUIMtDU76g==
X-Received: from pfbft2.prod.google.com ([2002:a05:6a00:81c2:b0:8a2:dc6e:fcd0])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:10c9:b0:878:34d7:699e with SMTP id d2e1a72fcca58-8a9bfa0326bmr3697231b3a.46.1793416089082;
 Fri, 30 Oct 2026 20:08:09 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:08:07 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261031030807.4101384-1-jenhaochen@google.com>
Subject: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline helpers
From: Jenhao Chen <jenhaochen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, Rong Xu <xur@google.com>, 
	Han Shen <shenhan@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

When CONFIG_RUST_INLINE_HELPERS=y, cmd_rustc_o_rs and cmd_rustc_library
compile Rust sources to LLVM bitcode (.bc), link rust/helpers/helpers.bc
via llvm-link, and then invoke $(CC) to compile the combined bitcode
into the final ELF object (.o).

When commit a960c2cdb19e ("kbuild: rust: add AutoFDO support") was
tested with CONFIG_RUST_INLINE_HELPERS=y and CONFIG_LTO_CLANG_THIN=y,
cmd_rustc_o_rs skipped the post-llvm-link $(CC) step under
CONFIG_LTO_CLANG and handed the linked bitcode directly to ld.lld, where
the ThinLTO backend applied --lto-sample-profile,
-plugin-opt=-split-machine-functions, and LLD's default function
sections. Non-LTO builds (!CONFIG_LTO_CLANG), however, ran the
post-llvm-link $(CC) step without $(CFLAGS_AUTOFDO_CLANG) ever since
commit 3a2486cc1da5 ("kbuild: rust: provide an option to inline C
helpers into Rust").

Subsequently, commit 5febf432df1c ("kbuild: rust: keep Rust objects out
of Clang LTO with inline helpers") updated cmd_rustc_o_rs and
rust/Makefile to always invoke $(CC) on the linked bitcode even when
CONFIG_LTO_CLANG=y. Because that $(CC) invocation only passes
$(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) and does not include
$(CFLAGS_AUTOFDO_CLANG) (which is normally appended to _c_flags in
scripts/Makefile.lib), the final code generation step for Rust objects
is compiled without -ffunction-sections, -fsplit-machine-functions,
-fprofile-sample-use, or flow-sensitive discriminator flags whenever
CONFIG_RUST_INLINE_HELPERS=y.

As a result, Rust crates built with both CONFIG_RUST_INLINE_HELPERS=y
and CONFIG_AUTOFDO_CLANG=y emit all functions into a single monolithic
.text section (0 .text.<func> sections instead of 417 in
rust_binder_main.o and 424 in rust/kernel.o on arm64 with
CLANG_AUTOFDO_PROFILE set), preventing the linker from performing
AutoFDO hot/cold function clustering and discarding SamplePGO weights on
the inlined C helpers during final code generation.

Factor out _autofdo_c_flags in scripts/Makefile.lib (preserving per-file
and per-directory AUTOFDO_PROFILE opt-outs) and pass it to the
post-llvm-link $(CC) invocation in scripts/Makefile.build and
rust/Makefile.

Fixes: 3a2486cc1da5 ("kbuild: rust: provide an option to inline C helpers into Rust")
Fixes: 5febf432df1c ("kbuild: rust: keep Rust objects out of Clang LTO with inline helpers")
Signed-off-by: Jenhao Chen <jenhaochen@google.com>
---
 rust/Makefile          | 2 +-
 scripts/Makefile.build | 2 +-
 scripts/Makefile.lib   | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 0ac9ab28cc2b..f2d9b4411720 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -658,7 +658,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 	$(if $(link_helper),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
 		$(obj)/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
 		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
-		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
+		$(_autofdo_c_flags) $(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
 	$(cmd_objtool)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6127feb970c6..bd7bd05e9fe9 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -369,7 +369,7 @@ quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
 	$(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
 		$(objtree)/rust/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
 		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
-		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
+		$(_autofdo_c_flags) $(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(cmd_objtool)
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 19e96b30a122..e72efa5c6c05 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -120,9 +120,10 @@ endif
 # enable (depends on variables AUTOFDO_PROFILE_obj.o and AUTOFDO_PROFILE).
 #
 ifeq ($(CONFIG_AUTOFDO_CLANG),y)
-_c_flags += $(if $(patsubst n%,, \
+_autofdo_c_flags = $(if $(patsubst n%,, \
 	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object)), \
 	$(CFLAGS_AUTOFDO_CLANG))
+_c_flags += $(_autofdo_c_flags)
 _rust_flags += $(if $(patsubst n%,, \
 	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object)), \
 	$(RUSTFLAGS_AUTOFDO_CLANG))
-- 
2.56.0.317.g454f8302e1-goog

