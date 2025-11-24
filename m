Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5676314D1B
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 16:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764000655; cv=none; b=uso3Az1EjvAKiyHKRVvfdBfl2/xyKTGJaNVxewC+d9XuNdwoWX7rDY/oAvwrB8G3ceAA+6WmaTU+0vMz3vNRQP/1QX2t9McmwpATve3irqydz0O5zRJjTQhllRqwpuGlx2RHN/U+2LDpR+n8YR7VD/HU7y5ksKLCdVLYi/0sgeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764000655; c=relaxed/simple;
	bh=57eglluhUM2nZlJclDwE0caSnfRd7PY6EbxwsIKzZW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtAbVA/gg6cI4j+OgfGfIJ17LYXi8giXe/JUuof0i++uttTyvmsUjtNvgLWs5D8XA2Y4eNFZXRYngVC0f0sfp02ATLDLhfrCSgImai0oX2LbVIaRTwfik13+IYtAMtIRxzDKJCJMnl/RQ5RYlQNcwgPbpSWnK2N128sp4BumafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tnWmWrRQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tnWmWrRQ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b713c7096f9so690676566b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 08:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764000652; x=1764605452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PNJKw8p/bVC9DDihKlO6wvtRyoc2CqJVoOEDDkEFruo=;
        b=tnWmWrRQNWeVC//eu2/fIIaE+0OE36czXlPaZPKymZj8MN9ZvhrssnK5+n7nYGAqDD
         ztQD8EYGkmKX/cot5R5oC+BgoqknKsDkNrZhcglYj/aX2XK32dBjAQa5Mr4yNrS/qE4J
         sUq53wFdwnnYQFgsuty2tlnnWckUK+XyAk76ZAg3K4MX5LAri2pa+2nVSy+UJWU8uclJ
         tAGnwiKdAThtyopLc4GZMtCHNLD7JyoGUBpQ6hUU+SqIRuI7+y+IiaQcL1iPTHngor8G
         iJGtWwj1Ya+Rd3uLs3K6yP/cKpag+i8292ScySxacQC8C6ZEWdDPN+TrymaMtjmKXQHl
         dfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764000652; x=1764605452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNJKw8p/bVC9DDihKlO6wvtRyoc2CqJVoOEDDkEFruo=;
        b=H69YR98WBm3gcfNQXpIQ/7soXaT1zUyabMMuxyyAcNobv1lint7Fh4uhhpdIXyI0q+
         HNhCIw2XUgXMkpdACIll2THGAa7ADzDy5BR+0BjCzIE1RNmOApvrxUJVb2x8Sx3tXBDq
         P6YXQ92tTY5W6ybCLErmIa3foVkBzhPtXMLkhqJ3dem13LB1VjlzOv5I2dtDpgOxN5Qc
         i2HQAnyckl0KuGJzp1AM3lF5kpOO4540XUS4ONlJUBFbmFdAU7c1F4LyBvHkMim9tm9U
         mXUaeNduom/jgOYfgzrOgeRgMUMIqogYKKnW7ml10JxYT+n/OH8KWM/UdzxVdvrSak8d
         eHXA==
X-Forwarded-Encrypted: i=1; AJvYcCXYhZyOhRwQ5jZDuEB/v4D+gQd1Pplt7qEM3wsLCwmfavUz0DyEpwsrXWngkTrt6rYT+sx+3TwRGBMAuWlHYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0RRgSqNDpTfEOuAbE9IpoI+ysYkzUFn/46+Gorw1EmYunmut3
	RDs/F/3OIo4bwO1wNWhHe9Vba/rJDbbEY5k9iUC+7LZ798Qv3WRH0yVgUuuTOxJrGVQ=
