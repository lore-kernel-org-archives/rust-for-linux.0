Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4619336D9EC
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 06:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777529838; cv=pass; b=i0O7WXfBIUuLVfOYExsTbLUx8V5f/+bfuOmNJtbTgHFVXt6+fJIs+eK2X3qTLuEv6hWzzKfH72ZR1ZGWX3evX4x2Smus3T37ZRUbDDDgcHYKevF7pDM4h0Lh4phpTK/gnqM2ApBROMR8lCetgCYt3tqOHeIeXeb6n9QzcYpyLTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777529838; c=relaxed/simple;
	bh=EvIFSTd4DIo94eKbmVumuYiMsEr969T+VaT7zIlrfuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5bsNCNmJsAy+exMUYwzlkbXHp/laA72IhXZ8aAWmhWOTKBkj29R+Jg7xdXYKptmEgoh5RCsf/5Qk2p+dvm2AKYL89f/3R3Ud0idge7NRwaxYVnb6038M7zsryc2Yx3THP/s4rIa3LrBPI0/V72HYgAdxNyCECvHr0DxfqaRwD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDagj74u; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDagj74u"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8f83efb5729so65143285a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 23:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777529835; cv=none;
        d=google.com; s=arc-20240605;
        b=TOF5tEL3eaQwwJezLIKw662fRRjPVLeP6bFjjEmSHI8hONSz7HwdHRaW2F3OMGjQPy
         uv/wCskIsqzvHQ411SxHkbesDL/PZ5FqAjdCNbzJ1kopZcEYn8cA/zBbU39m+K5Qb9of
         Y+1FwOPEswLBoPHECYT6+yIg/gqiAmHfD1We6iG3LZnhC9wfhH1SS280rQ7zF3opEaGX
         c6GVoj2MBKtk61FstW/WNmbA72dF9dESKZo/iRgLB7hDDDQtMgRmTJWahntCjuB+ydqv
         JH/wa7JlEuZmcpNpANiLRO5cAcN5bjEyC9JN5wV08jP7beJng3VEh8Xp1YXffIQiHt36
         8tZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UbyXbbJhz3wfsmoEZ41b+VYuM6EaOFn1oKvpRZNFE6E=;
        fh=8C1OCN/XlTsaGBmxu5opt2ZpK53667RN+QyM6Lk8200=;
        b=SJ2SeVAr1vxA9Q5S+80cdNXbrEJoLwb/bICphe7wrtRlfNrpWxOjDEZZHZOiIaWmhH
         86lWrK5W82ZUXep0eAuCilLbL6AaK5eRuxNKqel+HAfz7rHYQMPO1Giy2FPQIZm/rM5H
         AmRq//UvmdSschcuM7jMOmcAVI7SGBlNwwFWTyddmr6o50yeQWYZ0Qnnp4aFX19+nqZL
         0cXWb62NuLJiA3Eoty0nCm2iNQi2b8Dae4TrrKOfNvxjx9TyfHtwT+BFo4Dnn4t4neB1
         /jZ8L25LUJmN3F3t1P3b0Lgp2GcPb2te+ixM7kHmfHEOsE7Gdz5QLDXgat4Tv2gGAs40
         ypig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777529835; x=1778134635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbyXbbJhz3wfsmoEZ41b+VYuM6EaOFn1oKvpRZNFE6E=;
        b=IDagj74ujSUA80tq6GHOrM5wUfyKbw0FxEjyWQipW20H6hkqNTscuDNOdgpu1wyIHY
         dUcoddfvRXPAidgyaYicAd+xlCb6eoUBHrA6NBAtYio536FzUwNeyvQxwTSA13GM8cmZ
         DLDv6VTm3iheYwLl9kUNcurZNthknt+RhzVmh2IuRWA08YL1imVhULBFqIzlF9gfpu58
         kcfLshJ38asLAe+4a6jdABRdjvkFMT+a83nuY6WzOOAksE9SZ2mkLO8mKzCnIVY7TJzk
         jXE/pbqDI+JhIYjncrTB3ADkyMaADfwCC6vkqBEyCB3sn+/NCUnkEeUpQCqcdojurk2D
         jvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777529835; x=1778134635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UbyXbbJhz3wfsmoEZ41b+VYuM6EaOFn1oKvpRZNFE6E=;
        b=VEgs7ZmsZzft3pKsIxwMefGJcHY9BOzToGWPY8GfqRVJtlB5aauypNzEo/pnlMJsJp
         8bp4QwOTW6IKLRNEmJyySotHIiasGsPnXrkkG4+e87pHL2vjw3JtwBcTzb1DupibDx2M
         5Kkid98h6J57KTUF3yOC2kloZYqnC+F0ARLVwt1r5W7e6gRds1KJEiwVXnNFflpV0oLs
         +olcb5uqA8RkKKUbMSzplH+oN465GYvB3sH9ToPMz4skliSGDeAajHq+OiK1lt1Pk3HI
         61/oYvQ9i6krL5Mgcr3JhViNA5SRjoPQPEtrrXOElzA6BatN7dd1G6kPUMgo4LciFa1/
         j5jg==
