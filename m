Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F98F72617
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016912; cv=pass; b=ikVmaZoHZI1Wwi0SUzpru0SvvYArGaBaDJ2L0b9HtdoJIK+EgNQvwiP7sZQNgbCzeoaI3mfPjQVl/i8JA/eJrQsmp35ZTB8iuUj8QkHdvmXsn3gqulflnGjxeXLppeXwuEOcJkfhv2DKpSHkFy24OjZwWY/D5Q1QOI3d0oluU98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016912; c=relaxed/simple;
	bh=Qh0yKpQkVJy5XXHDedS61+Oe9MjNrWtGzOftaWfnmrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvS4pimtaYHizb5GjKxN9UqRIelwUNLoor1PcWhCy3qizuM/Maw1WaOhJGMgX3ssRHaBTHaSf9xEO7SlQA6lt1uEVXvMaKOt9DBI6+c3BmOa9Qk6rT9Hgs46RpZWchDffgOs/ONSQO3x3P8g0/NCK4Kc6f+4s8xL5QqCbKSYJ8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C10iyM04; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C10iyM04"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b78c97f57bso198307eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Feb 2026 23:21:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770016910; cv=none;
        d=google.com; s=arc-20240605;
        b=SksGuKZ05+KhUpy0RK3N7uuKu05DSqx+Qm2nMLK3CMSgLzH1VgkGksv+MwVKHB80vq
         W/OGEhkqzIQ8YUh7bjJIYzIcWiyvNo5fsVUYmVDAQm3njgECnY331vtFNtrQ/tfSbrfW
         Mqk/XtvWfQgwGw5FLcMgvmCk+ALDEmJzwrdv8bflVUBw/EP7izQdBH0SXRzcNwkYrRZY
         +K6nCKxkpwaBZ8DSYzNwljg1AaF0/R8t1tVEPQ+/FxBEnev0g1HdSDN4TvSAZJZx533O
         qUWG73mpa1Dj6u3lSrBJjKnDfXnfS00q3tZVmpfjsjZn77cqAkBQlYiCR7NdVrvfZzL+
         FEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mPEJobanAs7q9hbhAsHwX5LU72XuDG+jrFHXl0MG2gc=;
        fh=s0/noY7o5zUoeg2pOI+GHwqjcUU3MrtppyrgfOs9Iys=;
        b=HFSdG396hjou/kU7fI0lnR1oOOVeCyP+TOIOsnvKOn09zt7uoojExqDOLq/W7xN9hO
         975GU7hL6C1gtogZgdQVo+IkpNJ/59ozXNpuE9qAkZoOjM9r2rSniai7wLp6SgXSwsj2
         nLrX/+B1EFrDW7X0BGM8lzyhKlzsW4KWAFKJjn6jHoqBTsYwA/TbqKHLCe4xqVESsCQK
         utyvrAIcyBI6VyKWXxFiHu2fHRg5keizGOzxjRQH1T8ACCPWuY6DXly/CjZKlRr2Gowy
         D8acR9ipvoOetvelCq2SXCYu7rWiOBEOV4CizhCdmJ7OpbySEAk00X9lmrb2kNjdylFt
         secA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770016910; x=1770621710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPEJobanAs7q9hbhAsHwX5LU72XuDG+jrFHXl0MG2gc=;
        b=C10iyM04Ad9WH+8cKOtLg+Wjavc7TAfOUDTFvk+VbV/IxdN9t8nSxW5+yIO+7jMuvl
         BWWrLluID/R4fxngG5uZ09DvKwA5eyl1/jP0pl4oXTSrINGqXPUeeH51Q06hfeCFLBRH
         btrkDvJAThBkm5QX/KJKp+5KVq6Ge/vdVkVAHkAXIzh+Y72ZkABACqtezUXFTdeZABXc
         xi2MF58jXvV7Scgc1ptGisIJ82OHOBTNvRTfr1VoTNXxoyXhh6BTxCZYSz/fRPxwtUR5
         ENSCPX/qBDbEcWUMXRUwvKMRotrd6N5ZByLePHSq3PIN832czJqxIAE4P1QZNmR8lI8e
         KBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770016910; x=1770621710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mPEJobanAs7q9hbhAsHwX5LU72XuDG+jrFHXl0MG2gc=;
        b=D3J2l8x9jP9p2hZUHmOOpxIoU82NOviiccTAy0sRiqKN285pee9/rK86d/qxvfBqMh
         OXwbmHnt8H3U2kaGTe5js430XeVU1Nwe6Nf0UIyo3DdxhGNmVpz2uKWmVnQYDdX2LL4q
         3n7fz75MfhfGzJdOUTB6tlRvFQ1v6XoZdcsK7YhmdHGN2kiByPzOdiVHIqRwXlyTwKuE
         +Y8ooYYO+bMHDlTpuPlytHJXueIqqO5qXohJ9yDunVoo4SbWIYfUKUkKR3a6cAPaYpuh
         3Uk41zyLNnAKq0M5GreHjGqt1v/elyt4c+db/5fs83G/6bYUbC4s7h3GE/sESVGRYbru
         8dMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/e490NDKeaiXtLAneUSn8eLupNlViECAl2P4ZwvgZB9etT95JlNkIWqcJCg+KV13rs5haxQTZRsAf2IOQKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3D10dambE0ablfYndy1VRXon50yiNMWbzn7x68oG98S45lNAQ
	SXVZ05A0/F5g3fZZWPbyBxfbNuZTjT6Ug6Sp3wWnWyMx0C2QeD3P5+RT/ONwV6kTqQrpwRYDH8Z
	Sl2HnkoWLjdN3WQMg8CL/wQBsOrP8U60=
