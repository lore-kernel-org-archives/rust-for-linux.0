Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FD5405D8
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Oct 2023 21:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cja/+lgh"
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A385D8
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Oct 2023 14:41:01 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59f6902dc8bso21798407b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Oct 2023 14:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696542060; x=1697146860; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g+0XZ4668oG273eR0HIMNtDUIA8UJt38oxH6S2htmGo=;
        b=Cja/+lghjgljbAErxlP3BwLDI3j+J2IQ5EaQVZLFZTzPtuK/hqe/R4s6xAmcLSSZ60
         qXaObCUB1yhjb1TOV0y3ffYAf0VlUkSAQfVARA6mAW0Vjn/M3NNPMHVQZ8w7VN2MZ+7Z
         wL+n0gn5ESfb+8iiYviiQtWuOdOXtDQlaNh9MLNJ7oYvkefrrPI6EPz1TO38SaN62RDC
         QGauHu8fIXek1KI26CWv1OlZ+yGwecMTMMD9oilwn0cEXNrWlz8esK3JAUdk/F9W/zVo
         x9mm6lwbLoR/f3OVZFNvXFRyPYO45I3tAzBs3u/W6dsH8DPBFMuqMqPLGwsIaNFuPbsT
         HkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696542060; x=1697146860;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+0XZ4668oG273eR0HIMNtDUIA8UJt38oxH6S2htmGo=;
        b=S3/MOIpBUyNPeqySWmIXHAfX+N0JU0UOhLZVgDO9LVuP+S0ZlW0LP68B3EKwAiH4sw
         walDOOh86jGnPCWONglhfaUHsdbJI3X1NbPXbxt0ZWT2dmNxS9VVUU8QATtA9DGqhCtC
         AYet2steNlWe2Ox3em33cbVV/tyi07xoWjn13G2mSWcSEhC5zCFwADP8y1j2yvXfZhhG
         05jN7KyjE1XLBHdLI94Z8BVAK/+/c+epTfjPrDGz7ocpvfTKYAxelJmAMiKeg1c7WwO0
         /fUkG+QO77+yxP6ycqhdATmu0KhgsAplPTE7T0YUTvu2a581+ydve9Y2XsIld4dqw88d
         8gAw==
X-Gm-Message-State: AOJu0YwEilJBwqRrcZlIvDb2ukuA2e8TGqY1uMVIpPsqKQDimV1KLCIg
	t+WsEv7WLebeg0cNqRcffRXA6hGro+TZ
X-Google-Smtp-Source: AGHT+IH18mcFZBjno7qcVSdfTIMzXCbUraSNB9ezxjSbMDxqPIDOGA0bbTBdtYlQKSDXozX4E88C3YDA594E
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:bc47:0:b0:57a:118a:f31 with SMTP id
 b7-20020a81bc47000000b0057a118a0f31mr112123ywl.7.1696542060316; Thu, 05 Oct
 2023 14:41:00 -0700 (PDT)
Date: Thu,  5 Oct 2023 21:39:58 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231005214057.759089-1-mmaurer@google.com>
Subject: [PATCH v4] rust: Respect HOSTCC when linking for host
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
resulting in build failures in hermetic environments where `cc` does not
exist. This includes both hostprogs and proc-macros.

Since we are setting the linker to `HOSTCC`, we set the linker flavor to
`gcc` explicitly. The linker-flavor selects both which linker to search
for if the linker is unset, and which kind of linker flags to pass.
Without this flag, `rustc` would attempt to determine which flags to
pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
name of the linker-flavor used by `rustc` for all C compilers, including
both `gcc` and `clang`.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---

Edited to use escsq in both Makefiles, as per Masahiro Yamada's
suggestion.

 rust/Makefile         | 2 ++
 scripts/Makefile.host | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 87958e864be0..2ddd821d9435 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -383,6 +383,8 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
+		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		-Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro \
 		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 8f7f842b54f9..08d83d9db31a 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -91,6 +91,8 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
 hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
+		 -Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		 -Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
 
-- 
2.42.0.609.gbb76f46606-goog

