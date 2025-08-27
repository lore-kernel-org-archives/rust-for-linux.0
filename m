Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA751EFFB4
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Aug 2025 17:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756315832; cv=none; b=msQkWXeJCEu4ME7qmwoh8yK8dlJAIiCuP3a12KmYEgJfAjanROZBI4ZwcWyLqUAQftUgw4cdpP7iIEKvRSmMWk9HT7AlZG5Y1/xRvXI7Lxa4xquRDyThM49olXSeUZfq6T/4sQCmuZfXls7Piolj8/i0GUEevV316lIpo7vyLpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756315832; c=relaxed/simple;
	bh=10JvqHYd1g2pjuuvL77GTnpK9XnQZIJBzWWTfyesHUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYX2+16HtzddKzD/dASHBSkw+f7BsxstBCFFs4ely1pYmj6sRTQ+WEqf3jpIP1/TKAq386DMWzEZUqqBV6WP375SME1EEdlLsYoNXIv5JVYG5943yq1EVaHdF0FsrepSdO7gl3S8iy7/hvFPw7/Mg0WE1Olt9uaf2RD2DXJ+v3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=02oNzWZg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="02oNzWZg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso210665e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Aug 2025 10:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756315829; x=1756920629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYYctumKADjof5tvwCf6IXKsYDBtRsoy66Tbx2zq3Nc=;
        b=02oNzWZgDKxeUYLeYZyxfXCaHRhyCnCH+OYgwfnV3ouZgExBwMZ9lwVT4FhWKnAWpS
         z2KZtm3ttWwDECG78NqcfYnodz9aFbPIJ9UOZk+vvOzbEnrTUh3/I7Ijv41Z4dchOqVb
         EpR4dlJjHAq/GXbMMqSxR2dYC5JkM98dMRAN1vCnOGvraRxCoKKVDlCLTEam3BTh/yma
         YR30vNcoi8jyVCvcYoeTxmhfQf7jyWB7nE4TM0MI6VtvSAM9UL37udXJdPRywgUNpoJe
         oEryLTwQw0QjZr48HwGz4S8khNRf3Tkf7SN8HWcU2jcimhtNGXroinoCfknGFFXKasfm
         64JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756315829; x=1756920629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYYctumKADjof5tvwCf6IXKsYDBtRsoy66Tbx2zq3Nc=;
        b=q2H0R57nRcIuG/Xg0gebjTu8MiPln/8Lrxmfhth/qYsYyrKTP9z+E+/Mb+MZgehOJf
         VEu3eW8grHZMtfpoHD6u+AzhIWjgCNO6aF1lWKHyA1eyqXT82dMnu2U9F0AjdTT8uBf+
         gpaNOsOsIQeJVPf1bTjYTqrCVDuMmdl7iJZvRViYpz0OiyYyBdetC5rMSBeKucWAoQ4z
         f6wsgL5p7MZcr8YxZUWCyJQAexPjnlg6KP+I2zH6FSwszr7eYBYTEQ2gRNFW2SQvSflq
         sw6ztulGRQx/k500kbZsu74O2ZioC8zDO3vm/NysW/RmWOjPvWZUIjaK3tmN5QbyDtre
         HDZg==
X-Forwarded-Encrypted: i=1; AJvYcCXvz3cs+o3ZbLmvTVKQtV8rD3yVr5PUspHaSYMACaXzLTFjH3HaZzdpvW3SXBHDanKc/D0e3zfLHLDOrgD4lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVGV5bjeUwpSgiFb1b4cxEFexDgHHHDdJu6JUJQaLrB4tRU8HT
	0aM7jv/bdi1S5i9CObpNYhwiCarQocTywS740OYGLMz8FRsyBZXytssVgjAzEhmdK95zrIANOmq
	DpEXckBUPc0ZpdorDsCk7vJym9Yr78Js+y9Xl2O0T
X-Gm-Gg: ASbGncu021wNpcdwcDADUMFrMqLcnK4Wi67wFI0xbwAJV+cptZA1alUeCkDGrW4e+IP
	S4dMdOAoir4wp3tSVgn+m9moXSjqSjGDatGgLPraPzbFFcuV0p1l6sdU4XchxBiVlezkvTe6a5N
	JYLoiCbGRQAOAy7ndhl3xjAJ+x/uBc9UVghYKdtaUG7zB4Dg/0WKDZglsxgplLoooRNJvzJMPQN
	9zyUQbNOTiW2S0QEt//naE9VGj4LHycOTfOxMcbC9OXrOMy+vjmrL10oQ==
