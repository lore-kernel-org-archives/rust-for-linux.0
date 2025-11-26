Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9EF2FB96A
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151626; cv=none; b=V5gT41pf3eWrFyq05wHFbe/HftEv8he2D9oZDv7lEjFyWi8I9M9fcv7POPRaGzkwQfsbdOKdY1IkBv7XOO85jlvwtn+TORpbJwVsXz//iQI1bWX0OUyBv6CWYTXaeIIjcuMtMy2qPeBy7zF/hxlffmo0MfJK0OmHois2IcfN0/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151626; c=relaxed/simple;
	bh=e2P97JqJJgrSTofOE6L0Vqzh5vWI3dfXbDRlEdNGUic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNVE09Tq/J81LCinEWJ1rf1bEcdMMXKZJSrM/WhuQrlr4iQJWXPffoqdLHnT5mo/whuFoaNFXGxsIsRwNcDLUoxcOgQ2jYar1jaw3obbvHxEGJzr3hRYTR53JzGPBB8M/DUttGoPY8B7WXPz8H5N90cjCzSHOduX5QMFVSdEuWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B991CO2p; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B991CO2p"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29800ac4ef3so13136645ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 02:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764151622; x=1764756422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2P97JqJJgrSTofOE6L0Vqzh5vWI3dfXbDRlEdNGUic=;
        b=B991CO2pAcR2Wn7ChwrVtSzOk/misyZY8ITTAgqhDE0qnY9zKWle0Y6acXPjqhZ1aG
         l1nNQUEvajvNsso3zSt2V1y/9WZEJqLGsJpFwVtjBdjRKJkVmvBnQlztNG6GuSJo+tzK
         L3DPs61aDYCQ4/TMsYdHtWJlWXn3UIo1lQYij33qALbfuGwH6zpq80ahQJX7W9aOZAqI
         z3rG5dnhk0pIqks4hapRj190uv+UW6b0b68hzU1IfdloRB/OutPFAvrJ0MoGLZfMBV1W
         dUUoEP07+YH9o5X0etOlPqWd9wdWwdxE3NXXOcS+wKDfyQDzVBI8PQeRQcO7Mu6aYtim
         MX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764151622; x=1764756422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e2P97JqJJgrSTofOE6L0Vqzh5vWI3dfXbDRlEdNGUic=;
        b=RtRlhJr5BSBU1/f/or9STjs0M780HUuVLLRmO2uL/Xx6LM/45GI0LbK+99HPakQt6L
         LqiWH3f0m/Acd6PM8E0XOUEaQDqnv9g64+l6RsYdPIlUQfYtalI0AXkohW8hc9rG2qBH
         +cXSgX/2rdRcsDzLtnUEhUh7e3nWmX6IDuVv5gxZkYB6xTH9doBmn4X0Py3E2qd3LtsX
         Rw6oCRttDiieHZ/EHPQ0L0kJboy4e0KhFtJncJ8jjAriiDIjbXARzdeagd/W3DEsjAKi
         VSwi4DxQkXRvCsQx6K6dHdQmWVw3X5an6gJin+lnzMG+TwCvP72a/R9todiDzmHcKjiA
         UH5w==
X-Forwarded-Encrypted: i=1; AJvYcCWWCtdCngxhrZY7CGCUoGMUGzz9t44XmA5DeQCsRHYaMLnqqU5Fbxnn58PuGpPrAVflmi1y7pRO9r6h8qwqvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHMvrhT8EqNAbRRbv+G0nYYsX4gXaYx2ItX73bAEn+JNEEzGPJ
	Er+rD5G4Z0YuM85iCzWLGSSf8dzDBtdKVFdaWLkED6neUqbea5f4psoHd5AvFzS0/nJMyimk15W
	yFdnhW8usQ5BLRcnk+w6B54cCOWpuThE=
X-Gm-Gg: ASbGncvJ3fLXy3an3ax6p8CBaLUCLVSVNhemoivY+/cOq3E/ZsPp4TYG/A0Y61R+qCw
	WKDua//oDFxJWPKWVnB8+DS2faYBhK1fC9LW8K2GPnXE5xA56XmnwcraPVZqjUiKb8kKHVHa48V
	FvdhH2vTVaEQ8Spk1P9S4KHyfV+oEUWUsMQWTGkdaHf6/3ye/jwl8/w+Enh1MsbjN+IAhNT4B3A
	LdPvOUKbJoM0UQOIb64kGX2RIgZaXHU+iE5MF7Tq3JEJ8o1QtwqrJEsD3bTkCfGFQhGrWiOdCkY
	LcU9w2/oqIBOV2PnDm/9P4LX6HHlT6x3Ch74L17Y6quJ9sEeYhJS0G2QnrjbwHw7wPnnFaAbV4C
	NamGOpXLnvkhI1A==
X-Google-Smtp-Source: AGHT+IH2u/p6uuejiQdBn2FdTVRunkAVdZufiIm+sEmpf2szKbImscQ5SyGn12xniGpqStrNxFPmWHVbL4VJexNgqJw=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr11325693eec.2.1764151622004; Wed, 26 Nov 2025
 02:07:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com> <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com> <540391dc-caaf-4ca9-9729-e3147bed3100@nvidia.com>
In-Reply-To: <540391dc-caaf-4ca9-9729-e3147bed3100@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Nov 2025 11:06:49 +0100
X-Gm-Features: AWmQ_bkhJWTAVJBxKsZu1t81P67sTZ90hu6KhDzqOUDEKCI0FkxUuBERQ_mEKds
Message-ID: <CANiq72n0mW6wSWvk4=R41BK=RWbpeXXjea-c1FZMs8y3sE6bug@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list operations
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"airlied@gmail.com" <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>, 
	"ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "lossin@kernel.org" <lossin@kernel.org>, 
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"tmgross@umich.edu" <tmgross@umich.edu>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>, 
	"joel@joelfernandes.org" <joel@joelfernandes.org>, 
	"elle@weathered-steel.dev" <elle@weathered-steel.dev>, 
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>, 
	"phasta@kernel.org" <phasta@kernel.org>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 2:39=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Yes. I am increasingly uneasy with the Rust for Linux approach, and
> now the Nova approach, of adding in "things we might need".

Excuse me, what "Rust for Linux approach"?

No, we do not add dead code unless justified, just like everywhere
else in the Linux kernel.

Yes, there are a few exceptional cases, but it is just that, exceptional.

Cheers,
Miguel
