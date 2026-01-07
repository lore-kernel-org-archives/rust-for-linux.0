Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9548235FF6C
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 18:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811127; cv=none; b=EpNKhY1/kdEumjTWuaa9ZRJF3lCcJMM1jcu+BBPYvl2uqhR7CivSs95IWrO8QFB+qjOlfT32JhBoceT8emx2mmYHk1wWAr3jgk6OCtMlLvSXQ5SiV35iy8yeioF1CJg9kul032Jsh0jPB4+8FvNpNdjHhmgbcEIRInop8HLGii0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811127; c=relaxed/simple;
	bh=jOQeoHCJqb76GgeN2cjCIyIcl4dbzwyLkjoIWhDw5v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCTuw388nYQ+Fzo13v5UIbbNhP41ZBYvSPmtmen2tesAesEYPYMwbZ+5gjVyD1CUjmZZTYT7DatTvb1QJ9XHXJEZI4OPXgXPRwkV59RpEcqWwLsqDdA/9ys7xa66y0D6Cx4KCD8HnaCjQgVtpfcEKyqGn26fz+A47T9qRAVhj1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9gk1JIK; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9gk1JIK"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-382fb275271so12429811fa.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 10:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767811122; x=1768415922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOQeoHCJqb76GgeN2cjCIyIcl4dbzwyLkjoIWhDw5v0=;
        b=B9gk1JIKkXDLFaVbD2Yc+RjgSoGhYHfFHu57K3HfAXaJ5lk6vIz7WUp8ZBrK41Okla
         6inSVLP56+GP5Rk/P9A70p1efjFjRTXBt9UFmo6cSQraZKeTSMYVi7h+oCIPYWrFvyf3
         np4t+2QMd9VMH4ZH2Z/0SMku5RFop80gvewXjCJHINuDkeumJQan5abRC0YDPRTLwpOn
         SxNf5LPM2DxEwcfZ5IXdYrpgqSSdjt48Z/53Mj85rdm3p1fj4pXYc9PSh5lqpHH0wUf5
         OuI/693SMr07O5L57j62ctPEaYho0pHS56xs7MwUlGtE1ppzy50oWQq9+c93HSHxyWx4
         Wt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767811122; x=1768415922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOQeoHCJqb76GgeN2cjCIyIcl4dbzwyLkjoIWhDw5v0=;
        b=lfz0IWg8JFUy4d8Ynz8a453IOB9f6zc760AWowtfVXKBAidRgOjCsmDKfyK5ULMkiN
         YkBRMxJQZcv413z250Kcy9U1jQQ69ODkzAkb+hRyTiCHJVvtmT9mAt0jgcCL0tcoLTnw
         DEH49VeI1KkfIwRw5qcYxI8Akl0B0t2WuPeahBq065DHnF5oqkDA///b7HuStNVJYGku
         x/b8zThiflUhPXJVpNCaM35S/7OZlIyWOb/aBUvWBys6+TsmgaGnUxcZB0whlJXgUl+C
         h5uengPKmm39A1nFWu5kdyOzi6GoXCAooQharBHNibBzaoiF579Cn69SfqhFZ86J6+ON
         41/w==
X-Forwarded-Encrypted: i=1; AJvYcCUQrOfr/RNrZDV5i9XCjwPxBds+9YeasanlWjYklh1IHRgM+h2vfBByZWRTHYvSq7tkQo6iRSUbcyDgiuozGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRFLESkV0YHNs9WRXTAd8ij+9/JZG5megMglF9ZMgmLPntfgSy
	4kiiAGCbBjLRHSW35kEdX8GqcEqoXI81/tEoB2AkXdTDrnaubFtBvrpYRlCHMMCtZNl/ZGNw008
	wybAGEkCrzyfyFOypWxGtrUK8oJMcutg=
X-Gm-Gg: AY/fxX6P8RYWoBFlhDdp5OtcLfy6/LZz1LlnW1iu6//ug1y0n8VyNQsp4t9JgDIiIYu
	TS1LEAixDP6PlvX/LseV7QMF/hk4AtokdimDV4aTZyNOvwhlfuPlCsnt3P+463LfIidwGmM+f+j
	gSvoHSPBvT13FFRJDGiIbXZwqvZP5tWBUkTTosOQu3OHjb2s/Ij3hDLyIoJ+1UZH4AXP3FsA4k3
	r29G/XXN0ToT7zgvrOm0vqAYoZ+H1NXV9+EJJK6yx/0VJ79ubwglxFLMLBaWMf6bFx3ae+g/Tt4
	Ux2tMoN8bB7d7Ecu5R0atwzajXmsInQT+Ps1Ony0ewSnDA5f3JPhJHclss9p8XdJYOkdfc5rhMH
	GCByRCQ==
X-Google-Smtp-Source: AGHT+IHWkzPm28cpz0yP2EynPjIQoxCx8kSSQzNvELUbs39sid6S1LMChvPIk8V7fUO62H0lCefZm/xpNzNy6obuoTo=
X-Received: by 2002:a05:651c:41c9:b0:381:7f8:4b2c with SMTP id
 38308e7fff4ca-382ff67d8bbmr10736561fa.15.1767811122036; Wed, 07 Jan 2026
 10:38:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-3-9e5ffd5e3cf0@kernel.org> <CAJ-ks9mqwaWMc0MTGOk+rKSM8W8spRmwiLGCkEjcSvF+d7QW7g@mail.gmail.com>
 <87jyxtgtlc.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87jyxtgtlc.fsf@t14s.mail-host-address-is-not-set>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 7 Jan 2026 13:38:05 -0500
X-Gm-Features: AQt7F2pD0IJpTb4tqmOW0CeFL-tnJRiugaNMbEgdpzfK2OfjH2Ae9WbtCMkuFDM
Message-ID: <CAJ-ks9kYk7cuQFOK89OwUx+k8p+_kANjB12rZLO+dzfSd=BpdQ@mail.gmail.com>
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

On Wed, Jan 7, 2026 at 1:34=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Tamir Duberstein <tamird@gmail.com> writes:
>
> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Add a convenience method `contains_index` to check whether an element
> >> exists at a given index in the XArray. This method provides a more
> >> ergonomic API compared to calling `get` and checking for `Some`.
> >
> > It isn't clear when you'd want this API, and neither this nor the
> > example are particularly motivating.
>
> I added this when I had a line reading `if xa.get(index).is_none()
> {...}`. I think it reads better as `if !xa.contains_index(index) {...}`.

What was the code surrounding it?

> Do you have an idea of how to improve the motivational factor of the
> example? Writing motivating examples is not my top skill.

IMO writing a better example is not the issue; rather it would be good
to understand why you need it. In my experience `Option::is_none` is a
smell, but hard to say without seeing the surrounding code.

> Best regards,
> Andreas Hindborg
>
>
