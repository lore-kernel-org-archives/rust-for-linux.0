Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC5D480357
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842093; cv=pass; b=hakP+aLG0RlBCm5WsZcQiTmeXG1ccXB5VTuBpXTzWVAoWx51MFgJjIWVpMsTnlKhlaowN53QFnuDxnWJY13FLqSQl1rXZ1+SvwQ/svwydrMKalHfjvG3BWQbVxhZLocA9QK3T37sQ3RcqmtQq4oEPj+pjNf38Ix9lY2QgZ+X2To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842093; c=relaxed/simple;
	bh=UyNAutr3ZBqr3zw4vZvqNGkd6aojgPH2Nb7YhuynXlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abdv/LhEI1/ME/Uem/1+pUX+2SDi+X9bdIc5/LiS25Wd84a67oUNLPUVIL0E/1DEatqIq6PTb/Ros9snkbxqIbJCk4jahFshrdn64YELeBBdvlWc58lxQjqdcXUOeozLdY5owYJoKqTBb+qF05Dk1Gv054sclakspiv6nEGfaRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTituS9x; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTituS9x"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b4ae0b3344so218477e87.3
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 07:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842034; cv=none;
        d=google.com; s=arc-20260327;
        b=WUUOQMPkIQVDhjbHmgkPiLESNoMO5cK/rZ+Pyz6Wfu+NZP8B2Z1pDuDwr4Zid0C5Rj
         +oJvHdmC6xuzg4pliy9bFF5KrZXp5+lNSOmpGjr6nzSmTWgr+/CEVsyHna8wyig5q1zn
         wH9Mv7njARh12toyJ91Dl3lvi53biCT8tvGotYOBYlIBeUd5cLCl0mZH+wLXitwbTqn9
         4IJo5lxM8wVQNWnP+NVDjt1nfdLQAQASpbKhx65jJzHZ33EBdS4pgcmn1dl4EZJFLnMY
         JuwTahrQBjh5w8qZjVTiQhWVTfkhvXEucVJNlsBp2FUr2QtlNs7KlZf6bS7mVqDKDylw
         h5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIv/H/IplOBpLOuUIXvmqmWRs9LjOZuBeIKzBslr/ec=;
        fh=tL1UwBq8+pGCQhgXFlIoTQm6NRQSzlVLi6EnUA5818I=;
        b=iXOiL+drX8aW1Z0pcLciY7ziSr7WnXg5mTe5pq7ghB45RIP3ZG+5x1X0/8AaTolclF
         /gYWhRmkmlROUV9Ft1uJVGthL0JK2utO5R7PJKyVBYhdxzrvbJ1lsP+DgpIiBLcNFVae
         xprQpONtAEC4fuz9n3ddoULZGrYjizc08otcTCv3zka4InDMAllk/CyZWubRgynHmgfv
         m26DMZm+4KUZMPkdj0azmdgeu83CYMbkWyJwvhMgaO6cZB23KimZITl8aUBT3OecVs8R
         KtlxyTMGgYLKLUY31vWTOkWLbczoVNcbLlIqApzVaLYuuYloEYMT+2LuuxwjV1XEeLrB
         /jbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842034; x=1788446834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIv/H/IplOBpLOuUIXvmqmWRs9LjOZuBeIKzBslr/ec=;
        b=bTituS9xr/yXNciyLAZtTMQdu8C3H21kfPJlFuuk9AYtE8aCx44MselVEtMIS/Zy1w
         T/r9fVIX5RZfNNwW0vNONCitDBdGo9iK1dLJsOEFZx9Al25xsxixVpzWce8xfefUClQ6
         Psh3z9OfUWoOKGg5X+070xyJ+ji3qdux7f6ai1S+HSlowa1yz/2DTToYuGoxMVij1K4b
         Lx8zkZEjYiSUB+fpIcndNJnGc6bn9j2t8SqfsQVusCB5KjgG+r+Z+1ZvGp6DK4vK0nLC
         i/xLUjYPTmrHSYCwarZI9TyfWWg1ZMo9iLMBXTE/dSsbsfh5oW5geT2Y+Vg7XWJOIcUp
         L08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842034; x=1788446834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIv/H/IplOBpLOuUIXvmqmWRs9LjOZuBeIKzBslr/ec=;
        b=oS9CI55GIjWN0Zuxhkzp1nm6GGBXpMBXwG49TZxGZy+bfWowgVRGp7PNji+aiiyiFy
         9NZK8I0KLC1Ftm40K5+6C7eBul3Z9B/6sgnIyRjdKc2K/HDwrf40vZLjtK1CLPTFaOp5
         bF0BqOAdFtr3uXyr5zxvneY4Tv/X0Jyys2krGP1CRIFnrJTHaVqtMIiLoYdf2du7wftL
         GKQ3Wf97LwscAUKvQj2Ovb3RV+Q8U4Kt/MSG9vJqrGiya48EAXXGSKL8i1YpJk+KC23x
         HzUXkfQusCrWTe3dhbZqrtvHtX9Wu47vgYSdRgsnh/ZFQwi0UTImemCeHUW5twX4zq0y
         4iVg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7oIJbGir8EERS04FQO2SEuVmbahiUzyVLznUIPabvaGHorEAQOnOdba/1xgf+1iKvydPp4OFuA3cO1fFAjA==@vger.kernel.org
