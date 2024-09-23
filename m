Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B841885A4
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727079277; cv=none; b=hggPGqSMRZ3qS1WaN+gwGn4bz63oi7HeIb1ZsLco8eEW+JM1V03DfaxibZsBaGDhcGmhOTBwJoRrCO5loYGy5rnV+snBu/tllE8B+vCLirRH+uBeKK2gjTZIIp9PlganvDD6RmswQRdjyzKUEh03owltzAIjH55Llx+cOnvRs0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727079277; c=relaxed/simple;
	bh=o9RYAZ+ihKi/qnu3t8fCvW1gHNpjjOjwY4lKAZHoHaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2uxZFS7H155EdN2KWhAoYWQisEepok3VesL93l3Fa/l+2ypOlSUxKARZy6xzpFt1aLBxc2+5842Sj9A0hwk3xMsEZKQ6ZXcOY+zhDWW0mhoX0Bjpl08ICPVG0by+z5OcOGT105qpQ/cwDDau3vdPo1+nrBJs6MEl5QXWpJBXHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=19t8NNHK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="19t8NNHK"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374cacf18b1so2440621f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727079274; x=1727684074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhm6VDUyFbk0AMF8tTtB6iaMTp7O9/A12f5FRSU8wmY=;
        b=19t8NNHKU7P3mcepq7lVhdUhszBdWl/8KCs3Z1q5ibOSnHiD467Pa1Zrc4ZIdcIQrg
         Two8PjeUnXJYimTqPf9yhWkigzxDVjELdrlbTWZjC6JroYY+iswI4LIC8Oke6EVzqadM
         8nKx1252s0Jp/lL2h9qZVA/igqq+wKGfw7EdE4pmXuAxqfJbipEUEI4AWsPg5M/CWz+0
         kxouq+YNh6UfwLpBAsaBO0tt3udrXCkR0T5YT0bRYtBQNAi3ag0TwWlmMRJBlYUx4tax
         vhkSYtpO0/ReJBphhecoaOYuX+e2IT1BMawZITYJuUnNRiWDf+xqb9/M3+nxFGpe55V3
         t0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727079274; x=1727684074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhm6VDUyFbk0AMF8tTtB6iaMTp7O9/A12f5FRSU8wmY=;
        b=FP8VGdsIihYsqlNrXK0LEBPciXNhpQY81lGL+Ds8rtBjwlQwP59k+deaa3j33sdwHP
         MfMq7HVdwBeTFBZ0LOZoQmpl/MMEYSG49jyWyMKwlA6PNUYxk2/R4/6Nlyvfa6L31pG+
         jwG0aU929I3Xh8+xbyFZ5GLNeLwvGMb9gylrEQLCmkDiMkbaIuGfRaa3w8XQ00MApqTX
         YV2be63aGIKXMdXykNoc0gTl5WShqK0lTyP8sbrQ/niLiizGY28O6yioNZNFu2xOxl4L
         vKCCuK8j8IkhqoHNhkBT9lcPlzmlsMmqX6gAnJHtIOLW1KzBPkWKInRsYu/kW52YXgnx
         Zfug==
X-Forwarded-Encrypted: i=1; AJvYcCWqF41QxHAqEq6Gcb0DTgN7W3ru/Z+oLfUR1XJCtpcNO5QMJVR1zeVXHOXtb+OTaNMlf+UtycvIMohkSKCQ2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxNlUXP+XlhHt8oyGn9wcDUshMflfoYtuyOhBBRrO4EXYZ0WG1
	n3xth3CzRXli0W9zPRf6SZv1xFLPsy6WliOhyqoD0OMY7TsFw6nnTagRLTf9bIHeWPsMQByit6E
	7SS2F+oazgA+rPHB/0uOXi6eU+P6V4dV1Rg1n
X-Google-Smtp-Source: AGHT+IGaGz3aAPtcpdOxV3K/A6xg/czFRCBlIbwHkW2YwCfRu8a/ULBRxzRicaQamRV5tPXenSsxkSmgE7i4TKwB1/0=
X-Received: by 2002:a05:6000:1f81:b0:374:c9aa:f24d with SMTP id
 ffacd0b85a97d-37a431bc6famr6549449f8f.59.1727079273754; Mon, 23 Sep 2024
 01:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917222739.1298275-1-a.hindborg@kernel.org>
 <20240917222739.1298275-4-a.hindborg@kernel.org> <e7e42ff2-1543-48b3-9bd3-bdef5ce66348@proton.me>
 <20240921165801.1d1df6ab.gary@garyguo.net>
In-Reply-To: <20240921165801.1d1df6ab.gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Sep 2024 10:14:22 +0200
Message-ID: <CAH5fLggudKg0x5jjOHxdSq4-m8x=OE7WM+uCtTCJKzG8rm37dg@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] rust: sync: add `Arc::as_ptr`
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 21, 2024 at 5:58=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu, 19 Sep 2024 14:03:50 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:
>
> > On 18.09.24 00:27, Andreas Hindborg wrote:
> > > Add a method to get a pointer to the data contained in an `Arc`.
> > >
> > > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> > > ---
> > >  rust/kernel/sync/arc.rs | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> > > index 3673496c2363..a57ea3e2b44c 100644
> > > --- a/rust/kernel/sync/arc.rs
> > > +++ b/rust/kernel/sync/arc.rs
> > > @@ -258,6 +258,14 @@ pub fn into_raw(self) -> *const T {
> > >          unsafe { core::ptr::addr_of!((*ptr).data) }
> > >      }
> > >
> > > +    /// Return a raw pointer to the data in this arc.
> > > +    pub fn as_ptr(&self) -> *const T {
> >
> > I don't know if we have a convention for this, but shouldn't this be an
> > associated function? Because if `T` also has an `as_ptr` function, it
> > will be shadowed by this one.
>
> The usual Rust convention is usually that if `Deref` is implemented,
> then unless there's a good reason to do otherwise, associated function
> should be used.

The reason for this convention is that adding new &self methods on a
smart pointer is a breaking change, but we don't care about breaking
changes, so it doesn't fully apply to us.

Not that we shouldn't follow the convention, but it's not completely
clear to me either.

Alice
