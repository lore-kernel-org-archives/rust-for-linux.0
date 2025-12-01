Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81AC288514
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 23:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764630828; cv=none; b=kdslrEnCWboAnCVsNkyf6X0afU51AN9Uc11tIph1j0VYojpon1k4zEC5j3h9RckS+7Jr/XfpK92WX7Fyh+OdC79T0VPTAVIU9YPetk5AxgM8ET+jFr8hnEaVEy32hLjBSahwNsawSdcQ0/of3rEqQ6mNz2D7MW7oZqLk2xQL1dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764630828; c=relaxed/simple;
	bh=Ngf+KJNQQvbi+fFDERAbtaRR97fIqpGeUdUu552Airo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOY4Bq7PvyCVwyEPztEwtUTtJr7YNEuNB2fyAnO2O2xThE1McmbnHNTLLU+lBRRdSzxNLeYdJl6yZ4Vjq1WkDGIifzsurOAYHxxIxTvGcDbB1bUX9xtd+E7ccA+wFcy0xkAgc38kE96yVNpQk1rUqhwCJ4Q4/fT6gFzFw4R2szQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkEL/21u; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkEL/21u"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297f5278e5cso9785875ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 15:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764630826; x=1765235626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7lnIapC5hP7XLdYbLhmU83mhpibTCJunY9NEXIM8bs=;
        b=AkEL/21uAGTWe+BxwPYs5aMTAAlVv6T8f1y+FnLxxyxzly1tYG+zE1SiO72xEEOUj8
         M//5FiYiMBYrnzcjnrEVBETqZ6Km5W14LajST7Tjl4nUutvP02Y/EQ9ByjGeoLhmFbic
         JOO1yDH164CAK8FqLdzY6XjHQkK06p0gIA5km3T26QST1cRufU+pXtfp8W4jCnsdyOA8
         SmEHfkq3Ero6L3f/OopCugw9HhKOnFSscIVj0xCiY7ND/kdDAYkj2CWwdT2uJE5k/mF9
         KFpymbilOLF/ABKqw/HULdrhXUoHFhn6xwbEk7rQxJUDGtMTaLnYgw9PJKxNYo5PiqHJ
         vwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764630826; x=1765235626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N7lnIapC5hP7XLdYbLhmU83mhpibTCJunY9NEXIM8bs=;
        b=FdPTlmibx2n8QUrwL0PB9E++HjAb/vhH8ryd1ZRmfQAlyfApUNmSOx+A5HVHo3Zimc
         eW4dEuM7c4o0Dcsao+QNiikCE+7xuRO2p0ond10E/fBFdTlpnN59fErGGVMdVCSiSHyo
         TXJoIH+gV7nsjL0pD669oVedj8cbaNaM+FsxADoWm+m/FCAWNR7Q+a9EouMxxTpSkDUn
         EdRztaOPcq16lE3OWcDi/8WpK0uJ0sBcm4UPBBdeemdSENwIGtFbo6uwL5CJLZXLMdPB
         OnS9PwljIZKYeyMzxpbtEugMZkJl5eSDXhZ4vF0wvSk6EYgpATank5Ht2DuIB3Qvhauk
         QEUw==
X-Forwarded-Encrypted: i=1; AJvYcCXQcJH8EsBDjy52n66vemUjsxHGjxYFQUDmPMA4LrcPQTgPIX9AWgGkaDCBxvTl+dwbppzsD0C0mJKT22C09w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXoufnkknlgivD/orf1V3FWeOawGuwGi/gjTyyvlvptpJykcrH
	dcLygZmUhJSjRnVp/jVAZW6ytGtUiVJ2qXk+R4B892SyDrianvGkj50Qowh4gmF3aUhHdhK/n5C
	7VKdCsgeWkY4S+Ed4RRAYgNJchtvPNq8=
X-Gm-Gg: ASbGncvzVi+wUID+rHtrpVG0/9gXmttZkrMpvjBwd52OISDCZSM0SSAsoG0fGKRbH0g
	CLAQhbInjxu+KaEALlmr0+7o3akirGssV4WENARlsri2T6RVJPYi9LvaR0lmsPonzbkKKjSvpH6
	z7iU7QqiK4nKnvuthSTx4ep2i37XlvFi8BfxYdDY/V5HdOA8T6ALi2FGef6CCSRShNSUOCMitNr
	mayVyIeJuxla/7KYtxVuX4jaJBVuRPxIc2SvnS87DEZ0nFo2gGc78m+bNprS7+3xjfk9RzsB4/n
	e1f+jLLoZ5bhV+vKHOnGRb6gvVNFrOLrEeW0j4ivVUpgA7+BJEhkF7P4bHp1MXVvmDVJk6xIw51
	N3cPCMnQVqQhkLw==
X-Google-Smtp-Source: AGHT+IGxVdTUYHF8iE2D6SOC3zDFLgWrtThDk+vCT5QlDGLr9pFuDZMTKe6/03j4SaY+hb4WZpWt98bJyvFLpp/EFRw=
X-Received: by 2002:a05:7022:43a5:b0:11a:2020:ac85 with SMTP id
 a92af1059eb24-11c9d873c80mr23376629c88.4.1764630825825; Mon, 01 Dec 2025
 15:13:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201000949.1626363-1-ojeda@kernel.org> <aS3seTNRum3ZXMom@yury>
In-Reply-To: <aS3seTNRum3ZXMom@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Dec 2025 00:13:33 +0100
X-Gm-Features: AWmQ_bkHrITwvcm3bjCTQmkTP8nrImOcwwWE4np_O6AAArIp946vcpIx0rfJqY4
Message-ID: <CANiq72=1ipov2pV9pSQwGh9WMA4NvQRV_cBCO0hhChVg=c-Njw@mail.gmail.com>
Subject: Re: [PATCH] rust: id_pool: fix example
To: Yury Norov <yury.norov@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Burak Emir <bqe@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 8:29=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> Thanks Miguel,
>
> I applied this, but the fact that you've sent a second fix to
> documentation that actually is a build fix, raises the questions.
>
> Because Rust documentation bears compilable chunks of code, I think
> we need to enable rustdoc tests target by default, so that developers
> will not send broken tests.

You're welcome!

This one is a Kconfig in the normal build, i.e.
`CONFIG_RUST_KERNEL_DOCTESTS` (it is true that the other patch was for
a different target).

If you mean enabling that by Kconfig default, then I don't think we
can do that -- KUnit on its own (which this uses) is not meant for
normal builds. Perhaps we could have something that just checks the
build, but people should really run the doctests anyway, since they
typically contain `assert!`s and so on that can be wrong.

If you mean enabling it in Intel's kernel test robot, then I think
they do it (or at least I told them about it long ago). But maybe
something is missing.

In our P entry in `MAINTAINERS` ("Subsystem Profile document") we ask
people to run them among other things, so I would perhaps suggest
having something like that too (or linking to ours if you prefer):

    https://rust-for-linux.com/contributing#submit-checklist-addendum

Of course new contributors will miss that initially, but actually
people find the doctests quite useful, so generally people get to run
them. At the end of the day, maintainers should test these too before
applying and otherwise someone will notice sooner or later.

I hope that helps!

Cheers,
Miguel
