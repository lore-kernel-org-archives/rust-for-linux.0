Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED53F199E8B
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Apr 2024 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712852517; cv=none; b=Dl5a96HllBxqrxO/SmkqB4BQrwJluqGSswyWuefS2eaahXFBISBezZgHtc5cJOM/rLez52RcgDSq8cwWGcNkCcgfTjvHPFmqJM2pSymY+05314b66frG9Wx6svDrgE8gg6NkONStdggz2kn8aw6q2cYFpf1ceDNd49BTdMZrcaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712852517; c=relaxed/simple;
	bh=lf+0Ib0/SILN3w7/PCPazIMQblm1eMQjgq0Ng4XGKNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACYfgbw8tAcgiYL/GHcOTWnfZVE+QXoAz/h//ECtVksaddB2pNznAOsLNX063lksmIB+PDiWnHTRd4DUa7e+eiUK4ie4FOKvN1N3+uVmQGx2fQjKa3G4XjJMOJYcuSSeihzmg6MOsxGdhTUEb+2MgZaBnt3ZFtoNMDtp3/2eRHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zMnH0ULc; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zMnH0ULc"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c612fa1956so287164b6e.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Apr 2024 09:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712852515; x=1713457315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcZ0pKuDsoHogwdYuz9mbRdwS2176lXlA0vTIaXKs1g=;
        b=zMnH0ULcpk/KnxXzuQGSuJEzDwYXSJyiOjphfmUxivDi57fC0HuCsgLiXgtuqeS/ot
         boEr7tASYZ9++10beVcD8wK4s+hKPqntMoqOG9WMCQ1/H8VFy0ctro8n02DKqS1t/vcp
         iGW066n5TuiIGrP4ICG5g9huwn6jTecXvyZcTIYry4g+0iVxxBdXPn44uwzbu/FA3928
         pPC5g63RzV1RqeMIdF0yTgecvsWtF9/2rV/QRnIFJf/2pe0xF6hP3ELgs/ChD/5HiqOW
         ghDdDy/5oiz9bX97l9aC+B9QFIKzYfKSdT/Aplg2WZrFB+yLk0wTYWtR1QbDDm05MK94
         2QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712852515; x=1713457315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcZ0pKuDsoHogwdYuz9mbRdwS2176lXlA0vTIaXKs1g=;
        b=GMXw04mQ+gSQtIk2FQOQ7hIOD4uitDwbGb1n9wgOxlOWHjLLZVWGNG3xh6YoOqyupj
         7UC91kltUfFgWGVC2I/TD9lfBaibRJP1LiY1qh+h1CBq5l/2Pu6WxRXSZBXrKaBq1RMN
         raGn1h2zEyg65SUXaDxgYHsZs9XD22dwOKFJZtHNNNdVmTbxb+SPdS37tIgob5aM1MUK
         78N2tktc0oT9qkUr/+vrWRHW69qjp3ZKZhOLDCaBRVe4J7pt5fVyC4czdMnyeusJZyk2
         OozrtYf3eVu10VrB1ugtJJrqe4K6MsJiOocVCt4SWDk4ZOiy8d+TpvTzOS277y7oJnd8
         vQog==
X-Forwarded-Encrypted: i=1; AJvYcCUrfKnTZEr1kUPa6qw87b92d+boxQqfWUPxk8MY+ziq6maCKl2f8aYn+ruAycEzDjOHw5m3+6NSeS3goYE5HjPnVWjHVfY/RSKMrVO9Mr8=
X-Gm-Message-State: AOJu0YyzFXRrNYkKHuLwVk7hg/+3wFSK6rpEVivu/LsCxutqcaBpCHBa
	bnTtL+mmV9TWYEAO15747v2umaNYudo4q+6AekQWQr7WmKd3ekCuAJCKIyVCDigJz5NwswfZWzU
	BDHbip/QnfzUW++eqYCBEx61endYO3I1orxJn
X-Google-Smtp-Source: AGHT+IFcZi96Ry1HT9pKgtfjtu0w8kWo1mew/Ye/KOYKY3s21BuVIydCjug0RSuMOVFkuaeS3O4HOABhJR3D+LUzbSQ=
X-Received: by 2002:aca:100f:0:b0:3c5:fc80:56a with SMTP id
 15-20020aca100f000000b003c5fc80056amr109433oiq.32.1712852514866; Thu, 11 Apr
 2024 09:21:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-rust-ktime_ms_delta-v2-1-d98de1f7c282@google.com> <ZhgISqMcEl21QZmW@boqun-archlinux>
In-Reply-To: <ZhgISqMcEl21QZmW@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 11 Apr 2024 18:21:43 +0200
Message-ID: <CAH5fLgh4-OunYFmKYJ4L-jWthiB2D_moESpsZ7vwz0gUxdC6kQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: add Ktime
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 5:57=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Fri, Mar 22, 2024 at 08:59:38AM +0000, Alice Ryhl wrote:
> > +    /// Returns the number of milliseconds.
> > +    #[inline]
> > +    pub fn to_ms(self) -> i64 {
> > +        self.divns_constant::<NSEC_PER_MSEC>()
> > +    }
> > +}
> > +
> > +/// Returns the number of milliseconds between two ktimes.
> > +#[inline]
> > +pub fn ktime_ms_delta(later: Ktime, earlier: Ktime) -> i64 {
> > +    (later - earlier).to_ms()
> > +}
> > +
> > +impl core::ops::Sub for Ktime {
> > +    type Output =3D Ktime;
> > +
> > +    #[inline]
> > +    fn sub(self, other: Ktime) -> Ktime {
> > +        Self {
> > +            inner: self.inner - other.inner,
>
> Nit: although we use "Release mode" to compile Rust code in kernel, so
> i64 substraction behaves as 2's complement wrap, I think it's better we
> use wrapping_sub here:
>
>         self.inner.wrapping_sub(other.inner)
>
> however it's not a correctness issue for now, so with or without it,

We enable overflow checks even on release mode right now. But I don't
understand this nit because we only have an overflow condition if the
two ktimes differ by more than 2^31, and if that happens then that's a
*legitimate* overflow that we would want to catch. Or is there
something I am missing?

Alice
