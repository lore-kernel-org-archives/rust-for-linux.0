Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4473C23A9;
	Mon, 20 Jan 2025 21:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737409985; cv=none; b=V4gzZryhnTpIIUsx4MxzwrbGw4HainlnGXyl9KzuTGFHNHFBXITh3V4kzLCLabQh430ihnAJ8gJkRVAKpiWXlQkLfrh140SIOt+BdXKen0iEOCQQyt3INOtR9TV6fvgy3+ogOdG6enOK37kM7JK5r3KSmCvnViY1yp+qyh3uDmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737409985; c=relaxed/simple;
	bh=1Vbw7KU/hZTJSqblA6qabU/ThVTNhHylD1j7iTQi1h0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaDJ5Gkgg+cKWfBR4XSrEoI2j1hv8EDou+XXe5PvUdVoXeJRj3Ws59iQDarHHNSAVOK8qYOzyKjBM9I4U90dQ35WZg5uJ4RKW9QxMKOAgNTSHZnpq/u2yL2HGgjzRKWhFhSxFHeRQkaV+/s8pIfNO2nedJmSg+zmWsFsaSDH030=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCwwu3vf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCwwu3vf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21c0e29b26bso10898955ad.0;
        Mon, 20 Jan 2025 13:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737409982; x=1738014782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Vbw7KU/hZTJSqblA6qabU/ThVTNhHylD1j7iTQi1h0=;
        b=FCwwu3vfMjDNGzONtw1MjM9ReJuQAAStYZ9hwbwKG4qVV1+p35lsLE28QTcCK+z2hD
         1ieVXv2Id+1J41IVrl3JCrMGP31cE6TCrpHzDlfNtMIInIshrzaIGTOCOQfLbU7ByBfX
         6Qm8FXQZ4rdigOf5cfoIZmrxuZvCv/p0P1eJ9umLrQvAQ8jTU+AS/JZ+sqb2Ss3cbIj+
         kVgG4cOfsKD1oF3HtbAzCzWqSEnhlj4VgIGD7l4pTD8UdqzswPoms6NTHUiLA+GFGKmJ
         o/9JIBB8bYNwwrrU1CKWT9NM2iW/DTqh4W07c5qgr5ezuu+Qxy85ZmeybJ2nvBfV9GGM
         HVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737409982; x=1738014782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Vbw7KU/hZTJSqblA6qabU/ThVTNhHylD1j7iTQi1h0=;
        b=FjsSsIQ72KgtCpvvJszng0aTTA/ZJtdMmg9HBPc+M4gUHXPJPmQWrZkzhFyavucxtx
         vaewnoWuYEKC4F1iHRRyzwtRe/sgqmULJWkFZcJLasjETzp6MoDJWy2rkAkJD1P0ZlmH
         3XSVgNHAbXnhDA0+CFkpHlGOorZVF5OqiSnYpFBJa0WhSSeHe9AQZkiRUosToCBYDb1B
         kN5JgRFbP5caJUYwzYt1M0AhAnpA7Gf+CO2ps/hK+VtMXam5YyxnpR4Xg0KNHjAbVXC5
         Dl2pCoZVSdOIw4ThYGBytwxti9gITvl9+tDbawEDIHTrEjkxmfFcZETWtQWz3s7d92Ik
         VfUg==
X-Forwarded-Encrypted: i=1; AJvYcCU3f3jckZDCVVcU5VI7yskMz0TT7bketXbEjBSa7z2uRe3SoZJgdFwMujDeZUB0USZSIS4GRw29V3I7HRI=@vger.kernel.org, AJvYcCX8Py6zbl4PflRl7MZd6U3souTvDY+NZc2pQEpKQpxbaUVBQMPSR/fuCJBjBZ7DFJ4X8MsqjtKiP4AYK4WIDxU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc82DCPcp2RzPwrBlt0TbkhBtHq9/MUtpPduRc7GkOez+vBdoz
	H+co0o1xWz4kfmcrHPH0+ksB2yeiLakH0ZDLFdmYVnofh6QKRyibGeO4ludP/0Nn5/at/uhjrYp
	wWE2BWzKBfL2sj6NCq0qhzOXIEWA=
X-Gm-Gg: ASbGncuydL97FtVgWyVtn1sAjk96qjHt2CRvv+omWzSPD/KVJka6QNAKBag55RJdhyn
	QWOvQPCughr54wAX1PgxRpKKUXOpXwYNEZZelPSb7e06jZ/9x70M=
X-Google-Smtp-Source: AGHT+IEBFfoREvwPsyAWhU6KI6Sj3YXP+bME90dJ+3K+zVF2Ba9Y0tsVR1FviFh6Y7cffgrMh+5FSIjsqdqa+EVs+bs=
X-Received: by 2002:a17:902:fc87:b0:215:9d47:4897 with SMTP id
 d9443c01a7336-21c353ef373mr82155455ad.4.1737409980859; Mon, 20 Jan 2025
 13:53:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120124531.2581448-1-linkmauve@linkmauve.fr>
In-Reply-To: <20250120124531.2581448-1-linkmauve@linkmauve.fr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Jan 2025 22:52:48 +0100
X-Gm-Features: AbW1kvbipA64WZgr9Xm7SsOvkVvkgqJp9cEZabKMYD5JD0up8QBoKASUAMMavBM
Message-ID: <CANiq72n1YpUowTh3Hdjo5auOmTTUU1-8d2FTL3e=Oyu3Q=-BkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: fix compilation issue on ARM
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Jocelyn Falempe <jfalempe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Emmanuel,

On Mon, Jan 20, 2025 at 1:45=E2=80=AFPM Emmanuel Gil Peyrot
<linkmauve@linkmauve.fr> wrote:
>
> In C, the char type is specified with =E2=80=9CThe implementation shall d=
efine char to
> have the same range, representation, and behavior as either signed char o=
r
> unsigned char.=E2=80=9D
>
> On x86 it defaults to signed char, and on ARM it defaults to unsigned cha=
r.
> This carries over to Rust=E2=80=99s FFI, which aliases its c_char type to=
 i8 on x86,
> and to u8 on ARM.

In the kernel `-funsigned-char` is used, see commit 3bc753c06dd0
("kbuild: treat char as always unsigned").

In any case, the change is fine, because we want to use the proper
type, but this is already in the Rust PR for this cycle, which should
land in mainline in some days, see commit 27c7518e7f1c ("rust: finish
using custom FFI integer types") in rust-next.

However, I am nevertheless confused, because in mainline
`crate::ffi::c_char` is `core::ffi::c_char` which is `i8` in both
arm64 and x86_64 and thus there is no build issue there.

If by ARM you mean 32-bit, then we don't have support for it yet in
mainline, so you shouldn't be able to see it there either.

Could you please clarify? Are you using patches on top of mainline,
e.g. the 32-bit arm support one?

Thanks!

Cheers,
Miguel
