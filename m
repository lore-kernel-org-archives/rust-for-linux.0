Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795573504;
	b=fUP8+0cukDQ4l7YHv/z6UzArYYkV5fafyECM3jfg19ntF0lAcQEdOLsYzXa8Psv7ze9V
	 ygV2BNDpSHqqJezC8sqiapnaGtaVqVP4zEjfAMxhW9s2gtbj2KTdFRSs9q770QvnWsCNl
	 ZuMQk+4b2ZnY3YONYNezaOLeDut0LXGqDIaUYG/F4il56zx0OPLvG8Rt5CpLOH5nez/RB
	 6QF0mGbw/aWmPCcWXIw8hCGHuSTw5BP6fQdVTd0i1GIFKBJKzy5gqcAgxKsAuEr7K3H0s
	 v00Kwrtc4EmNWB1I6IN4jTMQMpqiuznDHmgxOYjIHgiL5PX3njAD4ZQbV7X274Q8BQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RoVdVJuanm6IY9SbdoTW0HDKXtpUnzxojZdIdcKrd9Y=;
	b=1bUsPJI7WvGY9EKOrN4Hh8ndLE3QV+FNcuL/+7VIllnSy4MKqcQzL/T7gXxb5JgKnt8U
	 fb0ueY+tgMBANkrcCGI617xqPY5ApZItDjJr9lVumNrjA/eUGyOJ0+teQb056b3PLwHJp
	 SV2DlUVMgw34tFIWRdDVGq8iHnKw+Hkr5PuIj5gF9um84nnhfkUsxfLt7kd8vBvINx5kB
	 bx+S3liPJhT8tHc1+cZzBMbv4spn4a2E7B3pmi6jRu2UxNCjt3c2BlSd7ALUS1Q60XjTO
	 dybWhtJnI93M2UqWUpJu7wxzj/OX5Psazrep1D5zFwPpYD7cH8YBdNhh3zB24u3j/yA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDPnUdSz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EB8606A323
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 02:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44EB8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDPnUdSz
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae0a5c1715so56511461fa.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 18:25:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795573502; cv=none;
        d=google.com; s=arc-20260327;
        b=cRF3d2tej0NRRzSJ0oSJZMBPt1jBxOmNdYJ0lJ89GQHV0KcSF22jJuDTFZHpuRQhKJ
         3RPpteCjv/WvhD4TM54qO2hETwpWHr4iv39UYFE6Iy8o/PohVt22a6Az1SGjsdPRw6QB
         FQuZ1vScAnQjMDelj1WdW4SGFCda74WZ1xUJeGpbsFNxLrcuzRXkqj/nyzGRxWxXpYSi
         8N+kEH5LEV6Rilpitmak6hRV9ghbLWXxHm8U32sF71lTXPpUg1GakeLZl5WseKxoX38+
         x3iP6e9JWTYquNKxKqJY5aalCKZ7oJGQET0HBPzwFgNvjeg0vT1s6iOSzoxEry/xwZtK
         xvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RoVdVJuanm6IY9SbdoTW0HDKXtpUnzxojZdIdcKrd9Y=;
        fh=B4eNu3jtv1keqTWf1yXIE2bF7eyvMMvcyrczQ3eRl2U=;
        b=ds+Cc+BatZsVSqMo0uViHHseyMQuut1WHE6mrky+N2FpI/wxzKfh2c4eFCIXnfBKSB
         qlsFcHD8enk1sMZAzHVhBSrAQyudJI6fUXMW/dwcw+DM9EQfRz+ilpw/npXaaVZ5OS1z
         /sBLDyFhrgX597pAScJYm5PzMMVYFfdpSAKvj75xa07fL6VvUmqFmSQy0tDV9zml/iMz
         zVX9kZRk5gGYvio1ff1+dV6Blb2onKExUDBMBfzWV3QBSV5QsOaEoHEYv0FX4gufi5i4
         PSJOeusGoEV4dU1jm04RyjnYi0hPOkmFVzZ6XTD+IeUk1AusJ4bBScKabe/8JGJZFlAq
         oYnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573502; x=1796178302; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoVdVJuanm6IY9SbdoTW0HDKXtpUnzxojZdIdcKrd9Y=;
        b=RDPnUdSzB/AhnrN//N+BqPMk9ZTTXTKqFwy8gyHKdHefO1PpfVCMR6aUyienTzJI8P
         JQGcRjKX+MmaAJZP+B6NKdLw4K1FiiVv/6KY1f/KYSLS45C4rvQa4hna4gHfroEycXg9
         5lJVhz6BETGdhwdNnDbEdLmmRORAdtJpV5iWI7e9M8rr6iI8DHjdVvwL2S2z1QPfiOUa
         Pojb1nWft/8I7O5ZqDj5nnkxRhCwPDxrbDwItFQbwdO2Zaqcq0UY7r1w+tqo2Kg6hLcq
         nCJypzIw9gh4ToZYIVblfw33S8GICrIljQcEyhLP8cllbNWTJ1sIVcj6ZIeQ6W73XNxJ
         fwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573502; x=1796178302;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RoVdVJuanm6IY9SbdoTW0HDKXtpUnzxojZdIdcKrd9Y=;
        b=pf831ToIuphWFfXmt94yBnn/qmIEzxvM08/T+GUZCDL9PAP7z2qQC133xM7yf1qHU6
         JsCeQL/xu82626y5QW8FRmvar0Jz1iFwEIQnB7z+kKCRRddZ7wIQlFjnt1zx0CUHQgJM
         9gE39mpR2Ee/5DM8WckAjqknK/moV70Nq/CCpX0CMQ+KCPeRhhA/6n1lFCDMArQsxNG5
         HVYYUghyaBupGCybny+KWrCSjg9vuLH2nhlgmoDCneb6qqx0Fk/kU5SU5pxahQ/vGt0E
         Oo9wOEZXYA64U3Urut7s0OjPg9hugMPCDMR27O2z7cOmO87DwLM2g0x7lKbkjE8BlG3T
         x4hA==
