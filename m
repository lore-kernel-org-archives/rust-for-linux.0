Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CA3320CA7
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 17:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767805246; cv=pass; b=N41pK9zy6//4T5blKTczCDRgUL4jN6Wff8lbLiqQsqS+FCPjrCtjVbZYN/TEXlI4VoKNJTBaMu+aZAI4uAfDr0zTOZ19hMEtls7TSziH+zMH55F2PQXKkrUbeC2tZKjF4QQKNpVxkxKt+iIo975LT5sZ5DAJfFm0pj/4vhTQ9CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767805246; c=relaxed/simple;
	bh=JANClq+vJupUiiNficR6nASBeqXN6UY3FRormzY9Mw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8WA5xyp+LjoVC3uV45cSirA+jjoVGwqT/zKOEC4ILJ3Vlh33dWZj7io7XhQsyw6XFWYs4SiZkJbWUuNO/75rc3MITaRdFPxzG6SRV3ash7L6rFFSajz+yJMySfIkj4Lcr7z4BZqVOol6D3L8jjnved0DhlpDESSMevG8sD4w1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqvcrwcY; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqvcrwcY"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-11f42eaff60so175537c88.3
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 09:00:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767805235; cv=none;
        d=google.com; s=arc-20240605;
        b=hAAJlqcZ9EbZpMhbgDEYDW1vQYdltztd8hHLROuteKBSHNbazR2jxgn3T7332mn6Ef
         ZlLLetX5TXXUS26/Bo6Tl/CwdSiQ6jX2bgWh6dXYLOIm/65hGcZsV+NPBT5oWG3Th+tZ
         xjyCnnBVq+0pmWPSU3xiGbZj7ThjqPy0eJVp9ruU0ep7oWA6Tl9mj+h6EdQsihDKHs9j
         1IEGdBw9iq4cXs9YUeAhixerlWzUsl6MPzOA+fMFmX1f8XRJCeFPidcRTQlG5zlLmB+8
         Ig50qUIFvwlJZaEW6up1qYvAaxMCxAhm29IA+YncCLC3m9TRbuc6OiU2/OEBCK2L0Itx
         3ydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JANClq+vJupUiiNficR6nASBeqXN6UY3FRormzY9Mw8=;
        fh=HCKcTW945kpwuLmnMCLyV3bDnXvBa+xt4dwW6QtxjQc=;
        b=N4VfAExdsOKEiI2EfkUeXSDkUwFKJrxGhtcJ/2EExSAdc57a2ClMpCf8OngtSX61BO
         SSxX1pKdPKk6APebktTDUb6Oh5yMAHJEuZJZPkkpY6PJxKpH0l/bw/ZDCd0bh3hwC2GH
         AynsWSEUNLvR6hdqaJQMpfZAheJd7sGNCPh/YWyolF8FN2gpbA9JAgPLNszHWx5Fxkz2
         J0Kz3XlzIv5pP5Og/zl/SKVJT1/Bo28rB4HRots1o0MRKbLF97KaS7l+PWxJabNS0hB5
         zf+b69txxQaf7Ia49dt+NuHmYCrzlNFMqYjh9+thNdwNmxWalgid/1RjOFgAl71WPSXf
         FAJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767805235; x=1768410035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JANClq+vJupUiiNficR6nASBeqXN6UY3FRormzY9Mw8=;
        b=RqvcrwcYUptb6UMGTPkoRjP4TSUjNRpwWBfC67jOcjYo9pSO9itvsvz7+JpLXQX2RL
         p5SrjsKjzQmA77Y3s7/0hcFgmbHXktzL2wZyN+km+WxYVSm5jR4giQG0OS3LoVQANRAQ
         eQp7JzKda1CwHOAjVkdOoVWjbMoBRIBPUaxgT3dTBxSqTtvHV8qnxOY6vh2ur4Iwsde/
         TDhr9kIOi/7Ur1X7ZZamcjFeq7/8G4s2UXjz/eqyvWE0xWtGo7avMJZ+CYZni9O2tfSm
         FGyZScndSTmXv+mpqUN+AokWiIDd2yip3sdJ4bW/9EEoCk6MYCqH76f8nzq/I8qb/Xn8
         lC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767805235; x=1768410035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JANClq+vJupUiiNficR6nASBeqXN6UY3FRormzY9Mw8=;
        b=UImY7ETqfAM85eRplj6B7WY1SziUHlU4dECWZy+sXlnsIsMyma2PXe7yIkyoC9LTB+
         TLeEbJQXElPZzEe/zh1SC36orkuU0VYYcF9Wd6yHHhRrko4iWB4sN1bjMEILzI2zQuKq
         W7y3rvPBiFrNWWBEGjeXo74p7CZ6ccgq4atVIC44Mgjs4GeGmYQ35xZptZC6EPY5iHDO
         PJerbKYklo1HiACiUyoPBop8GyCZ+eDuaikZyabOMHPvGLfaOfuDUv+Bql+h5lmpEV9z
         Dzyna7+2KvyQ4aMGnvWM3E2VvX3xaMGXAg5zTkb9YuTRet4qGvh2liRzyB1IEHOQCZEt
         XcaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY9EOWq4bqjbhpCrfAfCwUdAT/9Y1hYV+Nughq5W4t5GU9fB1NBu/55LzH38IXEHprmkn5PwWMfXbJ+dnlWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxULAD/vk71veOWpGADrpkJEtV49x4rxLKvJfaLJdV/q10OPcl1
	Nc9Z1aXbjlLPLuDKJnMdpd8NtyUqmxmsh1etzLOYUCR3kB+Mcqgn101/10UX/GeGkK2jlSydCWa
	eY57bR3lGU0Bz1plcnyfN1PSJwIQNQqY=
