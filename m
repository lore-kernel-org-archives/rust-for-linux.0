Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF28233986
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Oct 2024 17:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728409426; cv=none; b=UGaD5qYut5ujFA3NlTwBx4o+OcmOpWCLJnIDpvSpTN0FWEI//hpjRLzyiDm2SjYHJeO5irz6Mu5PC6Ypn2125Co91bSzmCr5RpldHxcUuzvYR1A7lfy5JRodSRir9eiTpFHxmxj7RFV+06pUZ4MhnfMvre5BttJxLnzyX584Gzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728409426; c=relaxed/simple;
	bh=ZG0nNXZuDONSmZRpr+5HQxd5/vf87bFyGemBi+O4hDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDwK+yvhd6Vny/vc2JYgQSzMa+qJZzSPbNloZ3C/uN5c8lwh3DxgTFUQ7a81eXsPRuk8CrSBTzjbLFVlikXl2JSmdXuCF053GNZp2L+Jv11sl71+Iw2AtTaQoCzrHMAru/NfW67F6G9YCriIpgE1KQeN/pwfK6WBcmYc1Ab7jqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RfgJ/9BD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RfgJ/9BD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb1dd2886so25025e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Oct 2024 10:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728409422; x=1729014222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BN6kXGTY/bXLsaB4MDLmcxb9JIYWOPiKBiUBPzfzhs=;
        b=RfgJ/9BDmph29KaGhm1IIqSNwQKnNM6CJgD6WbvXOIAjW8UBE0qVkHixZr/Qbjr0xH
         BA2IPzErMBxotG/Hds35LD/U+E/2CsLUVJhgzUEBQ1hXnonmxMl/JZW5ByT5h5XpfSJL
         9dmTy3DZA3g4d0Hi15GhEH+kO31rOs/lUc9Z8SjRjMbm9to9XLZMs4oP9DSLnOQdIjwK
         6rvexc5oG3vkpUz2WAX71JOFIbUZPFQtIzevyx3srh5MK7ajdjwPKg2IobhSjuvsNeVY
         SclZE9SF1wp+fYSecqMQf6KwgI+lJqcHlt6fhvRhjiJv0S4CjHykQw9vEQHsCQgYP/FV
         xgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728409422; x=1729014222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BN6kXGTY/bXLsaB4MDLmcxb9JIYWOPiKBiUBPzfzhs=;
        b=QfThFN8dlzX7nCiGNnEbVt7GFC2mX/JIEkQu+lSBJoPe5jzGcBoIEFniVpnlUSbBoc
         fO7Ni4d8lWkp72AZtY9zloZOtl60e6+/RjsdFFzW2W565Boj4GbzgtNYhg7FotcJyVvU
         nU18roqk39ImlL0besQyAkrEEehBqdon6itaOo+8hOHdPpCLl5DAMvMdx6eZl+p6SUdt
         WFjhpYv0lHqU/6XqSX6o80RqWKK6059E7yCRBDq0a/tDWKuVeaNh7wyFyQu1vF1cFRJ4
         XP1QjxzP24CXpNEY3G0YyLbodxodTd7t72rU9xHtjdjOYuzliDmnPi9b525miwjZIphN
         7Hkg==
X-Forwarded-Encrypted: i=1; AJvYcCX27hgj64sw4qoJEMRYfXmdPNycsP6ag+9vzXE3zWsxWhDuZgqHDuew318UY97FXrdLmKk4QH6GI1N/zN3qmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbwhI64xgEKD6SfOUnr/mLzhFXXWn9TzkzwEPqCjVC4TBUNYI
	KMMknDpF4n1G8L1sPJk98ikikHrl1mZYw4N9SULt63BXKhR8REK6XZfw8gDcMaOotOy9gLenLFX
	YdTLjS7fL+rl0gFYqU4Ld6YTTL3ESvtZV+wVE
X-Google-Smtp-Source: AGHT+IH9DMeqDkPeSNyDAOapvfTWm3xo8gfSpMdKSRuFd5l6IQ8Il0u6xIwpPm1k4AiXM89vENBa9VvwzyB3JvCfRVI=
X-Received: by 2002:a05:600c:4e15:b0:42b:a8fc:3937 with SMTP id
 5b1f17b1804b1-43058d74578mr85355e9.4.1728409421996; Tue, 08 Oct 2024 10:43:41
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
In-Reply-To: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 8 Oct 2024 10:43:29 -0700
Message-ID: <CAGSQo02oVWxazut2nyh-9K9gK+937zKCfYMBkT4EQE2CddvZtg@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for catching this - I had a specialized toolchain enabled which
didn't exercise the `RUSTC_BOOTSTRAP` issue, and without an unexpected
failure, didn't see the `--out-dir` flag conflict after I got the
request to add it.

Reviewed-By: Matthew Maurer <mmaurer@google.com>


