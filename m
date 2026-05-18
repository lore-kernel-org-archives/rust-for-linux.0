Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB6C477983
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 17:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779126222; cv=pass; b=INmB6PlrAupHw2sDozqTqh+l4YW7qLx+zyBacm8nYIiruxrYtC1UztGqOiiJHZCavqhTgFYkiqPPLIgAvW/Fi349ZtWfcJuqKvsrquISPOXRPLCp3fyYOBt40a9SeawPLHTpxuYi3pl6519fzaUg58e6/EQwD45ZHAQp89lWUQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779126222; c=relaxed/simple;
	bh=wPDcDHDQj8pmP+qzkh1hEraUCuRV024udnyWVSiSX/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enRfgqE3SvPrGmflGdcJSxWe3TbIkjhmlBYQhHi+2qro4SdIkvsD43/HqNRI15Xzej/E9SfXyKdXCONuQ8b/6iIPS79TRa/zrb/I0Pbqoag6XYlJlU7LUDuCjqEvV80wHN1O9iuymsuO97AVvXV5GeF/sOq2mdrRtciibcj7HEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4twG6tr; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4twG6tr"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f114d129c0so115124eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 10:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779126220; cv=none;
        d=google.com; s=arc-20240605;
        b=J2cDDeApwDTWnmVyOf2oQBfaus+CZDwbuhzZp9Fe6Qpd5trdthIdg22ToDyTGZL00c
         hiQsOEM90CQ6xV/Us4Us1hPBfmjr2NUNqftBbHlqme7uIZDXGcI2UzCwm+X7Fe95qmqx
         q02yIJ4EbS4MvHYRGcQlBuy/PY4PUTEQS1MjdQNk9LaI1kZoNbyzv+EBc6MTVIYaWerM
         omc9wZPveCaEhgFxkSZrEXHGoJDPCKGtzpcJ5GKd+6xO7nmsWlxIujzjJrUP7HV6cWGD
         LyZEA+28C9EEJEx7X9T95FhnQMERZAKl4p2S9HNIAJRsiINDvnCeGszNvoZidQ8FPg7i
         4F+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tdcKso0/BujWCa+dO/P9U397LpVQKNh1JdKWMY0FaqI=;
        fh=4GYBbbfPYayO/d0cw44EntTUAJ/22VCCMlVFednBQrA=;
        b=OU1XH8mvoel2Ouws32DTegsTdMUQp7b5PbgjeDms6iBXdhUEiMfrEn4hSJ+gXZrfkh
         RlK+5B6KtxIejGacb3N3UXsrULLoVMfNo9x+wlv7SX3o5oxAbFMZgMqx4Bc46ElN4FU/
         InJZ1BtbJ8z1KZCrQjnMcH8gO5+4FpGv6j400fd/iMhWAteINthJbBPXWaMQ0J1wtifU
         w3zHjs+k+dcpUaaUSkN4AXmmiSEN8JLKIzzqbzBqIrMLJtPtkF8Q3fDY729L62BFc/iD
         UM0fMEegJQNxJsENCIViOi3o8OzfDKydgmrYnnj6T7hZK4hyDroy2yMjtqJFxjcZRyNs
         kHtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779126220; x=1779731020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdcKso0/BujWCa+dO/P9U397LpVQKNh1JdKWMY0FaqI=;
        b=U4twG6trErnSt0uRI/4A+YfOF8IzLszpuyLZ6vRDGYaXF+TsdOoY82hmvIzubxp3pu
         tgIPDdXLhELjz1rSHSO2i8akmPVU/BYdl2uMZP31HcyiJbQ2qq4uDKDyDB8MFaz06NOZ
         NecYC9K1vJdWvtoVeGjjfDY4RkDtNRyUlLldtXXKJSBDOSGAxniIXD8d4ueq3Jr6MNAC
         eIKgp1eGL+0/wnAqRQLtjvp2LFYY5U+syJxAjn97IBlL8wMALiNUy55yGLvjkJypqo+O
         MJuZjvJ7bw4BqlEURnpNY1ITq2R19s3ldLM0RXWiKlpOrMBKWU/EZf69nfQH05Yjbbqh
         lDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779126220; x=1779731020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdcKso0/BujWCa+dO/P9U397LpVQKNh1JdKWMY0FaqI=;
        b=QeL4m85gm0OiPGWp9YfQzYPip6u2cjM/5KklSp81nUZ2qkC4nsJCCVzTsh0JUqxS3+
         a88Ms6YV2Wjkjz9gWeXEaxPktmYreHhe3uOb8jnoY0xL8TQwcfiuS0pE/3xf663HLpqO
         NMfrAZUEO2f7WlqklITsjkB0D0rb2b5/t4kPXi+VbFoR5FnStPKcLpMpuggpaZ3NHyHh
         FmGNHL2CRLQguUZqsi7lnMeTrBiCRyTNysjSaj5GocoD7QTqKC57v0yyjP0tftw5yZ9Q
         +ezvHeO/Dkb9qHmpIvyCuo3QhqtWre+nIPeLDlKt7oU7ZKVTbLjpZy92ajotzdopr10N
         7dOw==
