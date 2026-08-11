Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4C62737E3
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451525; cv=pass; b=YvPvAUPwxnwJcFxfv46HIO1vmzuXHBZFixzZMf5z2a+PGnK7OmeppNaCG5KfDHVzC9SZGbL0ZJbsRsVVYkW8GUIVRhI5OJuhFIoakMZS2A9CbCONnc0cpHJFSvv/DyWtpga0u2wdePtwdg/S8mCDXk8pT6zfJQpxkeUmi1DUohw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451525; c=relaxed/simple;
	bh=VV7t6wHWEE7xZB0c0ALAUrHcYMkXiim8886mu4yeAcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSR2G+yErTBK8z03RSWKIb82YLmgiDrPsAysJ/EMK3qrKo2MTxqvoAEyPNRPg5SkMPt8XM+iDuGryJRDwqKJBQ3QXN1Elc4NcVIxJBPFtvDlfvswCMyTQfavGhAgrypNi81leOYjoLs9GyrwlFpedCswR8t9/l+RN5AviSh0yBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAC4ebbM; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAC4ebbM"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d30c22b1eeso1195315ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 05:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786451522; cv=none;
        d=google.com; s=arc-20260327;
        b=bvOphq9NstbxY6tu7LQnFV41mFaG40PGjj/vEgznF7/yHLAWF9AhFquZ+bS0HyFXbo
         Ai74VILmI/W6FWdiA/keEc7GcABOCw703XKLnbvqcYDOHcVCROw69EWWHkrHiXLvJ7/n
         2QXjzsd6wJ9aVTnQ2/vJJUxM55SY104qsZBz+LMXyzb7DQBk5e2mREqbShgmSKlwTvgR
         JN2xrTKl3dBSL2d2UlVeGeLkZS2s5qXA1o5OqPhD5UVVhHfhgRct97p+WSbG/2PeZGNq
         CEPt1kuxOe4KwXCDn0kEm6cO253et7tZWJDb2In3Bn5DfYrDjGB/t2Z4jo86dTCqS/s9
         u6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=orvbh+9JL+FbxIqTNlcfLvYH6xrqqMswPRU7oLw3bow=;
        fh=3GTXSaGiyNR8I2cV+B3ib7DBYsLXIg8EXsVRVqh2Fbg=;
        b=aqVsDzBiOhfVKxlxoIM27gt92mPnBouSiEIgN5kCBHyYsQFRnyjq/C+gxnDiLWcI/w
         S0rqsA6NZqzHnJEULZVwKwEC+iE1u5SqGKYPtbbqSkIeu5Ch3/mTYrP93J63r3H+xeRi
         Lmo8aycUn4UikKuISxShviVTRhpG20zZyaEeSSQ25eUmZvCTny111zvktzbWy174AHMg
         +sHWJByxWRnHofibDpdB9mkTfn0Tyk5ZN/BLnvd2m6pqMVfLtB1HF6yF5Q4czrDrHKx1
         AskZOpHe6W1kk+YQSmYs5dA1LTuk8RWDBpEws2WldnO2GLjIQN28vXijiBzvR5S/+fnv
         OgKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786451522; x=1787056322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=orvbh+9JL+FbxIqTNlcfLvYH6xrqqMswPRU7oLw3bow=;
        b=ZAC4ebbMJRFcLOZcWT8I75Wq4KRaV/L2X3uX9KducB2qZtBVFoQrIPyAHbyfmnEj+u
         hPN9Wlj8vwx3y9BFdweqgXaw8NGZVttCE6oxWFiiwdHCHUJbZQOXJ5ct6Tt49XSFot62
         ZCtEc731BqcxEXw3PW0ObokXfJ+C+cPfDZmH5Elp5M1fZeVCqkI/0nU5hbbKNXZuBwHA
         235ofFKka/gzkwkL1/SaT8Ijmh97dDXwsqHklGmN+6bJaaiUczfEdHGP5+vvNiZBtqGX
         /FWC/aVh3Ag2uzfAMBfJdlbB+/GIKcoyyDyr97RO0aPIyIcnDEWW267ZoUO3OXFN7Nk8
         pleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786451522; x=1787056322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orvbh+9JL+FbxIqTNlcfLvYH6xrqqMswPRU7oLw3bow=;
        b=lcY8C0R0wjoofim35bcNIZqjFfn6non2F0BrXcs2EbvoQyJYKmC5NC7qN4IzPWcT/D
         aMvxnIxuc5pc60M3B75D8/rI6qj01AyhQmyPCy7W9qeVtAIMlsvxh/J/I0E6BW3LMoeS
         bPIy11h11LhTz+oyr2kFTyKK3638M+stJz7mk2jBNHYnIqYsxceps3MUrpt65UEgSM4A
         /mYmU9F+GvGmrBFKR1YqOf86hMAmaXGUkf01wMZsRvGXV+QwgXZw+4Js5wYlJfto1Lrl
         B/L6VDR7cIE22wmkWFAJPEOokip7HXmS2D113jBp3UEpg5/jnJ/PUC5GvSyP0QSNCHpo
         Ydyw==
