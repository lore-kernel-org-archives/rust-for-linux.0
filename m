Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AD1193402
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Jun 2025 19:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749412715; cv=none; b=QVWvHIo8ReISsemp512pMT/nv1UpKINrryZByW8EdG0x5vhoSxmChz7i0YhLSY7wD1dPtTnV8KBm+U/P7zEBLZB5L6ZYua/SxLZZRqJdG2YL2YuKOOf7X4nIkI0ag44gbr3E9YCGnYYNf+1H8M49DI5D+mInmyVU/1BQty1+MJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749412715; c=relaxed/simple;
	bh=BLmXJzTM5ia8opzo1LdCoiOFsDBXD+MPSBLR8pplt3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYKdqzULzw8/2w/SdnmSf6kThcpXoeW9Dpx7oxfqpRN/UC+5NL3h9AopE9hZ2HxTl5AD2cmWjeEdxr1XJdn4HD/8Lz3k8itZITc2AlQ7l0YoiqEt3hfnApKuJpFHk3lNk8Mso4yznqIv/eXuLf/ETceVoAxyfQGmoBkpKx0SrcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=o0zl0a5W; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="o0zl0a5W"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747ef5996edso2711584b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Jun 2025 12:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1749412713; x=1750017513; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SO/TiV/eetgiNfMpNbC5+xBYaQpqY6ayGmPuNTPhj0k=;
        b=o0zl0a5W2JtCxMthNz0mlEdGoO5932iXTBqqEUQTXIn/7roxnt/UGnc6klhq1fFad/
         oh7W4Kfc/lihWp2q1xXCxz6M8WnvrPn+3mzQNG7uUh3CLd8VhRVNxFg3FjF3/S7mHZaP
         016iZkVXqfash9pU937ZpNr9TXAgRSGtp+LqVRHn3qrM5L79k+vD5A4LggEFd5JlMJ1t
         Ma6f6aCvL4G14LkjX19k5u506at6hU4ZIUR5LwndFX9CH2frP2Ah4X2Hk4C5idOU2ydl
         JHsRt0OhOdMQDdmzJ16QSRhHgh+OwFXY0QAQt5+r+X+s41FLNwT5zbxpjGSPt8Tj1ODE
         0Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749412713; x=1750017513;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SO/TiV/eetgiNfMpNbC5+xBYaQpqY6ayGmPuNTPhj0k=;
        b=VEXgkgqBZ/I9uVgQ3dTwhYcV1OXSKXKDB6vKLTnYJi7FwvmuEgigJAzjyUBblOjmKP
         S6UZeEXwLI8WzgDyTEzafKWDscmDqxNpvNYGV2HKUuNDkkJBQ9/nWcDbnmevTmT1kCg6
         Gu3YgIkBccKu/j4YNg2IVF3kD1rmV1A9VneJA2xbjBFWs+AJY+P7xJDQgDY0xU8JHb4F
         eq1Uy1dOx8cO67uvB716EELBMFsVaHm07UUXM0bZ0rr/NCd7YbsRJu/2+Aqq53i1Oc0r
         DxusczOsC6q7A8jqn5zQlyX7K4VRlbQOTo+6Z8GaPPGRyC2afjiVv0yAAGkxLxVL+1PD
         yYKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8dMPID2PwjhIWYiXnmbD05NtCp2IOrXmCr8NsSHtNE2KypdtrbHd1xGVO2QIRdM0Z5geO2Go1JxHytkpR6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNFF0W5B9H8bcu4THTlZIgVm7Rsg5YkgLXN6HQ2kQtuQGQqZ6W
	KF9Gc/OBTd1rn1gUlOE83rKqZp7+q8pecwCxu1vYgc2N8n2PC2l0RAu6RkrOdWrg/yM=
X-Gm-Gg: ASbGncuX/tiT5C7HX9QYoLaVT4826TAthQdv0qwkthwI+uid7q1CKaRxQtf3rRuFGlj
	c8r/ONzpCV1JtxlxPtwWb1UFkIjV9V9G0DsWPErVs3P5d2l8Guth13KpWvW2bVwiq3cW1Ahss/+
	J0NNJou/8FcFERtKWICTrFvH9thI0WyHAD8JVPXkj2gfGErPDPJ6V83WO7uarnuyx/mN4VFwLUB
	GcaTwZWHFt3mYK7VNf38fBhsDnEnGGgR3uQ7r3iCTWt/xTB9gV6h9uguWAs+kLRXE8Zetd1X0z+
	VgdJKMCbAVcdcEpkXncqu3MvRgZG2gxn
X-Google-Smtp-Source: AGHT+IFbXbhXFIU9zLa+fXurTHgYmeXx2QZmDu603fA5wHw0+5DeqF3jW9IscpN1oxDbST4x8Tn+iw==
X-Received: by 2002:a05:6300:6c03:b0:21f:54aa:2004 with SMTP id adf61e73a8af0-21f54aa2170mr4488578637.2.1749412712968;
        Sun, 08 Jun 2025 12:58:32 -0700 (PDT)
Received: from x1 ([97.120.245.255])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee73e2asm3467343a12.29.2025.06.08.12.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 12:58:32 -0700 (PDT)
Date: Sun, 8 Jun 2025 12:58:30 -0700
From: Drew Fustini <drew@pdp7.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 0/6] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <aEXrZvpTD30a5OhT@x1>
References: <CGME20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <aDJGgLZ9tITwGBxq@x1>
 <b5f4af17-05ef-453d-8f04-283590ae5b87@samsung.com>
 <DA5YY0YF28GO.3DONTQDLY6VBD@kernel.org>
 <aEXBH5r05FkTxpV+@x1>
 <CANiq72k-FmZe3P_y6FjmiqXViqLKXkDqHY1-KLfmgwAe98oBAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k-FmZe3P_y6FjmiqXViqLKXkDqHY1-KLfmgwAe98oBAQ@mail.gmail.com>

On Sun, Jun 08, 2025 at 07:14:18PM +0200, Miguel Ojeda wrote:
> On Sun, Jun 8, 2025 at 6:58 PM Drew Fustini <drew@pdp7.com> wrote:
> >
> > I'm not sure if that bindgen warning matters?
> 
> If you don't see the `FromBytesWithNulError` error, then it should be
> fine, but I would recommend using a newer version anyway.
> 
> I hope that helps.
> 
> Cheers,
> Miguel

Thanks for the quick response. I seemed to have updated it with:

 cargo install bindgen-cli

And it seems Linux is now happy :)

 $ make LLVM=1 rustavailable
 Rust is available!

-Drew
