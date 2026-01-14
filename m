Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9637E3396E0
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 18:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768416869; cv=pass; b=tIT5UIDkxvgsQnNtFQEt88s7wr4ykTxk3fhIcJiLz+/LRhiChh0f+CJiCGviSHmA5yytj7JJFUTDf9bl0NVxlQTdkFcjEH4A1/sNvx9cS3P6RhKOx35WV5B7rDt/rm12yPQ/4KjHArumskTkz8Ml0sxFDYe+Wk92H6cCz9MA/YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768416869; c=relaxed/simple;
	bh=IUnoTD4ErkoI5lYAzUBpZJn7Wf95shtYCwMI2ixCKnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aq3F6oBup7eEZ6lIWu75IjaoHYSHH0ah9lWehSdVD3496qVkcl6UGXAX8Rft+CAEZuXbURFKVF8j49zDop8O/QqaW4mohcYXbZcq3/ozDT4YZfHpI5WMbVAt2R5yxWIlL9GztIAK1zR4LYYbUCXvWZauJjsnOdSwPUQ05d+2MdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RL81Vbny; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RL81Vbny"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-123387e3151so9871c88.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 10:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768416864; cv=none;
        d=google.com; s=arc-20240605;
        b=ZXGbf9LM2X/xKM6L2IQH7oDMr8DwHV7PsCt0mkGH+2TOLTnYeMaVskKodaXqzjrYIo
         A7DXrgVQFBhF5Uovw9gFuXk1sDJkNDugrQuUt3e5rjBb8nmvZ7iqVPtK1NqBifFgSISj
         l07EBMez0VXcQOiIGLarOxOAB5dyEIhzCycASCzQcrtLfc++ekNkRdUcQAMbZLgUmjup
         gx2YxWk8YBboXlGNX8/IcTLQ0EKB94SzZ7CqOEm9TN8HuhzBOHPzmc5M8moBPrxq15Df
         4HiH7Jg8/wS+t6v9nZLaQdq9Y+9BtC02RK3vYinTHqRGiwlodHVfdL0fYiGi2elkfxe9
         cXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+VwzuK2mRwmByUFJQrTTROPAJx+1yqWSXNGCJdzOb3o=;
        fh=WakgV82XJljr1BpXPFZnnuQ+n9wBwAQYxWfbZQmVGuU=;
        b=LXHWB6lEyQTSnMVSe2db8Dn+kGOMdrooI7a/nK4Y0+G6SMUq4B/5kwvKABCuCj2pH4
         fcBH+0yBE866E8AYAjpRdoJsU7xJMvLpb03FfbX0NcE5WQOxd9srnxeeeb2niw7b0NOi
         IfA7GVl8PoAg/NqamPVM61OR/6Ig8Ku6jDBZ1QBC9SwzQXGfAVUX28hnOP5ZC+kLsVn1
         YTtseBUuYOutC+FsMRpfsqo/zU9BeNw7TlzLGkbIarIYZfECw0AhcbgbOk4+1qpyuRMA
         jvYZUUkiELYjN1RNaGaaeyDs8Jp572LS5+WWwSmJqtLJ62xQww8JCMN8+AqmdDKqyk3C
         77eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768416864; x=1769021664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VwzuK2mRwmByUFJQrTTROPAJx+1yqWSXNGCJdzOb3o=;
        b=RL81VbnyFHxqMqNYFzzwVC+d7Iz2P43SPHwEBAwEF0UoAJJF8o+z2VfkTbsEO+zsF5
         be1X9ReYKDjEdx56bBeBnHvmsv3/m2ewVCmLnV+d1iE023pRC+5F4BX4z5HSMW8nvUWm
         Zfa4Z0YZ0tePND45R5piYZXi7bxlDHb2JSulbs0hj1Fm89mohEAGQHNzJyIfhLfGlA+D
         eh9KD4rAz7LjcHEP9s7ns/4z0kU+fUo1TDe4XrpW+tLFSVx6H4ls/fhxIeKD3LEUE++P
         sZSVeA8Zr8MXirSvAooI/Zo1WTMy9j5mStI3okmNUYQdwSa/HnwYdIMaWl875WAz2Jak
         iJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768416864; x=1769021664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+VwzuK2mRwmByUFJQrTTROPAJx+1yqWSXNGCJdzOb3o=;
        b=OAOytJEDaZS5BFXhgXzWKr95ej36rbxY6W+4y5pz6iCZYjBpag+i2KyLITEPHRB1/6
         bUq+8YQ9WADnywzjJrd8MRn2q+k1DgP6bOUHQ2WXAkesjIJAs89Ungax5ZpzO87fHdPJ
         syu5wTUyHfM8YT58nJzm6bv9hoSVrmoq+lWHaj7hcgKfnxnWjrDaU1m7i8oHEN11r1Lw
         BdbRMYxLEI2V/caUAz1TWAzLRyZtK8Z5jCCDwOSusHBk5ql7wf03yKnevJyHlQCJkVMk
         S6ZGKkSJsAzGAlMfSqM+OBctXcvnujxt7hDMG/sW4u3sM7RayOnWkzx+Ok+BOatqJHoc
         sbVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIblo9VxfV0yvi4a/XEL9JaWarsJ9CL9yL1/A4YZurEDrDstbE1lMIvbvoB00Mm9nFiMTBB9MdLWA3kdgaMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOXeP4qwx9UeePDlniZ70ttinDJUhdb5MlpNUT7fo0dMYX/Mit
	7nW6xRr2MqE/XAAHk0Yc/T1VHHH4zZ9Sq1u/1IeNF1Y7Ic+Pw0AM9Wp78Ugjd4mERBVZ4m9HxuB
	H5sVKAt+ni79PSKcuooJrol/8IeUCk1Y=
