Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506110;
	b=pHU28TV1utirpQoUnSf29q2nw1tOznCoEZAsX4tEmbk9gceRRjtOxOb8dzlr6eaB/kEY
	 5hyObzRk3rAXLIpiM3cADoEU7To5f+GAGs5x1LZmEyv7metqF5ixqs6dd4oLDQX8M8L4S
	 GuSe8eRGCvTbE8u0/1cdi6oW/Zlgd3wn282l2YSucereyiMgwsq3NadcDGLdadQNZoZMq
	 6DHAG1orVZMIL8WrL2nfiSEgmjstXJfg34wDr6WCXHkt4ClS2KPSKUuOX0XmPdX/eYOuz
	 T+zXgcI+7qu3/8pgJC/8Fcr0uZChVq7NBCfPpo0avxJNHUITm/xbIJVQ5+kzlTey+XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Developer-Key:
	 X-Developer-Signature:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ynYM9+Qap+tlYRlfmOG6w4Tj1+4gfNqhSqD8Yw1/wNg=;
	b=Th24qiwWkX+6IY6RF6dlcMwYsNd3Fg0jsz0saQ9+Qq2mkonnQJi5ocmNO+81VXdEdfYE
	 D6mG576XaPH5J/lCt3pm5h36t0xn+lT79MirQOJGfgMU6iJsX54ZmtANAEd4vTfqgxryM
	 XOlQVnQy58zx1ww3HueFy+lQP7l1R2NyziyetOwewN75t5gbXEFf/Vnd9Seh+7vdwib/E
	 +R3LyskN96PO/bWmaKu18Lv9k/MSubVxN0YX+Fn4f0Ljbq+h40wy0fGzIxNBpmTYfI9fT
	 psdxTVnHNpEwQKZMNHJl1rXfwzVVNhbhGxY3+mYUufhreMqPnR692GcaXZhX2VLLfoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Okr2dcTu;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C345606A31E
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 07:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C345606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Okr2dcTu
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49034831bb3so2564260f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 23:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795506109; x=1796110909; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynYM9+Qap+tlYRlfmOG6w4Tj1+4gfNqhSqD8Yw1/wNg=;
        b=Okr2dcTuPTk6IeAbq2zF+KqbXJ/8knWkvc+FPfiEAzuQ+bOxHtdLOYZys0X4TXwDqh
         FiWRX5HZe4OVgPf3BFbmpgKvc6SzWpK4cbI7qCLF3bS3S4CCd40waMs/yd7qPPKWyz6l
         XonBvqwD6TeSxu14Ii93FwHtT8gDe6HNGpa+1W30W2H11GqpzxGc8Pn2IOorGDVFlnou
         WOdEJUPHP1oH9mztmrr3aDrJvnZgL9kTeKyj8pk9AWw7b61xb6nUUlEmxMnGPYHfLogj
         LhUcRyohYwEkALp1q6e6JzImB9hegnoj2CaKeiLRjtN5Lol5krfj2YXzfGkvZmtMekHY
         LimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506109; x=1796110909;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ynYM9+Qap+tlYRlfmOG6w4Tj1+4gfNqhSqD8Yw1/wNg=;
        b=OenPKXWKDYBRqvaklzpAMrxcSVUoWkc/XjbVZh3aX/r4WQC/KmZEVLxjXNjaE37ykO
         AEY1byGUE8UfS/FWUcbEzp8ZnBp09GeeB5X8v6BbLkFteXUuhvGQdIvcz3fb9W/cERB+
         CjjWi752xOJ97zw1AxZJkgyZri24cJauTfxYHkZ/y99IBnx2OE7sfj9Xo/FeZYGIJTqy
         8bdQquWHcS77+fsd/ET85T5EdriiP29AXGvHkb77zemTiRumBCxXUpeLnb1SJ51BNt7b
         42xRkQomwiFPpZy6kys/Gmhim/StWGAoHkF2dmQPeNbDgZkqZvhVdE34v1fthDctC0zo
         d5Dw==
X-Gm-Message-State: APuU4Z/JoedCi8uxPYtYj+dXj8DnLXvB184KqLKHilpZpCHGnUNu51bY
	vSbkTvWDikFNvgeSLseSzYDqnnXNX2+DWk0ep4B5xashVs9ok/b4/L8gx5W2d8fm9TAQ+/DmQA=
	=
X-Received: from wmmu7.prod.google.com ([2002:a05:600c:c7:b0:4bb:51ec:41e0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e87:b0:4a3:59c9:a758
 with SMTP id 5b1f17b1804b1-4bb88922c81mr282055355e9.32.1795506108368; Mon, 23
 Nov 2026 23:41:48 -0800 (PST)
Date: Tue, 24 Nov 2026 08:41:39 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3281; i=ardb@kernel.org;
 h=from:subject; bh=VKxpYpmeXmmfqFoZsK4/R6FwAHNhn1NqRuPhJkwFzw8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZvVfnNM2U5OwYaCVXtfn7rT8jem4QH7LKW3t1N/MQSb9
 LaI/lzRUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZizcXIMK/Mb5d8QUagYYbN
 EtZw+69VRv9YmKIuua5hstj76MiFH4wMr8oOh2zjiPul0nt6zpTDO1wPcV4LPCuju/XZiqUxTw/ UsQAA
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124074138.450793-2-ardb+git@google.com>
Subject: [PATCH] kbuild: rust: Pass $(modkern_cflags) when compiling
 inline-helper bitcode
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kbuild@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

When CONFIG_RUST_INLINE_HELPERS=y, rustc emits LLVM bitcode instead of
an object file, llvm-link merges the C helpers bitcode, and Clang
compiles the combined bitcode into the final object file.

While rustc receives $(modkern_rustflags) via $(rust_flags) and the
helper bitcode files are compiled with $(modkern_cflags) via $(c_flags),
the Clang invocation that performs final code generation in both
cmd_rustc_library and cmd_rustc_o_rs only passes $(KBUILD_CFLAGS) and
omits $(modkern_cflags).

As a result, target-specific built-in and module codegen flags in
KBUILD_CFLAGS_KERNEL / CFLAGS_KERNEL and KBUILD_CFLAGS_MODULE /
CFLAGS_MODULE (such as -ffunction-sections and -fdata-sections under
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION, or architecture-specific code
model and relocation flags that override defaults in KBUILD_CFLAGS) are
lost during final code generation.

Pass $(modkern_cflags) alongside $(KBUILD_CFLAGS) when compiling the
merged bitcode in both cmd_rustc_library and cmd_rustc_o_rs.

Fixes: 3a2486cc1da5 ("kbuild: rust: provide an option to inline C helpers into Rust")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
Cc: Gary Guo <gary@garyguo.net>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>

 rust/Makefile          | 2 +-
 scripts/Makefile.build | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 0ac9ab28cc2b..49b139639339 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -657,7 +657,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 		-Zunstable-options \
 	$(if $(link_helper),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
 		$(obj)/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
-		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
+		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS) $(modkern_cflags)) \
 		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6127feb970c6..2e03e960387f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -368,7 +368,7 @@ quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
       cmd_rustc_o_rs = $(rust_common_cmd) --emit=$(if $(CONFIG_RUST_INLINE_HELPERS),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) $< \
 	$(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
 		$(objtree)/rust/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
-		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
+		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS) $(modkern_cflags)) \
 		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(cmd_objtool)
-- 
2.56.1.831.g720f3f5937-goog

