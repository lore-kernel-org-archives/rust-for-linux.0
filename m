Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107581E9B2F
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756169; cv=none; b=TPPVxnm8v0XdDUHnO6IkeLqCFK8kFR7cE+azj7k1eNCWoGKOta5qsQbxBOp3VFSbk+rtsHYI16Dnl75pS8Uydyvl3xH9toLjScEK5SceyqmdUDcIbzLRntYom+X/onSteUQMpAgljJD5YhG08HfyqTmn0UMFnZKTz2MAj7SBrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756169; c=relaxed/simple;
	bh=irPKs7vww4Wp5DHwFQWJhvy65Z/tKYjeF2LU3WM9bV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnMErwyDwlk5JhClEVhawm8IzBFYWBtfl+ZHlWX7TkgIiRZxspESiNoElnW2cXS7bL+uR14jXBRUfTnKqedushsnkSWX06eF+1EkcGE3ilSKNynrxtfv4XQMEpHjoQIBTv7cT4q2iwGsMF4iqyfk48QWmB/FrZffoUldx5sOkkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=gP/HYed8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="gP/HYed8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so29369295e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Dec 2024 06:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1733756166; x=1734360966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0FhI6hMAqJvHiDFIKccG4+dMiyyLUeutIS+OQMFFz58=;
        b=gP/HYed8a77ZxIriGfiFIf1jB+JG5KH/VAAwCfxhzzxebNX4TjZTUAMxPqNmewdKLJ
         WqeE8ftAQNIIS1XPGCLa0bRJWl037BbDip14VZkrmcXZ5fLGgRfN55leaEEcL4rdIfdd
         SFMyTUdQ/9BH2/I1vCDMEsoEapMVq8LrfKQ74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756166; x=1734360966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FhI6hMAqJvHiDFIKccG4+dMiyyLUeutIS+OQMFFz58=;
        b=LpKxb5oNfwX25TycFP1RyOsIcCTygT5DPCpWVu6d4ozeIS5fdZ8qce48S5h7UiDIDE
         Jx9bRbqPYtwkEc3BSWIVzgreqDCi89BVovVff4NQ/01tIRqlYnpBU16DDT5nVNrhT7rm
         DEp7cKOW3SQVxcuPIwElkR3AOIvbhqUj/1UQp7xZuF88Z3p5DxoecKeDPAyRZ26zb2gT
         lBeBi901lOtbVG396Z3CanAC0uyh/eeCjuGyos5NTg87DmQW/BlbmeaUyBWq7gnvDb2H
         mmK2SMYNskgczmpTLJUDncCZW9pbinoqc4ZI64a0L22j9eITWrIjjmFef4B9TE1T+0jb
         sWwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTtqgmDNOcAJ4ffbNzjydIAFt9lzJkI28XoxfgXzrsl0r+SZu8BSPA0z8IaAGGel440x5DBgkA9tVF3Cff9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YynxH+oF06s3VaAWmGRwOxLpRL3G6XjNZFDai1F3y+KGabX+ZGC
	tuPQWZeX80NEgUwWqP+Mc/8MhMhfZ6Q+R4grE7oRIYFQFHXCLutvgUzKJzR9as0=
X-Gm-Gg: ASbGncvgB/KmJkoZpJuu6nEZIoUOWE0CqjqmcjQNhuL0Wab/rTAbCJQe81/HxYHfdeV
	d+FXfoqvQDs2D37PAkKKB1uY/1vIR5PhA296vAelF/URFsy4IKxXC14wwT0E8VmCe2O4KWbv0WD
	rBfEOLLu5MfDAaDicOpCNbV66YN2jnKi/HD2BeuiLhR8aQoNds0oFykAtonncY31bEcYYtAmG2M
	gCv5uKrRpvwwO3meiwA1pmuXyxk7nfU/LWAH44p9EqGzElCXouTBqJG/tV9Cg==
X-Google-Smtp-Source: AGHT+IHlyvTt8nZuozeEetYYMkZ9Tu//20YJAjUPgmqNVSL1YLm6l1SmhmE+cCyZjqZQJNpjJeimzA==
X-Received: by 2002:a05:600c:1554:b0:434:a07d:b709 with SMTP id 5b1f17b1804b1-434fffd7955mr6890705e9.29.1733756164612;
        Mon, 09 Dec 2024 06:56:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbefasm195585265e9.43.2024.12.09.06.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:56:04 -0800 (PST)
Date: Mon, 9 Dec 2024 15:56:01 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Untrusted Data Abstraction
Message-ID: <Z1cFAaQ3TtRVoeKo@phenom.ffwll.local>
References: <20240925205244.873020-1-benno.lossin@proton.me>
 <2024120512-tuition-overcome-0939@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024120512-tuition-overcome-0939@gregkh>
X-Operating-System: Linux phenom 6.11.6-amd64 

On Thu, Dec 05, 2024 at 10:06:19AM +0100, Greg KH wrote:
> On Wed, Sep 25, 2024 at 08:52:57PM +0000, Benno Lossin wrote:
> > Enable marking certain data as untrusted. For example data coming from
> > userspace, hardware or any other external data source.
> > 
> > This idea originates from a discussion with Greg at Kangrejos. As far as I
> > understand the rationale, it is to prevent accidentally reading untrusted data
> > and using it for *logic* within the kernel. For example reading the length from
> > the hardware and not validating that it isn't too big. This is a big source for
> > logic bugs that later turn into vulnerabilities.
> > 
> > The API introduced in this series is not a silver bullet, users are still able
> > to access the untrusted value (otherwise how would they be able to validate
> > it?). But it provides additional guardrails to remind users that they ought to
> > validate the value before using it.
> > 
> > There are still some things to iron out on the Rust side:
> > - allow better handling of `Untrusted<T>`, for example allow comparing
> >   `Untrusted<[u8]>` for equality (we should do this via a trait extending
> >   `PartialEq`)
> > - rebase this on Gary's patch to enable arbitrary self types.
> > - get more feedback as to what `Untrusted` should make available
> > 
> > In this version I removed the API showcase using tarfs. I did this,
> > because I have added the API to `uaccess.rs`. Also, this version
> > requires [1] to compile the doctests.
> > 
> > [1]: https://lore.kernel.org/rust-for-linux/DM4PR14MB7276E6948E67B3B23D8EA847E9652@DM4PR14MB7276.namprd14.prod.outlook.com/
> 
> This patch series just came up again (well, to be fair I mentioned it),
> so I was curious as to what the status of it was?

I kinda dropped the ball a bit the last weeks :-/

> Also, I think we need to add this to the userslice stuff to mark all
> data coming from userspace as untrusted, so tieing that in soon would be
> good so we don't have to churn a lot of existing code that ends up being
> merged soon (i.e. misc drivers).

Yeah I agree that's going to be the main entry point for untrusted data.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
