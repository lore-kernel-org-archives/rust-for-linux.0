Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AC0306D3D
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626439; cv=none; b=Y34EMI3Q64zcJWtBQhIeMo0C63PN+8g6Ew4ame23O7kbK8tG4h/TTk9gunql82xxFLamsnczmpy3rSkNva8jaI6wKGK2pM/x/QBSFUR2q0n3QLARAMu36k1aVfqltvFW4OakmkE06eHJFQCSeJA7+MmHNsXmkKzqaUUK0TwytVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626439; c=relaxed/simple;
	bh=JzutmbHUiEwmJddfFawqmQsPAgMaUX3dtPouDZtpQbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjG9fT24Dqqkn/AGkkj8HbLEvPWe/5GOVxpPlg+CBZ+VKJVuKJ18YLlGvCoTwQgKw8kjvkklcJQCEQEIf7IVQMcTtY6Cp/xwnx4AqoBnKv9+D7L+x+yWwRom0hPLyIii3RHeDxH36ZZHhV7/Y657eKstXZ8wW32PPDOcmt2qaGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyDiDD6t; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyDiDD6t"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so15067337e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 07:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767626434; x=1768231234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwjU3wePhm+UjFo+okkMdDj+89n6Mtxb3zsg52SwFXc=;
        b=UyDiDD6t51LR8sAmRTx/frdZ7bVyliBhJc8hh7BNdS7Pxbh+cfWwTQAqI2oGY1CZgx
         oMlpbBGWkn+CnsOaiUe02zTHF8uRBPAS/Eikw957fzIKbF0+yUX3IxLZmTVel1hKHb2g
         Z6bpHu6ufdP7CEnwDdn1WrTnHM/etj2zM8ElEUYUo6prgSA82EzvvSZfGcIwuFI/u5QB
         Bs2TeFq0esh+6tJ9OqO+9/4mNo1TgAhxG8YNZ4NvQEK9OJxpUQsdcsAOXL1kptZmCp09
         /uKz0JCc2COytETh1NznntahgOSK9RPyDQvVEbHW8w89K6eF/ixKYNDz3MG8+C0bazm6
         anqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626434; x=1768231234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iwjU3wePhm+UjFo+okkMdDj+89n6Mtxb3zsg52SwFXc=;
        b=WdKIUhc+fNAJPMeRslev1zUJzyxIvfCiucX5F8mCIru2/y+i7RAgVY+KJBiwZN6+nE
         EypMLRQEmc+0Z8I8DI4OytjfhAVx18t1MKHvrKR8TfTcYKeWN7rmt+jrkZuTG96fTW9Y
         b6I/WlAbjQT6Wp/vrTijmCe1+fQKZ2kZ2CfKQcGbywprs6d2BeQjDF9pS5SrHaH27m3e
         IbEYIDu/0eLYI/WuprjmzoiHbHxyfxtXsg3LZ5OzHvKmi2eFQb8IrSgiEOAWdLBCrAIE
         sdQuKUJ8qlLiEfM3XjLV5MP6/F8tWVwyquP5b9Fw/yL72YBPxcMFhoeEIH5FlmN6WkzN
         U/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXudStdkjJAFaubA8THiyc6nwj00bh69UvvzKbz5Og1Wt07lxk/I4xRIC5OiAxby9cHg22fix7eJfetQkunTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGF/ZcLtp67ke1ihS8jhjHPkAK3ybsvreQNjtr7oaCGCbkwU6M
	xm08NvUhGV2tHisDTGzizpz5RGF2fXL19fK8IGSxdGiXGwauyutgOQBMhF58ILdAjEc4C7ylRI4
	TbHcVOt+Ec7wuMUmHva7jjFR+4/iBdvI=
X-Gm-Gg: AY/fxX42Ky+u0HSfkIHBTmz1fXpWjg+xE081MSHRg85S6y/+40xdKfnPVukCyiR6jpP
	/FpsdvA9/Kh5cPH7B0fAh9+WqME4GCDygBLNu0MM4mqE6H0sN/VycLHzmYfElEfaMmdz+MW+Cbg
	uCu85e35+P6x/Jgu749mO1YjbuZBE2EyIhLtf/j8GodTzOYUXfStYp9bXLer4nQ1MR6Sh9iViMz
	OxYI8I3ggnLKorNbATxTCgARiZSxAqSYVTfnf1uuwSgWe6qax8fxXZsHg04sUGsBKO2rqEVvp0x
	W2f+hQAYeF14OyMvRgXZVFz+3RRJmpDVKaWG8vL+vvTge3Reauzor7sjMtMm12nMMK5BblfLA7E
	hCKeD6dW9TQZUaA6ECNCVDHQ8BvWXeNk3ISiNIpMJEg==
