Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45231607A4
	for <rust-for-linux@vger.kernel.org>; Sat,  9 May 2026 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309362; cv=none; b=X3IdcTViCzdpEb5n81Lg2FEkYWQLHjwml0YCNZGVwKxKDl0fpzTEMEQFB3rKPSu3sxEoca1Ji6pMtVGwv89Ch3gQVeM3JSAFHJqNprYO9epiteu4CU87voSyjgJNl/UrAO6PQPrJjX9JKbm35nvnHmJi1bE7YQx2SzTZwD6WhWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309362; c=relaxed/simple;
	bh=9G6tnkGHYxJ+/t3jD8og8VQ9au8cqrNIomgFudUQDLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UnzVCZJePOxPe6xK0gjI8S/n4xBUhqAho3ONNLsYaOTHS70wH/1ZQ5N2YgtX38+N36E7mJsByTaeeiH1jC5SvYlNuquY0Cp1+gsZxSQH4+BJkig/VCWbFL/YyI9xVDfnmE3w/nnpu8hXAwku/gpYKhE70nRImqBvmTEyDFvuUqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=HYsIeal1; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="HYsIeal1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1778309350; x=1778568550;
	bh=SxFMYMDXNgEd9NX3SOd/yhfWoQZ6VhjH2XG4SiVacX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=HYsIeal1A5Uuhpj4FF8STjxAU/tavyedff+SvTApE2Z1Kok68TeYn2KfkxXZ3AshZ
	 RML9RAjIgKaOx5szLCSDFJ+tqwdIHPN3JXZEkb5clLxHY2hYMaAh4xO8wvrFLiYMXM
	 1erasdTXDMCvMSnKyEors1ENuBhU5xUgQJrnL6alq3C7J1Y6+VOWAXm1mhDvFuM6XP
	 UxJafoFvIMAdO7Fx94ccg/PnFE28+isajWc1IGWbKEUfwPd6U6YdPy79M0LGqg4vbG
	 7axrdLB4vz5fnyL9aJB+eJhHEwaDz1ffdzaED26ZGxpM3eZdVrmuvezAbL/L5qEez1
	 +WQSIrGZxN3MQ==
X-Pm-Submission-Id: 4gCGmg1KXjz1DDXS
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Gary Guo <gary@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: pin_init: internal: use `loop {}` to produce never value
Date: Sat,  9 May 2026 09:48:42 +0300
Message-ID: <20260509064905.536777-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260508152950.833635-1-gary@kernel.org>
References: <20260508152950.833635-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 08 May 2026 16:29:49 +0100=0D
Gary Guo <gary@kernel.org> wrote:=0D
=0D
> From: Gary Guo <gary@garyguo.net>=0D
> =0D
> In the `init!`/`pin_init!` macros, we rely on a trick that assigns never=
=0D
> (`!`) values to all mentioned fields in never-executed code to let the=0D
> compiler check that all fields have been initialized.=0D
> =0D
> Currently we use `::core::panic!()` to produce this value, but before Rus=
t=0D
> 1.91.0, it creates outlined `panic_cold_explicit` functions which do not=
=0D
> get removed by the optimizer, thus leaving dead code behind in the binary=
.=0D
> This has been fixed by [1], which lands in Rust 1.91.0+, higher than the=
=0D
> kernel minimum version 1.85.0.=0D
> =0D
> This causes ~200 dead `panic_cold_explicit` instances being included in t=
he=0D
> binary, with ~90 of them from nova-core's usage of pin-init.=0D
> =0D
> Work around the issue by using `loop {}` which creates the never value=0D
> without macro expansion or function call at all. All instances of=0D
> `panic_cold_explicit` outside libcore are removed by this change in my=0D
> kernel build.=0D
> =0D
> Link: https://github.com/rust-lang/rust/pull/145304 [1]=0D
> Signed-off-by: Gary Guo <gary@garyguo.net>=0D
> ---=0D
>  rust/pin-init/internal/src/init.rs | 2 +-=0D
>  1 file changed, 1 insertion(+), 1 deletion(-)=0D
> =0D
> diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/=
src/init.rs=0D
> index fbc8286263b2..b1cb2e53ee6f 100644=0D
> --- a/rust/pin-init/internal/src/init.rs=0D
> +++ b/rust/pin-init/internal/src/init.rs=0D
> @@ -338,7 +338,7 @@ fn make_field_check(=0D
>              ::core::ptr::write(slot, #path {=0D
>                  #(=0D
>                      #(#field_attrs)*=0D
> -                    #field_name: ::core::panic!(),=0D
> +                    #field_name: loop {},=0D
>                  )*=0D
>                  #zeroing_trailer=0D
>              })=0D
> =0D
> -- =0D
> 2.51.2=0D
> =0D
=0D
I don't know where this patch is based on (on current upstream there's no=0D
zeroing_trailer thing), but at least on the upstream side there's another u=
se of=0D
::core::panic in the same module.=0D
=0D
-Onur=0D
