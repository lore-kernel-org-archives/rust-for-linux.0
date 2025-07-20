Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359855579E
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753027660; cv=none; b=MrcO+TvfLBAt88zs4DiP9ss4A2XiLVkzgf7BC1swBIiB15O+xqJA0glwhV6qWKBpGWajlSnSsiRlYdV7DqY7x83/tcZxCoYLlKPXTFBMI6GZv+JcMoHxSj/+qBkR/Za1WvAyKQ+UjizIxItoLfe4bPeuQUqjRO+yn2NevwcvflA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753027660; c=relaxed/simple;
	bh=MEAipS7tIqOOORhzOLxJEu3EMaurgTk3P3SmCmKRjYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVuptzazVyqcAM65eGP5eQxpqA/TiSVwewFbZquhekxuspgYFv5dbA+vTVqTC+I2AeHBSCuCHbhVn5mHGiR2wSUJn/kskvQkJ2Dhpv5p+8NsBIRZtLhaBh7+dAZzRcXVdMJM2TLSC0TjhGefUGmStZB4UxHZuopkt9tzfwgE4Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=RI63pXLi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="RI63pXLi"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234fcadde3eso41535085ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 09:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1753027658; x=1753632458; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q8RUv7gDQVh9Xv400yvcTGdoBeNmRYOsZZ8FvZTzEiw=;
        b=RI63pXLiCCOy9Jw2OSad2RPSHhlSqt3JwtCVZRvcwQJmG5LOE7r4caeOyyGCfcz67g
         ARyTaKbDPzr2dgmr7abMvGU7OfYa8Tt3HstagpzXbHdlvg700GXSB8t/Dfm7n/MzINnL
         aPWySH7QpZQXQn/6r/PrxV0FJJFcfDP2rRG4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753027658; x=1753632458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8RUv7gDQVh9Xv400yvcTGdoBeNmRYOsZZ8FvZTzEiw=;
        b=ftHe5EvBZgUocdIhHPhdyZhAM13l7UTu0eR7sGdMqEjVUdHJgiLUWS6jCvI8zr0QCN
         inchexfELjbTSE8Cg5QYsGcZgj8vyB086pUYUUkMkir7TI324W4R4b8w5ZkPJ/f7EWSW
         lwSUwINhlKvsVW3RfagocbMS1UqIq3mKK9dOJRZ7GdRaJvRiSzsa8L/ceABktzDMC23X
         JMo6/SOHS2lGFhF4QL+OrHaPzajlmy502INj7mw0JRAXIVt0714UOQ5QW3qUTaqbTy60
         lH/WQNBkNkPtyyVPaaHYXXBOpG1mmD1ItG/mUbcyf4a+xyaTX7T+6qN7E24QkFpOjO1+
         Th7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIZE3kaJkJxT+jzwZ12xF7iNlx3SaI2/URK0cPR4eWCMotztH4FPdMcUr7ga/5yqCzePhxNaImnNx7wcixsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwijdR8ZoZAiXey7nrCDRJNRsqnK7TW6EFa7edg9cgXKUSjrqJT
	a6ygAvaIcNOwj47Q6i4ewm43JQ7DRjb0eqb+r5MlAzbvN3+EG+4kJKI/E1KXff/t3Mw=
X-Gm-Gg: ASbGncuSZct/jqjTk6odYnV6q4PXS7WpHnueKmsF75WcBZ26QQwS4DQFd6Fu/U96GCD
	zuJYNgeP0Upjdln1HSRgiWkrZaOHsqnCm4HhkHzqZ3tfWtJuy1S9XzCpA3aSgHpe7KIHIyNAc7A
	88+OA53E3M+16kXn45R4R8I9lAB4e00B/FrCascTa6gfA/c+NTxpFt8W6oWA76kH3ROmxvGd2vv
	/zHJKbqEsorU041oZImkdAPl54Wl8KrslyyIM1briu9meT/akdfvpyyokROkdNhtFg+I4z+KPO0
	DPYEO2NMXwEsErlF1QxID+3kNAo/QBoOxOe0lyfcU1mAIyYBzwWG7734aG+VMTXLYDJJuqB4JtT
	iiW/LeFbYgXmFf9Rqn+YL9ydisTxugI5k0jkzlOaqxna4vGapsCD6
X-Google-Smtp-Source: AGHT+IGf/MnOq1vbpyuq47JBNkrTX3YVoxz/LvdQ9w+9MydBBoVrrzSdMf5GEBSblzU0JCHK+46alA==
X-Received: by 2002:a17:902:dac9:b0:23d:dd63:2cd9 with SMTP id d9443c01a7336-23e25780c52mr307048635ad.46.1753027658452;
        Sun, 20 Jul 2025 09:07:38 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60eabasm43262175ad.54.2025.07.20.09.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 09:07:38 -0700 (PDT)
Date: Mon, 21 Jul 2025 01:07:22 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 0/4] rust: miscdevice: abstraction for uring-cmd
Message-ID: <aH0UOiu4M3RjrPaO@sidongui-MacBookPro.local>
References: <20250719143358.22363-1-sidong.yang@furiosa.ai>
 <CANiq72nWFW-5DFJA31ugMY7v0nRNk6Uyb1KuyJfp0RtxJh3ynQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nWFW-5DFJA31ugMY7v0nRNk6Uyb1KuyJfp0RtxJh3ynQ@mail.gmail.com>

On Sat, Jul 19, 2025 at 06:34:49PM +0200, Miguel Ojeda wrote:
> On Sat, Jul 19, 2025 at 4:34 PM Sidong Yang <sidong.yang@furiosa.ai> wrote:
> >
> > This patch series implemens an abstraction for io-uring sqe and cmd and
> > adds uring_cmd callback for miscdevice. Also there is an example that use
> > uring_cmd in rust-miscdevice sample.
> 
> Who will be using these?

Hi, Miguel

Although some existing kernel modules already use uring_cmd, they aren’t 
implemented in Rust. Currently, no Rust code leverages this abstraction, 
but it will enable anyone who wants to write kernel drivers in Rust using 
uring_cmd.

Thanks,
Sidong

> 
> Thanks!
> 
> Cheers,
> Miguel
