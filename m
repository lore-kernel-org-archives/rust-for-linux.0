Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21229202F71
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 03:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772247882; cv=pass; b=CUB0UVjoJc+BC9BnedVDYxwUTg2tVqW5rj3/Z8jd2vfRQ91KsArwJgPym5mdZTxGg24w95uIQpCAfvVKKxtJ7mrGNMXqChVgddXvAraSjxYkG7uXzwKfadg4Zxspw7apDPSprEtzYFrRlcXSm1P1gtkrwtU4xgbYMi1XME7r6ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772247882; c=relaxed/simple;
	bh=vTgL6wj88MiC7bKtnA4PfFprU4IvDrt5AbGrKHSU+k4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6p/Xnp2EbekMeEJ1rYxFqo0jEfAkqgTt1XvqRvVofcnMTV0cwxq8K/0cLXDsEBB2pJ6fDtKiZntKbTw8hwrJWx+Bgotx0BTh/c3cstIbkNnjW6UYYIcmXBAZjJAnFBOCMbYeZkKgAA5zrWHr9aCWxci+oKV1vR2ou8oTEIB158=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFOvsxT1; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFOvsxT1"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bd801b40dbso224789eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 19:04:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772247880; cv=none;
        d=google.com; s=arc-20240605;
        b=hcdy8LUOmOwWVz+ifM25RPVFmliZW2kP570fNs8/UjjB1AGafeku3ftsUn6ZCp8WOJ
         Ye8qKRmKP5bFYi0mA13ZvdsT6JLBd3kud8DBG9cRGB8EZyNlqwSHm4iV8KYe6GdhDAwr
         hTJAlzdO1a5k79RLOmZZsTumxkbwYuQyAZVDWbQN43ot+QEj12aSSXAJ4JeZRZSR8hUT
         sLB4k+/fwxe/3q3ifQnLnfQyRcU1k9fs388aPKNoGcqDuFYoyq6e+TOYHEgGfznq+Syi
         IL9VT7KvH1SS6qUP5Wcb43X4G5QtkSanDUIyTS0+VjdEPaAWUNlpdgsXqQlyFm5XqSGG
         CbnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3eBwjHixwr42Z/JUwBQoLyl3SR0lJOCkLYgkHnyat6I=;
        fh=2qqPvPTVAlZUBuRsPo+/wHx4tBex71r/G7VeuPo6hqA=;
        b=gxz7qsPGulSUj6rsy4pgM1qQ9npX5ytFPhWyrzINzROXebhlSx2IAqbXvDA8R4I3Wy
         N/fRoqfuiMbj+xadrdw5xCAFKFy256OzxlrEwGbO/l0/tef0HOPrWb4qwleBjNVNf6oK
         KiT/z1/uro09CKEjnM5x8YtgNzDC1pakBANMKDzzeKbqbJJhpF/eGkvOmrBUPnzlDugY
         etCqvChT6yb2a/RfPnw7J8MvkfForjkibitvQCpPqhPfQuB6/w1/gKdZDmyE0guMymcJ
         fAdYQRUOr8TRHsXynHsKRzkOz8AjjiJDGwE4Ey/iJpywtUdITnaZ+3seUG4bVzt4uBZm
         NjNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772247880; x=1772852680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eBwjHixwr42Z/JUwBQoLyl3SR0lJOCkLYgkHnyat6I=;
        b=BFOvsxT1VPLdr2WMXrHwfmN5VqWNc+lxscpJR0nBiuMX0rvbzvvRrDzcXQd1OntBfE
         OILoIJhz27eOidfim/sAQF339520ENq0gLlYfSDAjk2hr4Oe+1NuXsNLO9PEWvu3SdIh
         0IxwsrU0b2R5AEJ506iC9hJjk+FbiguR+JCY8c4dxND0wfb/zaiWlm/hjhKXk+bWi78u
         vpXuPE5MYCj8TWGNzzBaO/ZOPxUfBa/hQSDhYUiu7Yg3yPBJlKLcJ8NQ0fUjM63Sp5mB
         1VYmj7TAS9JIsCnmr72Ajh9StIsvUVyWsDE8tI20xo4sysv3JGkFOX6tOK29vnc1zkeV
         EMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772247880; x=1772852680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3eBwjHixwr42Z/JUwBQoLyl3SR0lJOCkLYgkHnyat6I=;
        b=dLXifiBwjWaLwmCrJ85FEMfOKlIhVIdft0NOHykuzhmtBOdtbjFvaNEPuOfCtkq0Oj
         GJbtIBEZTYYJRU6ca7bw6LuSyL3JvJImnbXxAJp0vMqetoXXNmuZyoS6xXsx0xwdco2P
         AIyuUTuwjTrmoecOj1iNkLKm6rzfSanIh/x7tiWz8MUnxNrMBbwImSBs1QeqynimHtPz
         ZKXqPUnXPmmvg/eNm86A2EQJ2t9Vi2IEqUOgWzhRJXgha1+IkNV4a/mobAjqzFYrvSwo
         XjBKPNvwmu1JH0P/4nc6SX8/a3dtgJa2RW+noe0i0rgdRoxVSm8hNqgOqGJAdxFLTzub
         3bZA==
