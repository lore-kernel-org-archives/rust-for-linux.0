Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A02354AED
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768837578; cv=pass; b=ZkFZOqlZfp+3AlhD5eCzzxoZm9MNCzd8PVZ9Z7Amf5YvH54adLEvf04NVPG1LOhgailJB7zrt3ruC1KU4162pfJU2Aq2xU56HnB01XOWZwYpQcGVNP7pAW0eSYKvNKu28irTWOMKLaNpNYW4JNRUqnDe/yChzy0cFNz5FlRpMhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768837578; c=relaxed/simple;
	bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ooFQGaEUQZk2GMyYg9nHfnav78koOWnf+NXjGT6N2Vx01leSzr0liQtdcd5vS2SFYLHEQc3eClC9u9iSVxgydIxRlwh/xVJKkH1sbfqSUz1UJYzAeATZw0RQhBZqBb7DodAkzqemfMqLrZDA4dJIb50fOUrsnnB8w9NVaRGg3sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXXSCU3C; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXXSCU3C"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12336c0ae91so388816c88.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 07:46:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768837576; cv=none;
        d=google.com; s=arc-20240605;
        b=ZUxuE11bE851JhyktIpDs0yXlYygGB2m/Uzhe+IgkMblOu6XePBjWL5dpRZ0/uB2rT
         HKfVzC5yPC/DdHJbwIUGKYA+o3Vb+agOSGL81tSZMykN5CfsYhdwf2hNjMym3cx0Hv/R
         DOHt3uFjNAFmpDQHMb/OggjaW9uTi+VR/XR4xuuaOI7HylxcRNiZ1F1nKGCETHZb8BJ4
         UsW2smyQW1f4zvDxx03Yh273lu5Nc0wsXU/Hu8koY/a2iIoJBhJNUZXx1YJEmlAyb6fD
         dOmQnmwPJ0J4gsBkQdQ0Hh0W/dk8tnXmqp4szwHlEePOfANquin67mdqf5d3z22PxxMo
         H8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
        fh=dLzlr9ay0YewAvc2U0+BYsU330nibgyR1B5IeOIhbYs=;
        b=dhkVXoOsDIb3bbHpjxgklcTonZK6AwCCZIQ5J4J5EzmIkQFAnudL8TDnMpLgqpXb1z
         rJi3J6BrYb8PYJNZm+MJXdXcG/uoZo2e+YEr2iYebW/Grt3XQP1Slo45ZT1Y2hZiqjFw
         XGe7yVwPVaC5fy2OjIqR/y9ScB511s4eAmUf3a8GKvYzKfKy5N4qET2PPsCUqboXvhDK
         IL+YyZeLXlxkiB/F3SYOq95xzujK0fSyM+49eXOrmUdogzAi/tATNQeJQoqlm2JnFolw
         YhfxqdwdiEVm8OPdsgw2RDQVx4sv9MsjaG5SZ2cLhCC+WB0bmvlNNjqCbrPn5S37CIod
         zflw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768837576; x=1769442376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
        b=GXXSCU3CdBM8c+MgPSzgQooJIutWbrMebgtv0WvYE3ZbubHbcip+IwHvDJ9eq+wc2B
         Mka8HrKybre44Z5qJ81M4hwIGKs8x2I+658pDDoSYO5lAXNfuDFahjA5+wuKVOy1uqD5
         +QtGt8P8oTZgfrEpER3ICDP4awqpYwtUy0Cdfkkc5jUGjG5KLHrhtMt86+UkUrx9mL8+
         WKjjF0LOngCoioejgRfEY2bol8HvX5QXUMzXuFzgemphATe8K5EXp3BKdfXwsRtH7l3i
         hYQpfsAggJbzU9tB4Vr9HxzGWJfrreJyN649wORSxiagGFl1ze2jhWOJH0cugSxtW5nI
         PRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768837576; x=1769442376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
        b=BGvDGzKdpIdUQmP6GXv8WrYhXAJoV0PODS+gl+8Y0nuur2i6SuhZytjF35sgzxtuwH
         vJFP+V3F3cWg51gN1luWRWgGsG5REInKQeCN3KrXo/MXmnicdNqx/+wIHZUmdBshMEYR
         7QwCmMxl+C/tBmqACjqFsW62pqKrcKd3bqv7550bTCDTdtBIHOArn8GjchvTqmnz898f
         zcQ08AGW6KuZNYl0uow1QWu8OH8qIQFAXqaCnlOQskqst/bZmgwZAjbSENoRaRlqv5Ru
         lNI8Wddbnism2sLqUu4LU66r/le1a9qf09j/sGxrZHh55GtfT3viyIP+w5JE2qjJn4OX
         XSBw==
X-Forwarded-Encrypted: i=1; AJvYcCWi7OaEGvf1qrqbmH0hjXTBuayYXu38dmQ7aFehwlq83aN5jnzfI9r1sXnLoKBsRQUxeUvzfsz9fASGlWxr9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo0M1mVWI7G+CUci6S6G4+VUgZsO3R1oylYdLSkXYlt7pyhvG4
	R4gd9TWKc7uugUnXU2GZl2SlWZG1WbA0FJlwSqAIQpSu7NFjQLFDZGmLzP72f6WFDfezz/PYH/5
	jPL+YLh9Hy/cRWWY/KFQEYEt6NHsz5uw=
X-Gm-Gg: AZuq6aIh8VKF2B+vPsZCbJbSd617nLbF0M7jrPUrWAcdBqU2yV0DE0FLRjSjyExPd/o
	QdMgATgxDdMJMp34vkjr8lqx+yJZhN0vtMbkiDvG/YDAiasUdzwqqvFPqAqLc2A44UD0R8FTgCG
	Ggc2JsdHbSReZez4chsVfYu+6zsFDnOws0x2eUAotOffJwMjjQuzFR9UlAFsqTVjeAYryDFdZu+
	BDQ1VaVhvlPKXRsa+hXLG091GmuxuAqd1EOPD9tyGAyDc8iZbIlVrJf8e/uUsJ5SR0dytn3dceU
	twgWrBz699sdjJzPRYHFuOzx2WpepinhfLTVsPO8EPHTXA9wJvifNI3ZjV5il090llwwU3pW6Zv
	PbWIzWitYGECrMrsUSVhrSsw=
X-Received: by 2002:a05:7301:3f13:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2b6b40fc353mr4845380eec.7.1768837574267; Mon, 19 Jan 2026
 07:46:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com> <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
 <CANiq72kcRQShDgMJKZ+ekUEdP1T6Jr=4PDiMJCqnQjgCQEK_eA@mail.gmail.com> <DFSODY3NWRBQ.2VGQWXERVW1R1@garyguo.net>
In-Reply-To: <DFSODY3NWRBQ.2VGQWXERVW1R1@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 16:46:01 +0100
X-Gm-Features: AZwV_QjEkXpU0cn_dPvCmG7mx9ccCkl54ToiMM9A8sew4Jw7jWCplASiAflPTPs
Message-ID: <CANiq72kCi8=mK8V282O-tsbWvLC6M2vdc50mnLW3M3pWTACyOA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 4:36=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Which crate are you talking about? I can't find a linked crate in the iss=
ue.

The commit message (i.e. not the issue) has an (unused) link with the
`sealed` crate:

Link: https://crates.io/crates/sealed [1]

Cheers,
Miguel
