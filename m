Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49825377039
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774012608; cv=pass; b=ixgX0cyiFGVOgUhh1PEgRhcL2tly1bdGFYVXp1YVhv0Yx5lZ9feahVDHdmGBurM3yy4eCUm4Z+h0fIFnjQRIoWvMOKrYEFQ1LGKBK1ckumT+Q2LmCPqRmfutdXwKirlvlVfwj0jsq4fbAL3zAeNe6ijj49KCwkOPvgqb2z209GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774012608; c=relaxed/simple;
	bh=WlF7eXLeAs107QRZwGYkE6Q3dKQCajus/dMXGdTQn18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGBEPJeOxVS9lxu6lvsoJMUp4rXBxBAgFBLjjOi6ILb1q3++YZd8RRiX18+x5rLOGB0n/vHP+DEp36D4F+1LYVOwhANo3EEVLSy3nUxdjLj3q8cjPJ9oLyFUKbEt5Ov5EFKd397mcWhoYeN3yWehywccRFN5ve89+FUE0rSX884=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8absMS4; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8absMS4"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1277863a912so140537c88.0
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 06:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774012606; cv=none;
        d=google.com; s=arc-20240605;
        b=kR2TJDqxrThL84XovJdAbMCNnFDOzbc1TFcZKabvsuEXfnGGe3dMGnsG+C72HDSXO7
         CLcqU0yIDDQ8/N0bLoKmFkWy+acNftetodr4Ab3bCFFArMemSIP4xeNG823Hym1rJJv8
         5E/+fhRVGh1RMIjl2dJJ8kcqARFCluNK90LVhlNsfwIGu7rNUKIpC0My4LNCk9q4JpCX
         gWwwfURsM4qj1LyGEviDDukfEXpnXyNnbseiYDrheDxB7VLqNsmJFBETXiSRTkz4N5/2
         YuhLGUPJ3UKoJwCaXxRR1ApfAkPYwJQdZ58LLiiCp5vMRjFHtxiPDNjJejS0HXB8TCUg
         JyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WlF7eXLeAs107QRZwGYkE6Q3dKQCajus/dMXGdTQn18=;
        fh=/vWc6Wsb/B9JF+BeZJnW3NvgC1xL1yiTG6BdkqtIfG8=;
        b=WyTBEIQqaHoIrmgB0b6CK+GF4cVD6aGK84uxSzPKj11AoOw8ake9t/8jYve0RF/QC/
         0tiQU738qXEbfmBLpliKRxfQaPEK9HbxdDN4Em26Io6y06vx1YCydC4FTBqCFn3CvHJw
         2Rj7gdKLubcyLfwXnDHXvSg8lpgBBdmLsaDIXFPHx/95wMasxEm0auijhbGHzM5DGlCu
         C27wdFoYEVqlX5cptXho451S1TSWpTb7jMQ3y2zZhp/P8A7QqcW3IhC/tTfZO0nnkb22
         01CjKWs+8aWMTSXXS9m7GKqpCAlyB0ws0l4cvnt80c7gyda1PVp3Wj3wgBJVIKYV+XS9
         l6KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774012606; x=1774617406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlF7eXLeAs107QRZwGYkE6Q3dKQCajus/dMXGdTQn18=;
        b=J8absMS4Q9iUiW7bOz92bD6Cma2jxL5s/wImIXPRDbCtQox6OxnWaB6V7X5T+aq996
         c3kriYf2iVaCMenA5LBNCKZiKvWZhW084gtQPFVIcHB9nxHPJK4/axLxxT3SsgQB/1iZ
         78Ag6HNUJLgMou2zphzjzsp68UiuGaQ9FeCgWmGQLfBS+ZMFmWlTvRLO9wSg/2AhJus5
         SbLkMaYrBmDGOAEyBL1kDesFU3dnxRwk+5Fm3hh99frhS1LruP6IKeke7hsf++OcamUy
         XcsDy1UJHIKyBBJP57FMFX0jqIMg1jkryKWqIgz+mHi5GbsDehCOLpSooCBW+gpfFpxU
         XrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774012606; x=1774617406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WlF7eXLeAs107QRZwGYkE6Q3dKQCajus/dMXGdTQn18=;
        b=NylsqDHMLSr2bIrPf7z34bVR49ZExCAKMPb7OTF8nNTdoBeKHuPoNbuKgr3IiIotwD
         dxmKpy4QylBf60pnW7tJ5q51VQ/cKW5YOVeMk9ZNcAt03sfrI1lsik2wsvNxF6AQQ3Jj
         1BbYVb4ASbT1v6x7YIWXfrSYZ5c0PBm/xqYdfmrZivrR6KfPDJQlmjhBoHOvHcVtXnfD
         7Hjr7vRqZ8HLSBfmXQnHoyUI6duee8rhjegdg7PorYPqawOQmb9wVkXgb8cHHZbJn6+R
         vWFGNWTOc0GoVpwx2yy6aWa9RZH9NUCm+yr66Mp0tKmMQKrEFwRtcYVTIPB5lbMGOdDz
         woYg==
