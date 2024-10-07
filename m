Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B4B1D7995
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Oct 2024 14:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728310622; cv=none; b=kPdBTDf0gwKRqLpBGT9oEN/IPvF3pzuT6eME5HEopFfoU3vLa01kJIoZbu5ZGZWMZX1UoVX6D9rWGSooigPmzI23IPmLgT/wN2l2AVM68z4R9gfV1tVrRzX/4mZa05BByBz1nR+xg3vHJAbYXHHFyVylRm6cZukK6CiW4RD1itk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728310622; c=relaxed/simple;
	bh=376HqnvNhc5ZE0HBO6XE8aIeQfBue1EBUdnGFKgW028=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvUXCh/gdxISXlJpsuJzssV2+P0qll+jWzcrKb+UX1d7YjgI+W0HhjHzdfQwQNlV2DGSoLXejpFgM/xSot4ehE6AgJOhe4cfh4CJ0rHrlVJhqTJhOLbIeDLrnIWup1yNqbmisSQ2e1yhoqUuoI2gFEYSPf/2WbhZcjemZ3b0YLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fcPqXvXc; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fcPqXvXc"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so3693739a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Oct 2024 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728310620; x=1728915420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZotRyJfqUBQUUh0GdjsSXNxbz4lowqfUZ4/U9osmyA=;
        b=fcPqXvXcxEMkgbz11ctygKKwnEzhK4OL6i+PhJxnCrinRC0LpMtkgD474UtFJ8nzk6
         1gPNyUmT3eq+xh6i33Ku1F623wDtyk7LwLwF8VWRHpKlSZnOcIZ7pNmGvwAu5CMFhwmF
         nURwmfU7OJhF5IQHAS8jPhxl3JZoULmxqDhzHpCkdE8UlPD3Zs5rJpKJbFeDBfPf4aHZ
         uMIgGQICxCjO8CTGyfTYIqpmsj2PborSN3a7N5EksxSfUN0tXpCPrdfCdikpRrsCBu7+
         9F1Qz0JRV22GyCSgw3l4nmlfGdZYClqA+29rhA2l3CAa/zEi6qVRHzMwzx3p1nPqi5VR
         Om2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310620; x=1728915420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZotRyJfqUBQUUh0GdjsSXNxbz4lowqfUZ4/U9osmyA=;
        b=BMqFt3Gi57dIYJpUC71yIuWGz6DkPPgu+mUHc2U68bkPFN3Up4P0C3jRSU8O2HhCir
         RlKmJ/V1kiJONDnXqBDZwIVs192glf5ut9yKufkiKUmxadv35xlSnemzQV7XlXceisAC
         c1oiDmkFF8HGGIEeVvXzjai05PK5a4z9OS0F6s8RM7E2ZZGXX53gbABDt2Ft7QuYqxRO
         ow22DkTXj9IX9atbA1QUq0GY1TwcyhabPuEEU1Qfm5tYX/0rOKYxtx6vxthlkitsa5wM
         GYI5zQPrUrR6NkwXNiIOc3Y8FY9TbLjZENldG0XZYfI7x4OHTHw4crAYOeZLHKVZhv5+
         Dn9A==
X-Forwarded-Encrypted: i=1; AJvYcCUsQCYa+0yL2/hiDrJKIr5Cl2nS+s0fhxknNARMpMUuChg3/pfmQacM8zCcA8A1ScyoIajiNR54f8GQksjwLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YycdN+j3JZDRBlpugIS5ApDalwGEK0dRykuV0X7jNFMuwEKy0U1
	IYDAfkI6jq5raQAOjqqH1OXLqHR0Uet+tw2a+5D0mAldrbfYEOqT+tGb2g7uSxUdp8USDgFi7tx
	RfNN+hSyivb5/h5gearxmnFBOn9bcJqyNioQH
