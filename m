Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46EF25B09E
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018101; cv=pass; b=c5XN0wlz88xpTTWOakxwtmqh/eHrlx/SvL0yVyRUJLEKQq5/X4RSlmZYxHwNpqb7E7RPT27bTTdSnNW4ubRezoPgrcLayAJU7zs9DaLz1zaipmMOm7p/3hfa0T3Lb6e5J1Q6HtddP48mqzWC/Dy/z1BobqSrLMr0X6jZkWDIN+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018101; c=relaxed/simple;
	bh=mfT65NBSSPQfJvIyS8K+fknKp7dmJ4sKvXuvehWc8eM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GVJaSNCVb22+vU30IxUgWYo75pF17xkK7hGW9YQizzx6//o+oTdmRT3UclV10Z4eEaVM4dpeV0gq5EmgwDefCSkA+fuaw6t+3nxBZqyuOZFBITNxlPkbuLVGqg0p3v81D+YSQc6hvcBl2Wt9c+rs6gIERhvanZ1FEzAIYahPRjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnWevrip; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnWevrip"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d03fcd26a6so2767905ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Aug 2026 05:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786018100; cv=none;
        d=google.com; s=arc-20260327;
        b=ZIDBG43nIu6I/vAVeeH+xWlzOQ8IlAnPRz9qIHm4FY87emkupktdcbcgYpyEDR4ffw
         okQkLu6nu6woMcJDWF2lTWBQPn9A2uL1rnKtr0EYstXcNzPpVqZ+M7zanQf+GviZkbfv
         Or1OpsmC6imNUFGYhcVVVJFgsKEc1Z71ktuvK9S6BG51u22yAUK+xjPtNe9eGQbK5crH
         mF660KuBu0izTlGK+ccDpSRH29vS9Qdu9a78Lr8PQn0bVuv2lY/w6VtzdBiO6f8UQO2+
         AWyaDh+kMHZR6/L3qV/5BdPYGgS+gPurMbvP1XtmSf5yirpo11umGXG7QrrN3L5TVVbw
         6JCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mfT65NBSSPQfJvIyS8K+fknKp7dmJ4sKvXuvehWc8eM=;
        fh=U5pql8Lbu7uZMATtKHP1QcWZCbl7iYWcv+sTyhl5z4s=;
        b=m8Xt86NL/WkI9j/YLQTc42Uract/6KYwC94K7cHrH5BKuEerox5xXZlF5erntGMrrM
         HlUCaK8Ywtvc+Tk0AtZfQSZmdtKz89YddmRzu3gwPtO0t9fGNLOIqZkBnj+mMLoZBCcp
         ViU9am4xBvXbeTa1/9hYRZP+PDu/XxBRtjvemt3GQrPb25ndVAjYKeNHynmc4TATOYU9
         65CQfu99FX1+xQH678FX7nc8PUMmjDB86tmnZG90lQWX5kwGyo5PyT3a8kezvsU7u8sV
         nRViXPCgwgA7L+EK+ywckBQektIdZCggA5DPStWIB0MRlKYqkd1vpmAAdXiw/vV/yUT4
         NRIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786018100; x=1786622900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfT65NBSSPQfJvIyS8K+fknKp7dmJ4sKvXuvehWc8eM=;
        b=qnWevripUomW6iqrBcgRQrFWmYJCjlIHwEeYHR306eWTM6V5JaquXZnEtCdrq6mEWs
         oDE/1ymqH6GdFsSsa3B3GJymUTJRQ6A1slbEj9YV5bCYf05kAM1G0JKSCsoFk3HMmO4/
         8YpNF2j9nvyvNBGdfUN5zcZ0XSIUcjk8ubdZ7DhpPRQJwf2cf1eS5K8yZ+tZGzJpTpWd
         45Xk5zVL+blm2pD4g+UJe0BzTisZwCaMFOwCndGJ4K1KWzZmrVp2xIqPHnRZmGmSwTcN
         BwtJxqIQFjICYF5s+EVhhBQLVJrVMhn831VwEmlQRYy1HvuHYRx358eXuVD0ocP3XNYg
         Yd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018100; x=1786622900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfT65NBSSPQfJvIyS8K+fknKp7dmJ4sKvXuvehWc8eM=;
        b=hfz0DiFXte/7uChkpohMOAY6zlv2Hx3h4vvmyIoCIuDVd/6UlATuc1qelxcjz/iH5M
         ssSQhjvG9pMHSvqIuUAekXaJzJv1A/YGH4dtuAHj+YrJBE8XwDBcyOhRPATOc0gllP39
         vOPkjTieOIhy+5PtT5CmJL1iq+6Bz3zxUkhh5Y6V690YkZdT/6ZUNKf7Van4LIdT2wi6
         7dqt1RSoFE/cFQBjf7Az/4yQDHRxfinpmhL7UzlZLme+hkC+worMsCstHdTTc0VGf/ks
         CXkceZXSxfnSWcuih4Xgqj43NYmCH5jLpK0jdWRWwQmfcdjwhpfrgeMLoVwQROLr6kSH
         24wA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0OGxY6ZdhHXTviiYt7vZcVlH9B2YV0+8SKKFwsQEHUuY+MUlTLO/Yk/NoihmkYTMTv9YdnnBZWG73jD4AaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJsdoAcV/z86QWxzlEdkifcy/wT2e6wlGLyFKW4WrwP6pz/uWT
	qpoArlMqsgHlXIsZKGxstJZboUf0lfyNU6HfgjCTzWQOhSljYcU1HTR4lTZpHdKdks+4KdWvnpD
	QEjy/B4pxjDWbwho6FcG1AuIYnB3jXS8=
