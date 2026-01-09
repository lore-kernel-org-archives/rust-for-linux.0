Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB0E314D0D
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 15:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767974389; cv=none; b=evYyD5FNn5qvDCeB+zcw+QNF7iDucKeXxwt4x7sEwQreldOSk4INpfPgx44xtDuiLpXLPgmbCSkfpDG0EW4oZVwerTDw+YiyKQMAdSb+9vgM9evYeBBDbH5vuIaB7qZuZXALjisrXrRl4+wWY94EjImes64xLJXNt9CTo5C1biU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767974389; c=relaxed/simple;
	bh=ZjxeDp9YGaFUK+W3fDzn81jroMGVuiAGgNX64MJODx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z2SNj8BrOLdzVsZnUWAvWYd16cqym+x/4nSeXcfVISFmpRFK6b3v5zo1PF4cLBJH2ly8gvF+KaQAmN7xBsPl8YG5COQmVUBYzoW2pVaU7JoCuBwqWEE1EG3nFmTGW5bsBf9vz9EVxVYZGrPxlNd4LqJ7vcNNztD/ClWanhkpQ/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wb72dMnm; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wb72dMnm"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38307233c98so22725331fa.2
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jan 2026 07:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767974383; x=1768579183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qDnJQ6hNmXepuNggB2SnhuDzeGOIEIzjhTyoPuwQjQ=;
        b=Wb72dMnmcvqXg6hcppGfjL1p3lJLVjWmYmsA6KIwxrmNx5CAxmV3E5yMdD7vdll9Qn
         UC1dbCSoT398o+jrz+XsEFRtHYFut9Lyr0KErZwbNnHrVG2X0haiYgGY2/BaQQNM6BZT
         +Qhc3RhvDLwFwFvh85a7XxaqFKKFGe2Pzy7nZw89syIGOz9zVddIts+GHjXmklTxn/YK
         2xOJ5YgV1wkmXA1fEHu4E4GvUgN0A3Vz++ctyVbXIV6D6pHU0dapzKRvjHQo2SYSvYdl
         qwu6TlRFs/IH4HTn64MPh8Z5zdbo0bJiGSwjbV1NEQ++oF9hmva3pteYzx0sFsRwBAtn
         kxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974383; x=1768579183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7qDnJQ6hNmXepuNggB2SnhuDzeGOIEIzjhTyoPuwQjQ=;
        b=XJ0IbuWVIBr0Sm2OcEUnEtyhWQeynKdL0iCbR5c/SHWvZgAzb7KvfVtq+8M7t7gAmp
         g8z9qTqrXH5hqmBgOvgG6ogFAyaOM0ebQ8EO37bSdfKceLtfvX6lvGbcgZBL4R7eXh4w
         2u//qISMY+aC3W1t8rK8xftIuFGKyIsmyleYusNoiIfZ1bBlzbovDXBywOcz9T6icZ4L
         r+P322edaZBK/2oksRyLGohWG5Td9Qp//7RdGt7gUw98liBf+tjRqXPG3zpEyj0IpxGP
         gO3BQNO7YGaUGdQhVJFfFuylKrKiBQpjHM5WWY+XKamRInWgu+EhiJZV12fyVkcTRRD5
         oDcw==
X-Forwarded-Encrypted: i=1; AJvYcCVqb5WbL53BjRXEFvldW+994VYWboajK7dwSwlBjzngG3PLugOEj3JcBS61ney8ZbUP6FOiqX8PdQYKkxdyyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygd4NoAQnm8wBpKSKHFVyhUpFDRhTmDv0xgNT7gC1wnF+X7rja
	2T0gSuAkx9MB94FIvF4kNmPiPaRjf6tSi10dpeeyxB3mBmkMr9ONBgQi25sn8iEEFW3b7QMfnMu
	fRqnAvdIwO9WX5G17PiianEARYW3+zns=
X-Gm-Gg: AY/fxX4oLzEG9MMwYhlieMAPJGDgmIOd0kvEtb1zfRbTW2SyXL45ukmi2ZV0wokujy7
	sLPu6vZs7y7GjTb3VyOlftM82r0s+9pBeCib1+N0GZkAv7AH46CojElkhU+yxmMH8kizWxmZyRX
	e1jbABH2v/5egsfvdiVdEBY2SY+zUy1dl4u8qMvYi+D8gYkO+FuDq6vurxcVXZ2Vbb7BNcRNDSq
	nTAtJ8QPeb/vjvRXn9xO/So4UhpOfbv4S8xd3A3AMAeEQCXu0qldNmqZe1Xq8c+rjX8e9s9xuz8
	Jupm3sC/YdY7wGMnOoV/UBxSXZMFjWpkG03uL/1CF7rWWZxAntgIJNtYO/1yb7g5bPk2AQIxBsW
	LF3CxgPxzBLxrLisy2loTbRvPKAx/fqT4p+m+SmXo1A==