X-Forwarded-Encrypted: i=1; AJvYcCW3WAKXAsbF1maFGQ9M4WKbaQ93xKMWyE4xISCyw5D/jtikT8Ek/lcRjStjSQ2hQK4X6TYLrxshiYMQFtBr3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJSThtV3/BZgnbdZKqrwmQx/ogXbwCbRkBUKTyArisz6QiXPf
	hM4YhluMVkg3J0gHmpZY21ysJ7sGQoUx+qxlL5nF3gy7KounaVN8jQ+vf+im18EVgRCaDtQxI5L
	NqZvh1knJD7zJZNmQnbHjD7m+dhGBdPY=
X-Gm-Gg: ATEYQzxpA415jnOnBO1cT8TCDqNW/FvdGpDcLk/awS2DCdPkHs/5KbQrpkk/WklwRHA
	DVDMr6RbUBYd/FGfh3i8GM5EcEsrwwVLfZFLGLsb0wZ1wlHZZ/AqbceHBOhv3RGK+4zkk6YGG3t
	7m4yzd5O0dI8PjDNndQESddWrqBOItBgtARykMzXf70Q/gcnBjyTvwvRXAUHL1otBr6SZBKAssk
	zxBBjwlyipiad4T56ZIxEN7CNNPSE6A3u2AlW1MzjNcY42pYWhsQb5pptMcWu2kf5EiIJJmYBur
	INLIutdDqOaEUIijBvHNIrQamgDiDTL5ACPshSKfKPEymETkl8nF2UtcPO7Uh94oqDs8e4z4NcL
	tlJMMxRwg/xiVUre52F0vX2b+El/A
X-Received: by 2002:a05:7300:cb13:b0:2b7:121a:99f with SMTP id
 5a478bee46e88-2bde16beae8mr943647eec.0.1772247880144; Fri, 27 Feb 2026
 19:04:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215-hrtimer-active-v1-1-a754d10492c2@kernel.org>
 <CANiq72mfLyXNs2QdzROkgOeuQDPSEM_f3Rt3rvGcrhd44weSTw@mail.gmail.com> <20260228.112257.2070673836800156099.fujita@bee>
In-Reply-To: <20260228.112257.2070673836800156099.fujita@bee>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Feb 2026 04:04:27 +0100
X-Gm-Features: AaiRm525fxEQ7fIgyaAGspou9bW5sS58iIsqFEWInXxkYoULuWYWH26Jcc8wVoc
Message-ID: <CANiq72=Y5aHc+jQc2Z5R7gxQj4oyKKKuPuuR9Uzx_LR8Ph84gw@mail.gmail.com>
Subject: Re: [PATCH] rust: hrtimer: add active() method to query timer state
To: FUJITA Tomonori <tomo@aliasing.net>
Cc: a.hindborg@kernel.org, boqun.feng@gmail.com, fujita.tomonori@gmail.com, 
	frederic@kernel.org, lyude@redhat.com, tglx@kernel.org, 
	anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org, 
	ojeda@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 3:23=E2=80=AFAM FUJITA Tomonori <tomo@aliasing.net>=
 wrote:
>
> Should we use intra-doc links for true/flase? Currently, rust/kernel
> doesn't seem to use them. Seems that Rust std library isn't consistent
> on this either.

Maybe... It doesn't matter much either way, obviously.

For simplicity/consistency with other "trivial" items, it may be
better. On the other hand, it is more painful to type and takes 2
characters.

This is the entry I have so far for this in my to-be-sent guidelines
"rules" list:

- Use intra-doc links wherever the link would work (i.e. if ``rustdoc``
  can resolve it), unless doing so would be unreasonably complex or
  verbose. In such a case, use a simple code span instead.

  Do so even for trivial types and constants, such as ``i32`` and
  ``true``, as well as for ``Self``.

  .. code-block:: rust

    /// Returns a new [`Foo`].

  Avoid:

  .. code-block:: rust

    /// Returns a new `Foo`.

Cheers,
Miguel