X-Google-Smtp-Source: AGHT+IGRirQUTUs43IAYcReXl0EvbBGWtade4ytNJlT9/pAyB7YZGBvddZQaFl4GNDeiuwukPx5yEImABPr95O01a0M=
X-Received: by 2002:a05:6a20:29a7:b0:1d6:e593:1d6b with SMTP id
 adf61e73a8af0-1d6e5931deamr10398837637.6.1728310620266; Mon, 07 Oct 2024
 07:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005122531.20298-1-fujita.tomonori@gmail.com>
 <20241005122531.20298-6-fujita.tomonori@gmail.com> <06cbea6a-d03e-4c89-9c05-4dc51b38738e@lunn.ch>
 <ZwG8H7u3ddYH6gRx@boqun-archlinux> <e17c0b80-7518-4487-8278-f0d96fce9d8c@lunn.ch>
 <ZwPT7HZvG1aYONkQ@boqun-archlinux> <0555e97b-86aa-44e0-b75b-0a976f73adc0@lunn.ch>
 <CAH5fLgjL9DA7+NFetJGDdi_yW=8YZCYYa_5Ps_bkhBTYwNCgMQ@mail.gmail.com> <ZwPsdvzxQVsD7wHm@boqun-archlinux>
In-Reply-To: <ZwPsdvzxQVsD7wHm@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Oct 2024 16:16:46 +0200
Message-ID: <CAH5fLgigW6STtMBxBRTvTtGqPkSSk+EjjphpHXAwXDuCDDfVRw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 5/6] rust: Add read_poll_timeout function
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, hkallweit1@gmail.com, tmgross@umich.edu, 
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	anna-maria@linutronix.de, frederic@kernel.org, tglx@linutronix.de, 
	arnd@arndb.de, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 4:14=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> wr=
ote:
>
> On Mon, Oct 07, 2024 at 04:08:48PM +0200, Alice Ryhl wrote:
> > On Mon, Oct 7, 2024 at 3:48=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > On Mon, Oct 07, 2024 at 05:28:28AM -0700, Boqun Feng wrote:
> > > > On Sun, Oct 06, 2024 at 04:45:21PM +0200, Andrew Lunn wrote:
> > > > However, this is actually a special case: currently we want to use =
klint
> > > > [1] to detect all context mis-matches at compile time. So the above=
 rule
> > > > extends for kernel: any type-checked *and klint-checked* code that =
only
> > > > calls safe Rust functions cannot be unsafe. I.e. we add additional
> > > > compile time checking for unsafe code. So if might_sleep() has the
> > > > proper klint annotation, and we actually enable klint for kernel co=
de,
> > > > then we can make it safe (along with preemption disable functions b=
eing
> > > > safe).
> > > >
> > > > > where you use a sleeping function in atomic context. Depending on=
 why
> > > > > you are in atomic context, it might appear to work, until it does=
 not
> > > > > actually work, and bad things happen. So it is not might_sleep() =
which
> > > > > is unsafe, it is the Rust code calling it.
> > > >
> > > > The whole point of unsafe functions is that calling it may result i=
nto
> > > > unsafe code, so that's why all extern "C" functions are unsafe, so =
are
> > > > might_sleep() (without klint in the picture).
> > >
> > > There is a psychological part to this. might_sleep() is a good debug
> > > tool, which costs very little in normal builds, but finds logic bugs
> > > when enabled in debug builds. What we don't want is Rust developers
> > > not scattering it though their code because it adds unsafe code, and
> > > the aim is not to have any unsafe code.
> >
> > We can add a safe wrapper for it:
> >
> > pub fn might_sleep() {
> >     // SAFETY: Always safe to call.
> >     unsafe { bindings::might_sleep() };
>
> It's not always safe to call, because might_sleep() has a
> might_resched() and in preempt=3Dvoluntary kernel, that's a
> cond_resched(), which may eventually call __schedule() and report a
> quiescent state of RCU. This could means an unexpected early grace
> period, and that means a potential use-afer-free.

Atomicity violations are intended to be caught by klint. If you want
to change that decision, you'll have to add unsafe to all functions
that sleep including Mutex::lock, CondVar::wait, and many others.

Alice
