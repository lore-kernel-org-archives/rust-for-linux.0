Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B654F93A1
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 16:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960389; cv=pass; b=M8BggUBdL6ZcIijhyQpig1664oL175cKigILLvSBMb/ZObhfp0Ad6lJeL8Wp3+IoBNqmPbMaYpjMjXgK8zJHkAgAHw79RnFcQONdk6DnnSgF5tWEYJ7YtNkXkiCsI7NQIBv8LP6odFNZw/Gi0yQXYCKVEwQRppCc+bI4EPKx8D8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960389; c=relaxed/simple;
	bh=EHkJtd8Eu6RlYIDachMsn7gB1X9/FWHuhTARdLq36AQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwpHJjix/FB2uxlmVA+fNMOCC3eXikZL7SofrfXy63EgZcW0SeA3dzOKZhb5UPHjpgtC3xhcFBzd4R7S3yVHbBIKUx2m3LAF7bSd02AwuxlTV3ebVz16niMhR7UQy16w2HDZEGsD9zr54xs0UoT9uGzoV2347ib5w9JPIQR668I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpIzZ8Fe; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpIzZ8Fe"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso1188939eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 09:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790960386; cv=none;
        d=google.com; s=arc-20260327;
        b=OTCeQH2UQrD3JxJJqzLTRg7Zl7xGlogLZ/aR0KkQfNU8zTkIdSNsANwo7MqUk55BbK
         KzCMTyES7Ba2NHrZW3YVbrGy5kI/2LBxrUWfGOkSFXoriR5CXR+5RGHP0xE49Dw/5HoZ
         qAYfawEoOXqdekvb3bf+zL2hYJl745vNxUW/NbhEDC8VJNWDdZkKSLz/tvBff0KsHGnD
         D2hyjtSvYkH57a+/uQIyGXkbQn29+q8Rfo7p018A4x5pmV9wObTHM8HVWmSaCmGApEU/
         69SsFFAiLu4j8h4sLq9dEMGpYsZsTNQnPAapN1wF2wbWbXQoV0ovN9/fEIV3GEwp15UA
         fMWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oTUdZg9mDghQf1o9x+wxMpJYTch+gpQ19dcPDYZue7Y=;
        fh=y/sDFQvMqCFqF7pY80dVO73XdB7q+/2nWMGnvDdo/PM=;
        b=SSnycrGmiIPSh0Cy0ZFQoE1xyejdjqyeqRWsvbJyRQ5ovVBMeCI8RHSnFHJouSLIyz
         nBEXdO7/k8SQsdeenWU0G2EMd4yTOYnNQd/MSQwi9Oul7hJcLKtj2jg2fDVb0/7pVPwV
         8thuaEPQsIKoKENSDRZ4knRBSSle7jHbmBtziaWiyqJxOV6UAtn5TsdM+S/lSasYPm37
         yRy/0t2DEKdoRPffifAUZr1Jnh18Z2oR9o9ckJoyF/OHQ0gZSLmcQaV+xdOxBiH7etj7
         dSW0nd6cSaO+Wl0LVivSc8+oO1zN/CeVcM8f8BLwYKMJi3FEW+tviI6/iGB4bb2v/IvO
         f7Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790960386; x=1791565186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oTUdZg9mDghQf1o9x+wxMpJYTch+gpQ19dcPDYZue7Y=;
        b=mpIzZ8Fewhzw18Tfl3XgkOPOU1uONme0BMiA89Cy0Ed9IromRZD2/aKV6/49tOojkt
         GGflUKA/eaF3C19qoANFMP7tELK9jL2rH0AJG1lmNefizVTtwwjZwdzo8ZyMgz/I/M+B
         KnQ/pZE7RI88BZBdzoO3pDZEPAt8toVzDjEzTCJHl6+5nWlRYvTdPq/3v+UH4K4TJNVc
         AYHCmUjwexQBIbpRk+0ANUUfs7d4R5uQu8s8KBNwIsnjo77EyfVL6c+CJG2N2tLeDxHx
         KtfgRIa1f3IDIyeh/vAF3V9IepbtNT88mQs5iCzsTglwrmcG/OmyTfV8Ge4JIzj/nDlL
         dnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960386; x=1791565186;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTUdZg9mDghQf1o9x+wxMpJYTch+gpQ19dcPDYZue7Y=;
        b=PJY+XFk+Kapp+Ah0w3ai1YVDchvoGnug4OMDDJR3+MITdwkCpQLeSjbAJcu9H09FZJ
         J0FRnX2U7SiTIxx45pkOOahgmeZrUZTwj30KlGQ3YHaDqaO4CfZtW9adEtU+IvQFN7qH
         go0mLvO9gWL8q+4oO3kLE+oNCqKTX0wI2suD95arDkyRmanERErUwU/BElqEHFMbDOos
         yCDnQOU2eupzkD3/gV8z2sApNsVZvVnOeOfnX1T5HEi3hXOd7+q9/5AKyd9/hccUBJ1j
         1cf7YDTVGkQg/QyJKv+1rn65LIFvnWIJx2R2jloJvcHww6PNeJag1vYjr8yZTu9CELdG
         7h/A==
