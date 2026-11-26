Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795724272;
	b=rfeX3x15Pv+kvXkZ0gUvUwc1xVdViUYk6Og31IwOr18X7S1gODnjdm4NWNkDVjxTLxkT
	 dsdiBkthDbs/WA2OU2n0Qok6FsmHF7c3ot61q+IU4JBWZkWROgQapxUW0pRk8oRMKOZgc
	 pVN+iQjpwxvBMSMOE1KgDygOUq+NqvJY0n1x6kqEPAskB39nW5S/TcAQce7xD1geJWLEQ
	 BmfLtdluolOMeACAuw6Rx8esQpB5+ftT/3Jd5MrQ19F0CPWNrVJ26k71RobDpcTBS4PR1
	 VgmVlh+1CbQcl/Ex6ploDaU6jUF77PBcyBvuP6eNDjZNGoedJTE478jsdneryYsykeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xm3q3UN6DnQimxetmg57VpsJBbjQoWCdFICvXmCUsG4=;
	b=ydzfGv6OPncK9cnueUr/v8us/hxcFeMiUODq33WT99tUL+M5IcLaKgcjssMnNpCCFwlG
	 SVRKaj7hUpsGwdJh6ehmlt3RctElbj1eToLo+paj5atg+Vl3IUs+wkx/EKRuD3wQ6DgRp
	 5fQ6n9lOqVdzKZ8Ap9dizxbQ80Bqlwr4/Nfi7sXgZ2GgiT/8UzmXsIH6MxEL7GzrMF0kz
	 cPccHM7TkRlaf5UjAY4AttTXYdIkjZYrN5pBG6vTfCz4JM4JIMsgIkqBGp5RCp0KHflit
	 v4yWi4uvDN6YhaBcAlBwSC2MHzTZe87nTl23khJ8BvRWJ3fiP0ipwKmi/emo1aoNYMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ct0LcuIz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AA8606A31C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 20:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91AA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ct0LcuIz
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so595934e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 12:17:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795724271; cv=none;
        d=google.com; s=arc-20260327;
        b=MdPgXDXeROD+oC4Huy1MfPmvZKPJ+SiTbGKUY69Sh4dcg/PBO1pxPylT7LA3r9z0eo
         PCoRuMnVuBjBZbcV65h1rnrq1VFImtxLq7ac4pX2AOl42Odi4Z4CGjd+7p941nrn2C6w
         xj1HlKL6TBLAv3zMHCos11ojaVY67o8AK7K+wXSxUXqBlWmHq0iO6RFTS25/ayqusrA0
         dZKAJtmdGWc21St4Bs+TNbC2N9u7XUQ1ap091eCfqv2RftdjoJjEl6Th0vwzRaOsc4nX
         B1TWSB2EsXD/iaQLDE3JK6Q7tnPHymCuAvEY+KPsalwSUUJJweS3WKZA6+EIsVARZl21
         Z9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xm3q3UN6DnQimxetmg57VpsJBbjQoWCdFICvXmCUsG4=;
        fh=vIBevrRSHD1pltHrjs/8Z0tI8bfjtqdbNSD0pqZxaEI=;
        b=sZnhxvHIReKBU5+YT2lOYR8O96uRwGoNWmdAiRSMKnG0gxWDNm9o4a/I5zONBRsvge
         pBpZ6jO/xawSDtbjqtDT1BQ7gJhgS32wWAayfP1hAv9ezqXYqnRSa1LycedECQ31kAp/
         cUsYkCAnpd9jz7glkZEzDOdYUTbCaEl2HMRW1ndb1hXcvGDmKUSzADcXXqy/Oin/24X0
         4Ln6iUqcJkOPZ+D/TjZLYOMuoQtNeHvR6TPwxQhRZpfX9uJSSkBLdszftARCEbn4HbXP
         4lZVHX+S45cNHajCSOkDWTEfCxinvLgwjlR9gPdDv4iEgFC6mSww0fhggEvr981edDeC
         4Mzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795724271; x=1796329071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xm3q3UN6DnQimxetmg57VpsJBbjQoWCdFICvXmCUsG4=;
        b=Ct0LcuIzKRv0h45YFo/ToRcsQ8u3Yi1OpB6Be7V9neRnrkqExRqeGcMJe1j55xcWGx
         9ZBOPRGoLRO5pg9FZnGhuMj7nxoD9xidNgdEbnwIVRvWJNSipFqnZX8lqsWLjp8u0G1B
         x2UNqniHWTyv+/Dl4ilz9ufXmEYl2V9C60CAYPMwxWwe2tLOLgALRUQjr2KpDzNDUS/2
         DQa8sDDuwU1ZKzktctb+dOFk6uYPkPHiDqv3GHJ2tKuGDIgN+dadiI8OPvaATh4BWzVR
         kKgDw0/AArSROg8TtCCtiCW0LhbKkaMvvhSt8DPlMzzg5yV2/DFCGNVYUdH4bj5zQhRx
         nhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795724271; x=1796329071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xm3q3UN6DnQimxetmg57VpsJBbjQoWCdFICvXmCUsG4=;
        b=SscJNhhWSb3f8EaHecIjhZq3X2DZhYOQYVfTMaCkHhHNrMDd9uFGOssKEK/5xIMufJ
         JbLGA/ZT54PdfkiQscGipLjQtIZ7INfOhqDz60Iujd4nQ4Q7ipT3bluDKNbecDf8djkH
         QfgYDqmc1Ho+v4krBZ9HGGOThmhxcz+i1GMEA696xMHfei/cXncKZ3eKEfI/ZV3QHPgf
         4K321aJmbz4K5kLLZKmqoO6PVQvrW9IJucV4rWIhQsJ+QGwLW626UvcS3L2gy9lq8VSu
         jCtR7clTP1/Odcx6E6TY1uz/Xt1VjQEQX5N6OthvyRR+r7Dy/eAv2JzM51FfEKGxVV8L
         fu2Q==
