Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAA31E4B2
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744983927; cv=none; b=dNoMByaunSUcazt0AvwfQ3URiryS+BS5SYiuT5moNX6Aj6fsDLdOZbVRe4CaBvrWcpOQhi6ABtWnDydH5VRuYwufd5Y7vl5yw9xK9Y9X0I55Xzv9vPjZgl0erHHG7HrKRN4hdAe/4O+l3X+nTB/l8dkDaPzCyznHiu5RI0r/8+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744983927; c=relaxed/simple;
	bh=In53kUpbmZwQUORLdwI+9CRbyPgJ4oTO4j+Nvik4xnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSYvolUcrVSx/GI12SQLDIC8qWELC5+62Z0DNL9t/Dm217pKZI0H5qChBJfBsjgeqNewpb1RE/liO21CnLz8Ug/H0UO1VSPvBJZYibErLtQR6/8uexmVFQzbE/+v/fD6enXG4EbuN5eC8M9DCmROrMsTwOWmx3Lbv+QiyebPGpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjMTbShM; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjMTbShM"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so417834a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983924; x=1745588724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=In53kUpbmZwQUORLdwI+9CRbyPgJ4oTO4j+Nvik4xnM=;
        b=LjMTbShMc4XN78oT9kE37nviIW5lcrzGI3i3ZcJH15K6IraQVel7vzcxKSagXayenj
         SZgzDiTHs2ZFmfFfi72Sj6dZd9F7P6SRKORddbEaxCV77z9CsKvOK+ds3kLbdHlmAWln
         Ay4rT2UNtAdaYCMtisa8bMkowMg9mXB0208uIqTCMFbwmjOpXfGRyKr4w4MKWCZ0akTz
         7+mQQYbSP+3Lg3tSdM/qRCrGqMVluXTJNy9lNvW7Rk4zhXtf6eSswPZfDHkA78OTqED8
         kCaPWf23+wZScNZWNDLo99Cs97Ibq8TjNrPMhM0G3jh0Oe+S7UtnLBveKyJpJA9b/fvO
         nBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983924; x=1745588724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=In53kUpbmZwQUORLdwI+9CRbyPgJ4oTO4j+Nvik4xnM=;
        b=ORWZOH71JOhopbpTwYBGo5j6I9b3XbEx8ZaOleUn2wVWeuyhatNOBWnPyu13IZfjDE
         6Xe5dfIFIJrmJZ3mB9Zb1cy69lsSH78sh6zzpo3rnMH5U/NkKql/AvPUbKOs9AfZuhET
         3atql1uTa/KE7QK/dcecbAHqr5NPnnAF/KHmYfzDYQqMR/KzKKUcDbit20nzgCzgHNVW
         F75PJlbE8pAgJzyQMUbfGP+ISr2MXTEHKilH0g2tIbBfP7FLfWa4E6ECVKr9BNUqaEKi
         yTtU2AC9ic1NjIS5/TFnsBRs3Q6vbxhzLrM9p/pC4VTeDWLgLEpk8lwDySZp0iqHJWpT
         3IdA==
X-Forwarded-Encrypted: i=1; AJvYcCXSqeGijIVpauqm1ifoiYV7NCZNVGSNKTY0Oc1k/QHgm4nbPVYXOPQCe/LHN4l/QbGg8cf7EcPgeiZVVfLsGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfPNoEiW+yAZ8wg1mIMP4jwP6DU33QSjveJIrq5Y9rlR5ncOON
	BavKOTAlzSFGVzLT8Lrchyr5HpxKiBkd6sQbRcSkHdz9+nUlH+I+due2WEj2FsCaVCpFyKOMZa4
	cIh73LyyLw7IrivmzE7kbN55uzLs=
X-Gm-Gg: ASbGnctQHbxFQ6cGS0IDUCM4+0h+s9ZukoS+WueLKCSI7FwqomFvsvS/JTkP7kCtqVI
	2qEV1DP3s7LKiCdh50YEOcdoWKrdFkmCxaNCmIJTwYtMfVA9CPB8SyF7meF0JA+YHx7GUgiVpop
	NMaY51XfCVPK9TnS50vucT2KJUFeG2qRhy
X-Google-Smtp-Source: AGHT+IHq62E5iSCOAsQFpIvCr5L/1b51X1PZPZX4QvUWV7doauD/XFE6ign+GAZaTU087PfpkcDQhRKjkP5KHA5nU7M=
X-Received: by 2002:a17:90b:3851:b0:306:e75e:dbc7 with SMTP id
 98e67ed59e1d1-3087ba58fb6mr1655008a91.0.1744983923870; Fri, 18 Apr 2025
 06:45:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418014143.888022-1-contact@antoniohickey.com>
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 18 Apr 2025 15:45:11 +0200
X-Gm-Features: ATxdqUE4mas3D2DHlTOJIep6JKUWNCSKK3gWZQmEo4-uA2AgA8jP7QGme-wKTME
Message-ID: <CANiq72nteEHgwMbjUZAknG+7aKg1CzBmVyJPhKY0+9k_W4AJCQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] refactor to utilize `&raw [const|mut]`
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 3:42=E2=80=AFAM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> This patch set enables the `raw_ref_op` feature, which became stable
> in Rust 1.82.

This part already happened :)

> It then replaces all occurences of `addr_of!(place)` and
> `addr_of_mut!(place)` with `&raw const place` and `&raw mut place`.

Thanks for all this work!

We should give other subsystems the chance to pick the patches (or at
least Ack them). I can pick the rest, or even others, after others
have had a chance to take a look.

> Finally it adds the previous macros `addr_of!` and `addr_of_mut!` to
> the disallowed macros in `.clippy.toml`.

I have also considered picking that last one, but it does catch a lot
of uses already even if it may not be fully reliable, so we should
wait on enabling it right away to avoid screens full of Clippy
warnings.

Cheers,
Miguel