X-Gm-Gg: AY/fxX6WmGps4B//VqjAzxRYiVS7K49EFIEI6SzNF/JbMO/3wzInEq+2LFgohS/dmXN
	jTflOILB17XABUDp7gpAozD+R2dshy7dEcnKvKNRPuT4as/Ginzy0Gm/BYFa09CPmu49Wy0x+Qd
	4nvtBcoIyr/nrZ6pyfcR1SAO8oVDhzxgdwVPVPfOrooBKQjh4oEdPXTGCGSyKN4rGzvcR3NBWne
	V+ZMZvYcWtyiWXgsDDM5lJw68elXgM1CCyJe9oP5Mb+WqJCHSrpH/YH+JknBiaBdEN6Gx78xwF/
	2AVZqDjuD94dKGyk82y/8iOr2WwwZZmgkJ1CdZx9O9kkJygec629ZIT7Nzmhn+wQcxMJXK4mpSB
	IL0KCgvZ5exvuXFzd/v8CT1w=
X-Google-Smtp-Source: AGHT+IEan6+TvpfhTNCwBeIBP4DFHxt2xpZkVE/QhdSDp5SGBnrvhK822thXkI6UiXfj8I54c/nSy7Fpff1t54Lsy+g=
X-Received: by 2002:a05:7301:152e:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2b17d2dda21mr884739eec.7.1767805235093; Wed, 07 Jan 2026
 09:00:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107143935.5757-1-shankari.ak0208@gmail.com>
In-Reply-To: <20260107143935.5757-1-shankari.ak0208@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 18:00:22 +0100
X-Gm-Features: AQt7F2rf7xaWMJhG4K7dm4jEP5EMXm2MYxr_vmMB06CPzTQget25J25tVEyTv4U
Message-ID: <CANiq72=KPv1eTxpU6K9R6tu1tudYTis0CRKM7Hv2wfSLXgdGcQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rust: types: remove temporary re-exports of ARef
 and AlwaysRefCounted
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 5:37=E2=80=AFPM Shankari Anand <shankari.ak0208@gmai=
l.com> wrote:
>
> Hello Miguel and all,
>
> This change has already been made in [1]. Probably it has showed up on th=
e linux-next
> recently which has caused the kernel bot to detect the error.
>
> I haven't raised a patch for this file change I suppose. Should I do it i=
n the same patch v3
> or put up a separate patch and reference it there?

If you mean the `FwNode` one you quoted, then I see it in commit
2e2b4135d1cb ("rust: device: Update ARef and AlwaysRefCounted imports
from sync::aref") which is in -next, so that should be fine.

Thanks!

Cheers,
Miguel
