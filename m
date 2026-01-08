Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1494AC7A6
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 11:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870402; cv=none; b=PcXcAblDRJe6GOZ8Wh5dlPxNAwVR3eHKNbVV7b5tz1JI/Kls2xwel9uxm85bgIolVaZ/fhuckYqnewfKxD9R+fdHoKG7sG+HbOnnmQ62r8D7DY0HcCc31ymV38BGyg7oi4u8rna6k99aLHbtY3Dh1VRAVOWl7+uKmO0pOyCA/aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870402; c=relaxed/simple;
	bh=XLPWGlI36n+DcDLYJ6Kp5hzuv2r7ylE9YPvT/nHd7Yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IyHILEaFK1Wrd1Lw7/9Qwro0DmiNfmwq+QRQeZtE/a547E7DW0gt75+o7VuctkC7lxcy0KqFccZVwkszcBF/GBgffZOHEeJ9kmnyiegqHAvpEj45Hx4wOg6WQhM1DQK8I/JhhxMuEKfh8UfE0d/crj5BD3fRuM7DcV3YOdDxFjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xm/INNWX; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xm/INNWX"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59b6f267721so1701083e87.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 03:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767870392; x=1768475192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0G3gjKxYqpiwNPw7O/Dx/0E48ypMiz0W4h8OoGrtk0=;
        b=Xm/INNWXNMDljNtJ6WoOan50F16FXUYSUQgJv60sBHW16gKIQSnYtHeRgG1b6mGYqn
         D5FobXvIJ9RmzLVkhqudvrQ662KpoYWbJEfPx+glItWw2rcKhQECkFFcgNe78x6PQM3H
         ESFfGQTeSi0QARMy8QSiCU008l8KKMbzJwU7idP/oiEe/fBuvGn1krQmbULxN9mDw8v/
         iWE7Akk/4NtBEJVysts4LaodyB3eRitNWqHBK44PDokTNGBAgtjHG6y1GjqP1qRZuxZi
         /dnP4gnyXUXgjdjdnwAkeJuVVqiiby8PVN3F0CDLAaI4t5R9z2abLAw/dCHg+7ALbIaW
         GCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870392; x=1768475192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0G3gjKxYqpiwNPw7O/Dx/0E48ypMiz0W4h8OoGrtk0=;
        b=BS1echZRYQLYwzWazmJnW4aNcufYbzxY/eY6AqGftSfAdesIja4Vy3KL2R2McFhkqA
         0Z8cY59ZB7bjn6Zr8AYXrkLygrLXnf+qUvUdEYDmbkBAIPWhPyxKdTRzlWtmlAwAG5eX
         /PAbBWy1XKbzAsPr3jAqYhbv4cov5Iuui0CV08azaLOFoNL+00tOAZVYpiyX3LzaKRyj
         Cxwdv/sSvQpecXE8+KOUwAP+q4gcB/WTnsW68yL1wglG41efO8DG8OMhzS/PYbi0+Kx+
         pKAVq2tp84tvyS2kFpLorK77MhHUNQrsWZTTdjtukZMNwuSEu0UhNf0wGZsO5eqy0oVn
         /nUw==
X-Forwarded-Encrypted: i=1; AJvYcCUapR9ISJ+HqfN/kH6jWqS/MUcDQyvvSc+yvR6U38sNFfkkftPZJg5EH7pmEqhUR8LKpeyg8AzZsUPZVr/mpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPrMC+VlZ89gg+M8kCy/q3uucci3ggGudHqXXDMKbSvt81F5uD
	S9gXonbY68vBeMwCC/p5eDPkCb0FoU0sqmgeKZOcfvR3S9HjOpW5PMJfNxL+qW7WYLhXeNQTy8I
	QIU0L0G28bi8il4Bpql3EMPbagtkMr+Q=
