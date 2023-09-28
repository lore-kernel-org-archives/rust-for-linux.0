Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300EF110B
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 19:48:11 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB3719F
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 12:48:10 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59f8134eb83so171810367b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 12:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695930489; x=1696535289; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8iFw0tvjrP+bKthnM1Ar6RitIykCJfydYWlbU6QKJSo=;
        b=d/ucrjuXJ2acKPT9XyrckOG9VoH40jdz8VyKFE7DQXm2BED4MRhVmA2So4637mpIeb
         xkrOHP2k0Cl1rBg8EO6FsWtuNo8jp/D0f8/dUuvdQACV7IRF2yCgsslE3aAmjPnVwqnC
         5F5RhgoQT3hBr4pPQpPudmqNfnY3xCgUYPo2f7zK6tvfLKxQaDcqYwtQh/CUmq+vke4F
         V4KY7H5Xh7kCf2LpE3ANnCpTDdEAEQBHsrKlE+L8X4NXYt4kOr2iGy54wxX9oEwftqtt
         s8RqlnxQqt4lHkirnVXAtmo+iok4JQqf84L4UITpyK3RJukCQZd7GDIYdJHmCHMibs6I
         rlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695930489; x=1696535289;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8iFw0tvjrP+bKthnM1Ar6RitIykCJfydYWlbU6QKJSo=;
        b=TgSB/rw22tbEGYGjGDl3MNhdFJS2yJCNlfG1GuRjB67K+qg3MTUGGolBbTChpEdFz3
         RsY7FXKjSod+u0LYj4MwmRAI3k4Tqx4AXvY/OivT09xI0Zo/5b2GLWO30Fc4tf4sECtu
         a2UViRjKoqHH1FiL5zCWwkIJrS8ZqvAnstSLELf6962YjOPibrvdMO5poPDlV/2w1uJx
         7n+7gSgNSj7lpscR4891krgztihL3E4nJbCFJ7UeF928ybtvEPKv7er8VrAh2G4GzRw3
         Q8L0urbCEDNF4kRXYYctsysitQPRViPkxbDW26RtrWHxmcpdILh0PEXk9wu7bGvbv/Ip
         iU6w==
X-Gm-Message-State: AOJu0Yyls6yp8gJnqCHGYVwoQWpptc3c8rZX12OnbxexrCS5218FAd76
	zKAbXEodxNJTky8QBOlsSqHNcZ1bqkIP
X-Google-Smtp-Source: AGHT+IHmbhxmxw0u7t9poI7VDoNjrSv2+5OQoPENUEo3sqSzgMufa0dh2YWPxi+AEsKixH41b4COj6rIWJJN
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:440d:0:b0:59b:ebe0:9fd3 with SMTP id
 r13-20020a81440d000000b0059bebe09fd3mr29132ywa.7.1695930489339; Thu, 28 Sep
 2023 12:48:09 -0700 (PDT)
Date: Thu, 28 Sep 2023 19:48:01 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230928194801.2278999-1-mmaurer@google.com>
Subject: [PATCH v3] rust: Respect HOSTCC when linking for host
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
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
 rust/Makefile         | 2 ++
 scripts/Makefile.host | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 87958e864be0..da664d7aed51 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -383,6 +383,8 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
+		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		-Clink-args='$(subst ','\'',$(KBUILD_HOSTLDFLAGS))' \
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
2.42.0.582.g8ccd20d70d-goog

