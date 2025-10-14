Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5070B2E7623
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760459019; cv=none; b=GNuNBZaWJwIBOrXEaVmD64v4e7MZTOnWHhL3IGylKOTM1sQ9qCUOMj2cba9D97OfsgqMt1EiTmeJkGYwDxglQ5amgVwsCH2VTK+KEQr5bo7ein2H2c/s6PKji6wux35fUwFiqAU8PaPc8yvgsq1nf2ZorZgGclCj605/HKGmW2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760459019; c=relaxed/simple;
	bh=nLrVSbJF/dsM8EOkqzzEHEEEJ04HBU0HW1wHxoyhlPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtY8XyLhIIWlbtGTYPFkJUihsYXw1cusOlWhGJf4G3mNvmwXJLpUso6OqZ/PmsIFj/j/EmX4urxH4b00vGZt7skQISCNIJlwJLMLQwCXaKXO26/H1rZAGn2u0lME8102uqUHKfDXJkpD5On7trkO9O/53MvXZjHpawF1wCFyPGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CA0MFq05; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CA0MFq05"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-816ac9f9507so6105985a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760459017; x=1761063817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7CUMJDuqtfI1vdOSW6FkgvPnhx2KWnxWXMO5VApQeZE=;
        b=CA0MFq052hU/qEulaBZIIBo4dMcsOvCk1a+qZxAbMqBKlEU8IOUZAnfOKaqPgo682q
         PjGqFe2ea468ST+dTcCGXUHfDzy+oB+ULRZmYb1lAWBNSDglnvoR3I7PyfYToKJXOnzz
         PRgMOJfALIPiwLUzD2JYpiZ+qePCHHqUEfUjbC1c0lMtjWjyCdsCD+w1zTs3FXlf337T
         d+yq6RNjWLHxShnUsKo9Ytp7A9z2Kc9OyOEYWtbUNegA7uHjbNsQBoyff+M4vHSd3giq
         /vU2y7gMVXjaQ6r62Ffwzscnsz4FYusv/Zmw4b0CW6g2VV/coPIWOX1Da9EP16NGMB7R
         v+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760459017; x=1761063817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CUMJDuqtfI1vdOSW6FkgvPnhx2KWnxWXMO5VApQeZE=;
        b=meEnMnW6hNtCmirsr6pgL85wbON5AbxtSuNeowMu2JEtUWLYoxOUc4XD2NwsshF4Wt
         JJ55G93mj01qKLfKHKKAFG48l4easENsIaypugTIK99ThgrpRdiVQbxoCyg2UxsOmCN7
         vVOid9LwgPMe2YR/isO3Xw2RYy4BE5gMdFaPSJGAywhx1IWRML/9tcKxPspfvqWMD68Y
         5mTr8QhQ4pHtYu6jfcLDSP7POZGnoO+BZStGUfAAhUiPH2a3pWC8nGetS9J9Lbye3ZZK
         y9LTYNN02jmXDLGBbXT7fqo56cWBRQd8BRKKjsu0/zXk5CahZuG2QX5r8gTHXm0AJ1MC
         aB3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIyfXIncXU2zlei3pa/jqNj1IozHKI5bJ3PkEnuC3oWqqV4YUmzxkcSg2sRtSgg2mYtCArWSf1cNFlt575wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUf94BZCrecq/TXJmrO/8uRI4usFwTbK8K1vq68gM2RyolKIeB
	EtJckj+QEPHMM1V1WsJR+cW5dFMQEfmVGS+ChP0kjeilElmvIv2PqOkC
X-Gm-Gg: ASbGncvb61Q330N0t8T06+oCzwM+prZmC8lf9VShgZb435zUu1EX6si1/abhPLPbXVF
	8HxtzB9WD3CPsX5uCLqe/4XlawWjOEu60iZ34deTQ9Y6/Sjf2AEQy25dGMMmWCTlFLES5idmP5c
	I3ZP44/OasA74vIyV+2PO90bB6CSX41XYjP0fbVnXBzVpGCWHjawANYrtEwwEgiLTRNBGbFU2C0
	KtNdoOCueM/vGs4+ZLZsNDYOT1nffdxp/yYLq60LhZEDeieIW+1NoUh1V3yfIwgMtxBvgRRSJDa
	FYIRu9ZXgtdvFYRsEj8HtvMMcOnx/3BOe4J3h+ytj78SeFQN1gqiAqKNREmY72vfAHT/o3wo4M+
	2+B//KIaXnx7PnjEl3RNaMmykuRNalFDj7BnEHg==
X-Google-Smtp-Source: AGHT+IGb3LYxLUu0gNLKSrBv3dHhkBztOS9rJ5f0Uu7ubH+luxyqfSH/R31aRzsAnX4WaPCwDZbGSQ==
X-Received: by 2002:a05:622a:109:b0:4c7:a8ed:af3e with SMTP id d75a77b69052e-4e6eb068d26mr360037541cf.40.1760459017010;
        Tue, 14 Oct 2025 09:23:37 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e881b10bbesm1938161cf.0.2025.10.14.09.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 09:23:36 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:23:35 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Burak Emir <bqe@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] rust: bitmap: clean Rust 1.92.0 `unused_unsafe` warning
Message-ID: <aO55B_ishdHO2uiW@yury>
References: <20251013001422.1168581-1-ojeda@kernel.org>
 <aOzET46lagm-p8go@google.com>
 <aO51pV5WSmqnT4rL@yury>
 <aO54nxGil6a5hLQN@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO54nxGil6a5hLQN@google.com>

On Tue, Oct 14, 2025 at 04:21:51PM +0000, Alice Ryhl wrote:
> On Tue, Oct 14, 2025 at 12:09:09PM -0400, Yury Norov wrote:
> > On Mon, Oct 13, 2025 at 09:20:15AM +0000, Alice Ryhl wrote:
> > > On Mon, Oct 13, 2025 at 02:14:22AM +0200, Miguel Ojeda wrote:
> > > > Starting with Rust 1.92.0 (expected 2025-12-11), Rust allows to safely
> > > > take the address of a union field [1][2]:
> > > > 
> > > >       CLIPPY L rust/kernel.o
> > > >     error: unnecessary `unsafe` block
> > > >        --> rust/kernel/bitmap.rs:169:13
> > > >         |
> > > >     169 |             unsafe { core::ptr::addr_of!(self.repr.bitmap) }
> > > >         |             ^^^^^^ unnecessary `unsafe` block
> > > >         |
> > > >         = note: `-D unused-unsafe` implied by `-D warnings`
> > > >         = help: to override `-D warnings` add `#[allow(unused_unsafe)]`
> > > > 
> > > >     error: unnecessary `unsafe` block
> > > >        --> rust/kernel/bitmap.rs:185:13
> > > >         |
> > > >     185 |             unsafe { core::ptr::addr_of_mut!(self.repr.bitmap) }
> > > >         |             ^^^^^^ unnecessary `unsafe` block
> > > > 
> > > > Thus allow both instances to clean the warning in newer compilers.
> > > > 
> > > > Link: https://github.com/rust-lang/rust/issues/141264 [1]
> > > > Link: https://github.com/rust-lang/rust/pull/141469 [2]
> > > > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > > 
> > > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > 
> > Added in bitmap-for-next.
> 
> Is there any possibility of landing this for an -rc of 6.18 instead of
> for 6.19-rc1? That way, the warning won't be present when compiling 6.18
> with rustc 1.92.0 and newer.

OK, will do -rc1
