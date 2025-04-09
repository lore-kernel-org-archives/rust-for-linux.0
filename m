Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D411D1DE884
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Apr 2025 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229880; cv=none; b=X/RASXY714w5a4RoeUy2W+nS0IQsChCUwwNcHlpdxDe8ZYwCuwsOHIBx2AKEn20D5ulh30C+n4f7psYDAUxYA9bM0ZhGgbEFjJ8VonuCGZwNFLqbEa28RGDTmBa4RUV55/sb3Obk0TsUXJjSigI98mB/HQRKr35c9PucqybVzjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229880; c=relaxed/simple;
	bh=DN0wpjoBwbm62a2PojPzy9eL4TkNTyJB5bl5qwh5q5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eX/dF8ARTZR12i3jTgVoEawym1oEkNAI7mYTPVwaS34SXBX0UwzgBH5KjnKmkiQMWL7kynwhsNf08L4RLeeMelSTAIKBesLvEXvziiGT1f6zFCUAha/nPDkClq+e6HpGkuXotj3BWRavPrXw3Loh8207yrc7GH2kHqA8OTxomX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mo86K5Mz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mo86K5Mz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so8509f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Apr 2025 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744229877; x=1744834677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bgWloY6Z/GPjOoVRp8gFI5U+gR/p1lk09lOlKvqmyk=;
        b=Mo86K5Mz2C2YZ/lCbp8AwSgUcxlfYpgkrNeQvpmRPm7PCzZSR8QwLZlDG4LSEEhF3A
         Uh1qivzIEGo561f7DoPKplRlk3DG/m3mkS8NzE9BU1QJmSuZ47fajbkFN/Bn7TW+QRwS
         scibgQoDNch7cgDHFS12ZdDsg3WHX6d0Jm94mdm7R8lZMHKnnp0QzzBZzApaG5C96CRf
         tX/QaXNAbz4xO68+gGCIVlafgyy+qAZ3gU/qoSmFtzutrwYCgSgNKXBdvP39H1Jk/c0c
         R8OF1+ROs2OCstR1WjgBL7NWUOyAxHTzt94/XLfb0FDOOUdSrT1gn0p+cE6aa9sUoV4h
         z11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744229877; x=1744834677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bgWloY6Z/GPjOoVRp8gFI5U+gR/p1lk09lOlKvqmyk=;
        b=CVzQPt39A0mVS5fe+elJfQf9Ip6JfLHqi/ITXU/quSUrJ0Ftbe/9a1rtJEvr8rtIl4
         7JriHVsiJjmmFHFTbW9aUMjk1a2zbvM2eySkb18lS35v+7mnlXxyNnlUqW1FkEN5P8/C
         JqhTJNIfiChAC6TTI6SGI9B3DIn7hbTgxhtEXMQrBDqkiCYPCS+16ouiBVkjAosOhj97
         kdsscxB98IJq4x4DLgQxxqTLD+SA86vMvn7XEpWoCFuOBlykYRPC4vGzjnzokH50peDw
         Lk1t8aBhaDlFjLbzCPgUpCdLeVORXtZgrXCZzCty3JnNEBjPwlPM/g5AUlLH5T96uO60
         NNcQ==
X-Forwarded-Encrypted: i=1; AJvYcCViVikw4rCsWbl/8KkrBccAKfUWL9xpbZoSgbionY9cNKXY1LW9IeY1WTRBH8mlwyfx9k/K43oLOT0FJQi3ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyujpB/JxOyw9cLrUyFUGtvHeSPGhLwIet02HyCjeeX/UehwVNj
	VQo3mGFPhEqPwhXeMnu/C/bxJm8llRFPhrntjhxDH4us1Fl83HvJoIMkXANcjuS3mWfZGI4kvNq
	E1qkcVT5R6bWGv+ZlKVGI7cZ31fYwHzf18kwy
