Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFE119CC0A
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Jun 2025 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051692; cv=none; b=Q7nbTz0mGIi3I8Ou+nt6A+HoL1Q/ehuHSuaKC8NXuNcGfqgIn7JxdfyHhCQjSp2BY5KoEWQbCUZUuH9Qa6y5nf6KXVHtDkDUL/QXoPrB5I4Y5IKDBsnbKnxYl81aVE4iSpPNVXuO5vODbasrfGcDj8axMVP3JxOP5OrFaFGFN6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051692; c=relaxed/simple;
	bh=Mzn7xpL5rAvVucoK/efC4KdOeENWPy+LQfcrZDyh+Hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlOsl/WA1c4iUCaPxVD0lxLJE0oge9rWM+8E9LmH/Zq6jJDWBIIPONLo3O1AHNjRVrA6+ZBJ81UElqVeJODZVozkbEWy9SvKIaKauUaZp4QcIr9lEJcRGMr7AHfA+w0YCZw9bXhkt4F+8LsFdZvxosaCCtGctEehxFrbEMqHzfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GO/QX0dm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GO/QX0dm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235a6b89dfaso4004935ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Jun 2025 08:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749051690; x=1749656490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mzn7xpL5rAvVucoK/efC4KdOeENWPy+LQfcrZDyh+Hc=;
        b=GO/QX0dmwTmhKWmkc85pKTLur3m01Q6V/DNBogxLl0Q644bK9RFTc+Sqqrk9b/aW7j
         afFa8dL8IvWkOX02b1qUzDMi+yrXW2p8nUJBlrQXtx0EGyO069MXzhYlI357l/JYYBn2
         WL7c4bRvncJeljji69Ks7dwYcHC9DwaktkupIDC6geSsS/NBhWh5kwwyyOpxIoHntZ6k
         XWrssjvoDr0ZElgPLvfwFQ0eBEVM1ZUzaoGFyVlMC7P4TcXh9Y0Mfp67pn5xK3j3/Pn+
         86dBZDp1hAS2r1In76AkEqyZNigq/qYUt8ViSYwIsC9Az5I0gcNqE7ZgHmSCAiHLdFXI
         fFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749051690; x=1749656490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mzn7xpL5rAvVucoK/efC4KdOeENWPy+LQfcrZDyh+Hc=;
        b=cCEBR23SJ1ubAUjBdzf4SPtaFEktbF0NHcqmmUzrykdy1GWczMAwpvqnhkGtgRjOns
         LVFfE+0c5Ob2FH/xewyL2bSLqqVfngNzXALr1M9EYRU9IeIGVmPW3yJFgpQj7wfEzbRr
         vGgOznOeh4ISSibLHxuhiU/50FCUd0FaSteNFNuVRC7ORRPcYZhVfaJbcFZO+q4FK51m
         2q2ElYYfmJ5RuVKA6O3FKDzZ5FhVTBuD1k1otvDMptNZHJ75HzZS0bLLI3mwXRH4vv4q
         ihmhOjfmuy1kWHhHhlSuEqesy6NOQHpR1/ScBa1/mnV8/5tfYNOOg5GYXZT9i9M3+YAA
         /4rA==
X-Forwarded-Encrypted: i=1; AJvYcCVVsUeFcP+CX4lfhEo6cU5ssmBHTNx/AgZPAWcCmPXJu/Fc62zVKOpohdPsqzzzkXwf9YIZ7hkIJBLlqlfi4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0O1V1a7oL1/PDrpu9u+56fydO+OWh7qfDXgvJRNLy1aAixyIL
	ufIXMpL+SW9JNOWH22wrunWlw1WJVNyb1vrkvhQLzwZLiDTXjYzCDRtBM7fPnYwTL9/eQQkZ9qs
	IgFPnafu9qzyJGBup5j5yjFQEjkUbzyI=
X-Gm-Gg: ASbGncsqKGI5ksL0bjS2GAeSzsng76J4l218F7zzxkJVNr967z9EvAi3G+ILlHTGGhd
	KT+QcInZyIB2ZmwCy7YZX0UWOkaYX1afN4TnSNdF/eUcnZN1w4QUCWHpPy7SUmY7zWojgEkFZnO
	wOJ7gWHsI5RE/sBeNg9r7M8Hj20WjcnNngVs0r0OMt0rk=
X-Google-Smtp-Source: AGHT+IFosQQJtIVp6zeuv4X8dB5LcqQwfV3/2gCXALMPXscRaT0nZiryE3x9nVSHqBWTPdr2Oqvnqao+Xgmb8OTqmtg=
X-Received: by 2002:a17:902:d4cd:b0:234:d7b2:2aaf with SMTP id
 d9443c01a7336-235e116c1cbmr18356115ad.7.1749051690455; Wed, 04 Jun 2025
 08:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529184547.1447995-1-ttabi@nvidia.com> <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
 <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
 <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com> <DADUK09NUMP6.3Q5UVROS0QDYF@kernel.org>
In-Reply-To: <DADUK09NUMP6.3Q5UVROS0QDYF@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 17:41:16 +0200
X-Gm-Features: AX0GCFslFZH3fW4n1IjrOL0z8_AZ0UWD2i3-xs9bZkV_E-S6mNltlTKqWYUhDEk
Message-ID: <CANiq72ntEXJd+V94d4MJp5kEJg1zYAbuO_LqyUTeqj5ODB2Btg@mail.gmail.com>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
To: Benno Lossin <lossin@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 5:16=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> Why not control the amount of path segments with a kconfig? That way we
> can have both worlds.

I thought about that, and it would work in the sense that in most
cases one does not care having both (or a number as you say) available
at the same time, but it may be annoying having to change it if you
move to another part of the tree or between builds.

I am also not sure what the default would then be (it could be
annoying both/N ways, depending on what you are doing), and avoiding
extra Kconfigs is usually nice (and avoids rebuilds). The examples
(and maybe CIs out there) could need some extra care too (e.g. if they
match the text).

So, I think it would be fine, but not sure if it is worth it vs. just
having 2 ones easily usable.

Cheers,
Miguel
