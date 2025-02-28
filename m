Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7863C24C689
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740733852; cv=none; b=BkPfP9H5lwetRepaAeZZtgHBk6HJaCByuj7LLCFHG/glE8b3/45BeCpl1zm6kKTTjNHvPpxAlHLu6pudn6NkAew4QNXQsjNNLRWNxAeW7H2UPNanF2yb4W98suILOnuHDvwqdLw/hQqTWeB/ev2+CNuMkm3a3wGbh+HXaayLnko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740733852; c=relaxed/simple;
	bh=B+KZR9U+QNu7SUxJ+i8T3VOmdEx/39PbN2GtIhllJPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXtQPyB/ID6YWRpgButdzpZAdm3Uf46o510sTILfgewG4KKyVa5sdO8lWN9Ve7916u2W6TBdNWgLCJxhityjfv8TzSQfjLzWr2LmYSS7jdBheXrrhUQY/ATNBT6hHGm49iGNwNPoSbvJb5Li6LSVYCA4+nJPWtN10XY56BjPb1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YrdBKK1G; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YrdBKK1G"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1017477f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 01:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740733848; x=1741338648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+KZR9U+QNu7SUxJ+i8T3VOmdEx/39PbN2GtIhllJPc=;
        b=YrdBKK1Gc8taDPwF3BXslAm+4RyH1VD/8Y4MpBK18oEBxGYhAXV32Ixzwr979xnnfI
         X1XGf3igKoEAUZ5I11awrSNmbn9bMboYqs/4vY2FUouqYIK5LXuc9954EGcBDr4kUCM6
         6nDnFZ0Ni/nhoP43QfIWAki9ebSSxrz2lxV3yTxi0uvYPNdaYV8dZE9u9bFMzf3yhOtM
         bJuhBoR2FxtP13b6TuvKo9l5x3yseZ2Lsz9Q8hsudHLRgc1alY9ZJ+OMfNUTfc80/2az
         Q3reEXuXNt3ed9ugMzBGI4WxzZFZiS6qQn7K8Ds4IzXmvSQJSvAeRCM16zpPDwKkO/a5
         WbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740733848; x=1741338648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+KZR9U+QNu7SUxJ+i8T3VOmdEx/39PbN2GtIhllJPc=;
        b=SaIux6L+dyOaZJWk0jRoITvkDCfjetxqDiyvwzdb5W6ecbYI2Ks3ANKnh0CNqMm7nc
         JEZrr6SqhzD0W1J2juTAPCOftWtirXV/2caGUMxeQvPC1uIMlDLZHBqYugHN5SRwfftv
         4t9R2IO2YCu4mDk70mtaZFSo1Fg7Lutzm4dhCNhGHndbBP0iY2wkjreB5ovpVKTPGvE+
         kTPA+fatyi0eS6Ik2S+cMbGnbBpfWl6T/nq3a3vLCLBQGB7WohEXJG+pF/Kr17bo/M/f
         8XtTgOgOXlDLggYqnQR3O7A6GLV5FHCLcweFzC5oCg04PEZTxhNowtTuECr6cZq3BnGi
         cSnA==
X-Forwarded-Encrypted: i=1; AJvYcCWJV4Hq2sJdisyKci++OR5ddi0TzqBm7i9VY2VR8I3oIiSXa7M/kBx3yN4X8t4eio3WtnRPx37mF5tlgAXrgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyua0QGkIom7a5uaEFIeF8TdPnb4X8MRStWtupHvskpZ2K8q2B
	R+QNlQktwoWFNUBR2eC4P1t4wEGZWf4uT4PQTRhnwdvWSe4vSYUjEA/hu/8ukVHsN+fW+tAWkk/
	99wumgSfJ3UGx1F4DIn+x1kLNyTF8QJWrswhp
X-Gm-Gg: ASbGncsaeV0WU0frOlsZUJN2rKWYP7UB8zK2cDhDQF2G6dT8DQc0Aam0mJth9LFmByJ
	70mf1nNYsf8dRWH5iaf53McvEXqBcAz3n0X+B8NAV1gEoVigOWWrpznYNCnlcyUsTDPfMhAtiDS
	XGUE14hfLILCDKnnMCYSpbdLOlywizgImU0KxW
X-Google-Smtp-Source: AGHT+IERGpvzIDS0sWelP51+WNxcT7yjVOKO5ZFHLOo3Y6uovfZdy2A/BnsEEhMwf3nYmys4gVtLG8EpMJrjOz8W398=
X-Received: by 2002:a05:6000:4029:b0:38f:2726:bc0e with SMTP id
 ffacd0b85a97d-390eca138d2mr2034057f8f.44.1740733847661; Fri, 28 Feb 2025
 01:10:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org> <20250227-module-params-v3-v8-2-ceeee85d9347@kernel.org>
In-Reply-To: <20250227-module-params-v3-v8-2-ceeee85d9347@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 10:10:36 +0100
X-Gm-Features: AQ5f1JqSvSbT0FH7s_hhnc_jNCyh2EVcbOEFqp5yXZR56yXssuri7XnydNHPcvw
Message-ID: <CAH5fLghKoWQqOC8jRES_ZdSg_PJHd22bQWngaQ4fRHJPHYLB6Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/7] rust: str: implement `Index` for `BStr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 3:39=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> The `Index` implementation on `BStr` was lost when we switched `BStr` fro=
m
> a type alias of `[u8]` to a newtype. Add back `Index` by implementing
> `Index` for `BStr` when `Index` would be implemented for `[u8]`.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
