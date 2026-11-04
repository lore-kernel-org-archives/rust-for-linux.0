Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753874;
	b=b9LUzGiooqar+plk1iJli3Q+6mVI0fe1itHYwDw/c/Xy0zP4oqVRNgKGqSHUp55LQs1S
	 UMPQfoJGyqAQjcUu57nFZobbHEVqOTKRmi9k9fmNniPkxIatuccZCpg69DhR+F5tUdDza
	 S1GF9aSRKmUgoKY3pZ6idSDDdgY91RHmFgzfI/VSN+Pj4QBNyRY7mSFtK7WCdtgpvpYwM
	 tT43Dbz5kG0HOWkoOLCItIjIJJiPvCXSZEJyIjMR1ktuyqTVtBfA260/+a8V0e+G9qxnf
	 9BIMHWORJ6qDdXtVnC6vejH0KZtSgMaltphy+RCXa5IsnfM/ffgthJUfvQny1vuGWig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Sk8Hr0fhc3C8eQFrISEupQ4YS+zYJDt+3X6d4EBkWvk=;
	b=Lh5/NHrjZQDJjAmfbyp+/dMs6CjQ+XVFqW+BNn/RfXQ9gPRvkLh4elPUQ2xLQJghQW85
	 MqZxBxtGX7r0YiHKuTG89oEGyGSy1GGZ94cpJqC6v72pe2vmBgGcJymKoUrYTwCrI+JND
	 f/FtLgXpyML6ILlKmhOoKVjDi6cGYJ1hf21ojq8zd1bOiBc6eSVH8cNz2Gkgo3FpawRgI
	 950xCdK0OB8ttSbw66QXewJmnJeEgDJlhswqvOfWtQ9XCF9a4iJMOEehIqRQ5hqeROAFz
	 S461KghLiI82ZAFIOOK4T025RBSAojVeIKqLoS0rqpZZYblTJDVOWL7etmV1k+TcEfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Cbod9g/Y";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95337606A326
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 00:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95337606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cbod9g/Y
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2af4c8d00so496435c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 16:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753873; x=1794358673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sk8Hr0fhc3C8eQFrISEupQ4YS+zYJDt+3X6d4EBkWvk=;
        b=Cbod9g/YU3+tOlTtTnbUSHpJBHl6gN8BoKQeRJP9pi5xeiIv1FPevko0jwJ+aGLuLy
         9+Vq0qwtYZhy1ZPpENlk06KJavb305By1d6MkDFwSS94Kb6MIUB0aPCZyna27CAn7nKa
         5qPYzapHjs6ljtS11Yg9JQyVgMkYRqEZjf5pCJfeYdjPZJHnqGxPSheIJ7o8Q6jKz4WX
         A1WQiE5SigEMfFCImoYerpJq3aJaLTVBDKu+btRbLQAt6+T7SXBCUpxxa13F/V3FNOgp
         CvccOATz2nUzmYNW+L7KhgaTkfkqgypeLVVw1GbDcJvVMaSGuL8YWhYn4Er/QeuFqmKG
         q7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753873; x=1794358673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sk8Hr0fhc3C8eQFrISEupQ4YS+zYJDt+3X6d4EBkWvk=;
        b=095KYnWWkI7q04/+jBXglizvYVpXMZhzNZvfYc49O2d+JbhXcpq6Wo3+hjKe0W2GhL
         RfrCxvos9TELQkLisp9cWXy5eRrpVzj4c6zVp+XYTJlAb4SFrDrAKY3ikfpuEVg9NnCy
         hPk+rZv+DC+CZIroYn6ontUTfX22pVI+DWPdW9yWkNx9xeDt6FhukJZ4fW30IoeoC81c
         YWye1C1nALrowBpy9zJDsaOM/zpqY+3hWbXEN7oNj/B393LCyrHx54WXnL7IBCNss52C
         6XBDMXUUJVFSH8LLMuYhd7tcDYrGg1HG8xsEA5Ehcyr9p/vH/0X5gt1lQpwy7FhSkCqp
         4ECg==
X-Forwarded-Encrypted: i=1; AKwUvByh9sbkt4c+rv/uZAPG5/xLWiI5noE7LSnlXx+h2pR+96o5K3ANpqg4u/fPZslcW/YgE40JYoV/5BWcRuuhAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jbSj0KzUx2CmIlE8yn89GAO0NXVeEqzmVUFsLpyW5VoLtbklM
	gN6a09K1O2XZYKwlk0M9ue3Vs94oZEw5ZSh7iLlOF8//ujLf48Bp4KeE
X-Gm-Gg: AYBFou2HZaWjghWgUvr+mg4+sppn7DnvfckLgovYdEERhYYSJUFsWkRXSxiZTXkQ/wc
	iRTk2yPs7DgTud0vSZFkKhXB12hECHAji/WFVUbhVqgSkmPz+H4mVVug3TuYtixL5AL3jABHUgW
	Uh4VYZYhIXeHszBwcrRd7RrHPVph44HJVYUA59tA0f6WRmZ1pPecML/yE1sOTPRYr2CubCyDhSp
	QyHp5uo6yloWfZe/sLExRw/iktMMJRnOUgOBFZNmFA0AhLU3b9FC5+zZ1UcE/Byn1KH3q22L/+d
	wP9AsbduKGiISWsDwEDrvA+S5/RfQYUDLMtfsakL5qlxgbgoLHGTr9aecFN3B3+pDfIMKZZqi5H
	xAW88f9gmayRP9NSvslLqou1LNqhiG8TwL72l/kRHA112oZoTE+4l0pjZbOJf5sXPap7+Nf7SgN
	jGsEsv6YQjLftOGeaU4JZpfG6D3E+uAaJNFvV6p/+cVhiHijUE3mIdBrrF97gIpAgaXkOegGZVq
	+ICl5ASYZCw3YMy3oyjOArmcL9A9woH9gnlAwjV8SbDC2MkyerXgagyBM9siCXrWk0DPEhUO6eI
	iXX920jRKP0KKuHTxTzp
X-Received: by 2002:a05:7022:1117:b0:195:49ee:94c7 with SMTP id a92af1059eb24-1ac5a0b579emr19552410c88.8.1793753872638;
        Tue, 03 Nov 2026 16:57:52 -0800 (PST)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2c2ddsm2546423c88.10.2026.11.03.16.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:57:52 -0800 (PST)
Date: Tue, 3 Nov 2026 19:57:42 -0500
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
Message-ID: <auqC9jOIQTyieQUJ@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
 <auXQaY25XfYzxEb1@debian>
 <20261102-throng-botanical-b244058ecc37@spud>
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
In-Reply-To: <20261102-throng-botanical-b244058ecc37@spud>

> I'd rather not really. I shouldn't be the maintainer for platforms I do
> not care about, but I will do it if you're unwilling to - in part
> because I expect that the volume for the platform will be pretty low.
> 
> Please read through Documentation/process/maintainer-soc.rst to see what
> the expectations for a platform maintainer are.
> 
> Cheers,
> Conor.

I'd like to take on BL808 platform maintenance. I'm new to the
maintainer workflow, so I may need some guidance initially, but I'd like
to give it a try.

I'll update on v2.

Best regards,
kwang.
