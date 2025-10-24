Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C58199E94
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 13:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761313541; cv=none; b=CXoBwPrD9DEfr2skwVmivljT4qEyE2WRdg7nc9Vyc5w7VIjJ72r5Vadva25b6Cbe8kk22c77kz+lhdJmQMiOcUi5KHuxBYkOebrlRYFIBZhIBbRJOWppLylGU+FRDcZTVMa6AiI16cRZsaqpD7FuC5YbHfPFdV2mLI9leAZytXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761313541; c=relaxed/simple;
	bh=R9mC9AqAfbLHak1gVQ+cGB4Ty+4JswFwQ13vc3fhUsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GymSuy+WNQ6vSZ/GQKQdDNA3UdhFkQimaqD3INDzaZ/dNYdv1ZCz9m8fcc3Jn6r4kKIBG31uLiU4MSUXSXOd4fsgKNGjC5Qs6VtH1bg0+4RzCyHrD40Zva964zlUByDDI2iIQ4u1Fb82rwABSCEH9ln//2Y8yW48k9BET71s2Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAIJsQw9; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAIJsQw9"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63e17c0fefbso2222462d50.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 06:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761313538; x=1761918338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ9flg7M+cKCZuZxpG7+6bazSm6e3HeyscPxk98oumo=;
        b=AAIJsQw9901jmex2B4RD/Kht/hdM0bApsNGd8sU7xdlrBYCTKaGKrpd9j+Q+936jH0
         +LngL6D/z8REyzR3rsuVSkDbCIfPYeb7gDleiWZicU7BR9o38S/745SJ2Zk/RWSNMFPD
         JmUtxQSevnmJlX+1peC/Imlbjggf4lCzuMAH0LNUxTJR1hxHRVQaNHwiaimnLHi/ZY9t
         wERQGG4EQ2rlSZOBiMHkOeT2YCejmO6rEa7yE0kGIR012Cs0yPUJsps2f3XERjWZsQ7O
         lRQSCzmQ+PPFJ6jjtMzDZ4CTyw2D0ae/FyIOR6ipTvqxA2NOzJb3tYlx+a1X2UudIvmz
         wvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761313538; x=1761918338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJ9flg7M+cKCZuZxpG7+6bazSm6e3HeyscPxk98oumo=;
        b=YxW1aVGc0Xm63kdpNZuJGUOkbjPV7jyOXkPQmA4LX1cYVInLImq+Xtanum2U3OYbGQ
         U69y2FMln55z646D7Nk4HcAEORCykbcdyB438NtUB/b0QLr+560zWhPPQWk6mIXGOxzJ
         Vo6YofHrPBmTCQitslqJVIQooyh7ko2DZdcoYWbWpjaSX05JMdiG7KzbuZr3X+0xRyN2
         LRN7VifHyZ8pFIOka3dxAzIqwS/++72idSSpskMSj8++FrjMPYSkBOrvhAu65eR3AX6c
         5kkv7JItk/4h9qNbMGwXE/UMCKyoVFOOcVG8iZYni1Gmf+avwXaPRaprqUtaRojj9hDg
         DzqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxVH1Hl9T2zyU/pgt3Qy8UXH31p2WUb6bxbpry5lY4/3onjYKxT4bpPbBi8QBloaC3CgpDHOzmLCJMm2Sb0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFhcqgoRHKPZz3HLCEDGzAm7b9tax0Biq32C0H+36iog1MEFCK
	peRvh+rTwZMiU82zOtQ5v8ArcsF3bs7DR/HYnKAkrxxmbm41z+LdfPdM
X-Gm-Gg: ASbGncuLDkQBhZvKSal4yyTESsuqzFFsdYqBsjC+4B/0nfFh288aGbI/TvNwLI58PtR
	OpZ7BThGMyFg77212Pwz0hIQSCM/Px0trOGnmNmu6Fg1U10eYsm8tv+dvSX2jhyjb4Az29fYQAH
	h/NNw0Ll26RsT5HtAPHIH2zbWVBTYhbN248PLCxTw+mxbRsCMgHTT6h49JvInFcneLgpOr63e7X
	QEWTOdNymy/bHMf4UXtp27Gp1lMuJT8d8yTdOnD1cGGtJZFmkSuSd7HFteIfUFZ9K/VyoSp2+kN
	ysuhKhS+GKyx7F4rS52sbp/kOo/joWTETaOuenO9ongFaJw04jC+hQOf0Gt8A2jkDQvJSNWs+FE
	eJDsV3KlRbpo1mjP5BzPcHZlaXKiPWvBDODxhpkKJRebjbEAtnJxHK7NhjAcU4vUuY+KGHCKCHs
	f38YdP55CN+qL3tDH6S+WqVPDsp2sRgWvLeL2WJQIj2RjmdouOe5s2QA==
X-Google-Smtp-Source: AGHT+IFE68Htsnc4siZxVCxI/NKRrCYbxxjzUI941ERUrQu0KUkdETGfNwFaCjQcge9iZ90zrqGuxg==
X-Received: by 2002:a05:690e:dc1:b0:63b:822c:4494 with SMTP id 956f58d0204a3-63f43500492mr1757658d50.30.1761313538444;
        Fri, 24 Oct 2025 06:45:38 -0700 (PDT)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63f378f087asm1612450d50.12.2025.10.24.06.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 06:45:37 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:45:36 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] uaccess: decouple INLINE_COPY_FROM_USER and CONFIG_RUST
Message-ID: <aPuDAHzirb3Arl6h@yury>
References: <20251023171607.1171534-1-yury.norov@gmail.com>
 <aPtDGA0JjmfDvxXd@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPtDGA0JjmfDvxXd@google.com>

On Fri, Oct 24, 2025 at 09:12:56AM +0000, Alice Ryhl wrote:
> On Thu, Oct 23, 2025 at 01:16:06PM -0400, Yury Norov (NVIDIA) wrote:
> > Commit 1f9a8286bc0c ("uaccess: always export _copy_[from|to]_user with
> > CONFIG_RUST") exports _copy_{from,to}_user() unconditionally, if RUST
> > is enabled. This pollutes exported symbols namespace, and spreads RUST
> > ifdefery in core files.
> > 
> > It's better to declare a corresponding helper under the rust/helpers,
> > similarly to how non-underscored copy_{from,to}_user() is handled.
> > 
> > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> 
> Overall LGTM:
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> 
> 
> In include/linux/uaccess.h there is the comment:
> 
> 	Rust code always uses the extern definition.
> 
> I think we should reword this comment as part of this change. You can
> say that Rust accesses _inline_copy_from_user() through a helper, or
> similar.
> 
> After all, when using LTO or other mechanism to inline helpers, it is no
> longer the case that Rust always uses the a function call.

It is actually worth to just drop the rust part of the comment - with
this patch there's nothing special in managing the _copy_from_user().

I'll send v2. Thanks for review!

Thanks,
Yury