X-Forwarded-Encrypted: i=1; AHgh+RqwSlHI0GkhwaFq2SbjQdXk1AE9zHUd0/1jWohp6NUl6A4HOYHdu9cTLgYG6jHDCVRTfDSuif/oGvwCo6VSgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNj/e4PYw3BG0fS6gy7aLZPS0iQZ/V948FNfwn0Doit+pElesS
	d5/Vy9fGQsPfR3Nul1GQ1TfFWcLhs5BiIyn9Ooc6F9cRgYdl2tDBRwmqUn3m9Y6hHjQzP0FMTur
	LVtRktjpVsRS3B3VLA0vKNU/GYdweaMY=
X-Gm-Gg: AR+sD13wGDMaLaaRbJAdg6an2KB9rDVtpIS5+22aXYXrokjnpFEf6382pSSnHl0L6DM
	8aS/NHVW46a9lBLF6M8SeQGPy4SNpOYca9E5ln+QVyisPI51OiF0Xm6LBlngEcghdc22yZXvV41
	Rva5goZ6vM6nFm0emP7mtu/xOQesCiuaLg9bf8SBgjO8Tot1RjBklwiJqO7ptrKuSrMAs7SVC36
	6G4MA+bk+bf4QzIpB/7LtCpSPQaZ4dhHLidZAdnccRfcZlOKLl0RflVgUdd51y0vn44DeRgm20a
	opS8ofalwx1b+p97ERy88yXyEo/lWxRjqH6daYQSMmwa8iCg3QAscp1fddYKWgNojIb0aDaZvw4
	KYl0+2PBuyBJgNn8bSxa76DbPGE1YtuuhMFwLvO7ccnOKCv25lbGMB7KQCyMO
X-Received: by 2002:a17:903:950:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d317790400mr26287245ad.1.1786451521959; Tue, 11 Aug 2026
 05:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com>
In-Reply-To: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:31:48 +0200
X-Gm-Features: AUfX_mw-sYa6mBs4ValMgNlBU-v6shu4N24mrRNJSqO0XtM0upSdH02iosArTGY
Message-ID: <CANiq72n9TaUgWgZYg3Xzm2mn3Ed36B7O+f544a5BXik_XUh8FA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] gpu: nova-core: add PRAMIN window support
To: Eliot Courtney <ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 3:57=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
>       rust: num: use const_assert! in Bounded
>       rust: num: reject Bounded::shr overshifts at build time
>       rust: num: add Bounded::shr_exact

Applied to `rust-next` -- thanks everyone!

Alex: I didn't add an implicit Acked-by to the first one but I assume
you are OK with it:

    Suggested-by: Gary Guo <gary@garyguo.net>
    Link: https://lore.kernel.org/rust-for-linux/DKIY9YGIPUUE.SZD2DUQM9NGK@=
garyguo.net/

The second one is actually fairly important so I did:

    [ This implies we can break the type invariant, which in turn means
      we can trigger UB via `Deref`, e.g.:

          rust_kernel: panicked at rust/kernel/num/bounded.rs:528:22:
          unsafe precondition(s) violated: hint::unreachable_unchecked
must never be reached

        - Miguel ]

    Cc: stable@vger.kernel.org
    Fixes: c59a2d14cd24 ("rust: num: add `shr` and `shl` methods to `Bounde=
d`")

Cheers,
Miguel
