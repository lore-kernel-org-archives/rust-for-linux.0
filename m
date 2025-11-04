Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C1329C44
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762265249; cv=none; b=isiHDmg9UvThm3dvUd0j3RiWDVFTsL/477P87FTiOuDiTS1RpDDjfwvBtO78i27wO4TNLZXT9+mzcq4QlZBy6p7SOrS4McbCHeLS7J5tbwWz0ffZ56dLiQwhEvGnGb9HdFrlkghtc5ujg2x7SWkuHPEoKyQa8/OPYNqqofpczqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762265249; c=relaxed/simple;
	bh=PEGyLJUT+zzSFJ95q6Pkl8/xdguEfP2nRB1yIszhyZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMdkzv+KF53+L17UUcNGBE/fJwCHx6d/Ar+WUfGDEtCsBL/C5F5ZWkA0tndObM4y2xj/+qsXfjnwMOgwXXj5XIIaLNglm5UXMaegYjcCBQckUuEXUCqY0pDtZmGzQx1c1llj5dZmvpaKevcBa845PTTmVJHsVrUFUx+1Rn3Uz0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwBOQiR4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwBOQiR4"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a432101883so605602b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762265248; x=1762870048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEGyLJUT+zzSFJ95q6Pkl8/xdguEfP2nRB1yIszhyZY=;
        b=QwBOQiR4q9fn59Pb4WjCrc3qUgYA1S+vIUbE8ZS4xy+UsL8t9aolAlsD2BIETdO6bd
         1KrPXBSuJxUJINerxxiYCtZ6T7DEDXc5XsSR5iqYpLQC5rfZeo19VbUSXCnsMh8QF5Nj
         S2fMPBhkwldM2k/EHgF/AaogANhuUSIoOELuoAC/Rs9VBQEKm1Av0gH+FxDT7sE3grbM
         JnOn14JaJST+AqpGc40k7uh0+//NwLNDW7w6GdyTZOJ1Xzue4VM9B6uCl0jlLMKEEiat
         Iiu6okkk8OUQd6777s/HWQjJIuOw625fON6PvbrGZfxlDd8EyxSpWyOLg8s3ejP6iPrY
         SSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762265248; x=1762870048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEGyLJUT+zzSFJ95q6Pkl8/xdguEfP2nRB1yIszhyZY=;
        b=lJHT60UHQiFKC000Px206ZOv1JPWz7KnTKJ5DugQwzqpO+gcBn1SKVJ5s+B4QsEzv2
         uPwwo3o5Nd7MG0dsexoffmdVeRMG+ZEhLPdNlCsOfHfagaJ7lGWoskmU1hiOVS9eXTeD
         V4K2efuC8saX+/dR2dMCMiMhYCBVTF93kLwe8o1Vq8S7zZ8fTNqGfaOiruEv7EfodIa7
         paU8qgT2bKNRFDt7Mw29FP5ccVA77KWveknau8nP3XJxd0AERXPHCmPWXN2zBda8QmbS
         ACC2EDM+8S5IcLEgJNIUtIYlNcUVibDZQmBPELKf2ROdxaNeBSuLUBQn7Punr2Wd56DQ
         Jy7w==
X-Forwarded-Encrypted: i=1; AJvYcCWEqz+J4+knNT145MUBXOx0gJZOCY4tgdEAkDZWYK9SRGe2gojXAI+gI7MTt/7Ug0FDPcd8h2soomJSh+xL2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP2Y2b6ZODA8IU8RV60IxwBulQ5f0kseguFtYoFwYpkqrjK/ji
	VriigQLOUNnruGL9sj7NjahDhihQVVK2Tbt+Eh42MIgG1iEOJURVRL0PoAQAwAO0nTtZVi4+Vu1
	1Twm2XIuDXqAXl7IyPN++Iy3ecWD/75E=
X-Gm-Gg: ASbGncuF/b7xoERlpSpOedSdYfPP3VDtTX227iRV5jub2uRiWmzAg2YmgjG4wECIcfS
	oDu5k8ibJiLySXZ1TJDsahTxGI4l1oI7cytug1QJ8v/OlE0Pfsolt1rKec3BL7PRtCal76j9OwR
	vPI47lfxVLQRaqgy+yTzOyRm+/yWllZ4/YZVHWByOC4E7ktSaoXjQrnfBlXmsmlOB7qh0kAcFlV
	UN0MnszudhotaBgkN6uXIg8Ff2j2xAqAL2TFtLbc/pI/IvQVUd5vpNUVgxGX+53SHXJ8JNv46dL
	HdDg9NZ92VLTtZA/oxVhrLiwQ5L8ynvBBQYVcRWQzRqjZ+bspjb7yXl0aqaKX/ws9Gz6LuKNvc2
	K6O1ctn3GbZtcRg==
X-Google-Smtp-Source: AGHT+IEoQt7wc4QhveCREcNLj59n0mc2+WwtyT6a1zVCHIjoX1thJlflh/bTa19DZhwmYOUd1dkkOIBrsDu+HwIpQfs=
X-Received: by 2002:a05:6a21:a44:b0:2df:b68d:f7e with SMTP id
 adf61e73a8af0-348cd411b8cmr11613230637.5.1762265245767; Tue, 04 Nov 2025
 06:07:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com> <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
In-Reply-To: <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 15:07:12 +0100
X-Gm-Features: AWmQ_bnRfHv_8j6zHrslJDNBWq9rDs6IM9lMFZ907aXIc2-_3edh4KvJlGf8RU8
Message-ID: <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>, nouveau@lists.freedesktop.org, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>, 
	Guillaume Gomez <guillaume1.gomez@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 2:42=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> What I'm more worried about is that it might be a PITA to write. :/ But
> maybe the core folks have an example for how this could be done cleanly
> and in a reusable way (i.e. we don't want to duplicate the dummy list
> creation code for every example).

Using a shared module/file may be good enough, as long as the `#[path
=3D ...] mod ...;` or `include!(...)` is hidden with `#`, i.e. as long
as the user does not need to see that to understand the example.

But, yeah, we have already a few places in the tree with fake `mod
bindings` for doctests and things like that.

Cc'ing Guillaume in case there is a better way to do this. The "have
something applied to several parts of docs" has come up before for
references too (the "external references map" I proposed).

In any case, even if the example does not run, it is still way better
to have it at least build instead of completely ignored, because that
means it will not become stale.

Cheers,
Miguel
