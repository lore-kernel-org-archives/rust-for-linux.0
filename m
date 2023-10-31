Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C11E22335
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EGHI4CJy"
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74598F3
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 13:18:18 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5b0c27d504fso1904177b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 13:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698783497; x=1699388297; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ztq39AVKtcPBQkDEgvD9lSUG5ylL2QPNBxZOTT2U9hc=;
        b=EGHI4CJywkrKHWz4oREJwLIPp6QyfyEiQeyA23EfZYk0zf+UB8FaTgGtnIX4Yz/5zq
         0wfaPxBX7kOFTa7t8SErD2Hdr9/BpS/09YMO+DydsO14aCCNLpEF5gRDbAdvSyeOlVqc
         UPdwDfxNFzQZxJxlIYSyVEJZg41aUPEyzyBuf8phKhuMelMvnPjr5Pz6KgLXeK4ZyOyT
         +hM/LYAkG4A9YLNg1vZwyyDl7cXlnZ1Ny2Pzc8JTvWpSyKt02vk6NaI7jNgmL1ZlNAAc
         3b2rz5CYEcRrjjIGqzCRVZFOm/ke01G8uUhp01YYpIQ64333Vi174EbMtHL1aCTM9ObF
         psUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698783497; x=1699388297;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztq39AVKtcPBQkDEgvD9lSUG5ylL2QPNBxZOTT2U9hc=;
        b=LvYI+N39P/FCLW4RaHFqZyuYVLP6q1MB5GacY0Qk3VIFejohEqnRiaZr3h14AFxkzu
         RMn51Jx499jB5yMLG845Q5QpFblN+XqeSQOuRPuG4d1DGp/eGplAHt6uboolFo/eZKqY
         4DMOaS674p+mR2EDerUlYUTQDr126X0bPz20pYm4kDPqqDxDt3DXjrf7h1+23MBnM5Vn
         b2KlA32Gy3KbRmWdeTEIfdAttY1bPHmrWQPfRBPjvNdvM5r4mObUpTeLoBA+rQ8gM1D4
         3SREoLmErNxQoEgnTO0H2unV2u0o+79xiSaI+Mmh9vB4d8jmv2Uph9D3gnQHwi6onV/+
         EfiA==
X-Gm-Message-State: AOJu0YzJ/rKAsuVISoaXmWQl4D7V+GHX3WvVkL5xFgnk/88yHjU5h/Bp
	qJ0DX99HvNzP1IhVw51+TgJP87+3NkFN
X-Google-Smtp-Source: AGHT+IE8r9R0/YNE2aMmXBt/5jdVEq82GPS8cQwktw+16arRhB9NYq/NvvqS8Dt8j29bFV2jrKzq4QjdO3vj
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a0d:d684:0:b0:58c:e8da:4d1a with SMTP id
 y126-20020a0dd684000000b0058ce8da4d1amr89719ywd.2.1698783497681; Tue, 31 Oct
 2023 13:18:17 -0700 (PDT)
Date: Tue, 31 Oct 2023 20:10:14 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231031201752.1189213-1-mmaurer@google.com>
Subject: [PATCH] rust: Suppress searching builtin sysroot
From: Matthew Maurer <mmaurer@google.com>
To: Jamie.Cunliffe@arm.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: will@kernel.org, Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

By default, if Rust is passed `--target=foo` rather than a target.json
file, it will infer a default sysroot if that component is installed. As
the proposed aarch64 support uses `aarch64-unknown-none` rather than a
target.json file, this is needed to prevent rustc from being confused
between the custom kernel sysroot and the pre-installed one.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---

This patch is prompted by the issue I encountered at
https://lore.kernel.org/all/CAGSQo01pOixiPXkW867h4vPUaAjtKtHGKhkV-rpifJvKxAf4Ww@mail.gmail.com/
but should be generically more hermetic even if we don't end up landing
that patch.

 rust/Makefile          | 1 +
 scripts/Makefile.build | 1 +
 2 files changed, 2 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index a27f35f924ec..0403e88e19fd 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -400,6 +400,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 		--emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
 		--crate-type rlib -L$(objtree)/$(obj) \
 		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
+		--sysroot=/dev/null \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
 
 rust-analyzer:
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 82e3fb19fdaf..6e4ee513cc3c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -275,6 +275,7 @@ rust_common_cmd = \
 	--extern alloc --extern kernel \
 	--crate-type rlib -L $(objtree)/rust/ \
 	--crate-name $(basename $(notdir $@)) \
+	--sysroot=/dev/null \
 	--out-dir $(dir $@) --emit=dep-info=$(depfile)
 
 # `--emit=obj`, `--emit=asm` and `--emit=llvm-ir` imply a single codegen unit
-- 
2.42.0.820.g83a721a137-goog

