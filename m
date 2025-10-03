Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA642248A8
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Oct 2025 07:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759475119; cv=none; b=d395BIaanSUzK10jh7W/ko/Yb6RB1LiloQOZbfnsTfa0i1EtMgj4dc/E09JC8YbbZatoOUwF88sgsYOfh7mFS/TAtU7r0zDR0w7la1KXfC+znvuFhsxefpJy7vZhbTCkmltEQZhckUpQmGSLjR7x7ATcrT87er2WSQblqHmCsas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759475119; c=relaxed/simple;
	bh=V4nXwYJCm0qAgWBhMSc7xLQVPqXoKoYttkP89beAoNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLkUxvej3khDy3FKmC6YAE531thspOZjwxWWguql7d4L309kOihzTEO/unms4eI6vWw3FtLCWArBzetZCERG7hR1B0YweVbPJapV3Fov0T1Sux7wMVGGW5bHrAyonnmyzQ4bTvDlyUDvxrrSrdpF0NXf/1Usot7pxfXqjlW6lcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sYKwgotD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sYKwgotD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46b303f7469so12447845e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Oct 2025 00:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759475115; x=1760079915; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WYt7I8mRkr3Ey2EwDvEAd59xCd1pgQeHenRaMjT/0TQ=;
        b=sYKwgotD7CgXw9ZxgY3uwEmRCPi8ATgNWzz52NKU4TPFuw4X6k1Swg5DqW6HhP61R2
         z2v0v/MkQ5+xh6sXCmegmI6/lp8OcBKcLcVwnpo5lg/8pkj4pDmHa2oKT4ZCdicfchvL
         J+8AlLXwjQYTi5PzQTuipbWGxbAPqhk+IamR/u4h3cfjxjdMLc6xs47x0BHGJzQu/sHt
         socjSeS3CoebE13mdhAAWJvHTy+K3nXKtJGONRLBTptsYEymaEabsFsVi36xfXGmN4Fm
         lpE0qto+nlxiIIaQDg/rcSjcpfkFGCEuwVDBNMhHo84zZ6HGAzEwDMvK1QVRQk8NKHoi
         5Ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759475115; x=1760079915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WYt7I8mRkr3Ey2EwDvEAd59xCd1pgQeHenRaMjT/0TQ=;
        b=BhXLHFl0DOPpETr0GsJb3apVuMPS2qBQo64cozDizSzR/9ucTAidJqcLm0B2IlAcox
         l1mLeAo8A7fIYF7OGEqMoL0rv243aw4lpNZJ2NYGMufaRY2bMcaT8iE1L+/UwIStYIGP
         Y4STUF1+Vl4/t6KW9UPgV+7Nc3/jaWTNqupiXmFsZbxGOFhCLnpD1zBhl8cQvciee98h
         qrCbWXK7BWKVKL3tLq28qU8A5OiIgrjK4DZQPQNeV7VTRQMiX9b+r3ogbFc5skD3hQgx
         O9els6lzou772ILRTxM6rJ1QATBuIQkE2RO7nr13FPryRLHMVVaVcHLrY93ZZbzQ/OGO
         0Liw==
X-Gm-Message-State: AOJu0YxHcyGGH0oC7Zn8ThOwdiwJ14iF0ANy8w4+j+jvxRKv643h006f
	qxXt/SLVWtaEEIG+BMHHqdIsuzGqeLO0IFGjK0nwgUFXjZ+eGrbE3a70Kj0EwPpEoUY=
X-Gm-Gg: ASbGnctV2Nx0nY9zeqcGOUd7IDuqRFNsOaAF8pm92PTnH69wnGkkCUuP6pdLGvHlqLD
	9cBvIbe6coQgVHyZTvAi+xufDNPwLhRcvBDzIGD6I9pBatsdmI7TUQA5FOfYS3lLitR/cJI/Eq7
	yx1yAtlYahrDeM4NcpTa+oDQAapbw38kj+DLSVz1QBmUYpt18bjIy6h7cmHEEeS01BlDMR5Wh4t
	CSsXBpvsXnVZR/MdLeXYOMOTUUdQOgWO8qwUADYKamc+CzvYbX7d44z/z/9NTWRZ2pB+04/jhdD
	pV4u0KRZfeXVmKatSiVxmfFDdRjv2IkyoH6nzMqJgFzz4m6d1JRTR5q+zQBbEYIffDEl8WBRctL
	3rlDcG9nwoFX7xFIfrYk/SMMqrM6/KEEErPXccbHw2G9zjFn93YbYehZr
X-Google-Smtp-Source: AGHT+IEKWMNU5OX3+ORzmomh1gz2zjLM87JREtHvmvNpMc/EuUWnJ8BWX8gvQHfL5j0uFQFyRdFpwA==
X-Received: by 2002:a05:6000:25c8:b0:425:57dd:58bb with SMTP id ffacd0b85a97d-4256714cd43mr1162661f8f.22.1759475114640;
        Fri, 03 Oct 2025 00:05:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e7234f69bsm18356975e9.8.2025.10.03.00.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 00:05:14 -0700 (PDT)
Date: Fri, 3 Oct 2025 10:05:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Oct 2
Message-ID: <aN91pwLmB_2TwK77@stanley.mountain>
References: <aN6qWFc6hIcbRU1o@sirena.org.uk>
 <aN7cRUOxq-zwCoZN@stanley.mountain>
 <CANiq72mDsU3W5Qfyf=sKhbad4tAHJYF8WnY+4VPz2J0paA2gTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mDsU3W5Qfyf=sKhbad4tAHJYF8WnY+4VPz2J0paA2gTw@mail.gmail.com>

On Thu, Oct 02, 2025 at 11:35:10PM +0200, Miguel Ojeda wrote:
> On Thu, Oct 2, 2025 at 10:10 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> >   RUSTC L rust/core.o
> > error: cannot find a built-in macro with name `define_opaque`
> >     --> /usr/lib/rustlib/src/rust/library/core/src/macros/mod.rs:1757:5
> >      |
> > 1757 | /     pub macro define_opaque($($tt:tt)*) {
> > 1758 | |         /* compiler built-in */
> > 1759 | |     }
> >      | |_____^
> >
> 
> Thanks Dan.
> 
> Hmm... Strange, it is the `core` library, which comes with the
> compiler and thus should always work.
> 
> So it sounds like a mismatch between the binary used and the sources
> of the standard library (or perhaps other kind of mismatch, like the
> wrong edition being passed, but from a quick look it doesn't seem like
> it).
> 
> I will try to reproduce it. Did you happen to recently upgrade the
> toolchain(s) or something like that, by chance? Are you using the
> Debian packages?

Yes.  I am using the debian packages.  To be honest, I don't know it I
broke it with an update.  It's possible.  I am all the way updated with
`apt dist-upgrade`.

I'm on rustc version 1.87.0+dfsg1-1.

regards.
dan carpenter

