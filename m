Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168712AD00
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451496; cv=pass; b=MOXijptXpcKKdp8Zv8xLtvcgehCWFButkCxehQCcUWhA7SxSXvzeGH7sn/kto5hk7FH3jlcHBLkrZZx+KZ4L6ul/hOEImWkzrmHaGU1qh9kqYmnNztU0r9wBjNhuqCLvO/jEa5yeJsEtOgB3O2boEgWZdyhgyq/0FzLHruCdUzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451496; c=relaxed/simple;
	bh=Kvo9TKdttK5rv8KXZKEyC8pu8fV4Pu3XcvOG69wPlb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/lqFDhOiNBkF2DDZ2D8hIFA59XGsvLylcmhBj1lk6GBcTHnFJle45C64XJrQ9MklPYrJCPAJWJwYzaSaAMUx1V1luPTejuMJ86yU2K/6DeeReFXSH7QqV92xT8WdljSpATbeJadC2BlmKYZ1gOROXbPc848r5WDsVrCwm06cSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaB6ddVb; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaB6ddVb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cecdc24b1cso2556805ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 05:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786451494; cv=none;
        d=google.com; s=arc-20260327;
        b=AHhyPzY45pHMmKJkl7XJ5Qy6WJI+1LkZLt9+a7TGSrLfm0yfXsi5UhKy0PxuxDHnZL
         RUmFbOgne3MPxYCKVOEGr0nb6s+GF/Ji4si19Et4xv7RR+qB5mPIrWCiOiI9tMUiXAVX
         +Oka64fCZFXjIxYH26SYpwT1/AmPW6tXcE8pLZok7rYY5qjnijXCZS8bvNQKwGgKWgM9
         MTbAKmhvrjV0PlqMo6wUBEx/C74dy8vbFXLACyqDv2eBRCKCfOeQm31JWIRQzdPEqR3/
         +dVa+2ROb3fWI2wjxjhJkN4R3N1E9F5IppYqRw8iTz+QCjrSK2CetAIP0WQVotI7naqa
         H1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kvo9TKdttK5rv8KXZKEyC8pu8fV4Pu3XcvOG69wPlb0=;
        fh=h/EmpCm8yLr25a9at6Waj1R6YJu9rk8opfwv2h+BKJQ=;
        b=YyGiMDLmGG9zmh81aep0GaMJMX7SIDZsFApg1P0wzW/Ed+/HBpzoQ8Xp7+VpQeowzd
         Iy04+X9Sqap1gadL82qZE+4jigmHVwmX37RjMrRSPQzKk+MAnWKY2W0ssKmnS012X926
         Cja2c74ojb/EQ5DGtSmVom5XYOx00Hq2MCk4o6GhVPEzMp6TXJiFFROomZvbEKRIcsKr
         0tFNxpxozMPxtRh3Vl0aaLP7NejaL3+m8M7dL5D9ZJFcbdbi+G78lTyE3Cr1UhJJgZS6
         iheCPktAvJbDxogxQNIY4YhOMI2LXk0YcwRYFxfMHHd1T4Os+wVB6I2vQIn6OLmy7oTV
         5ouA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786451494; x=1787056294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kvo9TKdttK5rv8KXZKEyC8pu8fV4Pu3XcvOG69wPlb0=;
        b=DaB6ddVbPxmNZvOvFFMDGxAzAIFNkEMhzZ8OpSxsAWJ4Ldi5FNW6VO4hdpuhBDpYEv
         C5gPowOMEF5kiaE9WY3Pfu7PFqiR3QlyXlGoaakLsqFSRl7rRVuDuKnsGo3FN3oK50O/
         KTjenuKcpUzhSbEHvNm0BJoIofplXBjQ0aD4rg4zoMK6d7cJhLqDn/ENSdYko3tryKig
         UZ3hdfbJuzoptl+632PFWt8S4cQDP4xq+sqaxueUmoXPJQbMw48qSTDyk7RAWDoFWg5r
         8VOG3b+q3vOaylGpGQrkjpyjYmOB4r0y5WW2zSece9tfFx8INjil2QaKu+LVl+QFNMEr
         +zMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786451494; x=1787056294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kvo9TKdttK5rv8KXZKEyC8pu8fV4Pu3XcvOG69wPlb0=;
        b=g3N3UrOnowTGTGGFQAwAuabMoem3Qa/nBLo/gcAFgenVRJEDkPHDI542Sm7n2v/iEc
         bQynTqt4+DKk+es1nxYXRIs9+9caLAMZdSmOeN3OyboD8RQX95Tr3fY8uX4ckYtOZiAN
         E1UpkFqwaCz61W1Qzt2+deZspTg6VYY2kWlLlI9x+8AtmjAbLeRIQnz0AR5CLU8r1ldA
         /f0sfQ86AfN3V+d0gvJJbUGC5SNAdH/oc4EAv5o48IijsiHXruaocuHhEWOizIX7cuUS
         YUxjmUonmnkiekwI1179meA8La+1NMO9MFrYyoC+oIi1C8XqEAuHUFm6nGeGPR3Tj0+9
         GlNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIj5qi62C8ez3l7ROGQcgGMWabc9OaCYZG503Gs5svoernlSglcSQYIMSkRK/NF1E6RSAHUTX0/2KqTyXiFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2BuYBHMrsfA4jpI6e0GEsHTH7s4sEb7X367OxSd+bqgP/uUzP
	iVgMmvkHviNuxuagdkS6KP1f4BlB3277VRYBXcboKppR2nESY5zRjuXgXZZf3xpIF/sohbpTeTH
	qCT1JI1nYVL0ZKoGKBxJN39nIAxxszcQ=