X-Gm-Message-State: AFuF++li9qKLePsL5BDxvdvonLzy+56ykE4AUJ4kDVB0t1ICKs9OTnxV
	q5uE8pZ8djidohZ69tw5kOFb4CxnvS7whaT1TxNvQlOx4vniEuQO2/gncU6hOVUPysQtcOeejrO
	P9lPf5vDsvZtIjX9UML8fZpDEXv7bByc=
X-Gm-Gg: AR+sD10UmUbClzvugy6+RZATQr8k7vC6RuvGuAFR73cOGUbvml9gOut41wCzGJ3LmxN
	rbGaj/AmOkenKfUfcePjHWu9CjMrt9CsShJ1HuD5W0XESu1mTP7+FVVGn+bouJ7MCR8t40TCyiQ
	4gc5yPq3VwfVAyzqyugbDSSBVK3K4Nz47r99tGNv7f8XYFespW5B9HABYc2vbsgCnFgZjWz9zsN
	a1WDBnHd9WjAYv7gbNVeRe8KvLeldoEgI/TSljGNixr72bOrr+iK/G2hkC+phYHZGL1irjwVAB5
	TgvzbAgsv8zYVJr+Sd8IdQOHLoeavpAf0SLOwvP6YDTnxngyHk+0ErQ3K5RnK9vplqR6nhxoYB2
	wy/TaN9Wauj+zlwktPktr0Hr6XADBwEmDlAy9d964LqBds3nZXd2fXnK2J9qr6AMy6YXQk2E=
X-Received: by 2002:a05:6512:2524:b0:5b2:8f21:9208 with SMTP id
 2adb3069b0e04-5b4af8125bcmr1537133e87.2.1787842033712; Thu, 27 Aug 2026
 07:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163004.3365-1-mike@fireburn.co.uk> <20260826163004.3365-3-mike@fireburn.co.uk>
 <20260827030352.GB2327@sol>
In-Reply-To: <20260827030352.GB2327@sol>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Aug 2026 16:46:55 +0200
X-Gm-Features: AcwNN1UsDJQr_7lyG3pHWuoyy3p3_nTOF3nxmpNZaHmXNVMz_ZzoncBZkrBRMoQ
Message-ID: <CANiq72k3COcjo1s1MXdh=K7qRcOMMSq7-3_JCMtNKN3J0zQmjg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: crypto: add synchronous RSA akcipher support
To: Eric Biggers <ebiggers@kernel.org>
Cc: Mike Lothian <mike@fireburn.co.uk>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Burak Emir <bqe@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <ynorov@nvidia.com>, 
	David Gow <david@davidgow.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 5:05=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> As I've been commenting on other of these bindings patches, it also
> doesn't really make sense to have the kconfig symbol be in lib/ but then
> have the actual code be in rust/.  They should be in the same place.

Did you see my reply at

  https://lore.kernel.org/rust-for-linux/CANiq72=3DuUR4Vo9W55Kq6tQjc+6Q4_+w=
iWhCo-VLdkvg6PJeoAw@mail.gmail.com/

?

But if you feel strongly about it, I guess it can be temporarily
placed elsewhere, i.e. Kconfig symbols are not tied to the path anyway
so they should be easy to move later on.

> > +__rust_helper void rust_helper_memzero_explicit(void *s, size_t count)
> > +{
> > +     memzero_explicit(s, count);
> > +}
>
> Isn't there a standard Rust solution for this?

If you mean a function in the standard library to zero memory without
being optimized out: no, there isn't.

For context: I added `memset_explicit` to the ISO C standard and
informally asked upstream Rust about adding an equivalent function
many years ago, but at least back then they didn't want to add it (or
at least in a way similar to how it is specified in C, which doesn't
really give guarantees, letting compiler writers do their best
effort).

I guess I can ask again since now we would finally have an actual user
in Linux... :)

I hope that helps!

Cheers,
Miguel