X-Forwarded-Encrypted: i=1; AKwUvBw9gl8L+zkLcWftec69rYUOiHHZ0dMbb0S0Hqy9rwU2QtiXPO9WYkOOJwurRbC/EerSMvJueGnqUmUSiqaBwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIpv7dVEbi3n8nDEus3p5rln1sDPe+8T7uobMmhVJVqixeqoWjA
	Irz4rwlG8qe9E3NgQtUizVFwsleG+PUyjdmxYzxb/mhggm/O8gg6HtS2c9JXX0PWgn+tbnlUJXA
	InDCDos/r/cmle3HHJ4EE8cVYlu7wJ6c=
X-Gm-Gg: AYBFou3lmkzCUSy/x8vIlvAPGLji27sbUxhzpsezufQRYAcYYDJIOg6EafNP2KS7oEp
	74O9Z5BMbPg2X/ROFMuvD1Svh77qofOjB0ImwiHr/CeHiqCTWwW3TqyKQ8R8gsCmRKB+mxY3ijd
	8t7xQLXPetmn91y3klfia/DG2VJZqu+OgE3TEfvmD9PWq4DaLsJWU3SGmARBdV02OYMD/m/m45U
	sOFPA5zEpuSj7dxz3VfInlolJkZ23Vyb7rRSojieQmpaaM+6RsZSvo9cw7gKQKH9XM79zBNXEKs
	DoI9Wc6TLaCMC1JsgF1MAu2yU9NGXIS4VfXNKv/2dPjCoyZQRBlcMAb62B7YGj/PDOHHTYCTOq7
	Je884egoP8QUycoxa7UwBbRXCSwT4i8Nd1v7F8vZULnhBu2n2uwipTbgV/K7/uE8Ibwpm26s8jX
	VnFs9Ot9RwnjjGM378sWf/twnfo3ihPJVY37l4xfhDp+QVLMMcAAqYw9U2pBXB1Q==
X-Received: by 2002:a05:7301:468a:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-34f1507015fmr4716231eec.2.1790960386330; Fri, 02 Oct 2026
 09:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-cv-v4-0-547ef5727451@nvidia.com> <20260917-cv-v4-1-547ef5727451@nvidia.com>
In-Reply-To: <20260917-cv-v4-1-547ef5727451@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 18:59:31 +0200
X-Gm-Features: AclHuK_QhqfJYiyMedO2piq5-wcrguEMff8QxYGEopB8UiRg5ASf89kljYpIsb8
Message-ID: <CANiq72m0PLhT=-ODzQtX7k3jn6=XXpESDUbnHcAmR-1gFqR7uQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: num: add cv! macro to create values from
 constant expressions
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:35=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.c=
om> wrote:
>
> from constants without a verbose turbofish syntax.
> For example, `const { NonZero::new(1).unwrap() }` can be written as

Word wrap or newline?

> +/// Creates a value from an integer constant expression, with validity c=
hecked at build time.

Maybe:

  ... a constant value ("cv") ...

since we explain that in the commit message, but not in the actual
documentation :)

I would also say "at compile time", and possibly mention it is usable
in const context (we use "build time" for things like `build_assert!`,
which can be much later, e.g. link time).

> +    };
> +    // Using `FromConst<V>::VALUE` means const generic expressions can't=
 be used, since it requires

Newline between these two lines?

> +/// Types that can be created from an integer constant expression valida=
ted at build time.

Ditto (please see above).

> +/// Implement this trait to make a type usable with [`cv!`]. Use the [`c=
v`] macro, not this trait

The second intra-doc link should also have a `!` for consistency.

> +    /// Fails the build if `V` is not a valid value for `Self`.

[`Self`]

> +                // CAST: the macro is only used for types up to 64 bits =
wide, so `MIN` and `MAX`

"CAST: The"

> +                // CAST: the assert above confirmed that `V` fits in `$t=
ype`.

Ditto.

> +                // SAFETY: the assert above confirmed that `value` can b=
e represented within `N`

Ditto.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

One thing before that, though: are these assertions expected to fail?

    const X: i64 =3D 1 << 31;
    const Y: i64 =3D cv!(1 << 31);
    assert_eq!(X, Y);

Or:

    const X: u64 =3D 2 << 31;
    const Y: u64 =3D cv!(2 << 31);
    assert_eq!(X, Y);

Because that is quite surprising, especially since we say "with the
target type inferred from the context" in the documentation.

I hope that helps & thanks Eliot for working on this!

Cheers,
Miguel