X-Gm-Gg: ASbGncsnBJMNoNLUFve3Nj6ZgYXNXMUMKm/4iRlpyERK5QRHzLSgTL3gp8MezhVAmRw
	9JOv19Lbn5qzUuFi0/O63IcyNSjyWMHtq5v0yXpY/4c0NsoeLUjF/28nrnCvrV/CSV+zsFw+Jvs
	GrL0yby+HCLyRcsUfF1IsB9Kt0bzBV1Z71+DfAgzXDUIhi4vAlDRbgpYZEBYJlEGCvFAwL+Huha
	lCUbzYc31dfsXcYjDG3zZ/RTisg7YYbcTdAE9hrdJU8a5q+MRkEHdOTjTAtI7wk4DbpQF0gjgrq
	ONHx9dMS6DCXYdZXLsizd7r30cA733UcOELHrGUKXXSRy2S8J5BGvYI8WL/+mgLNL10aqFYPd4V
	C/mV6sNlyCMlLnVk47xAvDWuyfgOkae4LCRFcoLq061bR5krrchxUU41MU1zy8JcLdpt0ToZyOB
	o2Do7JWM9jcdDbPn9Q7I8YnQ6dVjWBVVqzpEmsf/Q/7aLuNTXTtQHk2B2VitGkpcwQah1CaDcnB
	cCVBajb8gt+
X-Google-Smtp-Source: AGHT+IGXZ9dwCsIFtfklKslD3fowlXA1qqiWl8NPh9/JTYvgg+1dn1ZwzOk8abK9I8dlvbUb861r3Q==
X-Received: by 2002:a17:906:b52:b0:b76:b76e:112a with SMTP id a640c23a62f3a-b76b76e11d8mr159583366b.11.1764000651916;
        Mon, 24 Nov 2025 08:10:51 -0800 (PST)
Received: from localhost (p200300f65f0267087d3c06a64089a115.dip0.t-ipconnect.de. [2003:f6:5f02:6708:7d3c:6a6:4089:a115])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b766d386665sm1040566666b.53.2025.11.24.08.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:10:51 -0800 (PST)
Date: Mon, 24 Nov 2025 17:10:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 06/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
Message-ID: <44gv3fhqppn4fyg5fnxkhhanlbbxr2slqq7k3kr3owx7frpnxw@idgwxlcv4otn>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-7-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="neqw6trvue47vu5n"
Content-Disposition: inline
In-Reply-To: <20251123092438.182251-7-shankari.ak0208@gmail.com>


--neqw6trvue47vu5n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
MIME-Version: 1.0

Hello,

I suggest $Subject ~=3D s/kernel/pwm/.

On Sun, Nov 23, 2025 at 02:54:34PM +0530, Shankari Anand wrote:
> Update call sites in `pwm.rs` to import `ARef`
> and `AlwaysRefCounted` from `sync::aref`
> instead of `types`.
>=20
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
>=20
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
>  rust/kernel/pwm.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
> index cb00f8a8765c..1605d13d5d64 100644
> --- a/rust/kernel/pwm.rs
> +++ b/rust/kernel/pwm.rs
> @@ -13,7 +13,8 @@
>      devres,
>      error::{self, to_result},
>      prelude::*,
> -    types::{ARef, AlwaysRefCounted, Opaque}, //
> +    sync::aref::{ARef, AlwaysRefCounted},
> +    types::Opaque, //
>  };
>  use core::{marker::PhantomData, ptr::NonNull};

having no clue about Rust:

Can this patch be applied independent of the others via the pwm tree? If
I understand correctly it's only patch #10 that depends on the previous
patches, right?

Is there already a merge plan for this series?

Best regards
Uwe

--neqw6trvue47vu5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkkg4gACgkQj4D7WH0S
/k4ZxggAnWhK6xpYiLeXmCfK1Sb7HgBa2AsbKye0MnHsSah6DHwnqx7klhUaZs6e
21hOZ4ecYKPAdKbbwZUE4xMwMLKlAEMhJbkWsmUow5Q9+c+jvw0hfGAhiscylqP/
yKADT4IOvjkjPQ0ty4go/b0bd0qvcWDcxJXhvKi5Z+AQokSHyF4QDqRLz3Jq+mE8
T20JB7XDuIOEG7dN8qebw7XS5c4FCeCpSrCm7jeCHdfPuJj2iXz+L1IOedk3+a32
6PdlPCZxmch7aH4fUMWHtsO81LM5JVhulRuGu1ItMrklyXvDV18T7HpvvOaWJaQY
KYI/KdOn48adECwq4ltKA6NkZMhc4Q==
=9ZGw
-----END PGP SIGNATURE-----

--neqw6trvue47vu5n--
