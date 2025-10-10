Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673026FA77
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Oct 2025 10:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760090893; cv=none; b=S4q3g5rpyfsEp0NYSZ9dlVNzapddKnC4i6L6A5prSkNjAR2ipASRHenlUt6LGny/9VV6dXMwp6lyiD9dQj9vh9eq9xh7Zk8qTHj58bqsU65pAvFUCO+riJMSyzugasyop89Cd/M1w4WLD8+9utGSBHNANq2+43Q7hFC1awYfN/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760090893; c=relaxed/simple;
	bh=757Rw+peN+Z+BJ0/8voAoRMaixAMA8al/pwz/vHpLTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpBBZjKhXOQ4CUCAYQYqXN93zY2KGnULsG80of+TDC44sGD6H5NMXoc52L4YMZKR8s9rn3SilaPlFI5G3mt4Ya+4UD64TK8jVxyU7dCwaoMvy6oez/Hh/lTalf8/RM5TYODj4H7AIYsFh4Roz50nZwcNrguuVDpBO+/VDkD0nvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gv+2ROuZ; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gv+2ROuZ"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-42486ed0706so10674395ab.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Oct 2025 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760090891; x=1760695691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JuJuRZhLwsG+1iMul2+WUv/TYmYlRZZULI5AyK9zhk=;
        b=gv+2ROuZoZuZIfM+32jfHanl8Umoxdr8Z4l10AxpS6wpSMdSlQvpoa6KNvOaoh/LYh
         NLAGd8YVtr29csVKesy5gAjCixVkL7Th8LfhqES27iPdu5cmadLqLPYNbpLd4oXmS/vt
         3CaULv6/DMh4m31eDsXW9jSm6MFBc8RKMOySPPcC5O69GrqC7LYcFQXqMVn74QMZK0hV
         qe3eHEf/3oxFe1cYtkL+aJ983kQ7dsWDrO7XEtfVOt/diK2b6eiJO85SreSmOzDSgeHd
         ub1fblu6wOrcrloGo4rVwkynCSvq7P74pnsaZoLun+1s3V4PQHqvfMQJwcgM2OfSgiXQ
         CM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760090891; x=1760695691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JuJuRZhLwsG+1iMul2+WUv/TYmYlRZZULI5AyK9zhk=;
        b=a+98mib6wwdq+qRivC+dx7qdGTEIkA79qSykKARgYNW6ZrIhjiVqWP8sosqSv1Cn5O
         EARexcN4IeNvDqyi7Ft+KxQuAMcBd3JwFV6m55LVIGlQdgdwNgfMkKhcgW8rWIguIlwx
         YVGchSJnyAVjdokDCegTAl0ovzoisuv+eD59poarHQsYdHKeVgc3IQDmBvEvkyFLDky3
         g+Sk5i51k+o9T/CYSixNo7UvwtXlVMkDv0sJe3dvz9efJ5UMQAhCr0ZK67KOOWzsvBDH
         qKZu0YFEt4YnlLrXu8uBznVqzTxcOdYfeLU6HCLpWX1ulZD52L7oO4V6E2BvWbo/XFQ3
         t/Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVjQ2BxKej0L5LQ+8pTyryPgoGss6cf/DU2xL6bQgTIvduKy7eHb83kmvzi3xh5xKWh//NCdrpNEBrZ1Vaj2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNnh2tISGDnRrTud2gc/5GMoqg+1cQU0IXWCNDuz5kUWxNF2VE
	/jA46YtO8T1obii76zO6CqoklV0GyoMdo5aTUSWITfqrN6VVLjZhabbJG5Fh6ewybAFFB98RN33
	sMcM0f8yzLkvtHw5ZVEctg1D8r+VtDSs=
X-Gm-Gg: ASbGncu2qwp/usbaT3U0vrHeumlGUYp5MZdEnTsEASxPQHND+m6Dn5NcJramoOJ5gC2
	F0YfmiJjs/uMRsNUHqhQ0KTFc6u+lrYBfNq3HXU20XPUCCE8t06VaUKZC7fhnlJyv2qW+pKpZfe
	Em2hqaxtRj0bC63shSgcMs+hMpKYKM31hEGQ1gJXFeTcInX+hbwGnbG9YVd0YFOPNmXkWu09+YU
	ynVegR2fLq3McdqWzgN+L5vyz6Udcl2sg4I5bQ2MA==
X-Google-Smtp-Source: AGHT+IGuRdBMYAkwKzsAFlzdYolufmnZhc4gT3Qkanm3b+H0ZT0F+1Fkx1oHfqeGTKvMgS5xq+3CPhlmxRxpaK9+R9M=
X-Received: by 2002:a05:6e02:18c5:b0:3f2:a771:9fb3 with SMTP id
 e9e14a558f8ab-42f873f432amr105318985ab.27.1760090890836; Fri, 10 Oct 2025
 03:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com> <CANiq72nbERSOWKRUTJ96YYKCDeAoHLBuiVP+XkDUKg7JYkoyiA@mail.gmail.com>