X-Google-Smtp-Source: AGHT+IHPp232XllFfNGqvWRSlzfTXxOenL9EieU2A3dAmkdssI2RtV81Ww/M8icJi++0Dp1+XBQbPV4cz5Wq9lNAIK8=
X-Received: by 2002:a2e:be0b:0:b0:383:5ea:e9c1 with SMTP id
 38308e7fff4ca-38305eaec72mr27962681fa.2.1767974383234; Fri, 09 Jan 2026
 07:59:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-3-9e5ffd5e3cf0@kernel.org> <CAJ-ks9mqwaWMc0MTGOk+rKSM8W8spRmwiLGCkEjcSvF+d7QW7g@mail.gmail.com>
 <87jyxtgtlc.fsf@t14s.mail-host-address-is-not-set> <CAJ-ks9kYk7cuQFOK89OwUx+k8p+_kANjB12rZLO+dzfSd=BpdQ@mail.gmail.com>
 <87344gh2pk.fsf@t14s.mail-host-address-is-not-set> <2PUnbrv1SBqe3PHKeFqFI7zge1N89qpwH_FF_pXszbaA9-ocBueRJHb0KcuW9EyPNiZFCaCc1vgmTjXP_u_oPQ==@protonmail.internalid>
 <CAJ-ks9=JJ6S6U-Bq0WC1PfJ0P9G3PvugfDdE2q9Q516M-QpsoA@mail.gmail.com> <87o6n3f4uz.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87o6n3f4uz.fsf@t14s.mail-host-address-is-not-set>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 9 Jan 2026 10:59:06 -0500
X-Gm-Features: AZwV_QiRIQEJkShwl9ClmVFCHVW5gLmu_BJ9jBrOhEMcM4NHpw3EFHHez5-uWFE
Message-ID: <CAJ-ks9neiwxL6WhK1i0qPtZCGjfEFsXA6J-yVHKmZcwZ8RS06A@mail.gmail.com>
Subject: Re: [PATCH 03/10] rust: xarray: add `contains_index` method
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 5:38=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Tamir Duberstein" <tamird@gmail.com> writes:
>
> > On Thu, Jan 8, 2026 at 4:38=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Tamir Duberstein <tamird@gmail.com> writes:
> >>
> >> > On Wed, Jan 7, 2026 at 1:34=E2=80=AFPM Andreas Hindborg <a.hindborg@=
kernel.org> wrote:
> >> >>
> >> >> Tamir Duberstein <tamird@gmail.com> writes:
> >> >>
> >> >> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindbo=
rg@kernel.org> wrote:
> >> >> >>
> >> >> >> Add a convenience method `contains_index` to check whether an el=
ement
> >> >> >> exists at a given index in the XArray. This method provides a mo=
re
> >> >> >> ergonomic API compared to calling `get` and checking for `Some`.
> >> >> >
> >> >> > It isn't clear when you'd want this API, and neither this nor the
> >> >> > example are particularly motivating.
> >> >>
> >> >> I added this when I had a line reading `if xa.get(index).is_none()
> >> >> {...}`. I think it reads better as `if !xa.contains_index(index) {.=
..}`.
> >> >
> >> > What was the code surrounding it?
> >> >
> >> >> Do you have an idea of how to improve the motivational factor of th=
e
> >> >> example? Writing motivating examples is not my top skill.
> >> >
> >> > IMO writing a better example is not the issue; rather it would be go=
od
> >> > to understand why you need it. In my experience `Option::is_none` is=
 a
> >> > smell, but hard to say without seeing the surrounding code.
> >>
> >>     fn get_cache_page(&mut self, sector: u64) -> Result<&mut NullBlock=
Page> {
> >>         let index =3D Self::to_index(sector);
> >>
> >>         if self.cache_guard.contains_index(index) {
> >>             Ok(self.cache_guard.get_mut(index).expect("Index is presen=
t"))
> >>         } else {
> >>             let page =3D if self.disk_storage.cache_size_used.load(ord=
ering::Relaxed)
> >>                 < self.disk_storage.cache_size
> >>             {
> >>                 self.hw_data_guard
> >>                     .page
> >>                     .take()
> >>                     .expect("Expected to have a page available")
> >>             } else {
> >>                 self.extract_cache_page()?
> >>             };
> >>             Ok(self
> >>                 .cache_guard
> >>                 .insert_entry(index, page, Some(&mut self.hw_data_guar=
d.preload))
> >>                 .expect("Should be able to insert")
> >>                 .into_mut())
> >>         }
> >>     }
> >>
> >> For lifetime reasons, I cannot borrow `self` in the taken arm.
> >
> > That's surprising. Couldn't you destructure Self so that all the
> > references derive from the single mutable reference &mut self?
>
> I don't think so, because I still need `&mut self` around to do the call
> to `extract_cache_page`.

Hmm, I must have missed it before, but can't this all be fixed with an
early return?

         if let Some(page) =3D self.cache_guard.get_mut(index) {
             return Ok(page);
         }

>
>
> Best regards,
> Andreas Hindborg
>
>
>