X-Forwarded-Encrypted: i=1; AJvYcCV5e5KL8u49xv3zjvlWDbvYN8DY4v8Q9hAtQD8AGH+MTNbnKRKhE7aX9RQtDekCXKU7Ml5i5JJHK5selXx9aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW24gejyZEIu1kpigdx3EtNMtOwIPZE2DysWEoN4JZyo+k/+Bg
	vPy3SWItoP5K8FrgCRk0M8B6AVK5UwKdcrO05FuALNn+1goIBlxNl4K2fIG2Rv0fHLp7hOB/pR8
	CBWzr2IkVUxxi78BcIf3H7y48u7Gbioc=
X-Gm-Gg: ATEYQzx3/lb98/ah8Jy8fdUepJqwv7wOMb7p+cajwzSO/sZDVaQEqQnRo/t+tyq3B0E
	V3a5kiAV3h6FWn+Y4CpiN4KtOwhRT1xeboKBjLxF0Q9hRVR3VF1o/qWwcrnbMZARKz+OrdJO9ja
	4XSeCvjbBbypQlgabLZH3x8xEwrvGL3r7fb0fYAKzs1XZxLFHjXu+zrwmKjGYUjwyXqCSTl8V+S
	lI7rDh6172OYkNqdzCjb0ukHf6lCLOV+Zf5mJqvWUy3Xf+fctJ0HriG6tdgwdzhCbJRmJoQWiBV
	n+LsrckFDzF72GVYgQ+6rEFN9uVKvx03OjTmOYMdw4ehpnsAzcLTT/j6+iGGS2IRm1LPmOP+F+Y
	hB0QTeMNupy8k7LvN4gC1CY0=
X-Received: by 2002:a05:7301:100d:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2c10970d302mr681771eec.3.1774012606161; Fri, 20 Mar 2026
 06:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317225355.549853-1-jhubbard@nvidia.com> <20260317225355.549853-17-jhubbard@nvidia.com>
 <125cb5fd-55fe-4c54-bdda-0478f5a8aabd@app.fastmail.com> <CAH5fLgieAZz4YAp4-Y1240mVt2V_Pu3TJ8YZyMkP1ZG_neafwA@mail.gmail.com>
 <d766522d-ef82-4300-919c-fed89f2f04fb@app.fastmail.com> <CAH5fLggFsjciKKxv7_k6tXqL=_8JrgAVWq-+xVH1PkGOew44KA@mail.gmail.com>
 <6163dea3-fa75-4403-929e-8ba9ba22eab5@app.fastmail.com> <CAH5fLgh1WMaUpLGTGpWiVjrnTtgFt=hhoutQqxV5DOtrGVsfkA@mail.gmail.com>
 <c7e8c581-5072-4184-ba75-783233bd52fc@app.fastmail.com> <CAH5fLgh-2uQbd+EvV2RT3prp4LqzLsDb1DFkYgj2kWZX58izfw@mail.gmail.com>
 <a24da031-2aed-4e08-8b32-b255292c137f@app.fastmail.com>
In-Reply-To: <a24da031-2aed-4e08-8b32-b255292c137f@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Mar 2026 14:16:32 +0100
X-Gm-Features: AaiRm51BQ112eq_SCoEkxqeRYdwxkac8E0IysvJyUI0npVuSb2qzbh5vN49WeCs
Message-ID: <CANiq72mHHxU3jzMG=CqtS+ACZf6gz-9bL2H717_MH+rkALn+WA@mail.gmail.com>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
To: David Rheinsberg <david@readahead.eu>
Cc: Alice Ryhl <aliceryhl@google.com>, John Hubbard <jhubbard@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 2:15=E2=80=AFPM David Rheinsberg <david@readahead.e=
u> wrote:
>
> Oh yeah, it is definitely worse, but I think on an acceptable level. I wo=
uld argue the cmove is a non-issue, because it is a reg<->reg move, but... =
meh, not sure I wanna dig deeper.

If this is mostly meant to be used in `const` contexts like in this
patch series, then the assembly doesn't matter much to begin with.

In any case, the goal is to eventually use the `core` type, yeah, i.e.
we have `ptr_alignment_type` in our wishlist.

Cheers,
Miguel