X-Forwarded-Encrypted: i=1; AL+hErEB1ZY4u4/cZIXap4ucsKKA9ivy4pgxNPrFRe2UeaJltl5uZbI4mDUX+piviPApOA4rhrs4TthvCBdb34Fh4Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+oO7j5V1qpN66JThqtEc4iZyFDsAaH2MLmC6RL9Y5dfZfYk1D5
	c4RRGAUW4Q0TE9ttWri5HV9rvTOQX2kdSITAET8f8docXzb+jl4ZHhoZIfPXqrfinlYs5Bl8gGg
	wY6LQpnr5BfbR6SPQOKLyGYLPAg79h6lWjw==
X-Gm-Gg: AZFdTZeL5dhQnTabUk4AjAygK4iD/atYE/2WyVC/FghzeveEwOBoglOUvmnanrfDpNv
	0gdz/ccozLsbxf25xFXhCj6GPg+ikzBhrWxbh/9PlgQ6o8ZpFaw/+bITs0Edr5I1TWkMHcSXjfX
	MHA5lgMXGzsZV0Id7npXD3dFVcH3nBb+Y79atCC+x3Zo6w23BbMKxLEwcxvPsb6soMFNVAbQvRx
	4CyYiVN9YobmcU4DasWhCA2QbON1HHt7B5cUdjE51vxFTYqX+Ud3nGmONzMdfLFbjkCaxw8K2VI
	85G+Vs7MhYfmnRfbEzr+AZn3RIz7LW4X8uPSN672eI4yiVI8FCzpV6sL8r3gM+DKwLBY7ympBHG
	lnl6bYfGApiU3DcUeQDRyMWwxntriz8Rl5+prlS+nGDJvD0MyAEn9eW7TVqjnCcQ8TL2AV0xJlF
	ShwuMduY+niUKxNGN51NIxhFd8G/5VxBKvYuLXyqbLdLtjoeqoGHbzDg+HsvAO/VOaQL7pg75Mi
	yu/lrhJt0tdWnPMEE+SnhdcrY+0PHGcO6VgJNRZRPTuqpbQ5CNGhEskCfYZy3AwrP8+wZLYmg==
X-Received: by 2002:a05:6512:2514:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c1bc57989bmr8249858e87.0.1795724270636; Thu, 26 Nov 2026
 12:17:50 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126131456.87524-1-ojeda@kernel.org> <DN588MZEFFDT.2Y4U95SAKPKUK@garyguo.net>
In-Reply-To: <DN588MZEFFDT.2Y4U95SAKPKUK@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Nov 2026 21:17:39 +0100
X-Gm-Features: Aa3M54oswV5lnJaWrl_I7DzaKOuGF1A-he8iYhsPwLjSRd427UdhzZBlOUROIaE
Message-ID: <CANiq72ngsLjcJQK-Tyew1JVW3rh+A9=eUFR5h8c4Sji-FbAN8g@mail.gmail.com>
Subject: Re: [PATCH] rust: init: clean Rust 1.102.0's `clippy::large_unopt_stack_frames`
 lint
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 3:54=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Given this is called "small", would it make more sense to just change the=
 size
> to, say, 128 and keep the stack init?

Sounds good to me as well. I can send a v2.

> Actually, I wonder if we should do:

Hmm... but then there is no fallibility for the example, no?

Cheers,
Miguel