X-Google-Smtp-Source: AGHT+IEbc3p2YaKC5w84Iej1YYKMh5i7QD+yi4bS1B4JKHp8EZu0aOleEPwdRqRC+9FfYq3Uv1aQdNCqrROD4Mh9f7Y=
X-Received: by 2002:a05:6512:b05:b0:59a:10df:3599 with SMTP id
 2adb3069b0e04-59b6520ec26mr35861e87.6.1767626433963; Mon, 05 Jan 2026
 07:20:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211185805.2835633-1-gary@kernel.org> <20251211185805.2835633-4-gary@kernel.org>
 <CAJ-ks9mQXP1mAYOseoUo0jbKD0FrhKOSW7ifgOUKzfrTM4WYeA@mail.gmail.com>
 <20260105021756.5df32974.gary@garyguo.net> <CAJ-ks9nTwOvJi=5b7SLZn6ZEd9pPRPQJosnAOScEw6LJ__Un6g@mail.gmail.com>
 <20260105142733.3d4ecfde.gary@garyguo.net>
In-Reply-To: <20260105142733.3d4ecfde.gary@garyguo.net>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 5 Jan 2026 10:19:57 -0500
X-Gm-Features: AQt7F2qxtBNpGbLPIG_40N6z5dufCLqiBjb59BsuyJ3-fpeT7Rp9p0nKY_eBqsE
Message-ID: <CAJ-ks9kFPFjwsgk4ShM1+CLdTSkFLY3WZC6keM=6nKG8Mf7EbQ@mail.gmail.com>
Subject: Re: [PATCH 03/11] rust: macros: convert `#[vtable]` macro to use `syn`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 9:27=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Mon, 5 Jan 2026 06:02:35 -0500
> Tamir Duberstein <tamird@gmail.com> wrote:
>
> > On Sun, Jan 4, 2026 at 9:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
> > >
> > > On Sun, 4 Jan 2026 18:44:43 -0500
> > > Tamir Duberstein <tamird@gmail.com> wrote:
> > >
> > > > On Thu, Dec 11, 2025 at 2:29=E2=80=AFPM Gary Guo <gary@kernel.org> =
wrote:
> > > > >
> > > > > From: Gary Guo <gary@garyguo.net>
> > > > >
> > > > > `#[vtable]` is converted to use syn. This is more robust than the
> > > > > previous heuristic-based searching of defined methods and functio=
ns.
> > > > >
> > > > > When doing so, the trait and impl are split into two code paths a=
s the
> > > > > types are distinct when parsed by `syn`.
> > > > >
> > > > > Signed-off-by: Gary Guo <gary@garyguo.net>
> > > >
> > > > Logic looks correct, but the duplication between handle_trait and
> > > > handle_impl is unfortunate. I golfed on this a bit, see if you like
> > > > it: https://github.com/tamird/linux/commit/8354c5a48769f5e1e52963d1=
9ca57c31e5926b08.
> > >
> > > I very much prefer the code to be separate. The trait and impl *shoul=
d*
> > > be different. It's just that they *look* similar.
> > >
> > > Defining
> > >
> > >         const HAS_FOO: bool =3D false;
> > >
> > > in trait is defining a new contract while providing *default* value,
> > > while
> > >
> > >         const HAS_FOO: bool =3D true;
> > >
> > > is implementing such contract with a specific value. They look the
> > > same but I think the way `syn` treats them differently is justified.
> >
> > Yes, the similarity is perhaps superficial, but the duplication in the
> > current patch goes a good bit further because all the surrounding
> > ceremony is also duplicated.
>
> What do you mean? The only code that is really duplicated is the gatherin=
g
> of names from items (which have to be duplicate due to type difference
> anyway, and they're still duplicate in your linked commit above.

There's a bunch of boilerplate surrounding this code that is duplicated:
- declaring `functions` and `consts`
- iterating over `functions`
- computing the value of `gen_const_name`
- checking if `gen_const_name` is already in `consts`

These are of course mostly straightforward, but it is duplication
nonetheless, and it is all removed in my commit linked above.

>
> >
> > >
> > > I think the fact that existing code has a boolean and do different
> > > things based on it is a good enough supporting reason to handle
> > > different code path.
> > >
> > > For some new `vtable` features that I am working on would require qui=
te
> > > different impl between the two.
> >
> > It seems unusual to justify current changes with future changes.
>
> I gave both reasons that why I think it should be distinct code path toda=
y
> and also why I prefer it to be it for the future. I did not justify the
> current change with future changes.

The today justification (the presence of a boolean) feels weak to me.
It can be made an enum if that changes your position.