X-Gm-Gg: AY/fxX5m4dteSq4JHieA9DrCA42JpB2v7yNT9oI/tmW09tnaFrRGO6PhksPuycahSIB
	arqd0c8RRtB+jSr+sPJW6BwYRqMtNuKVz1cNq/zCt6hfPB8/YFyBLL4jueQ6PGJzR6M0X1y6I5s
	fCbI9wPdPyUaFM0rTRYRse8e9BjB/xVhhraFEzGjEOLN3Hd7olyhkO5xs3Ov3gXq0NDmuSjH7nx
	CHzxQtwEAVx45l4gsAaimeZY3BEfkS/MbLX2riPLotcr354mYi+yt1hsW46JiyQkE7GMG7LHrws
	Rb+kLeP0gzWyzk6OdseB3DbNwI+zbwmXo9sLZseIYOn1LeMAwHdhYVGL5aRIuNZlXUWJa48EEMc
	mKhVJSYwr0qhT+3JoD97aw5HEbwU5haCNGICYdTvnYw==
X-Google-Smtp-Source: AGHT+IG5DUGCBUZ3mh0jqGitU7V4z1vVKhDRe+XGOTe/lygMN0VlAFFWdMAIMEXORYlcJ20uU2cLbxoFIBFXYhFSr20=
X-Received: by 2002:a05:6512:3dac:b0:598:e8b7:665d with SMTP id
 2adb3069b0e04-59b6ef0698bmr2404801e87.3.1767870392106; Thu, 08 Jan 2026
 03:06:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-3-9e5ffd5e3cf0@kernel.org> <CAJ-ks9mqwaWMc0MTGOk+rKSM8W8spRmwiLGCkEjcSvF+d7QW7g@mail.gmail.com>
 <87jyxtgtlc.fsf@t14s.mail-host-address-is-not-set> <CAJ-ks9kYk7cuQFOK89OwUx+k8p+_kANjB12rZLO+dzfSd=BpdQ@mail.gmail.com>
 <87344gh2pk.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87344gh2pk.fsf@t14s.mail-host-address-is-not-set>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 8 Jan 2026 06:05:56 -0500
X-Gm-Features: AQt7F2rrHRScNiXP4CzTagsK6kA0T-aAEskraTucekW5u-zflSz8wyotLHgHxn8
Message-ID: <CAJ-ks9=JJ6S6U-Bq0WC1PfJ0P9G3PvugfDdE2q9Q516M-QpsoA@mail.gmail.com>
Subject: Re: [PATCH 03/10] rust: xarray: add `contains_index` method
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 4:38=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Tamir Duberstein <tamird@gmail.com> writes:
>
> > On Wed, Jan 7, 2026 at 1:34=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Tamir Duberstein <tamird@gmail.com> writes:
> >>
> >> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@=
kernel.org> wrote:
> >> >>
> >> >> Add a convenience method `contains_index` to check whether an eleme=
nt
> >> >> exists at a given index in the XArray. This method provides a more
> >> >> ergonomic API compared to calling `get` and checking for `Some`.
> >> >
> >> > It isn't clear when you'd want this API, and neither this nor the
> >> > example are particularly motivating.
> >>
> >> I added this when I had a line reading `if xa.get(index).is_none()
> >> {...}`. I think it reads better as `if !xa.contains_index(index) {...}=
`.
> >
> > What was the code surrounding it?
> >
> >> Do you have an idea of how to improve the motivational factor of the
> >> example? Writing motivating examples is not my top skill.
> >
> > IMO writing a better example is not the issue; rather it would be good
> > to understand why you need it. In my experience `Option::is_none` is a
> > smell, but hard to say without seeing the surrounding code.
>
>     fn get_cache_page(&mut self, sector: u64) -> Result<&mut NullBlockPag=
e> {
>         let index =3D Self::to_index(sector);
>
>         if self.cache_guard.contains_index(index) {
>             Ok(self.cache_guard.get_mut(index).expect("Index is present")=
)
>         } else {
>             let page =3D if self.disk_storage.cache_size_used.load(orderi=
ng::Relaxed)
>                 < self.disk_storage.cache_size
>             {
>                 self.hw_data_guard
>                     .page
>                     .take()
>                     .expect("Expected to have a page available")
>             } else {
>                 self.extract_cache_page()?
>             };
>             Ok(self
>                 .cache_guard
>                 .insert_entry(index, page, Some(&mut self.hw_data_guard.p=
reload))
>                 .expect("Should be able to insert")
>                 .into_mut())
>         }
>     }
>
> For lifetime reasons, I cannot borrow `self` in the taken arm.

That's surprising. Couldn't you destructure Self so that all the
references derive from the single mutable reference &mut self?

>
>
> Best regards,
> Andreas Hindborg
>
>
