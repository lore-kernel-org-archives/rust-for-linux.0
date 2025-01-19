Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA7F1779B8;
	Sun, 19 Jan 2025 23:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737327910; cv=none; b=e/Lhdu+oTp3/SKDxAVIyvtklV0CLNV6a9JUJQBdquTiclqOCeDjjewdhuhVfUcQEawIeFAUxRlJwN9HTayfVBBJP7/Pg6lqbpc9FiYeEziz3NZpxJ+TkoAB8NjlNJibymuZ3trnc+kFcLJ9qIazoBYnXXHeNBIX7jOcITOBrAIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737327910; c=relaxed/simple;
	bh=uQzGiqOHQr7x2DuCo+9mj+6KbXYQt2A2iBKUi5xtVYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CAyAiRYJ+t9V/3CveCgQoAKTFHYdWZEhOnVmec2HH9VU5LgNkiA5no1AFF7QeCAbmMtuKQtcVbFqvvR2Ny8FRnkarBhGpteRmsYjZZ/rjv/IPHToLaeV318694cZsfcy4oBTg5K5HiCtyblFOEhfWxK74JskrnyIF6ePTeG/uOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgVvMrCd; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgVvMrCd"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef718cb473so822273a91.1;
        Sun, 19 Jan 2025 15:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737327908; x=1737932708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRAanV5HlKfh74KGcKWaMbyUZq0MsmmFt40cDRcFG9A=;
        b=cgVvMrCdnG7sIJmMEDbG3lLyukNDrwa1Uf73qHfprsZijsyjcv+G2OnRIZ3KqQ1XkY
         CMymA9qFrth4Gt608CgOq6adgTjwHIt9D7tcyNB1jtt167BZqYDxzfJKYjExFpov5MwU
         RsWI1se4uusrqYFh1vTuwLFpxws0CSKl1q+JoiMBf5mOe+jfdGBPvayG/2op+k4EioaT
         De8LVm+EkhU3e4CBnsYha+hznDY5pVL8UdSHMqN5QtEy7kANYqz+Gfk5iZErNOctKH/M
         wHs5W1N5vcG59PQmgfY5G7sIhcEwkSacwZfmQucePd3FDM17H9c27vxJYzlugUA9I3HJ
         p1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737327908; x=1737932708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRAanV5HlKfh74KGcKWaMbyUZq0MsmmFt40cDRcFG9A=;
        b=HPShR8a7GIoX0WaBBajwQKq3/O+IkHcLfcNYr83p/vns3a2PGovD0Le9D83x/O0B39
         vlFryqRHiac1vHtpIAdq/GeA0z3uc2Qst11zf+7R7URhzYef6D5pkUL5DFwfqKOQHU4j
         stNsrb0Kp6QxAnxo5/4tNwQizq30w/WqSTTC00BiyyqF5oD40LJmV3HmAdtQnto91uJF
         BmJvupW7VysmLRlLD90jxLgORhSj5fZoFWphynacMd9DBaz7n+pZmBVdjA4oXqgWSDfy
         FqvkyFAJ2CNkgTK59GDDON3XP9eJyB1nQEdbIDlLuzSN0k9GZpf91W8wiye/9QL5kLA+
         2/1w==
X-Forwarded-Encrypted: i=1; AJvYcCV3alddjLH0pR8bN0D+dcTq+5CphYZOwXG8W/dtf06o/rGeAE+VO+kYs5msTVEuPFHy6moLqeTDHJZpEAI=@vger.kernel.org, AJvYcCXS4zZWno6tZDGve17zth9UqEMsA8F6UnnKeZEbJAX6CjAUM8kTgBnSyZHvugE1YUs/6rCizjr+ET0Ynsc4IKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQUG671LECZHl/7UxdahrpLmHgQlJYnUpzw7Jta3NYlBBNXpnz
	zpnXAmxjle0AH/nS8CuVuiEC7O4dxmkWaLFIvcRGqsTUBAviRVyYTtbZ/bh7DFD8fBK4kqZe+IF
	xFZUzjz7YV8qWu3Og7CoGsjmSGaQ=
X-Gm-Gg: ASbGncuA1+QZHdSHtdShy5KgHfbAU4fYBWF6vvBRRnTLwPmV893CqFDmQikBSkNHPCs
	+tjGdP9vhZOZ0QzJbMIRhY1f4r/nOV/+aki8whB785VVFdScGYpg=
X-Google-Smtp-Source: AGHT+IG99r0EIldjfw8zxThKsspWdYuPgYRcIWf2gDGmTuNit8SiBzhazQsppUK+oRqvo8n0vQgdgQwM3pQtWpGOQpg=
X-Received: by 2002:a17:90b:2585:b0:2ea:c2d3:a079 with SMTP id
 98e67ed59e1d1-2f782d301c1mr6087865a91.3.1737327908346; Sun, 19 Jan 2025
 15:05:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-1-edbf18dde5fc@gmail.com>
In-Reply-To: <20250119-b4-rust_miscdevice_registrationdata-v1-1-edbf18dde5fc@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Jan 2025 00:04:56 +0100
X-Gm-Features: AbW1kvagLHo85DVNeZlRkVPeNFJC08_BYaPLKvbK5hUFwkoRdgk96HJXoD5nAl4
Message-ID: <CANiq72mqhTA+LQ5d6Sd-E24qc1_k46UZ6sbgGZRj07GZ9TR5Bg@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add Aliased type
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Thanks for the series! A few quick comments on the documentation...

On Sun, Jan 19, 2025 at 11:11=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> This type is useful for cases where a value might be shared with C code
> but not interpreted by it.
> In partiquarly this is added to for data that is shared between a Driver
> and a MiscDevice implementation.

Typo: partiquarly

Also, normally you would leave an empty line between paragraphs, if
that is what you intended.

> Similar to Opaque but guarantees that the value is initialized and the
> inner value is dropped when Aliased is dropped.
>
> This was origianally proposed for the IRQ abstractions [0], but also

Typo: origianally

I usually recommend using `checkpatch.pl` with `--codespell` (it may
have caught these).

> +/// Stores a value that may be aliased.
> +///
> +/// This is similar to `Opaque<T>` but is guaranteed to contain valid da=
ta and will

Would an intra-doc link be possible? Please use then wherever reasonable.

> +/// Call the Drop implementation of T when dropped.

"Call" -> "call"?

Also, please format `Drop` and `T` and add the intra-doc link for the forme=
r.

Could we have an example or two for the type? More generally, you have
some nice comments in the commit message, so it is best to put some of
that in the actual documentation, which is what most people will read,
so that they don't need to search for the commit that introduced it.

> +    }
> +    /// Create an `Aliased` pin-initializer from the given pin-initializ=
er.

Newline between methods/functions/etc.

> +    pub fn try_pin_init<E>(value: impl PinInit<T, E>) -> impl PinInit<Se=
lf, E> {
> +        // SAFETY:
> +        // In case of an error in value the error is returned, otherwise=
 the slot is fully initialized,
> +        // since value is initialized and _pin is a Zero sized type.
> +        // The pin invariants of value are upheld, since no moving occur=
s.

For lists of requirements, we typically use bullets, e.g. `  - `. I
think this applies to another patch too.

Also, please format comments with Markdown as well (no need for
intra-doc links, of course).

> +    }
> +    /// Returns a raw pointer to the opaque data.

Missing newline?

Cheers,
Miguel
