Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D50A267B64
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740484435; cv=none; b=pfbj0bcQWgGn6BI7pa3hgeV+nRDOcel6GwhVLKNdhNnYiag76aDN3/GQIct84+7cLX5KNG654Yi+ssliNFlycNTl02Rg5Zsk0RLDeZ1G2win6Tcf1zxftL9NZDsX3P7CaoqC1Jm0BtfEYeXGRJ362flpTRl0K9uIB4plTxQ/fFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740484435; c=relaxed/simple;
	bh=a9fb9/Po8fkbGsNdxEzFM4ny3tzW4+avELTv+pAGvKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cen374Uuw5k6XMXDCuUcqZ9ORcIkZmZTWHvNHHaL5zGIizBwoixb3RGkyJ9ocBZE5MPbewJF94PZe+Z6bMyTGlnZSOf5HtlrCNqcGZar6P8QdvahUr5tXSixwDQHkqQ84qSFxSgQT72qLsQZg9Ke9LQBgVWYI3XeL/P1Zoss4wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pGcZCtM5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pGcZCtM5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f2b7ce319so4559911f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 03:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740484432; x=1741089232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KKh9bgDpR6Lw5wYeyXdJoUFBHhy20zpW+hZJGoTw/I=;
        b=pGcZCtM5kpkIoddGsPoMKiwlf/bOR+Rmy3xhb8OQ0rBQa9vQGGwO5S4DVcZmBx7s/c
         f1xvjTIcc9JUxaVP2fIbrqhf1qPTAnjcMPHOVDG2aH03mpYUmlogOrQYv6YcCoLnIscv
         c7VYEJe1CVsAZk7eFGriEVMwVLX34IlyE43isLW7DJkbY9Lb1xisYkWWUNDEsGsir3ly
         EMR54WsGiDnyf1oTdS45ItkyGo+c3Tvui4Heecdn+kxboq3Ou07WtP/pmqVaMc5pRQjo
         gj7No3xjaX6L68aKcYSiT0k04j3T4Z2ByswSlx1vfm6QQtB60djgG9dJPOXuGzbCpqe7
         pDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740484432; x=1741089232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KKh9bgDpR6Lw5wYeyXdJoUFBHhy20zpW+hZJGoTw/I=;
        b=GpyIbk+wiDaYQmIDC4W9vU1ZZJIT512CwWQ1EYnbOH68BjREjtjA4Z9FbVg9z1UfNZ
         INxwLr9jQihwWHrjrMIhyrC2JKbdGKYWBbDHczq5oukFeX8YCMHLIfIz2pBwTtKqX3cX
         Dq7cPNAfp19CitVuAOx1gSuSCIVaznK7WJKVdMr2pohfLZ72h/IKIh+FfA1+EPZRbO1W
         u+GCoYOO2Va0BWnkGs59qO2pPoFz5d69XwZMMYNDUDwz79gZHszJShs69+40e964gYnF
         9fpAu4ie9nArYsp3Iulk7Aap0XjmXieP/ypesGKe3dN/YdxMY572qXGqHt/TiNr6OtQr
         edvg==
X-Forwarded-Encrypted: i=1; AJvYcCUSsHkTdHs9THYtaVf4le62+99cAIQImSB/QUwwxPo46NnijWJXrZ0F70SzRinMcK4KS5ltIzfeWNQHN0tffQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2buj14Hh+B8232fA8h6A2MripGduMfsUi2P1PhUhuotugnwVp
	Wy491oE5XPFQYhhryvlCPxkjB1mwQr1+orU+g3nJxaIazpoPYk0HAF3gulty7AjcoptOLUMuzWg
	9olUr3AgCJeTtQMMjtbf7Wx0aUuai5HywoVDV
X-Gm-Gg: ASbGnctXLnPR7iiY3iDWxE9p4Al4dfGiWZOpzaSUywI1mAFca96KO0rxwg2RFIzSzWO
	DfhUJRqN9R/0iqw8YU8cHVhbsQ5c1f8aN6ebbY6CqCWdMUQRSfqur5dJYZAqspLUvN7O4cbIhG4
	5Cy5UJYyAwjaMr4fJHgI9HGUp8md2DCrN4iO/aIA==
X-Google-Smtp-Source: AGHT+IHqY/a0ChgzNsrPhlIq4n2vGB9QqapOJaINrWTcYZxBCWa17WZrPYgX7RCd5da6qGdapIXwpxNB4adzRUzEdrE=
X-Received: by 2002:a05:6000:1a86:b0:38f:39e5:6b5d with SMTP id
 ffacd0b85a97d-38f6f09f959mr15938375f8f.44.1740484432531; Tue, 25 Feb 2025
 03:53:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740475625.git.viresh.kumar@linaro.org> <68ac0f0ee3c0ebd3d3cc078a6270752778a1b732.1740475625.git.viresh.kumar@linaro.org>
 <CAH5fLgg7o7hs5B4mMzPd6RzYm+RcX8gw1Aw8voJqnmfnA_aM4Q@mail.gmail.com> <20250225114830.64p56bndn4hkkkgq@vireshk-i7>
In-Reply-To: <20250225114830.64p56bndn4hkkkgq@vireshk-i7>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Feb 2025 12:53:40 +0100
X-Gm-Features: AQ5f1Jo457oNbGYfpXGn9Th4VDyFePvYBY05vhtLSFU8gDXlKbKgNgPnMpCHaRA
Message-ID: <CAH5fLghUDz8tpkTuvWZgwT2_VKgxuS+iZKnoT4prKwS9tbp8wA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: Add initial cpumask abstractions
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 12:48=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> On 25-02-25, 10:55, Alice Ryhl wrote:
> > On Tue, Feb 25, 2025 at 10:47=E2=80=AFAM Viresh Kumar <viresh.kumar@lin=
aro.org> wrote:
> > > +    /// Creates cpumask.
> > > +    #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
> > > +    fn new_inner(empty: bool) -> Result<Self> {
> > > +        let ptr =3D KBox::into_raw(KBox::new([bindings::cpumask::def=
ault(); 1], GFP_KERNEL)?);
> >
> > I don't really understand this CPUMASK_OFFSTACK logic. You seem to
> > always allocate memory, but if OFFSTACK=3Dn, then shouldn't it be on th=
e
> > stack ...?
>
> IIUC, the idea of the config option is to prevent stack overflow on
> systems with high number of CPUs (> 256), in which case the memory for
> the masks is allocated dynamically. Otherwise a local variable, in a
> function or a struct (which may itself get allocated dynamically) is
> fine.
>
> In the CONFIG_CPUMASK_OFFSTACK=3Dy case, the cpumask C core does the
> allocation and the Rust code doesn't need to take care of the same.
>
> In the CONFIG_CPUMASK_OFFSTACK=3Dn case, the allocation must be done by
> the caller (on stack or heap) and the cpumask C core will only clear
> the mask.
>
> I tried with an on-stack variable earlier but ran into problems as the
> memory is shared with the C FFI and Rust moves it unless it is pinned.

Is it a problem if a value of type struct cpumask is moved? It looks
like it is just an array of longs?

Alice
