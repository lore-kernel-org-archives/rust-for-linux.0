Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755131;
	b=chCMXipRkAqm9ZGIVGL+4ReOQXtDtuNMHBmPPTlpVccMWiDZo8VtbEWKWE9ldygvuUoa
	 kY8jNy5qy0bAxpiBxkqcymuSzCECAkrbTqPpy168uyh5tvh/41cABVZoAGhhhDs1EGGSo
	 lpDaL4Bxec8gFknZ+2Iffd7CYFlkQaJK3enOGZYJ2YQrwbM8+dM0sTXhCvxLlg9a+6VW8
	 ejRPe99a1G0FQLcAurmCMfCVZuHNLdqXGQcahAWecD1kpUzeVuhaJlhGOyjs8J1tlynHT
	 ZVgk8MPOIJJoMRjEtFDIzeCr6UvwZ1CC8/FulFAynXrr3Pn3QQyfqKCmnTWq4bqstsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Tofk4DAa89+ADIAKHIR2Vai/+L2kQBAdRyCdNLpk7aw=;
	b=HYJKu5PHQ/I76RklsyYnBJA5YAutFVQNm6ftLwG+Pj0jo3VJ3TSrdiNNhNvVBAoUdUjl
	 IVgFqDFMTDT7Jg+pxvBGAf3HS6uXsPqOuQdZTmWhhhtVthi0I4y+CEvr/FuONN0/SVvtI
	 Df4+e+SyJZJKbifsPEDKxuHusGFD1h5m1oFlc7mcdRpLY63Z2uCb//vuZ7zP9mEdR7FAj
	 TEE9GiYK+utnP/DGMY5fmKWAIu/kk08rVxEowa7YgmaJj0lVicE7ICSMReu3zqx5nZDxQ
	 vZgmizE2s54k5/VAbPWRsf/p48+VNIhfw+VoeugnOitYfJYXAAnpONItqBxcZF1Ym5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i3jOzUb8;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDEB606A31B
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 01:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEDEB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i3jOzUb8
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea7f9c11e6so28595ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 17:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793755130; x=1794359930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tofk4DAa89+ADIAKHIR2Vai/+L2kQBAdRyCdNLpk7aw=;
        b=i3jOzUb8ds4zFfDftO7lYb+6CfK6KPgDxXwk6C0I//DyWLHtEGU+9uze/n9FRRuoCa
         83KfNuIU3ifdtd33KmgRN+j0U2eeGobnP5+3bVMIu83OAvrH1gOnUJz2nt24+6XkIfAe
         dxYCxXrXI1nZFt8uvo1FEQEiZZ/LfbFOaJG4quxKoQbKp+F2u9Hsk2DdZ81hOh8He+VO
         Iv+Ts1EL7D10ncd/x3DX2B1Um94xsmsYRpAQS4XPzwH5efqXwmLlejq7fMKHKCVwGsXg
         MnLa+C5cUGvyBGXOmcn8XNlj3u1BZVVAzPYWslzXUQWKrtwkqUKikPGkvP4RgGCf23E/
         Ovbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755130; x=1794359930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tofk4DAa89+ADIAKHIR2Vai/+L2kQBAdRyCdNLpk7aw=;
        b=tuyQddUFvHbyjfBNm2FQzKMsqZS/hsHhUdZEUVYQpem1cWi/TP0UiLbKi4iry2c91D
         zARPa19iDHbqvZDU26ifq53hPmc6nUyR1kj6PW3C6d/QFUXv6x4HDZXP8ClvvDfJrFD1
         9bKxkVsh331psRsoo24ypx6xPXy2pNpTo/TuFp8tMl6rTHNzuk802kCq6/MqO0RQdnk3
         z9wXiCZLRRfcHli6t02s7zeg/lTNkGxnLstvyOYakrspsRj1Rh25s18xsKD9w/WqVOmb
         RK6F/VmvTe7W/GdgmsMnZVJAmk4Bhh0JkrfyHFibB2va2NiW242ZwDxp3dyPK/CrqLIs
         zIwA==
