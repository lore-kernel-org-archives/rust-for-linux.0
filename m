Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3484306D5F
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 21:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763501680; cv=none; b=fRZbrkPMDffBekzBFJEQyVsNR94nialztwf4dLaOm+v5NesTxa7ru9dKrpbmcUpOLErS7TJBZUxR/ktHUQIQLIhRyen+qwvKH43FXxAR00Q0bgk3G/6kmv61IM6/Zei6HRFcAHBEJqkW2vFyyMccEefVUSc3DzJ1eb31jx19+2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763501680; c=relaxed/simple;
	bh=ayhkjtnG5oYSTvJU9zGgngy6Vk4K8yB8TSicqsdscXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLlepHTsDutfZg3lq8V6aflcwi499mIy6l0AF+Fei+U+lozDDcRv/h2IikPsVXPx0vIgopA2cETfTQtsHLefQ5LKJ/857H0a5LKeowWZ67moiUa2q5y82Xz7+ehJDvRQ3mCfwznsGg7qWz2U4FGQeimi9Ma4207fCEmyv+/UzDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9uaJGz+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9uaJGz+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-295351ad2f5so6199455ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 13:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763501678; x=1764106478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayhkjtnG5oYSTvJU9zGgngy6Vk4K8yB8TSicqsdscXk=;
        b=W9uaJGz+p74rKUsqI94CYziohwg4v5ZwzQ4bzu5ynceDGsEQ4Faz2W+2G/D4oQrAPo
         lYyjnf2sLssVbmsBBDt618MNULgkKqa0+4RGw3tcE9EGVNEi+U69u1fonrg+kCPUgUOd
         xWaasW9vhX11UAHzuGIfHyrxw6nIthET7zAC0rLb7N0/QE7lMrU63aF9N5xQShsQd308
         aoTyw7ctJG6TsgMe5VMY375w03DTIuVGMGVSkt+B7OKSNdZNZoGAreGYoLHfsqgUu912
         ImIVzQ6weO3DarJO6mOiXNSU0NdI9wGnPoAxmlpP175OeZt2cD32aTB91DBCr/z1xl35
         mbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763501678; x=1764106478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ayhkjtnG5oYSTvJU9zGgngy6Vk4K8yB8TSicqsdscXk=;
        b=kiiFrt9SZlleHqqoeXj5BRHfKxGcnJRx0S+nYnIw8+Zj3xd0mqPHa+zeYpNibyb8Qi
         e16RLG9775LX82eERwbltEvjB9PUv9ELG5OBGFTD4LlkZINnB0KeNeClQe1GP/mYXdSt
         KpjO3cilhQVVBNR6gfwrJDOnZhR1ozrXj0UhOnqArEiGNs/R8eCI7lLGjJOODgFRGoR8
         HoR73wY9rCdfJuyGDwWUoDF9YUEnItpWDgUpvcCMEsOhUseMcBgMnSo3151zVELr/DJM
         AqOTvvKQ1mqJwa050Vt0kosrwLpW+CcqtORv/3lMP6Gh2LxGmUWXG7UpGSp6lI13m7cc
         HXuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1nwxCGLymksAbtI4zcZhG8MAHPzG6/f37A+WedLb3xMScUtxLO3gyHkWB8LzdbfaWkGMxCmZ7+NmCGLgubA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz23qYmQIfEw+TOSOI0IBpjrTKxfNA/+OvE8DtR9I1Fi/KWoW/Q
	vn8gOjzWFOEjrl6EnOs+HWwp39OM+qvIjV2ETY+pjpl5m1PXR9ljC2CrNA014pbxmKpOQKxsNEF
	335WwjesNyUTOLWX+1MRJnYNCasLmfhk=
X-Gm-Gg: ASbGncv2VJEIqWciP9CGdrCxaGMquUmpvp4dvmval0pisWKeLkXKZcu4Hg3l9+Kq62K
	PPDpVrqs/zPVvkztMzjIAnbTDT4WaZ4fdgYpZd5HvX6kPZoVxdbwzllB/40MyjpEHGnAzUi0w7K
	0owgbk/+YxPN9OgsADxnyit2+bJs795dVIq/i9d7RL0tmrkQcrrDk9duzVAsIzQJ1R7XOKMlk2F
	4R6V101p959KhlaGuUYVD+fuXwtnQzs1TAjDHYJ/iEjjQlg6XFz1FKwI5Y1bAeAs1E2kesqRmNa
	DK+LiMTxmgt9qP764KbajktENC4X4dqrI30ss44NR4L1+9h7tpMu/cMd+UdSxsO0EW0hztQa3ye
	ZmCdzrnS9tHhwXQ==
X-Google-Smtp-Source: AGHT+IGX8h4A6zcGUTs7X+eFMDyXhW51vmSf1uAf38sUPQjSauuE8ZKK+X2wdAA3Xa+2TFJLQgCs7ZBrD2+fbuc8h68=
X-Received: by 2002:a05:7022:2217:b0:11b:acd7:4e48 with SMTP id
 a92af1059eb24-11c79421cb9mr1445567c88.2.1763501677839; Tue, 18 Nov 2025
 13:34:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
 <a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
 <CANiq72=bYzj6iU7PCm+VMBTeBbgUcL8nwrvUut9p4ph+3+itaQ@mail.gmail.com>
 <kjpquyekvw7fwrndoomtge7fnxtfefihqlikj6xcqtazrr6l77@424ufup7v45o>
 <87seeb47pk.fsf@trenco.lwn.net> <20251118201152.038e2749@foz.lan> <20251118213210.0e8b173e@foz.lan>
In-Reply-To: <20251118213210.0e8b173e@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Nov 2025 22:34:25 +0100
X-Gm-Features: AWmQ_bny5AGEF8tykWZe5kPsPO31JUToEx5VVlr6EVeQl93Nod6ZibZYR-vFH6U
Message-ID: <CANiq72kYaFsY4jyFvXLK9KaDnZ8493A_7eiO3pE9UdWqGzgm+w@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs: makefile: move rustdoc check to the build wrapper
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 9:32=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Btw, at least here (Fedora 43, upgraded from 42), rustdoc doesn't build
> for docs-next.
>
> Perhaps the issue could be due to some weird things with Fedora 43.
>
> That's what happens after sphinx-build-wrapper finishes handling
> htmldocs (after this patch), when it runs "make LLVM=3D1 rustdoc":

That one is fixed with commit 16c43a56b79e ("rust: kbuild: treat
`build_error` and `rustdoc` as kernel objects") which is in -rc5.

Cheers,
Miguel