X-Gm-Gg: ASbGncsh2BQVW+UXst0C8lCF37mrkMMowQma113PxeJ+2pfJpkgxpYR9kjWHFicf11R
	QNygqyIjbjcjvlMQHUtJtAL/fIJW5yz1HY4CVfbohjlQiVqQt6amY7wzmE0pMolK9/tSaYi7omj
	ktSv/AVzrX9tjcAuiobwF7/w4=
X-Google-Smtp-Source: AGHT+IHF65zLg7feilUYDheUibZgFpivGomhAMQ9nvtXy1QRwJ0EXV2IXKYLDmuiA2LwoPriA5ZqZstTr5vam02ZaAA=
X-Received: by 2002:a05:6000:2411:b0:391:2dea:c984 with SMTP id
 ffacd0b85a97d-39d8f463cd4mr86810f8f.11.1744229877002; Wed, 09 Apr 2025
 13:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319205141.3528424-1-gary@garyguo.net> <20250319205141.3528424-3-gary@garyguo.net>
In-Reply-To: <20250319205141.3528424-3-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Apr 2025 22:17:44 +0200
X-Gm-Features: ATxdqUGIImZWdIXFXkMtgq_6FpLUl4WUHaHz6zPbTJ9JLlSwvxfpfqMMQQdWOGU
Message-ID: <CAH5fLgifMPxer5TcWUBUYKtGsPFryqPVwXT8-5qmmY6F3=nuBw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Tamir Duberstein <tamird@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Daniel Xu <dxu@dxuuu.xyz>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Matt Gilbride <mattgilbride@google.com>, 
	Paul Moore <paul@paul-moore.com>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 9:53=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> A new Kconfig option, `RUST_INLINE_HELPERS` is added to allow C helpers
> (which were created to allow Rust to call into inline/macro C functions
> without having to re-implement the logic in Rust) to be inlined into
> Rust crates without performing global LTO.
>
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to an object file to be linked
>   into vmlinux, they're compiled to LLVM IR.
> * The LLVM IR is patched to add `linkonce_odr` linkage. This linkage
>   means that functions are inlineable (effect of `_odr`), and the
>   symbols generated will have weak linkage if emitted into object file
>   (important since as later described, we might have multiple copies of
>   the same symbol) and it will may be discarded if it is not invoked or
>   all invocations are inlined.
> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>   is a performance optimisation to prevent LLVM from always have to
>   reparse the same IR).
> * When a Rust crate is compiled, instead of generating an object file, we
>   ask LLVM bitcode to be generated.
> * llvm-link is invoked to combine the helper bitcode with the crate
>   bitcode. This step is similar to LTO, but this is much faster since it
>   only needs to inline the helpers.
> * clang is invoked to turn the combined bitcode into a final object file.
>
> Some caveats with the option:
> * clang and Rust doesn't have the exact target string. Clang generates
>   `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
>   complain if `-Ctarget-feature=3D+cmov,+cx8,+fxsr` is used). x86-64 alwa=
ys
>   enable these features, so they are in fact the same target string, but
>   LLVM doesn't understand this and so inlining is inhibited. This is bypa=
ssed
>   with `--ignore-tti-inline-compatible`.
> * LLVM doesn't want to inline functions compiled with
>   `-fno-delete-null-pointer-checks` with code compiled without. So we
>   remove this flag when compiling helpers. This is okay since this is one=
 of
>   the hardening features that does not change the ABI, and we shouldn't h=
ave
>   null pointer dereferences in these helpers.
>
> The checks can also be bypassed with force inlining (`__always_inline`),
> but doing so would also bypass inlining cost analysis.
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Is this compatible with DEBUG_INFO_BTF? I'm concerned that we have the
same issue as in commit 5daa0c35a1f0 ("rust: Disallow BTF generation
with Rust + LTO").

The commit message should either explain why we don't have the same
issue, or this patch should prevent configurations from enabling both.

Alice
