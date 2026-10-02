Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6373E6DF5
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 19:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968236; cv=pass; b=QIPTzfPk1sdpNyZvbpKqfp8d7+EQI2jDLDuHpnaYGqeNK9j+dEo1Mfq81AMqJr8DGMuJSHKRWfWE/pgXocV+BUta3/GAEfr4OUI3kFTVml76b0AZbDR1Hm8YaVyEt/sm6xpRumpMAAa7hk9XV3v2KbMI07E2QjSzI8tDwlX50dE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968236; c=relaxed/simple;
	bh=tsB4IUGeBxXB407dr7P/VmcfoWcXwEQEHgqAlrksksg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APO3qYdVx2P7aMmvJn/+xaDvvIrZM1Yap7nFYubOqHvBnnAJZt23tmyukrmLVGdNb0IMuEzX+JnDjC03aLWEG6FCWEu3sepboApcTmrbJHuYmiFo75ImG8xp5e/d+wf6NF/vUvwgMplcyyQOceiTjt6+iFcURK1xNRZPQmG0wlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEWjyYJF; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEWjyYJF"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c5d196b0bso438317eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 12:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790968231; cv=none;
        d=google.com; s=arc-20260327;
        b=GhI14IpjHIcHkKrp4C5c1oNOhkdHeLQ0cqVn/L+nKhn+MdXDWo8IYrDbAXmNoA3lpx
         g4q8YEmGnXx5zfIU4pD9+rOYmjD0QIRcX2pF5wUViTRwPgmJ97JvbL92Gt7E4yvEDA6Y
         rJ/9FiH3QUuZRiN+vtlLexRD4kLomQiROP0kN8cuFc8RS0xt80u9xk0zXz4eUh2errRC
         aCxJD4veRsIqKmiBNSDP5pdhuvhE4HuIgkLyFihwBq/ZZ9fdS6tzsUVejdKvL52gEl88
         3mB28+xoWrnj18QrUXSh39sMLnKxpP93bFN3O9lzpvy7tTnoB5V90CAn2ux5HgQo486S
         DG1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yNUbqNQCHKJZj5iwk1OkX595wyUJMGq5rX4HKhBykn0=;
        fh=EPjwAGBG5fTHL5YSEjETytNOwJfikzxCDHs9fNP12Cg=;
        b=dEAnQsptOV5HpW+5OCnlLmIrTZVOmybuNvUJWtPhcwm7hIYF+BNGEGOkKQE8cVbBlC
         A42SfyjMFFRnBzpEJyXbEmZH6hKTr311Fx4NmbaY/I1D5aj2Snt2rSHAKyE1sbI4+R9O
         HXLSAISoLe5KK2c+bSpG4KA//1Tx5RYoDGWHstTeVFYnEtsE4TkTCs1NDoNUBQu3HpQX
         XvtQa7RTW3iTW0U2WRZ8QKo9CJ7FdJZKPl/nnzyvXTjwki2H8dTHxNMZbVpi2IVoYr6A
         bkKnm3XxtTcOSawpENWvKhRXt0omOcUalNYtwxBWEQT4G9bswz/MkJNe5ghL4I5AQAxh
         NceA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968231; x=1791573031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yNUbqNQCHKJZj5iwk1OkX595wyUJMGq5rX4HKhBykn0=;
        b=sEWjyYJFbKrMiiw2xoUeBiT9/IGk3/nQ4kip8yM/KeN1FbGxi0ae+vrhZsCVWKGxlz
         RtRYNGG14/GkcFi1q4HSRTaSZd/utvD1MorqXNz5nA05hIwkI/B1xmTJNg9Q+hZXigpL
         DY7841cy+U/rw6YWYvh0yh+qiB9WfFJhDtC1md78eM0+58z+IOeY5amTqEewdzVpa0BL
         hB3wbSUU0joX/ALNcyml8JyG8dlnB9XRfXzXKuMsfec5iOERXgNdMTJXPGU0Bv6rFu4p
         x2UUY4b6iP8PMYwJiWbX+B4iCS1jotHdDt3PHQS/f/B1xBwRpQWIhxi0p/Lnf0XCexrG
         c7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968231; x=1791573031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNUbqNQCHKJZj5iwk1OkX595wyUJMGq5rX4HKhBykn0=;
        b=2kN95KimTJkGDBA1SBZF9Agj8g5eKnHVnMm053SVRr0PHpEu+Zhi4ongZn4qHUd0di
         o1heUQvP0MrzHqB5O0124wzLS5a6x8Uv/RwmCQeNij0oirZ5fno3Rgprb6fH9KVe7r1x
         vkotpc7ehB+vYZBokPF/CJG/wbx8K8X0GMRbFiwmCqYS3+2t4dp7xmcUQNGSWsgVjJe7
         iChMHh0SToejod9Vpi7/dcOvcFMU7gQBoW1zEJB8vrfihT8GV1olWw5zXkqgLeDj5/6h
         4+7Lrppyg6sQ/Mn4ar6y6o6a1dWR//BfAC8e8TlNXRTc8yN2nv41dD3o7JFfCazSlPa+
         7Bqw==