X-Forwarded-Encrypted: i=1; AFNElJ986do6QpsSPc1WcA2jnJlTLXPeLYmpBEHn5hXrQimpeo24+V4lt7hhwqk2RPkqHFTbYWLgDDOCwEl0J4mb3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMMkfc+Ze+7QzVZJMZYWMfuHyHTtXR37Gg/tC3FeidMeTAk67
	q9lwN0rloCjIy5ZMwViysuHmAiYxCX1LrEQhKrsr9cqTRNjL32M/Qzy24mZM8IC904+KJbX2O2V
	za0OyfF/HvJmPgkUlQv5jlyKS+xFiIec=
X-Gm-Gg: Acq92OHVPP7hxzjSJ3DrTn5UtH50FDJ7YqcKiIaJetzaeS3a3wR6NpzusG4QduD+WQH
	V3KXH35diZ0KtsQdUftM4fzuumd2G0lVaprF/5DqYq6qmiC5vx/xN0SGwJI721m42SBVUfSlBRI
	XYfne+o13QHoZ8m7e5UY0hnO8rpcrXKFJUeGGpOaIZURkUyECRHt+Ohs4/Uq8kwtAgCNW6mfrcy
	oYhNxUyOAkALskNtUEIjTQOMSh/HM0rM0pKh7CAh7+7WhnU/0jHUsRTtw5ArZxmc8NU1xvT5S3t
	LRtuRatev0PaFZnMKE1TfBmWRh8RaDLOo4A3vtfX7DmwzqWR1PX7eNy6RpLJFflBg0hrOHAOKHn
	Sy8lzXal5iOYr6cnjnRqRlS+HBmRRZ21ftg==
X-Received: by 2002:a05:7300:dc14:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-30397b88952mr3173578eec.0.1779126220480; Mon, 18 May 2026
 10:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-params-pr-once-v1-1-3a8c64704cc4@kernel.org>
In-Reply-To: <20260427-params-pr-once-v1-1-3a8c64704cc4@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 May 2026 19:43:28 +0200
X-Gm-Features: AVHnY4IvdZI3MjjwxNDAYmlgRoQbD_087MrwcFjSD37edYlRRX6tgZZOZcjVPUs
Message-ID: <CANiq72kgM+ugZsRda=xfd=So1UteKVh=tSBxZAq5ETwk2zUOwA@mail.gmail.com>
Subject: Re: [PATCH] rust: module_param: use `pr_warn_once!` for null pointer warning
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 10:13=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Replace `pr_warn!` and the accompanying TODO with `pr_warn_once!`, now th=
at
> the macro is available.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

This seems to be:

  https://lore.kernel.org/rust-for-linux/20260226120848.82891-3-adarshdas95=
0@gmail.com/

Another one was also sent a few moments ago:

  https://lore.kernel.org/rust-for-linux/20260518134107.4114-1-cppcoffee@gm=
ail.com/

Is modules going to pick the original one? Otherwise, I am happy to do so.

I guess we can assume the reviews here to apply there.

Thanks!

Cheers,
Miguel