X-Gm-Gg: AZuq6aKFmJ5T8XbaeoxhxYrp0RcHcjuSVGaKkDcBYjPKcg5dsQkb1ctBDW7YMQdng+u
	172U/5sEz+izKl75gpaRfSVl5JmekvFFBd4Hsi7CAPXglykgHsrYYxz1YHYYpDi05m3tjs2X5hk
	6Gt57cO1d3HRH8ztC9y8j7K076Zkw+u0HBdgAqylc5bmKP3jYTCJ96qe5RDM86xEBVfldDozcgF
	s1nxB9ffUQIi/9kHVqWf+UvSf5zbIkMeP1i6nOGvRHq/lW1lAb/iPpKnyz3TzzDHv8ASMw2TdUn
	LsZO+fPKUt6lPZQcbMcJGAAu5M+08AOnD5LDE+WVtG6PIEgzeBPI+V5BxPyPMUCySGoHSd4KVP4
	RouqmOfoaQEG9
X-Received: by 2002:a05:7301:3d0f:b0:2b7:3678:2d1a with SMTP id
 5a478bee46e88-2b7c88e8ff4mr2657519eec.6.1770016910244; Sun, 01 Feb 2026
 23:21:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007215034.213779-1-ritvikfoss@gmail.com>
In-Reply-To: <20251007215034.213779-1-ritvikfoss@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Feb 2026 08:21:36 +0100
X-Gm-Features: AZwV_Qj0UAYTMklsAx-AMUJxqpPH5ulX386bpjJeiq9sPidi-KsF0dN1ZHM_hHY
Message-ID: <CANiq72=A4e-jJagpTB0pGkjBWzcJ5Yhaxg8HjThv5+0vrEKZxg@mail.gmail.com>
Subject: Re: [PATCH v6] rust: kernel: introduce `unsafe_precondition_assert!` macro
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 11:53=E2=80=AFPM Ritvik Gupta <ritvikfoss@gmail.com>=
 wrote:
>
> Introduce a new `safety` module containing `unsafe_precondition_assert!`
> macro. It is a wrapper around `debug_assert!`, intended for validating
> pre-conditions of unsafe function.
>
> When `CONFIG_RUST_DEBUG_ASSERTIONS` flag is enabled, this macro performs
> runtime checks to ensure that the preconditions for unsafe function hold.
> Otherwise, the macro is a no-op.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1162
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library=
/topic/.60unsafe_precondition_assert.60.20macro/with/528457452
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Added trailing periods, intra-doc link, "a" in "is a no-op" and `()`
      to function reference. Removed plural in assertion message and title
      of macro. Reworded slightly. - Miguel ]

Cheers,
Miguel