X-Forwarded-Encrypted: i=1; AKwUvBxNgcaTK4Aet9wh98IQsmPB41wH6qnTH3Js9CT931ePXi3KIWGzlLlMdKB2R2rC5l2THJ7hIeh0bYfkSy6Ebg==@vger.kernel.org
X-Gm-Message-State: AFuF++mOmujnurqK6BZgyCMVMGqSh/aCt3CQEmUdVXxw2ZWQBtcjHTDS
	/mnwcdycLrOCtsQ2W1NSHlgHBL05gb5v+oe0X8g0M5DF8eeIm6Xk1Cezz2zjP/3u3ahr+PIwuGR
	WeoXFjU3Sx9zhQpYKukSO0SX1kKEs7ek=
X-Gm-Gg: AYBFou05OFbXb/Bz9qEQGA6YA6XhcrSTiL8zyqRFRtvNHGt8xzkVPzR/lsfgtEzejbZ
	TyVzHM2ClkyRUE/d5mVQNeXjkJ/jpDTIGn8qzkswCj5YQ7iXlR4vyk5OyfXPWDo2VRbXH+Eduak
	Xf/urTRfhp2LRbYJD8MpcPEF8zM45/uYWb85C+aDTJzr72FgoSwmn9I0fEMzlRq/nfo8cjnDhV3
	8teA2KyMhFIzhWKBbs/Dh1ZI28/aC5/emVUu4e+uNXtaweTBcxWeI+EOdvOGBvGRathS+txyWXI
	VmJu3qMeqSCDYypVS86DBqFpwJNkN1AVKC3PdhuN3BXmQ/HeUGoCLyMJayYh3W/GYTpYM/bkCvL
	kyb5zW2/naBeCl6bLPyQtOg4FS3hN169dovgSSfbRrnpZaSTKAuLi5WEdJWoJb7+NVF+uIlQmif
	/Q5S3DXOMzaCa/p7HFMkL4OSpP4qlUlIvRZYmsvn7UKeqtwXrILxvVFlj8N0msOQ==
X-Received: by 2002:a05:7301:18ac:b0:34b:7c9c:9a69 with SMTP id
 5a478bee46e88-34f06678c69mr5525272eec.0.1790968230985; Fri, 02 Oct 2026
 12:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net>
In-Reply-To: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 21:10:18 +0200
X-Gm-Features: AclHuK9O_olN2liVpV_HQXYkyGUi9E_lc5eestVbB8U5SeeEQTTudNCDACSsowI
Message-ID: <CANiq72neqitKHftQ9UVJaKLkcUdX8uAWLtoE08-G784mqX+H9w@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: macros: vtable: add `#[optional]` attribute
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 3:56=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Currently there are a lot of boilerplate with the
> `build_error!(VTABLE_DEFAULT_ERROR)` because Rust want a default
> implementation but we insert `NULL` into C vtable and never call the
> Rust-side method if it is not overridden.
>
> Add an `#[optional]` attribute that injects the same default
> implementation to avoid duplicating this everywhere. As an example, the
> misc device vtable trait is converted.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

    [ Reworded for typo. - Miguel ]

    [ Rewrapped docs. Reworded message, comment and error for typos. Rebase=
d.
        - Miguel ]

    [ Reworded title for prefix. - Miguel ]

I was tempted to replace the hardcoded message with the
`VTABLE_DEFAULT_ERROR` constant, but I assume you did it so that we
can just remove the constant later when everyone is migrated.

By the way, did you consider allowing `unused_variables`? It could be
nice to not have to use `_` in the signatures.

Cheers,
Miguel
