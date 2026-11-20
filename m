Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795210300;
	b=x15AKS8Vvk5HLXvi6D4vjrLdssgMAo0mwwO6wE43tzXgoaSphLfiKc8hgu+Q87n5MXtJ
	 51TrWa6MhN08LuOwckQ5U3tR8ChkzH8hbRYXvltCDbdAkLIR5RN6QkY+Utc1qaAiWzKgG
	 8lc+4kQtmAbLq0leB/urvhiCu5FyjxXAwHOBKCodeBcRRx9U2di2fMu76mhhZ1wfv9vAY
	 eVtZnmtdpTKn8qFg7wChAusXXf+Pi2gzbSojSXAhDlmS0s1zAJOeTbWJn/vzVYGMeukBI
	 KJpE6+46InRGUkERoDeQRfuI96Phe/KUW2de2EbEzaZiWGrmqWvrdsdNoHVPKl5b36Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
	b=1qiE0sxnTUenoMsS2rqk7hpDcSrn+armntMcb2zLT8JtAV/XwGYPqZfFx6R9KH2NASnk
	 vVhvEfM1O9F6nyXG13wmnoKrwYnLTIXB50SE0MJTk7u0KaE/lxVEXlAvDIwN2xLZ/hwec
	 0DfeUrEMOx23hJ745GmoI0gNrj+vJRDGMRzzIXOotR+A1bMbL02gj17rCfK+UNDUgD2Sw
	 TdfLjpx++x4XW76oNS5OqD/UAKeaycERQm7t1ijmxQQukuCfjmR31XZvJvfOBW0vhzMN/
	 givH6YTylcO9yAg46uYfDCej0J75sc6MQynpPMOWvnfkvboH+BusJJ63Mxy2Pf201Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owhm7wLl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5F5606A6BD
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 21:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF5F5606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owhm7wLl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adfb744fa6so1226491fa.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 13:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795210297; cv=none;
        d=google.com; s=arc-20260327;
        b=Qe7+lyWvOtkvJyOxTUPDhNRNH5yqBGYYw7yzCEj7hUzoR6IpKNDbAuevp80RyRvpbD
         FwrMAtfOGSC8t/PzCgR61x5Y4uUQIJi8gukTWvoKtKbApaE30hkey2psjdaiayJTqmpt
         BbahBkqi5ubhOIrXYTePneQ1wv6Q/AHlMzGlJ3Jn6VqKR2CKozkAEjtw2YjI3/y5VhDw
         0efcK0QHYOLWecjc8zReiezzIuSRNirxNxDTigb3VvUHb6RFelnHdZCcYpJbzNMH9eTu
         y63MexFJG0tGYQt8e+Ki/X3IVYrbIW8SNFMLftB9t9B3u302fAbYHN6hJulXDtVzHk7S
         TYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
        fh=8MJfr0wA+uZsryNHn2ehWATGP24REaob/4yIme2Ef1g=;
        b=m1lE1Ctg84zZV4hi3j2BRU5nuvvAgLC1M88BEvTWq/qfMOd6RssRNNUTHkmkl9ofNg
         VwW7L98f9n2M8CGT0h48OXfl1NOjSb1qopUBQuXZMbREvPFIp9T7aLkIN4ugH4Cq/lC/
         rKwYgf/QnStU8tr0xTW6QMhkppOoDriZRMEQqdX5rUG/kg2AZ9CEG7rQXnKD/DK9gn+n
         FzqCvayo5I4mijaN5OUxEDpNY5fJUsgcfBVeZrxbY45nvsQD0l2l5PE8o7DQRFs2a4pg
         OhRQWHSrdS34tYByq5pm1Fkx3QEdhqtlJ7TRyzg/fIjS8KYsy+MKv5BbvgO2uIE8akEj
         dVVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210297; x=1795815097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
        b=owhm7wLllg3l9s3Ng9CV1HrjwLj04k4mew4+Il/Z8w5k0GXizWUecYujWL4XpHDtMa
         eS9MRCtEBZwwC8OdUWFwKPDTIlDgdFLHLZUfue/yq/USkW8/TiW1ko9/CoxPtSxP1A9D
         D8MSFcWmlq6iHfxe/N4v0YRGxj23N85NQtLSVROCDnIzR4Uv318mpVWcVMo7jrrlABYt
         YjadBn6OUuNuIFRnWiaLZ5X/eKMo7W3sxO+bCCWoKuFkljemHmv/yxy6hv/IR4N1kz5O
         L3UPxcjApzNrfzj6wR8qTA9djgxz/M4AodemmINAcWB3TwhsliP53LE71qSquskMkxGi
         21ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210297; x=1795815097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
        b=i9SKxxX7H4j7zvnrAbpsxuXLSvhcwT/g1AS0TDYH91T3HLwdVeFpWMLAWKgKs7VQmX
         BozS0gqctc89w6/OsOVj7oJ2Qq38jC3J4M3nvsQrekonNcz/MBqerW6FXg2xSFRWhNuM
         osk/kRJgtgHBjZ0TZo0AvB98JDk1FpFCouBp4pnGw4CK/CKgb+EyC5HEOT/qub0EuqK4
         iwY5uuTr7784zMBeXJUgo1ibLx7ijkFGKOWacTs4n5l0Xozfh00zhHO8xOurtXYrjNGZ
         dB9xMAW3qosoRlD59+axbjy58N4ZW+EHCvFk/grT/oEtvW2rjJo7va7VQjnhQLkvs09z
         LClw==