X-Gm-Gg: AR+sD13MdaoM+0a+imk1CmQSkQsDUwIs4S/tL/OUKusLU5y0++kW6KRnEO43qi+4Ky9
	ng35feagLjr9uCic8y/1Muf77Nnl6Cs8HvEiUpVwf2YMQARCfZESe9XdE2qy6aSkfH4lOpZWZ0Q
	8+6obqsJIr1GYSHRDKvZ8ZMr4YJZiykfqAhmS8Qgxjp3wNZK/Y1plGVgz33PSGKThWf6faQFlrc
	+k05cppgM0x02jlWNF875bW4UPmIMVa+eonfI9CT2l/TVGn34maLqganq48LDXqVTB1S3n6UNr1
	k0GCtLRKJqlrnjdXSDcTU5t6XSOnThKMeNJcrqconnVvK+p5qTtahlT7Tj6qBCJRONuyWRq7CaH
	4ahA/OmaPPN+tOSjR8Whr4ppzolI6AO3FLrml2xGs/TAueOAPfzvhF1Ddu56e
X-Received: by 2002:a17:903:ac4:b0:2cf:7dfa:7f56 with SMTP id
 d9443c01a7336-2d0ca95fa2fmr116010195ad.2.1786018100132; Thu, 06 Aug 2026
 05:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-module-optional-trailing-comma-v1-1-d04811335e59@gmail.com>
 <DKHUA0DRQXYP.1WH8F0FP7N39L@garyguo.net>
In-Reply-To: <DKHUA0DRQXYP.1WH8F0FP7N39L@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Aug 2026 14:08:07 +0200
X-Gm-Features: AUfX_myd1MOtjQgfdbpPuaQwusBgM57O9hU_bVw4mzV-Q0VFOM_ZQ2Q-c2yWXL8
Message-ID: <CANiq72kXkY_CtxxedtpV1DykxGZ-SDwAYzAo6d_iDaVs7DthtA@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: Allow omitting trailing commas in module!
To: Gary Guo <gary@garyguo.net>
Cc: Ethan Plant <plant.ethan@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 1:54=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Hmm, I am not sure if we really want this.
>
> `module!` invocation usually spans multiple lines so the formatting rules=
 would
> always prefer adding trailing comma for this case.
>
> Allowing omitting sounds like encouraging bad practice.

Yeah, it also means inconsistency can be introduced for little gain.

Cheers,
Miguel
