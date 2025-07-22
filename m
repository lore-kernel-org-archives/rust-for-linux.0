Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144FB27FD56
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 21:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753219433; cv=none; b=g2vgHbSV/ObZHeWBvj/dkrNfBbmmFS+X7GV+/iDgmKQ1Op/Iy5KcvmUrnXMYAN2ubv5rEWd3g9kfZlZt7bBn7QiWjD9XvAzETmHd43g5HtCXamqL7EpH+C2O1VxTMg9DSQDD94bkViVYTBsjbWgshumKz3B7EcREfh//2YShWkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753219433; c=relaxed/simple;
	bh=b/7LJQ6qQ3Q5vacIEXk3tpmjxMdgqSwhrAK6bJjEcMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cwfr17LIuiMKrTUiv+8Hr/xvNruDZ4tgTQnZtaMgnzWxmdWB/EVb9x4CryFrW+YYodqcSg+bXD7Tyspa9OM4p2FV9K4zG20e4HrmrI0GAKHXRJb4+xj87QzVgNutT17bV2sVbPtSQS34ws4J+pR5vrcPFudCrC7CQwB4GjpsrEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Az6Ho8bk; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Az6Ho8bk"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4218ecf4565so184291b6e.0
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 14:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753219431; x=1753824231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHvXNQHoipe7vJQIGnLh+2kNSZ1IbtY7/n2adK7vTYo=;
        b=Az6Ho8bktbGNIyjBviQcw298u4Pm47CjBNL9/cqaOAibsFMExLQ2fyGTDbUCCMkJsv
         M1XKPcjmm57AxtwjOJQMSETvotY+p9Qi/Q5KB2hgH2VkHs8MJB2+1+aXeha7nQGpl/NV
         HDiaiu8GPkmH8UCNQ13Qba0KxLJIteMzjMEKa6eS9DgEdHuDjGn5a6b0KaHEf469bboh
         Pp4K4eK37IUhjMR09F0iswUzhcu8fTsa3WIziJJFdoCBhSjwSSvboWrTGXjKiYTOqFG0
         Tz8pdpyjwz4OLDKFvPtZFzkkeaDWb5QCDoFdB6BEA3WtjUoyNPdNWQ1bAWcaHjZbUj8/
         drOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753219431; x=1753824231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHvXNQHoipe7vJQIGnLh+2kNSZ1IbtY7/n2adK7vTYo=;
        b=VSknKnBtbeHDBI6y+IrPmqPYepB8YsjyKUcrrt7vk/nhK+KBVvdm5u11OdDNEn5p1t
         jRWpLNO5ru4p3ZBZ6DxJRKK59AxuqAuFfH0zXmNYVFWZcGniMSYb9qzsZL2NDnUOZ9Ur
         4EnLj1qvQtDQJ0/vinryoFu5dAv9LgjNcZQNq+ERadOR9WR7eo1imjeYMHf4cyQCaSfG
         Xn62/fZ6GDNaZGNahrn7Y34A/S4R6DBO8zlmec0MDu3nVtwfVm2GpTnTnEo4WeFw2x1N
         q6x9t14xL0Gq4mm/cgu3p++dP7ivLp/4NFl2/6HS6RguKjka4zqNhMXjBApHJ0RXBmd1
         JKmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7volJ6IjIkCtmKb53ldtGZATzs+Uj9Wkoc7aT8/fWZ+lScs6QGfQSGHz+djrbCPTr7lwqONetmiWQ0Ar08g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrVaulRlHwOF1GXyziXuBsblGnOwR8bYrZqusC6OFyfOngtzLq
	2Lp/Gd21IdT8VWXjK0d2no9KXw9LOlP7YHuNXDmOY2B/x9m1h8Rpzvrerzwa1Clzh4bc1nIkaYq
	gMQ6Z1xWsB52UD3NITR9rvKXVW8zf3PY=
X-Gm-Gg: ASbGnctOUGTEQNq3n9BmL2WXzO8NjRj/UN7VBn3B4pYRsZt+9VXlxEe8FEQmQDaeJq7
	d5f+NPcm9gNg0g3I9fUQYihjmJsbgFWmWUCuZw9qHjI+NclQK73b6sseC7i0Mp7hFtxyzX24Uq4
	AZ9r43Qd0yZkgwNkmNFemKRwQYBokZAT7+plR4qw3UIeeH+fL41mHIE9JhSghCuXTJJuV2bfeTm
	SLat+MfgJn3jd7Q5ds=