X-Forwarded-Encrypted: i=1; AFNElJ96e91kh/HLizcgaas3EHbN2TXFztsCOyiiv1WRH2OOz8p6WjiBAZRzhTcp4NPiyG0WhhYQcSx1T7+UmjizDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1HroNqGcwd0UIfZk1mpGrve6a6Gqhz1rKlFIdG4234rcKrIbb
	ZCimq03Mn0Y4dkc4EPJQTbNwlbVkzY23JA5kLfDCmV7NYdm3lXeNWvdzlVXcVLRtIzj+2a0/D78
	gX6TSC3O/X8F+8V5vxs1SOCv16gIITBs=
X-Gm-Gg: AeBDiesp3Cg1TuZJ9LyjqzWQkqi2bVoNx0+w1XggaVuRUXkjgz+TZYco/IQ9OADxcG4
	edjhVFznxL+c1GeepNXX2Xoh03jmN7U6TGuuyyAz+T4WrlXsfE1YuBFElD1S9KedkItf9mo6nO2
	C6SuXVfFslkxGJi+UFVb2F/cXWsu6Iqzioi9GeEWLuFcvsWYHz8CXXHAmHeqMfewgyt+Tyx4Y8r
	H72ncvwiG7dqsnEEhHdD4TlWkUNEjcJe1rcYm0JpQFYMQMQDqyHHq9mD9TAnr1qjPLs4gx4te1h
	gBwnbT1OSbw2stBDJk8W
X-Received: by 2002:a05:620a:25c6:b0:8cf:d386:1db1 with SMTP id
 af79cd13be357-8fa88942ceamr252782085a.31.1777529835153; Wed, 29 Apr 2026
 23:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430004857.38281-1-sagartaunk2@gmail.com> <20260430055852.18927-1-work@onurozkan.dev>
In-Reply-To: <20260430055852.18927-1-work@onurozkan.dev>
From: Sagar Taunk <sagartaunk2@gmail.com>
Date: Thu, 30 Apr 2026 11:47:03 +0530
X-Gm-Features: AVHnY4JCKDDN8w1w8zFTJtiPwsoiibBINeAaCZs824kbJ_KjlZJ_7V1-tWrlbjo
Message-ID: <CADETf3teLF_TRa-MT4LCJQK4uvJpHYUxn1Wn3MJ-MiN65y9OxQ@mail.gmail.com>
Subject: Re: [PATCH] rust: workqueue: replace SAFETY TODO for
 `WorkItemPointer` impl on `Pin<KBox<T>>`
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the feedback. Are there any other things I should try to
improve in v2?


On Thu, 30 Apr 2026 at 11:29, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>
> On Thu, 30 Apr 2026 06:18:56 +0530
> Sagar Taunk <sagartaunk2@gmail.com> wrote:
>
> > The original implementation left a `SAFETY: TODO` comment on the
> > `WorkItemPointer` implementation for `Pin<KBox<T>>`. This patch documen=
ts
> > the safety requirements that make this implementation sound.
> >
> > The safety argument relies on three guarantees: `__enqueue` strips the
> > `Pin` wrapper via `Pin::into_inner_unchecked` and leaks the box via
> > `KBox::into_raw`, producing a `*mut T` whose allocation remains live fo=
r
> > the duration of the queued work; `work_container_of` safely reverses th=
e
> > `raw_get_work` offset arithmetic to recover the exact `*mut T` that
> > `__enqueue` produced; and the workqueue guarantees `run` is called exac=
tly
> > once, making `KBox::from_raw` sound.
> >
> > Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>
> > ---
> >  rust/kernel/workqueue.rs | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > index 74c59f2b1c09..f31412fca303 100644
> > --- a/rust/kernel/workqueue.rs
> > +++ b/rust/kernel/workqueue.rs
> > @@ -881,7 +881,12 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<I=
D> for Arc<T>
> >  {
> >  }
> >
> > -// SAFETY: TODO.
> > +// SAFETY: The `work_struct` pointer passed to `run` originates from `=
__enqueue`,
> > +// which strips the `Pin` wrapper via `Pin::into_inner_unchecked()` an=
d leaks the box
> > +// via `KBox::into_raw()`, producing a `*mut T`. `work_container_of` t=
hen safely reverses
> > +// the `raw_get_work` offset to recover that exact `*mut T`. The workq=
ueue itself guarantees
> > +// that `run` is called exactly once, so `KBox::from_raw()` correctly =
reclaims ownership
> > +// of the leaked box.
>
> Not very human readable (at least for me)... Perhaps you can check the no=
tes
> from ARef<T> and Arc<T> impls? It They should have some parts in common l=
ike
> the initialization part.
>
> - Onur
>
> >  unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
> >  where
> >      T: WorkItem<ID, Pointer =3D Self>,
> > --
> > 2.54.0
> >
