Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980553F8233
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426392; cv=pass; b=SOBeLq1Ex/4HR8fnbBlpfeMkc4N4WIvCVlGa7EbrUEEoj+4VLIwG2hbaFDK2JR7JQ3mfIIS/32cS7hyj8zvdNj7jPvP72ZfawBwndE8v+HPTjiYoMBOc7jk+bQmIdwTIoKwHv//Q2Qo3qCxxi5/INOKSA6TpGn8xba0RyATjYM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426392; c=relaxed/simple;
	bh=HhpGB3OYa2CqKqz6yuFbvT6lpvjmvLz426BCM2aCtyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mAH05qkXNaZbvzFsy2U18SeVPqFUB2LQmooaLRiYf4Mho+zC1QiaESocRFKUn1CCo8x2q4FN+Xm8z8jMIQG2kMn2cbipCf2ZHKwEITgKkxqlrvO7ZhZU90FAS+AMFTX7Ds7P28mIO63YDIGXweCB8zv514rncTpdP3N64jRcnrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgpXfbPh; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgpXfbPh"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca679f747f5so9610a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 05:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783426391; cv=none;
        d=google.com; s=arc-20260327;
        b=q0YmTFll2dejFE4THWxDZ+0CKEPLkPUyLKVuxx9Nd61BFsf4pSn8ZR5CUEas6TwhAd
         YeCi/qN4Aq7ozwBCE8k0JOk/yw4PqL4jQpYlWgHHKw35eJwA3tPXtBKJ+lsNmu/ct1b3
         8s0eqZxfEV36117RqOxJKjftD6Ou1Nr4oX9jOvwRU6rE4AxuKkxaAbNH6LDbYYeFRnbl
         YdCSlOim3LGDwyp5gjxzMfuWSI9r2vgcXe14PGVjiVBcyAgSbKmQrqB57K315LJMyUxn
         asU4qIqabKGCpPGEZTGVLh7JUwVKhgX5ymjBMLruKHGqu45MNP/XNkZMdJ8a/3br0zdR
         Vxwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bHu0GnIIgWH4db1JTnTdYIc6jfcrn5j/73Z/EPreQ4A=;
        fh=RCIdlCpEXQ+zCOtohSTYEEqg2m4XhhyJyL1SNgWPI1M=;
        b=JqaedNDSkNiPpz6azNaMytTPR8JXbpa/0N1iBKlfUoxHyiXqGIAL1aH2f1XmtjCIml
         sExi4o+49xtg5v/lemJHr4LfrGJuu11FrXXHWHRfuAHI3XBt70KZ85v0MFzejnASuNvh
         Ox6neL80f/5L4vITP6ui+8hhfDRacw/JvQweAtoAGayFx1CxkJSN1crnEVvUt/4z012B
         IzQ0jQM7WtjhXrQZ1eTXv055INqUCfe5t+F20BYWcG1TZkKEIS9xnQlKpScY9v4iY1+x
         8CjwNHwZXpuokj2jTt0VSuWnmOKhK8qRxWg+fvEJPvFaobS0hrYkABYF3OrSnnOtZ8jv
         gj1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783426391; x=1784031191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bHu0GnIIgWH4db1JTnTdYIc6jfcrn5j/73Z/EPreQ4A=;
        b=hgpXfbPhka47ETZ3MngTf1Yc6dicZzORJGZ5cajmEK9vx/C0XEI4vZbY9s+c4XTdkq
         0fBZGj5EjqYqLphfsNDt1p45542pTzZqELpGDE1U/g4L27/QlzbwdCEQ2S5svDAX6j86
         9iVyBFysQKxCzfM3k2gzzRrd6f8sy66Rl9IVfEmy77lVQaTTDarSfVKDOUhqYnASt10C
         rtHnXddXvPpxV9iAdXTgpHHrx+pJD2BPZaraRNgAXJNYsCawGsajC/sevI+fXJNux6d+
         1i7JsuP/hyhvX0hDGratpMJvdGbOkl0WSLnlLAr2GDquIdA/dRbH5lIvWjH64qdbHIU6
         Atng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783426391; x=1784031191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHu0GnIIgWH4db1JTnTdYIc6jfcrn5j/73Z/EPreQ4A=;
        b=q9uW7tNPuosavRef7WYuQk17R2cAky4gUeb8HGA7Sz+B9e8ahQRwwtZbkNsqdn2ZIO
         GZwhJvC8lv7n8hdPvwiluUIU4ZqJObEj51e4c0KWMTqxDJmh2fR9QLww+xZ4G9HZMrsf
         JhWlTevsK4wE0bo/aUyRRPVzZ7fRa11x0LIT80r1zoBjgxuQbFQzPbYODjPsNnQ841/K
         T20Z3vvQ7TRo7loymnR9ZLfP9+bYE0frj6ptCLEhTPQSSRwKSa5EeTdADaodxqWDbOYX
         UvJpnZmi+j/4teu4qt737NDNwwzPaWVsGHWMemz0JO1lh3YGxCXRnwTOdCPTKbW9UB7h
         axgw==
