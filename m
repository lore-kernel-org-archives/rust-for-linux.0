Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mMk0d+CF"
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73EB6D1
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 07:07:57 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5ca26c07848so50785117b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702307276; x=1702912076; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kG29XMk3lTrWBF1GpEp92hAzbHx2RURAGojiIVdfRzw=;
        b=mMk0d+CFvuFQRNww/Zwa8Y4syNdv2EZe3KAgWqe35+lpTCdXFnwz6HqhnKkxY+q+jj
         QpXC8pM1AGnqJa+Uu/JEZatWYzfLjJU6MufThSFhw7KlupHtt8c2sB8DFeGmTS7UoCVh
         HKXls9wnaCFmFvq1LoaqPRByTPNXdZyKjTpezWjjxHLE1ivkydgx6i2XkHhaRNBoi1Hr
         kUf1OCSwgTkhk8E/eDfG6inlw6SFcvmnDCzD2OwNQQ5kD8mG7v6CaF71VO6uow8citWe
         U5zUxvMBHWi9B7uFZjka+BCphBAlxI8UfiNI2McZ879N8mDokG8HGk/HgLhsbYtJy8Xs
         WS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702307276; x=1702912076;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kG29XMk3lTrWBF1GpEp92hAzbHx2RURAGojiIVdfRzw=;
        b=dJ3sCQmC1lHLZw1QdnMosrEPgEHDxbTTeCKsgT1fQrP8726nfaBoo60tWMt+Q6cbiL
         8HPQ2wMYPjFFr4Ow3+8aUzb5auPouPYUKgDbqJI1fsBwW3IIMpadHh5DQr8kaktdLpA6
         6bXaQELdX0rj+GR77vxxx5CBGltj1TBrb+32Zq3sQzlwCDfEQfKyjQTofk9hJIaweR3r
         eWGDWLK7tYitWf7882tqxMPDMnMccyX0Bah64F2W82dZJ8T1qK1nOhLRjSsIX/f/9t9j
         ij1+deFv275Y28eWf0IGIYfjGfmYFeo8mfL2A4T+wc5+qXSde2jN8EyQ+PgFYsdSNymL
         xKqg==
X-Gm-Message-State: AOJu0YyZqvx8FgoH6BBRSfXC1Bx3eNhu4q2Vm5L29XYEK2I+0F5pkiJm
	S0mtcAnHv74GXbqrRcl+MyqGV6KyMxy6
X-Google-Smtp-Source: AGHT+IFaiZEd7+b47BpPdyNVHldfy1fqi8OR1OodEiQIP1OrN47EutSHqBJsH0N98hqvXd26gcgUe+ORfXY6
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:242:b0:d9a:ec95:9687 with SMTP id
 k2-20020a056902024200b00d9aec959687mr30873ybs.11.1702307276664; Mon, 11 Dec
 2023 07:07:56 -0800 (PST)
Date: Mon, 11 Dec 2023 15:07:49 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231211150753.293883-1-mmaurer@google.com>
Subject: [PATCH] x86/Kconfig: rust: Patchable function Rust compat
From: Matthew Maurer <mmaurer@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Rust doesn't yet support patchable entry, but likely will soon. Disable
function padding when Rust is used but doesn't support it, and propagate
the flag when it does.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 arch/x86/Kconfig  | 6 +++++-
 arch/x86/Makefile | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 18b9fb7df95b..e9f1814217b5 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2452,6 +2452,10 @@ config CC_HAS_RETURN_THUNK
 config CC_HAS_ENTRY_PADDING
 	def_bool $(cc-option,-fpatchable-function-entry=16,16)
 
+config RUSTC_HAS_ENTRY_PADDING
+	depends RUST
+	def_bool $(rs-option,-Zpatchable-function-entry=16,16)
+
 config FUNCTION_PADDING_CFI
 	int
 	default 59 if FUNCTION_ALIGNMENT_64B
@@ -2469,7 +2473,7 @@ config FUNCTION_PADDING_BYTES
 
 config CALL_PADDING
 	def_bool n
-	depends on CC_HAS_ENTRY_PADDING && OBJTOOL
+	depends on CC_HAS_ENTRY_PADDING && (!RUST || RUST_HAS_ENTRY_PADDING) && OBJTOOL
 	select FUNCTION_ALIGNMENT_16B
 
 config FINEIBT
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 1a068de12a56..0228af62742e 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -211,7 +211,9 @@ endif
 
 ifdef CONFIG_CALL_PADDING
 PADDING_CFLAGS := -fpatchable-function-entry=$(CONFIG_FUNCTION_PADDING_BYTES),$(CONFIG_FUNCTION_PADDING_BYTES)
+PADDING_RUSTFLAGS := -Zpatchable-function-entry=$(CONFIG_FUNCTION_PADDING_BYTES),$(CONFIG_FUNCTION_PADDING_BYTES)
 KBUILD_CFLAGS += $(PADDING_CFLAGS)
+KBUILD_RUSTFLAGS += $(PADDING_RUSTFLAGS)
 export PADDING_CFLAGS
 endif
 
-- 
2.43.0.472.g3155946c3a-goog