X-Gm-Gg: AY/fxX6OsQX0E+6s8JOVxKJM5z6ovRh1a2xRS00EeGuaE/CifZBxDO8vFx65gSw3XYg
	NcfRlVKzlBbov0EDSj9T8jNjF16dBFRe2kMFs5TWohAIq5a3FIZzR0C64gZwffTrF+D1MtwODUc
	oLxuaVrex8xp9TWcH40Jke6vmfsyHDA96fhj97HobTERamDe2QrN5SLd7wOQseeYQgIwTofYGPw
	uv2OvGCmUgdOesUh/XONlLCuPn9PvUNf/0PAELfJr0HIKbyYgQ3amCiJ5jew0CFiE9Z1p56Z2Mk
	+raSh2EMEyA2ChHfZZ+57WAP7xnE5txSfhqsCLWwRTRMU/AaCA00vLVQNnIyR+lNoHA5QQMOxmn
	NWj8HYASKHGTA
X-Received: by 2002:a05:7300:54c:b0:2ac:2b5b:a567 with SMTP id
 5a478bee46e88-2b4871c92d6mr2897301eec.6.1768416863572; Wed, 14 Jan 2026
 10:54:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mEYacdZmHKvpbahJzO_X_qqYyiSiSTYaWEQZAfp6sbxg@mail.gmail.com>
 <20251210.082603.290476643413141778.fujita.tomonori@gmail.com>
In-Reply-To: <20251210.082603.290476643413141778.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Jan 2026 19:54:11 +0100
X-Gm-Features: AZwV_QhkbMklMnGb-Fpb7VfZUrLq5dlkoJjX_Rz07-0ZdBt1rsE01_eiLAP14PQ
Message-ID: <CANiq72mvezjyJBgeD5Ax8fNorDpw43nYj0oHC_bagjOkpQKk_w@mail.gmail.com>
Subject: Re: Mainline x86_64/arm64 defconfig+Rust `rusttest` error
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, gary@garyguo.net, a.hindborg@kernel.org, 
	bjorn3_gh@protonmail.com, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, lossin@kernel.org, will@kernel.org, peterz@infradead.org, 
	mark.rutland@arm.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 12:26=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> I think that simply marking the module! doctests as ignore would avoid
> the issue. But it's possible to make the atomic helpers run on the
> host side so we might want a better fix?

Applied to `rust-fixes` -- let's go with this for the moment, thanks!

    [ Only the first one is needed (the other example does not use
      parameters), so we can keep it enabled. Thus I removed that second
      deletion (and reworded a bit).

      We may want to do something better here later on; on the other hand,
      we should get KUnit tests for `macros` too eventually, so we may end
      up removing or repurposing that target anyway, so it is not a big dea=
l.

        - Miguel ]

Cheers,
Miguel