X-Forwarded-Encrypted: i=1; AHgh+Rot5pi81KVmDq35V4rTq63jwazmr42rnzROzYiJu/XaFkINoRpWu3FHVlaAPCsDAkY9xILAflABim13QQ6kJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/k+hK0bp93pj2uJi5ETsxMe31EAeasl51e0AumUkBVFLSs4La
	gvTB7oUTdeKgZosTRrwi64s4+P/gKMZNgp9ejp8DSj7+pypronjMPyEUdZSyyWiCUCnlZt7sFHc
	zhCtspRlQ6G8AJm1X7uJYs/1WQnyVgy1isSUgZN0=
X-Gm-Gg: AfdE7clHjS2hUWQiUeiQUfKSxY9H9PzYKGGhPiPoIbh1UQoNG/Zz8GZgSZU79sF+DCS
	V5Hh3FqJioy3T6ycXTwFteN5OummSTnbn5vmg0FfvyKA4NLgpBxJti22MU42ejTEK4QNF+Gl0Nt
	unMJtF9HNQmqLszZ+GliSkTDva5Wxa8xyEcuprqkqeNKD/KZGxhbCaKqykcw5+qLph4GdsC0aaM
	SM7JfluWvDpL/5s/RyCCOokZOA3khk4BhNSsOhzAXyIT5JQwr26hqh21Ef7dyApYL7L/0ESPp9/
	WVNS2hFWf+i6eei0i4B8KedQ4NxHLmH2UOYFLiPjzAjCRXYZ7AIRhDIBOA5Nh4TrLqIs42oD1gB
	xz0yQjeLftfYe
X-Received: by 2002:a17:90b:5544:b0:380:9cd1:d985 with SMTP id
 98e67ed59e1d1-3829fcdabb8mr9859894a91.6.1783426390826; Tue, 07 Jul 2026
 05:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com> <DJSB9NRJ9YMG.2B8SJBD7VNEC0@garyguo.net>
In-Reply-To: <DJSB9NRJ9YMG.2B8SJBD7VNEC0@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Jul 2026 14:12:57 +0200
X-Gm-Features: AVVi8CcP5ImJtTczbXQMmoOeYju_lcwoXyukPRGT5iSjmvdSTTHk636s2xri4Zw
Message-ID: <CANiq72=Q7aR51uvwKXUh2YWJmDuBAHPECA57qG3Hr20xWCt0mA@mail.gmail.com>
Subject: Re: [PATCH] rust: soc: silence clippy warning with rustc >= 1.88
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Matthew Maurer <mmaurer@google.com>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 1:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> We set `msrv =3D "1.85"` in our .clippy.toml, and my local testing with 1=
.88 and
> 1.96.1 doesn't produce this warning.

Yeah, I was trying to reproduce it locally too and didn't succeed yet.

If it does reproduce somehow (e.g. a particular toolchain), then we
probably want:

  Cc: stable@vger.kernel.org
  Fixes: 057d44b05775 ("rust: Add soc_device support")

Cheers,
Miguel