X-Forwarded-Encrypted: i=1; AL+hErGr2Nn1DG9yxnHWxbtvJ1fhbiUFjdYyJCUJpCNFWQ5XPIq57ZIBrlPjy4246uXFV7jBTssKDozy1QC/qdzGlg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/EMkYsqGDyVO/2dgsRa05Tmp1g9aPumiynpbrG09+Qowrd3td0
	usQWo0KBerEWMD35H1sxn1b0/L78+a3HBwR1Bpd2+DcdlyoPKPGQgJQ/qB/v2PgiXQT9RZjX39W
	o7ahDGaQkVqxqrWTrlh0FA5AR+VlNNXs=
X-Gm-Gg: AZFdTZfhTyhCdobNTpPvmSgE2MdiYEd5iMOSGjHaJBye4UAKLqqvB7uuED1lg4ih6tg
	goDNDTvtYgOjn5DFV3S7nU/P+cDQCYDuE8J4UlATNEE4JbvAZZkxpy2YNNT4I4YIW9ymYuhzuLI
	9LDBXf48aLCRT7RVwitXKtFOunu6UpjYzD+Xnty14GVeyHSsUyqFuPTFiMrOiLDNVNsfM6Poe6x
	WjO2feEs40+wHV8jbngjMyz95oOI48LgAMui2hVPvbhI+bQltu6D4yWuTvD5lKIKsC/YYThiKgq
	I0o9krgsug3ou9Sb7OCMCzaXLcCOY1lNehKfLJnZwT4HfS/WNzSh+p+p8MGf7p+gFU9v6WKC+8+
	tvgGtUhiWb5iUnAFugHIhRi1dZqDl71gHvP4f7qJ5/bWIb54ceqdWwn4OXRpXHViFp2/UAU3Oah
	UCrMcW4sc/yJTA41zcM3LNFzTcH3vwIIoTUnyuOiR7tmnrhQ1GqJfaFlGkkUq2TKT3bPqLp08RO
	81XxKKi7lRCca7MhqycL2uXA5inKkc89IwtjE87Zn9breSQAdL+avvgnuv0LdgCGPDPOSxf
X-Received: by 2002:a05:6512:1320:b0:5bf:cf6d:ef1 with SMTP id
 2adb3069b0e04-5c1bc5767fdmr1687437e87.0.1795210296624; Fri, 20 Nov 2026
 13:31:36 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <1a1cb87df11.2c57f9fa237371.844135553238709982@collabora.com> <179519331840.3795820.8047048832159165355.b4-reply@b4>
In-Reply-To: <179519331840.3795820.8047048832159165355.b4-reply@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 22:31:25 +0100
X-Gm-Features: Aa3M54o4i_zALBjbkgtOxZes0dCWZ4jiHPCTwn8GOTMZ7mrp5N06gIycRXOv0PA
Message-ID: <CANiq72nOKrAtct_eb7tjc9JFFpOQrN0=5bOyOZo1p4C+4U5bsw@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Clk improvements
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, linux-pm <linux-pm@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-pwm <linux-pwm@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Maurice Hieronymus <mhi@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 5:49=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> I was wondering how the rust folks expect these changes to be handled sin=
ce they
> touch the rust/ dir. Should the clock changes go through the clock tree o=
r the
> rust one ? it is fine with me either way.

The clock tree would be ideal, i.e. a lot of subfolders of `rust/`
belong to different subsystems (the file is already under "COMMON CLK
FRAMEWORK" in `MAINTAINERS`). The "treewide" Rust tree can act as a
fallback tree for files tracked elsewhere if needed, but it is meant
to be exceptional.

(The files will be able to move to e.g. `drivers/clk/` eventually,
when we lift the limitations of the build system regarding that.)

I hope that clarifies!

Cheers,
Miguel