X-Forwarded-Encrypted: i=1; AKwUvBwxkNhBrnhnJ3TwW+RUYflIdOvLxSJFubGz+KJHOhCbz4Gou9dwDAIyDnaly3KB/W2Ee9OoOqa40pOsDpTO9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9hKG9kIQ13uWPmxjmUlpOEcX6jbgFsAEjPeaSXwm12Y7oQaxJr
	/Nctw4qcY+qATxXcAtdfmAT5i0Vveir5B+7zxGVzfanEFxw5Rmox6Wzon6cX+pk1j/tGaIBJc3P
	kyrmtBNju2I8=
X-Gm-Gg: AYBFou2i57if2K5BPkuW/7JF/hQz2ZThLop7z738diKey4/Sv9jivN6Fbz3XCbK6xj8
	HWMD77CAS01VdOcV5xW1XmTgQ7jknfXPX25DYlhaq3K2zABS6wlMQuQVa8fdnLPKxn2fByQHPZW
	RDQozQopehGzupwx5pP1t7SAog5nVhPuHshQghd2snzvTTY0ZwTMC4QPY8dqtUQtQXWdx7ZmMa7
	GeYRJJ4Q5qQuyBEjevt/8EvDlaP+sgQS8uKQXeT7rUzA79zgwv7iApotX/AULFuX9zz3WDmDxQs
	cZRlXRlZTn50xIFJq+3KF474aVkq3UaKFjd+V/fM2bnWoEFkh1nqDdQPwvYIblS7x50F78fSFua
	oI7tL7bLI6BcPblhe+ldQ3iyt9ZuxhKT1UrM5XTXqfE3se/AiIucmYo9PXfeAwMbkthvacgmTgU
	jeuSi9WQv/P0sP3YnFagQjxHUZEIeNQqSUsTguKahe9hJE6bWyO63r5z27KiWhcR9BITK/DHvrr
	E0d72V1m51iQrsPjpbZKixbjFutaB69W2Wfw9A3SmZY+n2LtBuc36SrCqzWS8Kemb8OvkKXh2mF
	avhYk+k8W9HtKYSK59xD4zzBszj7sBVAODQE9rChoX51djLtU81BZbdYFvFoXC3u1g3qjyXRvCE
	=
X-Received: by 2002:a17:903:3888:b0:2df:96ca:d7c7 with SMTP id d9443c01a7336-2ed07aee78fmr1533795ad.10.1793755129511;
        Tue, 03 Nov 2026 17:18:49 -0800 (PST)
Received: from google.com (210.109.125.34.bc.googleusercontent.com. [34.125.109.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm4468133a91.13.2026.11.03.17.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:18:48 -0800 (PST)
Date: Wed, 4 Nov 2026 01:18:43 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Giuliano Procida <gprocida@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>
Subject: Re: [PATCH v4 0/2] clean up EXPORT_SYMBOL_RUST_GPL
Message-ID: <20261104011843.GB1247794@google.com>
References: <CAGvU0Hm04LXTywU0eL6KN4=SoOAC+LU3BKqENnLR-WV-sHsuNA@mail.gmail.com>
 <20261103165833.418845-1-gprocida@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103165833.418845-1-gprocida@google.com>

Hi Giuliano,

On Tue, Nov 03, 2026 at 04:58:31PM +0000, Giuliano Procida wrote:
> Move EXPORT_SYMBOL_RUST_GPL definitions into linux/export.h and
> prevent the emission of bogus type information for Rust symbols.
> 
> Addressing review comments, the first commit now ensures the moves do
> not trigger warnings from scripts/misc-check about missing symbol
> exports by extending regexes to match EXPORT_SYMBOL_RUST_GPL as well.
> 
> Giuliano Procida (2):
>   rust: move EXPORT_SYMBOL_RUST_GPL to include/linux/export.h
>   rust: exports: emit ___EXPORT_SYMBOL without C declarations
> 
>  drivers/gpu/Makefile                      |  4 ++--
>  drivers/gpu/nova-core/nova_core_exports.c |  5 ++---
>  include/linux/export.h                    | 14 ++++++++++++++
>  rust/exports.c                            | 12 +-----------
>  scripts/misc-check                        |  4 ++--
>  5 files changed, 21 insertions(+), 18 deletions(-)

For the series:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

As a side note, starting a new thread for each version would make it
easier to navigate the patches in email clients and lore:
https://docs.kernel.org/process/submitting-patches.html#explicit-in-reply-to-headers

Sami
