Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B843A224D4
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jan 2024 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4AW5NZAO"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7cdef012c0eso40279241.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jan 2024 05:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704376136; x=1704980936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMDVMQujU84yMnm6nGs6lmfbP0leDvmtuXFBPjTVJb4=;
        b=4AW5NZAOA2XXKN9zE3aGrLmr64RI7vAGWhTgyn0RL+IOduUXxmkbR4+kzSAb42QPFV
         ckeevFQAM9A8Ski/W2J7FOXatbUf0HYpSgmK5XK3DxMbql6AovV/nKyZBouWh57JJeQY
         W0hsOE1Hi9AzKFqIqnf4MyQmQzguXIOmEue/MCE+cdtJFGH4Qfd8sDvCvdSe8dnhcdmO
         8TLXPdaIzBC7efigLtI9+E9kne4FTNGUntNkmO3g/DOIorMsRfwUmKKbEPgBGzF9fgVt
         LFhDruQejqS6MJQCuRs/pKrzrisnDAv1hDnOBA4ETrjaKmJG8bP5rM5akNJrSYc0SGG5
         Sa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376136; x=1704980936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMDVMQujU84yMnm6nGs6lmfbP0leDvmtuXFBPjTVJb4=;
        b=eM67vbZK8/le1NnB6LSmQzDvn0QF46Y3daFA5D8b5B2xlZICXFq6P9apWX8MkAQqrR
         cWKJ+mgrmPaytVyb1koxJWT4e5U8QNrj39gbin+wk5ONxv2U6FlbnhUi+k8fbSLGafIC
         8b0bdbRCe905dIPeVkvF3ougbclMuAfOs5g8w0vjd+qx7xtgAl8A8SEj35TUSgJLnmzE
         Zm5uqX+DdN5KWibwrFse2m8hcQlJKRbIbnTFHCg5ckNlEPAdZXL6onZnJ0NQnCgEFq0X
         WP91460gLdE0cljA1LXQZXw8eXKhZxDB9Hs9uGYJpWWVEAn3APul/EtMbH1Gh+t/YEp0
         tF6g==
X-Gm-Message-State: AOJu0YwVGHD58EI98ao3Tt9/p6DAh+pTW+j3XhmmGmNojQLyM6PK+m75
	hedN0z4924PqjQ5mWf3GAsny/UdvhcyKg/bvKYFQP7HFH8Uy
X-Google-Smtp-Source: AGHT+IH47FmuyfTmRVFeXPOqqDNbtmVdCsHNqrvFBlVRhnrPJIaMHV7+5pPWivmai2Px+Q47+cEV48pgmwOQWxdGXrM=
X-Received: by 2002:a05:6102:f86:b0:466:bdef:478c with SMTP id
 e6-20020a0561020f8600b00466bdef478cmr419685vsv.13.1704376136134; Thu, 04 Jan
 2024 05:48:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231216-rb-new-condvar-methods-v2-0-b05ab61e6d5b@google.com>
 <20231216-rb-new-condvar-methods-v2-3-b05ab61e6d5b@google.com> <ZYC2W5Rzdrsr2KKv@boqun-archlinux>
In-Reply-To: <ZYC2W5Rzdrsr2KKv@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jan 2024 14:48:44 +0100
Message-ID: <CAH5fLggOxwx4+qDjP8WV_e1Nw3oxAxXDDJuQ30uSVEcA_yn55w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] rust: sync: add `CondVar::wait_timeout`
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Tiago Lam <tiagolam@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 10:15=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Sat, Dec 16, 2023 at 03:31:41PM +0000, Alice Ryhl wrote:
> > +const MAX_SCHEDULE_TIMEOUT: c_long =3D c_long::MAX;
> > +
>
> I'd like to put this in rust/kernel/time.rs or rust/kernel/task.rs, but
> it's not a blocker.

I'll move it to task.rs.

> > -    fn wait_internal<T: ?Sized, B: Backend>(&self, wait_state: u32, gu=
ard: &mut Guard<'_, T, B>) {
> > +    fn wait_internal<T: ?Sized, B: Backend>(
> > +        &self,
> > +        wait_state: u32,
> > +        guard: &mut Guard<'_, T, B>,
> > +        timeout: c_long,
>
> Nit: maybe `timeout_in_jiffies` instead of `timeout`? Or we have another
> data type:
>
>         pub type DeltaJiffies =3D c_long;
>
> or
>
>         pub type JiffyDelta =3D c_long;
>
> because a "c_long timeout" really hurts the readability.

I will rename this to timeout_in_jiffies.

Alice