X-Forwarded-Encrypted: i=1; AL+hErGqwu9H5gRlEiK83+TlVy664BUP5FyIaXbPclZ8w6nEqdTd+ArPkSK26A2yWVRg41lRyTMoq79d0BswKWDCjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+r6pSir5VZUyvyp6Lym6/qu6hBWD8lklk9wi/mB1PDFrgfaPZi
	wjBnb6NaNSwKRBzb+w35egPSt30LI1o+3fb+ROmDT06Ej5KRVNox0GUB92k4skvYcV/plVjyEEM
	NBtwiSReyTE6O3PaQvuHv0fIu+YcENVMZqzMdRyE=
X-Gm-Gg: AZFdTZfAQj4rtKjlm9K1fw0ZWxYIQrzYu8jbeJu3soNglYoR44aE33u0zVj9t8ara3T
	Ex8AsLf6ODdId/UChbU/lj4rcuBFxqlr9Ff4COzQACh0k4k4aBXB+VEDVczF4rPYcxA05pQYxPS
	v7Rq4yQPrUG1OKITLoEDKihDDRClTE7XyHMA+6ftcmFSjqzhwmbcn7moVKvfBaEdy9kuuW/uT39
	7yYUHX8lvIZ8xIlLWX46U5LnS4FKomvErlYgAB4xx2EazKocoCCgXCO3N4QpYuDiNRdWWSIzguN
	Djn5TOoxFCsAopOH4bCV0fpfAJhYS6TfdyL4cqnQGNJv53eeEuFFCCvxN8X2/fV9UPVJ6xfwre5
	+WWP8FBwqHRWlFMFB1u8UoEzYMrwr9i4KFw3C
X-Received: by 2002:a05:651c:160c:b0:3ad:ff5d:19b1 with SMTP id
 38308e7fff4ca-3ae7b7fbe41mr38238951fa.20.1795573502123; Tue, 24 Nov 2026
 18:25:02 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
 <20261109155743.83740-4-muchamadcoirulanwar@gmail.com> <179538281024.9825.4132712997497273037@linux.dev>
In-Reply-To: <179538281024.9825.4132712997497273037@linux.dev>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 25 Nov 2026 09:24:50 +0700
X-Gm-Features: Aa3M54rxCZafdUbvRb9-vw6Ll7Se68ZBnBVHsI0xIW9ramLI50wU4YKTZItQkks
Message-ID: <CAO26r3Tn95hm8SCEcP13wXE7p+iQpJ0O2n_tyhQvYUTkG813cA@mail.gmail.com>
Subject: Re: [RFC PATCH v7 3/4] rust: add minimal IIO subsystem abstractions
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Mark Brown <broonie@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Shuai Liu <847807867@qq.com>, 
	linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 04:26, Igor Korotin <igor.korotin@linux.dev> wrote:
>
> Clippy shows two issues in iio.rs:
>
> 1. Line 332 -- ..unsafe { zeroed() } in VTABLE. The SAFETY reasoning is
>    already written above the const, but clippy's undocumented_unsafe_blocks
>    wants its own comment immediately above that specific line.
>
> 2. Line 408 -- unsafe { (&*priv_ptr).channels() }, drop the &:
>    unsafe { (*priv_ptr).channels() }. needless_borrow, no semantic change.

Hi Igor,

Thanks for the review.

I plan to use `pin_init::zeroed()` instead, since `iio_info` implements
`Zeroable`. That removes the need for the unsafe block.
I also removed the explicit borrow, as you suggested.

Cheers,
Coirul

> Cheers
> Igor
