Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119832377F
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jan 2024 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rCAJ3Bvk"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-20503dc09adso320206fac.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jan 2024 07:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704381491; x=1704986291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZwnS2Sp7vv2PRnAVDjhBATPiqXuD/DhpKZdALVjptM=;
        b=rCAJ3BvkuCa7svBTTM856xsJPAk0VrRSewLOS76ssEEYFUMLkOQKxTAhEfU/q4F9nx
         P1hlyurUeuklxdcXm1cr+3xtujrxNuKtkXt6qrqTeKFc9NBlPGEQOIhrXh0Oc3Xj7NOc
         YqZEqqfqfVjgQnkwQERoXncM31CR/OPaiQThbiLF0VOx/n+YdoZ2UDpOOFVz2PwDWswD
         g4JwxUNMwTxZXt0LiJeehubl4+x01WCUckMz97O+d3Ft02NeEzIAgZVNv6y4x4JnUGlS
         /VcwPGI1LxQJZF3u2cZwTwyf/GKqX6rMz53BQBvD1diyBkrkUqElCd1mayDsfh6DgM4c
         U51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704381491; x=1704986291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZwnS2Sp7vv2PRnAVDjhBATPiqXuD/DhpKZdALVjptM=;
        b=ZRD4A9kTucNXSt0zbTJ0hlEpQXNo6at2iVgRwvXPTTtoVf1P9AH7J61LqqHfBM3Hm7
         MTkJM6ZCH5vulQvNvOHMgxQSWUVKQzaLocoMy5YqE7vSHrrIpMSruHufK2WeDzSjhvsZ
         uJIObKtuBkFEuxUCYqzHxDFIjORdXxV9TqQOMry0fSRDb9aCQjHGJsiG85Bv8tFLT0H4
         yWzLtz9wjQxK13a+KmFb/kAESG56dS0xYZtbtuHURxQS9ZYVDQLKHYXIVcjP8oC+m3pn
         mCumsrDDemeDtN+F1TG1NovtbfCvYyX/PPPlIcbd77aiEGNAmoUZ0lxxX8iR7T/Uig4I
         0Ufw==
X-Gm-Message-State: AOJu0YzX4npw37wpHUanVMlqc/4W52QmWPWzYpuHR5hk9b9VjCtgUAoh
	lZ1Z8I4iSa3rJHeOtb5H+PB2CS+xO/M+Ut69S+pXoqVHSUfr
X-Google-Smtp-Source: AGHT+IGfMPGT98T1eBmmQHiBufvEQT/Hgt8TdGqVsNK+ddk26PvAtema7RxLe/wukaMT3IVYTmHVvLe6wRZS15AVPsY=
X-Received: by 2002:a05:6871:4e46:b0:1fa:f508:b5cc with SMTP id
 uj6-20020a0568714e4600b001faf508b5ccmr722750oab.55.1704381490990; Thu, 04 Jan
 2024 07:18:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213220447.3613500-1-benno.lossin@proton.me>
In-Reply-To: <20231213220447.3613500-1-benno.lossin@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jan 2024 16:17:59 +0100
Message-ID: <CAH5fLghY3o5keT3UGUd0h1eb1WXT98BVYsrOpwpvAKq=7NVsXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: macros: add `decl_generics` to `parse_generics()`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Sumera Priyadarsini <sylphrenadin@gmail.com>, 
	Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, Asahi Lina <lina@asahilina.net>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 11:08=E2=80=AFPM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> The generic parameters on a type definition can specify default values.
> Currently `parse_generics()` cannot handle this though. For example when
> parsing the following generics:
>
>     <T: Clone, const N: usize =3D 0>
>
> The `impl_generics` will be set to `T: Clone, const N: usize =3D 0` and
> `ty_generics` will be set to `T, N`. Now using the `impl_generics` on an
> impl block:
>
>     impl<$($impl_generics)*> Foo {}
>
> will result in invalid Rust code, because default values are only
> available on type definitions.
>
> Therefore add parsing support for generic parameter default values using
> a new kind of generics called `decl_generics` and change the old
> behavior of `impl_generics` to not contain the generic parameter default
> values.
>
> Now `Generics` has three fields:
> - `impl_generics`: the generics with bounds
>   (e.g. `T: Clone, const N: usize`)
> - `decl_generics`: the generics with bounds and default values
>   (e.g. `T: Clone, const N: usize =3D 0`)
> - `ty_generics`:  contains the generics without bounds and without
>   default values (e.g. `T, N`)
>
> `impl_generics` is designed to be used on `impl<$impl_generics>`,
> `decl_generics` for the type definition, so `struct Foo<$decl_generics>`
> and `ty_generics` whenever you use the type, so `Foo<$ty_generics>`.
>
> Here is an example that uses all three different types of generics:
>
>     let (Generics { decl_generics, impl_generics, ty_generics }, rest) =
=3D parse_generics(input);
>     quote! {
>         struct Foo<$($decl_generics)*> {
>             // ...
>         }
>
>         impl<$impl_generics> Foo<$ty_generics> {
>             fn foo() {
>                 // ...
>             }
>         }
>     }
>
> The next commit contains a fix to the `#[pin_data]` macro making it
> compatible with generic parameter default values by relying on this new
> behavior.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Tested-by: Alice Ryhl <aliceryhl@google.com>
