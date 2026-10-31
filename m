Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793446019;
	b=J7cSDtcpYWBfD9VPzjLjqjHyCuca0ZH40oOlj9YWON7wgN+uLtK1BhdD4N/GomRLzOvL
	 vTrrMuFVUhN9h8jyoU4Llc81pkgGARTyOSoQF22LV7K4YM/VXRxVgeBgGETbEzSCjOxBP
	 XUlqAQ6NUguwUlv2c1IU8Jmzfq+LePKSrfPi8SVGSI+Q4YTjpHxO0B9o54DrKFoZ/TF+j
	 5TIQkHUegMlySWOGBpoEi9WrQailEBSUYgQcYM1pBlnzc1OqSy9smASOEXbCmYn6UrpSR
	 CUTpxp+hDmAekfdYNEWpdEJkPsAe5BF9O8cVzOWqRYMI/AXHIMg6FQ0OoWfwc5g9AzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793446019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eBAqeg3P7IjkzEoe4Ha0kzpqAxzRiyS3drMdSnkFfrg=;
	b=S3PTXJdR5JD2XeAZtweDm5dchuoTfza30y1lmq+/w+yXwrBpavCc5/cr3WiLiiTmH+mt
	 VhkPwJxLYj2qpWU0GiN5LSi5ZgZ8ASYSP8gqyLhk9NoacP1wahxf/NZb9dH3kEq8VhBkM
	 YulC914lcm0G4K/2eUZdvPHiNtMGkLdKG4USqDq0MJZ23pR2JQTND3hbH/gcxWOLIniGR
	 Dy6//eINyQKesKjDN/aQHjCLWrhtDmImNeN2tg6DL9oI1w9g1n0wXGmW/IVcLQ2ig2Fdb
	 2Al7NcqDLUtr8reUcNk2P+smBTOtNyHdJ4ytoqORwP4ltTlY5HoUkjj5KU780FG85wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOHFPiJv;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82485606A31C
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 11:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82485606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOHFPiJv
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso864590a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 04:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793446019; x=1794050819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eBAqeg3P7IjkzEoe4Ha0kzpqAxzRiyS3drMdSnkFfrg=;
        b=OOHFPiJvJJp+Y8vZjZ0nvwcq0VjDLqEY0recjcf2GspS9dMsfqZlPeR5uLbH1VAgb1
         ImUtA2/oSWkURP9z3Ve7mYKAlbqumGkxj/mVlnRC5F40hh32RIdYXwz2u1Jp13G2qiJa
         h3HAWvRG/fMz8z2Dg5dYecnZT79LHQ3HlKAGcmkhWRBWng8CStQ5BcH/sfce+uAl93i7
         +hM+NRY3XYz1mXB/sj9jwPhtimenwm/WVCClkuoROdDITpbUakuSFRdIHeVtOS6etuXq
         XEfzvrhDSPYLDX6E8gsuC7AXrRKXu+QT3q5f4n0h/Wfsm9VhHcEIYA6mCncBZErfpBy6
         Q49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793446019; x=1794050819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBAqeg3P7IjkzEoe4Ha0kzpqAxzRiyS3drMdSnkFfrg=;
        b=qZ6IYM9w1yVlHWOhiyKolj91sX2QYT4pxjUbjBp/vNjmYCN4HyTUdGuRhKs3hVPqi7
         Kc+KJrR7YySOzBLjNpn1Y0Ouho5hJ3rqd01UX3O4AL1kZp82QfZ6d62lwwKFlzRP/XUy
         BNQdTfhBnjwRhoN1pW6Nx093aTdp3oE3LGNdXuPPEzI9MbscHDUiy/zSDgRCenfRX8+d
         W5vRc0NM66E65F8lZ25MhNS3SjkF/Lmm4VBAMM0AOzBfqlW60gKomCmhqA6rq74E5F6e
         ExWQT2TNtt4ZjjArTse8fifOiyHxZxbwzcd+LxixxfubSTRef/uH8o7GH69C6XTBpVF3
         qKhw==
X-Forwarded-Encrypted: i=1; AKwUvBw4ae3wFu0I6Z6AoOAuwBvM6C1EN+CxthJ8XtuqtqrpFtOVXoY0xJ6U2QbyJQkJJ0gcECPVNtzqwNn8Rv5zBQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIPSTWAKBeqXzxEvelSVbwPE9LorbmF1SR9voFbEbSEgJKbwlZ5
	nPVkGzIe/X8094AHMIGFxvdt5r3JsbRNrrEmpTwf1S+Tz0wVktLeRI0U
X-Gm-Gg: AYBFou0D4miw3yHy4YjYt9n2dzVFIDs6lHrbA+x1UE6lYBY4ogzDPFJe8D719w2EFxe
	KFIpu3IzOiHQRjHuaBrTMad4CFspVIsq5i4bIm+mQaHY3DH8A004z4zPTC3nKQggI+0gu+aLO+3
	nX5xup0EX7CfwFmHZirCnAbjwwDdIeWLgtdKohJ8Cft1KhDUMDHlpEDa0w+ot62JkHz1vzjgyPj
	RQFJnC2+mUxCyFnwTBLtss4zDw3QJsLkHsHBCQWZCXMBZcd42ekH7y2eKw1D9dPpu/hO3L/RScU
	Hpt+WMH4ifgsjRTCt9ivc8Qy7fDwAO2jT21kCHBKPy/P0uYwKnI5SptHhTRmdRGzMVdC3gmod0g
	Jqx4gm2bRt7T8H47OW8Fm5OLJNETpohAOVSPunefC5y6GjGmEc9YesmtDPsXxFWnr3I7XQ76A6B
	QfowG/HHAu6x1+xSC1enrQyECl8oghmLang+B30yxVzWyDgSNy5TmWg9cG1EbEWbR5+ZhpwRa7X
	gKGtZ5vfMoalMSivW1JsY3vegpgUUxXcrFdhSEfvwMzcAtz8NdqVDnE29Wlv65hp8178K/dpJAy
	tWE/CkM9wBFFmPNcEyW+jg==
X-Received: by 2002:a17:90a:e7cd:b0:3a0:8050:2ec9 with SMTP id 98e67ed59e1d1-3ae897ccf9dmr3920644a91.16.1793446018866;
        Sat, 31 Oct 2026 04:26:58 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb2fesm11638646a91.4.2026.10.31.04.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:26:58 -0700 (PDT)
Date: Sat, 31 Oct 2026 07:26:33 -0400
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
Message-ID: <auXQaY25XfYzxEb1@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
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
In-Reply-To: <20261030-slider-finished-360b10521e0b@spud>

 
> Okay, that's good - but that's more of a response to my comment down
> below about splitting the entry, not a response to what I was asking
> here about the lack of a git tree. Are you going to send the SoC
> maintainers PRs for this platform or were you expecting someone else to
> apply the patches for this platform (IOW, me).

Thanks for clarifying.

Could you take the BL808 platform patches through your tree once they
are ready? (If that you okay with this way)

Best regards,
Kwang.
