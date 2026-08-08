Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60814260565
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786213179; cv=pass; b=oDdUDYPKkRMa0UmXtp9ryCy0zbe9uWwvxOM2ZexZxhY0syC7Zo+59A3MtjgbcRwiTXw7Qefja1J2voPNLdsq37qI1C0IKyUBMklmo5LsdmIesuREurLNvbfpfDyq6p+A3KdqtVqsnhojBwUlwIhSJQecl7OPePsHPyF7lOsaYjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786213179; c=relaxed/simple;
	bh=7g3j6bw8VqnIvd8/Ot9LeYc96xOthlWJV6/4lOVkl5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyBHmmGFXcksDWA7ntTBdjLZCr1kjh3LmliQZcGQFDOqoRI44K4bW73gJ/J4pefMpvU4CrgOE2Ve/H+MI9Zbrhd94HBnrVbQ9Gp38njkG+k03PvPObPuSu06xQQfIhLk/0wtVjhcjOGuvNyCMFRDb9iT/rgrVoMlzEcx9GLr6Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BreEmiEQ; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BreEmiEQ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38eca09faa2so99585a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 08 Aug 2026 11:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786213178; cv=none;
        d=google.com; s=arc-20260327;
        b=nJ+OQSwjx0BxVWfnllDqTYRe445h4XXzo/dyD8uIClmlX6xAh/yePak7RtH9JTSzjR
         k3ns3I2bEAMmZ9AXngGKeSt3btv6X5eZ/RM2ymzyDGt/lX9czlI2BQ56YamhkXpC6ESy
         j8KLRQFnJyYyuS1lW55mFrWUWNbqJfAXJ7tHrLV93gvHvMK+may7Px9H2oMihbixe/Wv
         B4pNlV7NHXg7zaz/Mv7aUZMB+MYNzSbbGLBojoZb5phwuIcaQotvXkCvL99qseG/e6Vg
         MCRfTkRWC/dfZRSGC1KC5JV/4V4SoV9U02ra41GsPB2Hd3rLFICnsVpri++F4mWxbM6r
         aoXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W31DsC3JQpXj/CC1Bc0XckcGBvTl6/B9PDcHbBhF79w=;
        fh=ccuwBn3atjsUlOIU8UUtzYAAIKNMvmGYhq9ulZ4kN7U=;
        b=I+ojcYXVMXEruKHdy8tZgyw93cqi6uARFLMH3gci6iMv/5L4u0h4KKXJqi32vxrbVg
         m9QQJ6fPYPfQISmVd0F79yRd8mPrTyYoNllD0sl+0ahWrPMos+ENUFELlUy1v9uwWRCL
         fq3oouVvey77IdpK4vfT8QoeeXnnXZ67+i+IkVimWOB8fRM6FdQHjUP2LvNQOZAEd/iD
         UG+HmCtb5XJY0qG62vo+B7Gra5xJxEIAg4ShOobrdRX5GArxYZ1dH1uMRH6NMKjoSfxT
         6hD+XfzZsLZEJ5LIZJQLhtzHeEmSnGWUSoIQNnkxOIEP0ZOWDRhcK598i/S0gb3vKHqm
         WEeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786213178; x=1786817978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W31DsC3JQpXj/CC1Bc0XckcGBvTl6/B9PDcHbBhF79w=;
        b=BreEmiEQjKW7Mo0iVE23XBLCdOob/IWdlPjVfU4nk4AnREFtEjiPoMdiWcXHhEt47r
         ka3vqUQWHH4Z73B4+nGpX7CFne3MZk3fR5KtroXJaWCi/LwfO7oMFS0kfPtBZtdhhJmt
         tV1kuDb9PMOU57Y1AS2mOQVEj3LwYKbOkaFN3CJ29CJhLUhBrULUstOVBDBX3RF2Zopj
         mEM08mIepaKAIeuIJCR5Fm4TI74h8zB/I8OgK2CU+ju/g3hIkORm29PKxPIuAZrzwrJU
         6Qc1jcHeOF3mHk0V6SUvMeWfddVqDjpkvzN/QIAsR23aYzWAXSjVo0kOH/ub+js4ay/g
         bgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786213178; x=1786817978;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W31DsC3JQpXj/CC1Bc0XckcGBvTl6/B9PDcHbBhF79w=;
        b=efmwsq0eyOkn5bxcSLuWUKvVu8VGIPqHNJ680PpfAtx8OG+l5qADVMSlQbGWod0fCa
         Kg3+DcphD/jcOVGBc9ukF65H5a7V7dqAHYgZCoT7l436gm/IWMQLaFen+SnbnIlKXByO
         gp1UPhYUSw+mFE8cnJELV5UULe7QkCR/nyY//H5fZ4bdzABhkERFMSldeGN59sbym81a
         kvi9rl+uLr276Jq+CbgObH4rk+B/9hCLOI32hN3CW0zw+0RV+edv7B9fokKspHvSJ0Sh
         BW0Qf4dhHGlA66EIjSTgyXdzGb+W+R0uHVa3tds8pqQffkG8ZtLQpqu8E0ygQrgP+ykh
         I6GA==
