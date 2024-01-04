Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63C6241E4
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jan 2024 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yryvG2Vc"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3bbd6e3795eso404364b6e.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jan 2024 07:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704381530; x=1704986330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yq1QDb6qMZk3I5/DUUjoS1xIca883SGj28CqAPW/BI8=;
        b=yryvG2Vcj7WdqACavep5kAOlyvodAijNAT6S++FT1A0xXQ0PiUKu1DcA2lINlK0MjI
         6UJxfzO3ihzgbAzCQuIOrf+9I3tQNzhEDPveA5M0mvKpm2AGhlo7vBCn3SbbnyBqtMfa
         29V65+TYOOaBhrAkxkfncjJGATAUnUaU/8T5fE6tYVYgylZFv7IRj6DjoSs8+yN9397t
         7Kmw1BxDSevpEGoY1SRDKY1Jf2UHrYa+AwLH+W8Ft9IlGkhnWDFjKMOX+NhO5uoFEy/B
         TxfffTnkaSNlrW1y+VMzBr3tHZi3YX2zLzAKdQUoNKo7W9xUlXSSvCS4BkZ0wLho3gcG
         uK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704381530; x=1704986330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq1QDb6qMZk3I5/DUUjoS1xIca883SGj28CqAPW/BI8=;
        b=wJ+8x2Vcq+EhWvXXqZlmPOPu8emjqbKqB3t1Pm9gCkZxn7jG6OfUnfNzcwFc+v9oCw
         yLBTAbkjpEfkrRYT5WH9ztZZGqWK+iqb83ZtHJYMmMjBfQUMuHzIG7r9VGyG0UaPeOSt
         2sni1V/kfRsJCogevZP24ocFsMfRC5Nvo+a+QE/WOWTndL8CALYHFgQP6TUqrEukq417
         xvJkUVCYFkUYoJ+hnOYIxIPUt0I6rRYYIfUkISVdspllc8JM8lC1kQp/p3i45eOvnukG
         XYqmnr3Z+3mIbScxIQX0q9pUwwNerJ6amnYl3tlnyKLnODT0YvDEEajm+0vFOEi9xdJ2
         dctw==
X-Gm-Message-State: AOJu0Yz+rVUxM75Kgw3UXdKCCn5CMKilfC4jn721X18J/7iUlPFUpaTM
	51GsM4bTaw4/Q2SefTQNCifVMUZHaC8ND78ii9uiY2SksQ2c
X-Google-Smtp-Source: AGHT+IF3Dflo918IleZ8UgZ/UuuZjqjkDFNPfGaU9SkeAMtXWX8kswde6L49DnrvqHKQRq38bhxIpKPfgWuGifusAvk=
X-Received: by 2002:a05:6808:3387:b0:3bb:c765:de28 with SMTP id
 ce7-20020a056808338700b003bbc765de28mr688920oib.8.1704381529703; Thu, 04 Jan
 2024 07:18:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213220447.3613500-1-benno.lossin@proton.me> <20231213220447.3613500-2-benno.lossin@proton.me>
In-Reply-To: <20231213220447.3613500-2-benno.lossin@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jan 2024 16:18:38 +0100
Message-ID: <CAH5fLgiKJpXF_jPnPj668P4DGjDwtfXs7dGV26i5kyLXCXLQ4Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: macros: allow generic parameter default
 values in `#[pin_data]`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 11:09=E2=80=AFPM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> Add support for generic parameters defaults in `#[pin_data]` by using
> the newly introduced `decl_generics` instead of the `impl_generics`.
>
> Before this would not compile:
>
>     #[pin_data]
>     struct Foo<const N: usize =3D 0> {
>         // ...
>     }
>
> because it would be expanded to this:
>
>     struct Foo<const N: usize =3D 0> {
>         // ...
>     }
>
>     const _: () =3D {
>         struct __ThePinData<const N: usize =3D 0> {
>             __phantom: ::core::marker::PhantomData<fn(Foo<N>) -> Foo<N>>,
>         }
>         impl<const N: usize =3D 0> ::core::clone::Clone for __ThePinData<=
N> {
>             fn clone(&self) -> Self {
>                 *self
>             }
>         }
>
>         // [...] rest of expansion omitted
>     };
>
> The problem is with the `impl<const N: usize =3D 0>`, since that is
> invalid Rust syntax. It should not mention the default value at all,
> since default values only make sense on type definitions.
>
> The new `impl_generics` do not contain the default values, thus
> generating correct Rust code.
>
> This is used by the next commit that puts `#[pin_data]` on
> `kernel::workqueue::Work`.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Tested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