On Tue, Oct 8, 2024 at 10:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Fix a few different compiler errors that cause rustc-option to give
> wrong results.
>
> If KBUILD_RUSTFLAGS or the flags being tested contain any -Z flags, then
> the error below is generated. The RUSTC_BOOTSTRAP environment variable
> is added to fix this error.
>
>         error: the option `Z` is only accepted on the nightly compiler
>         help: consider switching to a nightly toolchain: `rustup default =
nightly`
>         note: selecting a toolchain with `+toolchain` arguments require a=
 rustup proxy;
>               see <https://rust-lang.github.io/rustup/concepts/index.html=
>
>         note: for more information about Rust's stability policy, see
>               <https://doc.rust-lang.org/book/appendix-07-nightly-rust.ht=
ml#unstable-features>
>         error: 1 nightly option were parsed
>
> The probe may also fail incorrectly with the below error message. To fix
> it, the /dev/null argument is replaced with a new rust/probe.rs file
> that doesn't need even the core part of the standard library.
>
> error[E0463]: can't find crate for `std`
>   |
>   =3D note: the `aarch64-unknown-none` target may not be installed
>   =3D help: consider downloading the target with `rustup target add aarch=
64-unknown-none`
>   =3D help: consider building the standard library from source with `carg=
o build -Zbuild-std`
>
> The -o and --out-dir parameters are altered to fix this warning:
>
>         warning: ignoring --out-dir flag due to -o flag
>
> I verified that the Kconfig version of rustc-option doesn't have the
> same issues.
>
> Fixes: c42297438aee ("kbuild: rust: Define probing macros for rustc")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Add `export` to RUSTC_BOOTSTRAP.
> - Fix error about core being missing.
> - Fix warning about -o flag.
> - Link to v1: https://lore.kernel.org/r/20241008-rustc-option-bootstrap-v=
1-1-9eb06261d4f7@google.com
> ---
>  rust/probe.rs             | 7 +++++++
>  scripts/Makefile.compiler | 5 +++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/rust/probe.rs b/rust/probe.rs
> new file mode 100644
> index 000000000000..bf024e394408
> --- /dev/null
> +++ b/rust/probe.rs
> @@ -0,0 +1,7 @@
> +//! Nearly empty file passed to rustc-option by Make.
> +//!
> +//! The no_core attribute is needed because rustc-option otherwise fails=
 due to
> +//! not being able to find the core part of the standard library.
> +
> +#![feature(no_core)]
> +#![no_core]
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 057305eae85c..08d5b7177ea8 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -21,6 +21,7 @@ TMPOUT =3D $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_E=
XTMOD))/).tmp_$$$$
>  # automatically cleaned up.
>  try-run =3D $(shell set -e;              \
>         TMP=3D$(TMPOUT)/tmp;              \
> +       export RUSTC_BOOTSTRAP=3D1;       \
>         trap "rm -rf $(TMPOUT)" EXIT;   \
>         mkdir -p $(TMPOUT);             \
>         if ($(1)) >/dev/null 2>&1;      \
> @@ -76,7 +77,7 @@ ld-option =3D $(call try-run, $(LD) $(KBUILD_LDFLAGS) $=
(1) -v,$(1),$(2),$(3))
>  # __rustc-option
>  # Usage: MY_RUSTFLAGS +=3D $(call __rustc-option,$(RUSTC),$(MY_RUSTFLAGS=
),-Cinstrument-coverage,-Zinstrument-coverage)
>  __rustc-option =3D $(call try-run,\
> -       $(1) $(2) $(3) --crate-type=3Drlib /dev/null --out-dir=3D$$TMPOUT=
 -o "$$TMP",$(3),$(4))
> +       $(1) $(2) $(3) --crate-type=3Drlib $(srctree)/rust/probe.rs --out=
-dir=3D$$TMP,$(3),$(4))
>
>  # rustc-option
>  # Usage: rustflags-y +=3D $(call rustc-option,-Cinstrument-coverage,-Zin=
strument-coverage)
> @@ -86,4 +87,4 @@ rustc-option =3D $(call __rustc-option, $(RUSTC),\
>  # rustc-option-yn
>  # Usage: flag :=3D $(call rustc-option-yn,-Cinstrument-coverage)
>  rustc-option-yn =3D $(call try-run,\
> -       $(RUSTC) $(KBUILD_RUSTFLAGS) $(1) --crate-type=3Drlib /dev/null -=
-out-dir=3D$$TMPOUT -o "$$TMP",y,n)
> +       $(RUSTC) $(KBUILD_RUSTFLAGS) $(1) --crate-type=3Drlib $(srctree)/=
rust/probe.rs --out-dir=3D$$TMP,y,n)
>
> ---
> base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
> change-id: 20241008-rustc-option-bootstrap-607e5bf3114c
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
