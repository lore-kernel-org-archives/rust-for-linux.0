Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3441357A46
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767723627; cv=none; b=DOSgh5fQV31B9CKpijLBd3nldahm4znFNJ7s2/iaEDFxfJp8589pn2RBd758l/h+rQt93qPFQJ0zRVHDeP5Vlpay5bA3F1GeAcRApoHPaoDWP1e1TSBApYFwXXNq+zdrgMCck6jOF97IIfQR/oiLC9oVlfSJAWtuF7/zSh7hC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767723627; c=relaxed/simple;
	bh=LvrOXBIyJ+56pkklnl0rMcgxqybJWbL6RDGcsfnkXjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDmz6xr6mVjFCZoSIICeZeL/iRoiqKi33+dRKhjkfgkm09AjUHnVc8eQqQlj+Ru9pdP8yyDThSBp4PWR1Te0F3DbiOS3FM7Nhqt5Da6KcwtOzZAkL25MHW/jDPTa+Iw6ixn+Y65LnE03pODwgbZZIlKUJXB9qjhY/VDp8y5JMEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lp3ghFpq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lp3ghFpq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f02651fccso5505ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 10:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767723625; x=1768328425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+vFX3VuATVVY47kRmsI5fzfA4Hdj1OU59q5MkyZA5nU=;
        b=Lp3ghFpqv42Aj9QTG+TA0vMf/03DWIfM1VNEIXobMAmM44XI7TGNRhJmEvuhJRIP1P
         h5ehTclUADIp3yd9IfswxS7I4QSWgcil/J7JsqwJTCZaQfRVxreYXp0ZihACifqfnq1C
         1gTBu7raJSojS2QGFgE7NNDxZThfMv8/gdyU0XnaXZ31tJKvJoxJrDkRJjmiXEGFOmmZ
         AbvAWANIrJ0941A/2mbPUG10f0RHMvM7jJwQF1J+pQrueuYeNJFGEThAPNqg8cyZMQHJ
         GPgRgGLVayFm6KzmJPBvyZ/lo/FgpQRzz7+uxJV1xx9s+2smWSAhpaETNMOyCNlB2crA
         IBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767723625; x=1768328425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vFX3VuATVVY47kRmsI5fzfA4Hdj1OU59q5MkyZA5nU=;
        b=L2rju010dPa7mPyZWrpuSNxIqky3Vo6woT91CQNkOj6wIWnNaHlkk9H92HakePyaUA
         LCAgkHPSPeJZepecRHPUyUyKee7VHw9SUXbfNHdNC4tXLkHWL+C+izVmPU99nEAbuDjj
         OtSvTW0a4GZwR+57mA8tEIii751hUtvOAtm2mDCs7zplP/+EEwkTzplHDOB/WiEjAzjY
         tw9jnkH9xeVO+ldor/O97mgd3N8AfvoddATXzQKBcjA2NHiI8uPcT43+0lIgiLmCnG4k
         4GmkaxMVVi8XvrWta/rM2BOGcD9KCKGK1AYQVOTJQtPJ+e87MaZ1trQ5syfEqc/K3nD/
         tP/A==
X-Forwarded-Encrypted: i=1; AJvYcCVEMdOHyh2FvqGPQY65OZMl2ZI4t1Wevmeie5+wj9dRvhfNhyiQqAaySRJh1IjgsA0vZVWGewJR0U47l4k5jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/y8WrludGwYXP09x+Yj1/WE1yEuvhIRdCPSdG4kx0aLAuzST/
	Us+mQBkRHGHpA2kNe7i5tcSY8EXPI3q+x3JXahE+Ey+WZ+OYzGdVSL6zh0WsymVG5g==
X-Gm-Gg: AY/fxX4NcD4iSidIcAGUaHxjQLs22+KpQyRSvtahrlkhNlnce5Apv7JFg/6zpPeeDR9
	z1pHjcJpAKu2kjScJABvQJJ/8Cp4XVEJ63tYw+VLEbebc5L+sRQCGBoIvGdBrRzvaIVhqTQ658R
	lpGIsPCCJdjIMfxRjvedlw35zdLiu3dSgAsmuq7gxqy1pqNZVseAz29/OXXhErYX7W4pjYzftCY
	sBNhPxpluHolKwNrBSuLB1xz7G4S3Z2IH2Pr55Fl0xk0lxj0nJ286NOpeBUV0mKfhzvyZ3pUIWc
	Kk/j6IeX3ZW+ZeEPNQfBdwtXd7R0ZzQaZN0jLhykOQYSyXRcpq9epsenVNUF/8XUikjG9TVKUsk
	yh8x3oItn0xxSA5AYw521ZoxOFa511pR+foJTkq4NFtGQg2bqFoWmVkleeURD5ukoSuA+iSgVEZ
	A+/2jb8LJENBZ70FKSJdMgEQWFco4VuhqrZLtjiigK9f9urBz2Cgw=
X-Received: by 2002:a17:902:e54e:b0:29f:2563:7772 with SMTP id d9443c01a7336-2a3edb4e78amr88525ad.8.1767723624752;
        Tue, 06 Jan 2026 10:20:24 -0800 (PST)
Received: from google.com (210.53.125.34.bc.googleusercontent.com. [34.125.53.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5edcd90sm2755546b3a.66.2026.01.06.10.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:20:24 -0800 (PST)
Date: Tue, 6 Jan 2026 18:20:18 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org,
	DeepChirp <DeepChirp@outlook.com>
Subject: Re: [PATCH] rust_binder: correctly handle FDA objects of length zero
Message-ID: <aV1SYnssUrstzd7B@google.com>
References: <20251229-fda-zero-v1-1-58a41cb0e7ec@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229-fda-zero-v1-1-58a41cb0e7ec@google.com>

On Mon, Dec 29, 2025 at 03:38:14PM +0000, Alice Ryhl wrote:
> Fix a bug where an empty FDA (fd array) object with 0 fds would cause an
> out-of-bounds error. The previous implementation used `skip == 0` to
> mean "this is a pointer fixup", but 0 is also the correct skip length
> for an empty FDA. If the FDA is at the end of the buffer, then this
> results in an attempt to write 8-bytes out of bounds. This is caught and
> results in an EINVAL error being returned to userspace.
> 
> The pattern of using `skip == 0` as a special value originates from the
> C-implementation of Binder. As part of fixing this bug, this pattern is
> replaced with a Rust enum.
> 
> I considered the alternate option of not pushing a fixup when the length
> is zero, but I think it's cleaner to just get rid of the zero-is-special
> stuff.
> 
> The root cause of this bug was diagnosed by Gemini CLI on first try. I
> used the following prompt:
> 
> > There appears to be a bug in @drivers/android/binder/thread.rs where
> > the Fixups oob bug is triggered with 316 304 316 324. This implies
> > that we somehow ended up with a fixup where buffer A has a pointer to
> > buffer B, but the pointer is located at an index in buffer A that is
> > out of bounds. Please investigate the code to find the bug. You may
> > compare with @drivers/android/binder.c that implements this correctly.
> 
> Cc: stable@vger.kernel.org
> Reported-by: DeepChirp <DeepChirp@outlook.com>
> Closes: https://github.com/waydroid/waydroid/issues/2157
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Tested-by: DeepChirp <DeepChirp@outlook.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Acked-by: Carlos Llamas <cmllamas@google.com>
