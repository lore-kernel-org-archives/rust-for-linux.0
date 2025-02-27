Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E7722759C
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 10:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740653496; cv=none; b=tMfyGFxHiE+vNBox2GLtcsDfkekmbifVOGVhDYP1mLEs3M3fe1oYDIpN/ZheO7j1QPQ1+2l7Z0k69OdcvWusud4BN5xQBsSXxsd3kaN2WKF1M98K0yas3B1Napo31qjns9LUK9a9D24jUiKkKDQGM3vruwfKlGiqLVFfvp8M3Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740653496; c=relaxed/simple;
	bh=gwzpWMlcaBsycOSM+YUnNeqP1En+P3xOlXYQj9751xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqFKwHPqcQ0tAxkQR+0F7/Hxiq3tgznY+52CLsb89kIxw2j9QHbuvXLvZZVfQdKHlDZ7p41X+zDHH2jsRoBF+WrlFKyFDLozktVXnibTFEL8wam2EXohIh/zUdSM1n7z8NYIayEcEQiw7VZYS+o1+ccaULFTB4Gl0fD0jjJs1Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8jG40Sv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8jG40Sv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-219f8263ae0so12597965ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 02:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740653493; x=1741258293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dT185d0FOI5HGH1Y9sKArCWlsv6m/rsOymauDbDjP3U=;
        b=f8jG40SvR+tTqZXivwmbTuzK+DO/r9wrYoWkQL0AzPtryDN3sWcpz33zUosOjidD67
         nte/jJbratepfGh1A2LxCsz4EhV4Pq8noQDtC7KpyXo7rm2ZSOGhPnfG656Iip1EHJDN
         72WUj0pfsPxnfhKd2+RBQIiWLwLN/HTNHhOHalbcBKWo+4Hnlo6TXUWUiwMjipTDehHJ
         88S4ZEBSdRxH3l/XrCsPYMhgROOn0DsvzGaPG2EkTGh5CGym7x3bFfHuNOjVwe4cl1AI
         KacuN3K4ye93kpT1c19KqpPHQl+szAyiWu7yBEiNqLajUMQBCyxmZIKGI8+wvtqNgkRl
         k0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740653493; x=1741258293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT185d0FOI5HGH1Y9sKArCWlsv6m/rsOymauDbDjP3U=;
        b=kAadlA0+RlM8jvHk1hKTYys50cyr/IzjpezV+cckHDDOjl/Nxfu52JdAffQ/E96Tc+
         sjAlbFkw9GWmeesFMQXp6WMDwc/CsYU9dOl6aSL5O+AxlQ2AhZKayg/rnq9kZ569lSu6
         Uf89S4ns2xpKzDU2eRnMWLhx76Bza1p4Ww8KmxQUqZhE8WeCT2VWFO85GvQOEU7Zc9/z
         7osIj1/dF8Zii/WRR0HdCXSIrvDKWUc/v3IrInODOriX2zjs9OvXsOfIHo7B0hY6MZRq
         FPv3oNvmjbNoKp6QPiioWzpgV5wYkb34BLkf3yHMlK0Rcqq3T98KpGJ0E6nAkpokTFIA
         Rsuw==
X-Forwarded-Encrypted: i=1; AJvYcCWQqK+Ez/497mxeCP1rqe16zOROX+jhIMysAKT658lcnlWzUA+WYXwoQB0AGDnP68jlwKvjVnXwcWxuwyt5Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLtqN/DAXmD//GATyWuIBOVpoqW2thD6A4po4hIio7JpXJWAk2
	mhty7ntOWtmHv28QZZdJRg5W6L3YT6MmPuVnxWKquWOz+olTxGUMNpDqfGj/QHY=
X-Gm-Gg: ASbGnct1vnwltqQhvw2HA9+Q5fb2HGwE25qPFr2UgWTg+8DD4gA1oJzN/Cr1TXsulRd
	NsFIGRlBsXIWBo1CrAAS/hurIl2hd6MiCOrLx+74R7Bmlo73iNPb2ONqCt+4pxfrxnSGKvK63uW
	gsOS4Q7sZRm5gGYuN9eYXDPmqTBKn2oe2nkyfGDqM/mk6JvivZtB9sKE0dZaESxnTCREztnMvRQ
	nWnx66mz0/PIUq/5rexhe5bg7/BwPndCwRCidgwdas5TaeTe4EvgiVsc5nYc7mrdesAhVBcGzwg
	HN0C+2lmrNy5wFJMe4Uz2Uy4BC4=
X-Google-Smtp-Source: AGHT+IG630+3TS5xhf+OKW8ljyiG5CNAh5ck7afIDwubQFhmQKZ+JGICRHGY8ej+2hddtp+GzFMYKQ==
X-Received: by 2002:a17:902:fc46:b0:223:3ef1:a30a with SMTP id d9443c01a7336-2233ef1a520mr66106575ad.45.1740653493594;
        Thu, 27 Feb 2025 02:51:33 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bf3sm11387155ad.110.2025.02.27.02.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 02:51:33 -0800 (PST)
Date: Thu, 27 Feb 2025 16:21:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: add bindings and API for bitmap.h and bitops.h.
Message-ID: <20250227105130.wkklh2wpybz3kggl@vireshk-i7>
References: <20250227101720.1811578-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227101720.1811578-1-bqe@google.com>

On 27-02-25, 10:08, Burak Emir wrote:
> Question for Yury: What would you like us to do for the MAINTAINERS
> file? For now I just added the new files as F: entries.

> diff --git a/MAINTAINERS b/MAINTAINERS
>  BITMAP API [RUST]

I would suggest adding this too.

+  M:	Burak Emir <bqe@google.com> (bitmap)

>  M:	Viresh Kumar <viresh.kumar@linaro.org> (cpumask)
>  R:	Yury Norov <yury.norov@gmail.com>
>  S:	Maintained
>  F:	rust/kernel/cpumask.rs
> +F:	rust/kernel/bitmap.rs

-- 
viresh
