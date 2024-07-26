Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18ED17624F
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 08:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721981708; cv=none; b=f8VIUWe8frdvNdc74zqtnMAISlbj7rWrF+wlw7CR7tK+kiumPwrDWHZ2PmlngJmwq1gWnCesNeTqZjN4qfhXtu3jXtXkIuPqNAhIPAVnYbT52dgIrTQ1R95UgybKQkJ6wXT+xGmcRYi3l9SlqghNSrahsTatUZE1kX7EnOBkZZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721981708; c=relaxed/simple;
	bh=WUXF4cHSMIZbofUj+HCSNs3kDoKeQX31JhVld0gXxE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9+qQ174qBeECjCq/yf5a/DP6njoss6GMSogQpdBR1CE7JbIKXEq+JmRoYx0tlRmX8kogLSTnXRA9J/AvU61g7vd07r/NrFwkE9VgRwiR8gCyDEJo6kiEslK7mcwLh/peWNEa32COKF2NMPSF6k5DsYa7omtB4BbbNVuMVzXM3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GOnkRQJK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GOnkRQJK"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-368526b1333so1544408f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 01:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721981705; x=1722586505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjvUXRHyafAOxO1P1TeDnrj5lpR4MgApipaUexR3DIY=;
        b=GOnkRQJKBcgbaIOl3jqvPvrDKOPwmyCcrLbUHgbKDvIIhmP9Pir5B5Gr5iFlz0yrAQ
         cUjA3n7iLpEsS9Tm6SPjiGs521b/bq8zSMQ5EIg6ReIHknV1ahN7G1OWcpVGBdG/xkfQ
         VIYDtPfh9NIVs9JcvGRpKnptu5OcQTYu7YSgeh/zzfErvH0tzj1WRFP287pH4rJ7HldG
         wtOTNTif5OjAgwvmo7mUsIBLFkcpOU57jUmmMKij+b9VAthlw58mJLN+FB6/eaY5+2d8
         UjP7y8wk1W5F/JBNEbl1EgJKhJR6XpXPmFN+Y9THYOdbez/97JtNvr3tpFiMQk+F6g7h
         4i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721981705; x=1722586505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjvUXRHyafAOxO1P1TeDnrj5lpR4MgApipaUexR3DIY=;
        b=mTCmwVHXL9NqfWLWS3H3FPQUmBL3P8DFsroOA9sGslpOk3AOI9y338Zzjc/14wIuYu
         wNev4oSb34JL+NDLqMvSIIgA1JfR2rK5i+tbFj0ulPmSLDUN0Z1GJEiiVTswhTXTRGlJ
         ZT0lzAUC+iA57dhrpTJuH5QvzsJpjuO2rl/bCnrSsMot57bn1X787PIxCcgQakOTIDfD
         gz68Xci/VAWM/ZPNLQJCIpr7CTHUn5wtDPV1f+lKqrNEhNoDl5GaC5TrBmp8GXBfkchz
         Mc/D+CAh3kms/TCy2BRf4DCl4vKdnBWahMY3gVSHZKIWVHbsv0EY203J9ChZFVw3QpNO
         i9Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVkKYLfpzqmdBBunagwKjQjXp7msVlL0zYBxbcxWLFhu5xQTY4UypA3BPJWaO3XJpYZ34PXl4Est5nc/scuiXYeKE0oZ9A7YpvQTiAgOB0=
X-Gm-Message-State: AOJu0YwPmGdw0r9rsRlbOrWJyMMgLQy2E4Kvtl6rQoZj3VoSURl+Rd48
	ShFuxGjCTKzT3sHffid1B1AvsBdYAzDx3l18bH1UKx1nYhXQ2kHTTlMjuzvkKfIlgBnUzIl0LJn
	UsmA06yvoXWgLOmhlo83Grcug3R/dFXTc37pj
X-Google-Smtp-Source: AGHT+IGAYV5/wJgMUc0BHUbBo9+VPtYNIQeV16LrOeWH8imtbYdIWcBEFjfmQ0Zs3iiLis1elqPhIgNXqTCkczodUcs=
X-Received: by 2002:a5d:6b09:0:b0:366:f455:e7c1 with SMTP id
 ffacd0b85a97d-36b31b9b227mr3300733f8f.27.1721981704862; Fri, 26 Jul 2024
 01:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-vma-v1-1-32ad5a0118ee@google.com> <3bf6bfdc-84af-442a-acec-a58f023d1164@proton.me>
In-Reply-To: <3bf6bfdc-84af-442a-acec-a58f023d1164@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 26 Jul 2024 10:14:53 +0200
Message-ID: <CAH5fLggDDXmD8Nj-r0_bbEfquuKfOeH7bJkcA4GA=kKk8=gi7w@mail.gmail.com>
Subject: Re: [PATCH] rust: mm: add abstractions for mm_struct and vm_area_struct
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 10:11=E2=80=AFAM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> On 23.07.24 16:32, Alice Ryhl wrote:
> > +pub struct MmGet {
> > +    mm: NonNull<bindings::mm_struct>,
> > +}
> > +
> > +impl MmGet {
> > +    /// Lock the mmap read lock.
> > +    #[inline]
> > +    pub fn mmap_write_lock(&self) -> MmapWriteLock<'_> {
> > +        // SAFETY: The pointer is valid since we hold a refcount.
> > +        unsafe { bindings::mmap_write_lock(self.mm.as_ptr()) };
> > +
> > +        // INVARIANT: We just acquired the write lock, so we can trans=
fer to this guard.
> > +        //
> > +        // The signature of this function ensures that the `MmapWriteL=
ock` will not outlive this
> > +        // `mmget` refcount.
> > +        MmapWriteLock {
> > +            mm: self.mm,
> > +            _lifetime: PhantomData,
> > +        }
> > +    }
> > +
> > +    /// When dropping this refcount, use `mmput_async` instead of `mmp=
ut`.
>
> I don't get this comment.

The C side provides two ways to decrement the mmget refcount. One is
mmput and the other is mmput_async. The difference is that when the
refcount hits zero, mmput_async cleans up the mm_struct on the
workqueue, whereas mmput cleans it up immediately. This means that
mmput_async is safe in atomic context, but mmput is not.

Alice
