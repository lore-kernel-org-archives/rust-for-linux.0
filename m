Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE0341846
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Dec 2023 19:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kcXDDDyV"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5e1b9b10dc0so11407997b3.2
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Dec 2023 11:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702669711; x=1703274511; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jxvKbXwjbAGX6GdbkcWO53h3I4l2PzRLmBMsIoNBpj0=;
        b=kcXDDDyVEmycAM/0KvjpEtkST2WOdUKg5csGN94SL7JukLSc5zlJmRvPzWxj671fYT
         YjaygWkNXOixZ5qsQqAuUwAuDte3S8hWq+PM+aJUxNdQNqK8u4mVk26Av5g4hLiKj2xl
         qouDeoGFUkGtoaJCjghsnxjqYfaipnTzR5repaeqn1DpxutrBUxQ13Bs4PZ7wABQeM6K
         3p+aRyZ3hdphACyaxIIuaw1ypYdnNz4fYqbYr/6nhxmMblRj27Eop+CE+jNiNlWUJC33
         zTPzxqTjDoTrKsuMmdWukOZwjWLxnDfBwf5Tbk3o7ATgD8IH7o4HU8/iBJhDzsJ9R4WB
         KC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702669711; x=1703274511;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxvKbXwjbAGX6GdbkcWO53h3I4l2PzRLmBMsIoNBpj0=;
        b=XRQrdN+nnP8il/TmM8fP8p0ke+J3l/p5T6ei94UdRExKFebKPmAPICAWclMeMv6S1l
         ewoxGIMcSrrxi5EcJNiqd3VbZ1KlJYIRr8R0s8lIMJn4eXnONYTNpUV2m1GbwHGlZdG8
         st5ap6TnZgmUv8kRC1e5SVKuogLmCgqqyCPeKmeO2wybPiDZvEwtkRV4lTiDveBbHxGU
         4488K9OZ/or9yZSgd7V+3wPPihfoefonL4f9/98aus7lQ6BtWJ/b+URn/+ti8omZYcj8
         3S8X21KaUWcxZxdz914V2Iqv/Ig0FRkG1yWG2UR+pEIqKCuOGeaMV5cKmdKPC/CPf8hA
         rEMg==
X-Gm-Message-State: AOJu0YwBgCv/zXRU/Oljf5981VHugDdnyxdhKaGrxi65SY1DUeZSdgDX
	x7yxfQM2xD/sBQ80qCzAMKHDK8PQ+0Qy
X-Google-Smtp-Source: AGHT+IHC4TnKySuHLFy1qU6pY4sY2mdSNqJv+Lq+o7C1yfLFhEnIjpAoToLT14qb3uuo1AeTCXhR7qVVyJzo
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:3381:b0:5d5:5183:ebdb with SMTP
 id fl1-20020a05690c338100b005d55183ebdbmr143624ywb.10.1702669711738; Fri, 15
 Dec 2023 11:48:31 -0800 (PST)
Date: Fri, 15 Dec 2023 19:39:57 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231215194828.2611213-1-mmaurer@google.com>
Subject: [PATCH] x86: rust: Disable entry padding with Rust
From: Matthew Maurer <mmaurer@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

rustc-1.73.0 used by Linux does not support entry padding. Mark entry
padding support as explicitly incompatible with Rust.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---

This is temporary - upstream in the Rust compiler, I have:

* A MCP[1] to enable the feature as an unstable flag
* A RFC[2] to stabilize it and add the attribute
* An initial implementation[3] for the MCP and RFC once accepted

Once at least unstable support is merged, we can detect this in a future
patch.

Even once those are merged and Linux is using a newer rustc, we will
still want a separate HAVE_ENTRY_PADDING config, as Rust's gcc backend
will not initially support it.

While this is a temporary patch, I still think it's worth carrying
because it prevents us from selecting build configurations that will
fail at runtime.

[1]: https://github.com/rust-lang/compiler-team/issues/704
[2]: https://github.com/rust-lang/rfcs/pull/3543
[3]: https://github.com/maurer/rust/tree/patchable-function-entries
 arch/x86/Kconfig | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 18b9fb7df95b..a9d48709f7db 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2452,6 +2452,9 @@ config CC_HAS_RETURN_THUNK
 config CC_HAS_ENTRY_PADDING
 	def_bool $(cc-option,-fpatchable-function-entry=16,16)
 
+config HAVE_ENTRY_PADDING
+	def_bool CC_HAS_ENTRY_PADDING && !RUST
+
 config FUNCTION_PADDING_CFI
 	int
 	default 59 if FUNCTION_ALIGNMENT_64B
@@ -2469,17 +2472,17 @@ config FUNCTION_PADDING_BYTES
 
 config CALL_PADDING
 	def_bool n
-	depends on CC_HAS_ENTRY_PADDING && OBJTOOL
+	depends on HAVE_ENTRY_PADDING && OBJTOOL
 	select FUNCTION_ALIGNMENT_16B
 
 config FINEIBT
 	def_bool y
-	depends on X86_KERNEL_IBT && CFI_CLANG && RETPOLINE
+	depends on X86_KERNEL_IBT && CFI_CLANG && RETPOLINE && HAVE_ENTRY_PADDING
 	select CALL_PADDING
 
 config HAVE_CALL_THUNKS
 	def_bool y
-	depends on CC_HAS_ENTRY_PADDING && RETHUNK && OBJTOOL
+	depends on HAVE_ENTRY_PADDING && RETHUNK && OBJTOOL
 
 config CALL_THUNKS
 	def_bool n
-- 
2.43.0.472.g3155946c3a-goog