X-Google-Smtp-Source: AGHT+IFsy9m0Nmxt0WGUHWkcUUxKRAaFu/H3NPqh4ubgQxSGvZgjCCoC6FYqLnSy/hQbQZtlABh+GmuHsgAHUVGl+uU=
X-Received: by 2002:a05:600c:4e90:b0:458:a559:a693 with SMTP id
 5b1f17b1804b1-45b517b957emr198037425e9.18.1756315828898; Wed, 27 Aug 2025
 10:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814093046.2071971-1-lossin@kernel.org> <20250814093046.2071971-2-lossin@kernel.org>
In-Reply-To: <20250814093046.2071971-2-lossin@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Aug 2025 19:30:15 +0200
X-Gm-Features: Ac12FXxyNEyqCgkdXDD6Ij0Hk7m-4CU-xCxwWeT_l_WGRmeGZpIEa_WiEvkOoFc
Message-ID: <CAH5fLgg1gMBE1_LjwXqpbg8zK_1ve_STNwQZWmTq6nfsxpTHpQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] rust: add `pin-init` as a dependency to
 `bindings` and `uapi`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 11:31=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> This allows `bindings` and `uapi` to implement `Zeroable` and use other
> items from pin-init.
>
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/to=
pic/Zeroable.20trait.20for.20C.20structs/near/510264158
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/Makefile                     | 14 ++++++++------
>  scripts/generate_rust_analyzer.py |  4 ++--
>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 4263462b8470..09d4f389240a 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -184,12 +184,12 @@ rusttestlib-kernel: $(src)/kernel/lib.rs rusttestli=
b-bindings rusttestlib-uapi \
>      $(obj)/bindings.o FORCE
>         +$(call if_changed,rustc_test_library)
>
> -rusttestlib-bindings: private rustc_target_flags =3D --extern ffi
> -rusttestlib-bindings: $(src)/bindings/lib.rs rusttestlib-ffi FORCE
> +rusttestlib-bindings: private rustc_target_flags =3D --extern ffi --exte=
rn pin_init
> +rusttestlib-bindings: $(src)/bindings/lib.rs rusttestlib-ffi rusttestlib=
-pin_init FORCE
>         +$(call if_changed,rustc_test_library)
>
> -rusttestlib-uapi: private rustc_target_flags =3D --extern ffi
> -rusttestlib-uapi: $(src)/uapi/lib.rs rusttestlib-ffi FORCE
> +rusttestlib-uapi: private rustc_target_flags =3D --extern ffi --extern p=
in_init
> +rusttestlib-uapi: $(src)/uapi/lib.rs rusttestlib-ffi rusttestlib-pin_ini=
t FORCE
>         +$(call if_changed,rustc_test_library)
>
>  quiet_cmd_rustdoc_test =3D RUSTDOC T $<
> @@ -521,17 +521,19 @@ $(obj)/ffi.o: private skip_gendwarfksyms =3D 1
>  $(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
>         +$(call if_changed_rule,rustc_library)
>
> -$(obj)/bindings.o: private rustc_target_flags =3D --extern ffi
> +$(obj)/bindings.o: private rustc_target_flags =3D --extern ffi --extern =
pin_init
>  $(obj)/bindings.o: $(src)/bindings/lib.rs \
>      $(obj)/ffi.o \
> +    $(obj)/pin_init.o \
>      $(obj)/bindings/bindings_generated.rs \
>      $(obj)/bindings/bindings_helpers_generated.rs FORCE
>         +$(call if_changed_rule,rustc_library)
>
> -$(obj)/uapi.o: private rustc_target_flags =3D --extern ffi
> +$(obj)/uapi.o: private rustc_target_flags =3D --extern ffi --extern pin_=
init
>  $(obj)/uapi.o: private skip_gendwarfksyms =3D 1
>  $(obj)/uapi.o: $(src)/uapi/lib.rs \
>      $(obj)/ffi.o \
> +    $(obj)/pin_init.o \
>      $(obj)/uapi/uapi_generated.rs FORCE
>         +$(call if_changed_rule,rustc_library)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 7c3ea2b55041..fc27f0cca752 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -139,8 +139,8 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>              "exclude_dirs": [],
>          }
>
> -    append_crate_with_generated("bindings", ["core", "ffi"])
> -    append_crate_with_generated("uapi", ["core", "ffi"])
> +    append_crate_with_generated("bindings", ["core", "ffi", "pin_init"])
> +    append_crate_with_generated("uapi", ["core", "ffi", "pin_init"])
>      append_crate_with_generated("kernel", ["core", "macros", "build_erro=
r", "pin_init", "ffi", "bindings", "uapi"])
>
>      def is_root_crate(build_file, target):
> --
> 2.50.1
>