X-Gm-Gg: AR+sD108ZGcd2lZMYvsGpLKIvgSr2MIdqth4qYA6qz2OF93GI0CzSxucilNxFcGJxnI
	OWhbUX4xtxOqE8EHzUrpnHb+4JL6X6RGoti8onicu2V9qkEjPRiPjgR+MGwA32bdBZAlbJcjQmd
	XoN9S3FvJTxlgjkG9YrIU5xzJ1SwxHgAarXgkjYrRL2n8fMeP3aMO6MZxvK/nJF1eClt4u1hx0X
	d+wvoMVoIK436dmkssfBpR45u60Xht7lb/lWnCdAzDaugx7zAwmmvLGz+gdbxdPKUieygXSD2oK
	E2Dm2GaPlnVnh+EPRo0aE4m0EaTcs9QuatyHPB3jgvMRRsfRayyNO5ZJlT7PDWCMbfeMtcbtNS5
	wLbG1h0zKnlQP33IX7G/6C+ytwNG11VuXXxMHzZjcW3NEyueEe8SbQIV6x7YIBIUnepdIYyIP
X-Received: by 2002:a17:902:e806:b0:2cc:d6de:d58e with SMTP id
 d9443c01a7336-2d317966388mr23897155ad.4.1786451494065; Tue, 11 Aug 2026
 05:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com> <DKLM8GXJGFL1.302CSI4V1NF27@kernel.org>
In-Reply-To: <DKLM8GXJGFL1.302CSI4V1NF27@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:31:21 +0200
X-Gm-Features: AUfX_mz05pylmKA9x8ysF8Rltnon1TiS8QMQm-gLy33uo5KYaSzY0l5rcB4vQvc
Message-ID: <CANiq72n_DLiGKpAq+a=a165AjN9zcYJFR8q1eFb9AbBaYKToyQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] gpu: nova-core: add PRAMIN window support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
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

On Tue, Aug 11, 2026 at 12:26=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> I think it would make sense to route them through the Rust tree this cycl=
e.

Yeah, I asked Alex in v1.

Cheers,
Miguel