X-Forwarded-Encrypted: i=1; AHgh+RrYahf6BBjJUxEPKDQLkwcNM7D13M+i1u+845ZgMjt8KLy2kw/JShPlfJu0iqLXk1ZIDu/ledwEEVhg1WEzhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcmVRucFZEOhKifXKqdOh6hB5DeNODqdtBQIeHgz1IPdd0Yf2y
	WbBcYfM9wokKlXSzaLJ3P1JGY7RhcMFb4s9aYgyp34cEaCSdQiGugOdwFjl+nI7d4tLzfJsIz3w
	cnvKqZL56S/sI4vtcSwR0oOwVlMfFXtM=
X-Gm-Gg: AR+sD12uG3MBJbPW85q2gUA66YqkzgkqqIe3sPbVWU/Vkhz4nHtc+iumocYuxQwOcei
	foIykfD0zJmKr+7AdB81ZxZ1zgTWHQ4AcYbooX5EDRZLCOUiiEWoV3zkJwJh5sYCBX5ZtRjp1Ci
	cAIq15qqINkP6BaC+e22sO73/skPi5H+CjKoCXMUBlaUEmBBWzB3VZkZFFZ5fu9+216B8pB4slM
	1YuoydtnCQjzodyoQxT4dxskgUgFHE1tKaNXVDiU+iZO2JhyJgyiGPu88KxHFxCaOdFv8Z7jzwa
	loZmXVTbYlfl2aORgQwb52u0bSfMHfyqDjhjVYUAycrt49ZJ1sw77s2ZuSM39zEXPOVuGTfsqpS
	BR4LJ0R/2/qcZ6nsd3/G17Y/2Z0a19aNEuHt7ue1ovxutfb023xIzrD7isgkt
X-Received: by 2002:a17:90b:3f48:b0:383:5a16:bd67 with SMTP id
 98e67ed59e1d1-3903c783fc7mr21995742a91.4.1786213177686; Sat, 08 Aug 2026
 11:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720035510.4048145-1-tomo@flapping.org> <DK6CISNRMHJD.391EZL08Z6HM0@garyguo.net>
In-Reply-To: <DK6CISNRMHJD.391EZL08Z6HM0@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 20:19:25 +0200
X-Gm-Features: AUfX_mwedie-0GhmYpHQ5To4xi7RKTcffxYmrUi1hVoh_EmViG93TdmWkK9xR6o
Message-ID: <CANiq72nWcqd3aSKdPqOSRRQBuwWNW-s2EOscYszQ9kSbmrKxcw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: bug: prevent dead_code warning from warn_on!'s
 flags constant
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org, a.hindborg@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 1:40=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> Also, the proper fix would be to mark it as used in the `warn_flags` macr=
o
> that discard the expression.
>
>     if false {
>         _ =3D $flags;
>     }

Maybe it could be nice to have a `discard!` macro later on.

Cheers,
Miguel