In-Reply-To: <CANiq72nbERSOWKRUTJ96YYKCDeAoHLBuiVP+XkDUKg7JYkoyiA@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Fri, 10 Oct 2025 19:07:58 +0900
X-Gm-Features: AS18NWBVMcBD24mf1KqbL440nVAyfGu-ZCbyG3tLNt_guISUTjnPv0xN-eS_TOI
Message-ID: <CA+tqQ4KG98XcWh3rkAxEOiACSUtPf7KM0Wqh9Af=POgVDHJzzw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rust: add `TryFrom` and `Into` derive macros
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 1, 2025 at 5:13=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
[...]
>   - My biggest concern is the overflow caveat, which is a fairly big
> one if one, especially if one is dealing with runtime values.
>
>     Can we do better? Accessing the discriminant via `as` is available
> in const context, and you already have every variant easily available,
> so can we check that every variant fits in the relevant target types?
>
>     For instance, by creating some item-level const blocks
> (`static_assert!`s) -- dummy example for an unsigned-to-unsigned case:
>
>         const _: () =3D { assert! (E::A as u128 <=3D u8::MAX as u128); };
>         const _: () =3D { assert! (E::B as u128 <=3D u8::MAX as u128); };
>         ...
>
>     and so on. There may be better ways to do it -- I just quickly
> brute forced it that unsigned case with what you already had for
> handling variants:
>
>         variants.iter().map(|variant| {
>             quote! {
>                 const _: () =3D { assert!(#enum_ident::#variant as u128
> <=3D #ty::MAX as u128); };
>             }
>         });
>
>     Maybe this was already discussed elsewhere and there is a reason
> not to do something like this, but it seems to me that we should try
> to avoid that risk.

Thanks, I see your point, and I agree that compile-time checking for
potential overflows is a better and safer approach.

That said, it becomes a bit trickier when dealing with conversions
between signed and unsigned types, particularly when `u128` and `i128`
are involved. For example:

    #[derive(TryFrom, Into)]
    #[try_from(u128)]
    #[into(u128)]
    #[repr(i128)]
    enum MyEnum {
        A =3D 0xffffffffffffffff0, // larger than u64::MAX
        B =3D -1
    }

In this case, since there's no numeric type that can encompass both
`u128` and `i128`, I don't think we can express a compile-time
assertion like the one you suggested. While such edge cases involving
128-bit numeric types are unlikely in practice, the broader challenge
is that, in signed-to-unsigned conversions, I think it's difficult to
detect overflows using only the `repr` type, the target type, and the
discriminant value interpreted as the target type (please correct me if
I've misunderstood something here).

I'm considering an alternative approach: performing these checks while
parsing the macro inputs, to handle all combinations of `repr` and
target types (such as `u128` in the above example) in a unified way. I
believe this makes the behavior easier to reason about and better
covers edge cases like conversions between `i128` and `u128`. For
example:

    const U128_ALLOWED: [&str; 9] =3D
        ["u8", "i8", "u16", "i16", "i32", "u32", "u64", "i64", "u128"];
    const I128_ALLOWED: [&str; 9] =3D
        ["u8", "i8", "u16", "i16", "i32", "u32", "u64", "i64", "i128"];
    ...

    // Use this function after parsing `#[repr(...)]`, `#[into(u128)]`
    // and `#[try_from(...)]`.
    fn check_overflow(
        discriminant_repr: &str,
        helper_inputs: Vec<&str>
    ) -> Vec<&str> {
        let mut violations =3D Vec::new();
        if discriminant_repr =3D=3D "u128" {
            for ty in helper_inputs.iter() {
                if !U128_ALLOWED.contains(&ty) {
                    violations.push(ty);
                }
            }
        } else if discriminant_repr =3D=3D "i128" {
            for ty in helper_inputs.iter() {
                if !I128_ALLOWED.contains(&ty) {
                    violations.push(ty);
                }
            }
        }
        ...
        violations
    }

This is a rough sketch, but it gives a consistent way to reject
obviously invalid combinations early during parsing. I'd appreciate
your thoughts -- does this approach seem reasonable to you as well?

>   - On other news, I will post in the coming days the `syn` patches,
> and my plan is to merge them for next cycle, so when those are out,
> Benno thought you could give them a go (we can still merge this with
> your current approach and then convert, but still, more `syn` users
> and converting the existing macros would be nice :).
>
>     (By the way, the linked patches about converting the existing
> macros to `syn` are an RFC in the sense that they cannot be applied,
> but having `syn` itself is something we already agreed on a long time
> ago.)

Sounds good -- I'd be happy to give `syn` a try. It should simplify
the parsing logic quite a bit, and I believe it'll also make things
easier for reviewers.

>   - Couple nits: typo arise -> arises, and I would do `repr-rust`
> instead of `repr-rs` since that is the anchor in the reference that
> you are linking.

Thanks, I'll fix them in v3.

Best Regards,
Jesung

>
> Thanks a lot!
>
> Cheers,
> Miguel