X-Google-Smtp-Source: AGHT+IGa2JLI9RX6mt7SsEiS/wNhdhIMmcCi9mJkHqTggXOigNvlFvRp14Cy4MefV7xHd92FQIPl11lw0iis8HwqmmM=
X-Received: by 2002:a05:6808:1523:b0:41f:3a24:9726 with SMTP id
 5614622812f47-424a84208dbmr3909478b6e.18.1753219431099; Tue, 22 Jul 2025
 14:23:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
 <20250721010258.70567-4-marcelomoreira1905@gmail.com> <DBHSSQS2IALW.2OEWVKX6PY9LZ@kernel.org>
 <CAPZ3m_h4rvV8gfBi0ZQN=569FhB1+DsF2A6XkkLuWAFUEuKPDQ@mail.gmail.com> <DBIIZ28TA8SD.XY1W0S6G280F@kernel.org>
In-Reply-To: <DBIIZ28TA8SD.XY1W0S6G280F@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Tue, 22 Jul 2025 18:23:39 -0300
X-Gm-Features: Ac12FXyVLcBvfdnEb5gqZWjrw0-rbnrnXtkeCPveaPjQzHuYHMXwny0KC8iBtJo
Message-ID: <CAPZ3m_jepxCD-dr+gyun_=hb-fHX_yxTunsd4JX98nt4XmnEQA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] rust: revocable: Document RevocableGuard
 invariants/safety and refine Deref safety
To: Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 22 de jul. de 2025 =C3=A0s 07:51, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Tue Jul 22, 2025 at 1:01 AM CEST, Marcelo Moreira wrote:
> > Em seg., 21 de jul. de 2025 =C3=A0s 11:21, Benno Lossin <lossin@kernel.=
org> escreveu:
> >> On Mon Jul 21, 2025 at 3:01 AM CEST, Marcelo Moreira wrote:
> >> > Refinements include:
> >> > - `RevocableGuard`'s invariants are updated to precisely state that
> >> >   `data_ref` is valid as long as the RCU read-side lock is held.
> >> > - The `RevocableGuard::new` constructor is made `unsafe`, explicitly
> >> >   requiring callers to guarantee the validity of the raw pointer and
> >> >   RCU read-side lock lifetime.
> >> > - A new `SAFETY` comment is added to `Revocable::try_access` to
> >> >   justify the `unsafe` call to `RevocableGuard::new`, detailing how
> >> >   `Self`'s type invariants and the active RCU read-side lock ensure =
data
> >> >   validity for reads.
> >> > - The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
> >> >   is refined.
> >> >
> >> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> >> > ---
> >> >  rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
> >> >  1 file changed, 18 insertions(+), 7 deletions(-)
> >> >
> >> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> >> > index 6d8e9237dbdf..0048de23ab44 100644
> >> > --- a/rust/kernel/revocable.rs
> >> > +++ b/rust/kernel/revocable.rs
> >> > @@ -106,9 +106,12 @@ pub fn new(data: impl PinInit<T>) -> impl PinIn=
it<Self> {
> >> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >> >          let guard =3D rcu::read_lock();
> >> >          if self.is_available.load(Ordering::Relaxed) {
> >> > -            // Since `self.is_available` is true, data is initialis=
ed and has to remain valid
> >> > -            // because the RCU read side lock prevents it from bein=
g dropped.
> >> > -            Some(RevocableGuard::new(self.data.get(), guard))
> >> > +            // SAFETY:
> >> > +            // - `self.data` is valid for reads because of `Self`'s=
 type invariants:
> >> > +            //   `self.is_available` is true.
> >> > +            // - The RCU read-side lock is active via `guard`, prev=
enting `self.data`
> >> > +            //   from being dropped and ensuring its validity for t=
he guard's lifetime.
> >>
> >> This shouldn't be needed.
> >
> > hmm, about what exactly?
> >
> > Are you suggesting to:
> > 1. Simplify the content of the `SAFETY`, is it too verbose?
>
> It's not too verbose. The requirement of holding the RCU read-side lock
> is not a *safety requirement*. It's already guaranteed by the existence
> of the `rcu::Guard` instance, so we don't need to concern ourselves with
> it in the safety requirements.
>
> Essentially you're just stating a tautology in the safety comment like
> saying "2 + 2 =3D 4".

Thanks for showing me that Benno.
So we can keep it like this:
// SAFETY: `self.data` is valid for reads because of `Self`'s type invarian=
ts:
// `self.is_available` is true.

Sounds good?

--=20
Cheers,
Marcelo Moreira
