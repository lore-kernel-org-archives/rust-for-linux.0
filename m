Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4145D1E8342
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 02:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764297119; cv=none; b=srj3a2G0fqulPHGra0bum5W6Roi3ybB6kVy4ybhjbjm+1KcCf42G9Lj9nlJhwORnil53mlLa9eL/7Dd2pShbmvG0YY9Y1bTJUESIG3/Rki25doKl6enwtFioSgHMnhObo/t8pLBTTtanj5FSp3IGrOqT7JQYwMao57urGmqcV24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764297119; c=relaxed/simple;
	bh=IFpbffOusAAFvr8l9r6yDjVQw4lEG19XBmq3vDun92I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgHT1NMHrG5DNwjtvaqHvYQWAJANzrSeZeuaG3e4dyccuHu2Ljxij6yEjquarSJ2QANBIOOGEoqOinmow9RRxduHtCn+AjT96/8XU+tqoUHB3TmJrCJqPTbC0zJ9nGTxNrkpX3F46CU7RDY1K1Gh+QGddmrOj3aG7aX4cl3wnIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbB52QMN; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbB52QMN"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-640d0895d7cso1812316d50.1
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 18:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764297116; x=1764901916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NrpZiMelpAfnsIkiCtzyTE49kXhH3oYDEt7KBJydAFI=;
        b=RbB52QMNcK8zpp2Re9OuzMsRA0PvSUNNjyjmirIieN/yzZcTW7k9zayZ7F48VRNIzv
         j/z57OOipiTyNHemP4kQkOVnkEjQz1TTghWlwgGa0bSzhYqV/QxIad9eUwGBgPIcr9IN
         60HY9+CbaN77ak6KegN5oGOUX2v7L/o/1gsXvcgQ4hC8g7crrgxXmnlhL8Yd6AGKO+5X
         kMr2rJto0POIcjGfsVC1Zpc1RWwaEmm3fsoHEBmw87BCrWh+3RYQYR3hJ+Wor1EYfzbg
         vobOTi6byVWZCQZbe586btBhW6aNLrKwb7l/Zrn5Qe03vnIgbOmOFelvmtaenKK4MXB9
         toVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764297116; x=1764901916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrpZiMelpAfnsIkiCtzyTE49kXhH3oYDEt7KBJydAFI=;
        b=HMSzTaQTuJn1t4174Ge+DG9xwITX9p2mLEFdFxem3XNzv3KxE5bVoFfDZBs9jLY09D
         F7nbyLe7/RzXObTHvtIo4CZUvcHxmWTmcG+mliDqkjgwIYswdK9BVI1h8kzcyEyomoIy
         pqnEhM05RKl+elrSfzfz4bzCd3z1Rwx2fvOt2A20SurX33ETkplt7BjHxsyCIApzq68N
         TQqblB8FELBs/IkxIdTVzLeTF4FYAKCqD0S41jxx/O1ghS1a15hmaysmlI7Kj+Nqleb+
         vXd8ZbUuZs7MFDfCr6m1PnJUY+rbWrPAsWcLaTIKFAiQ7h1lC8Cze9HZsL6neKTs2+zT
         gzcA==
X-Forwarded-Encrypted: i=1; AJvYcCUX48DqZxk+/dKRG1w/ZxKRtnTO3KvPLdY/9kpiYKzRQZiYVez2t/SoR9uWn1HhSuQuDjC5O4tUcVSdOe+ukA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMuObNJ4PSkTqv1fCAKAT6hVtLJJxBaZ9MLH0U5saFhJMPMyIC
	VVMjb1Diz8+vugWod/WZ/GL7qC64QG7/zLsarrNRCV0KeXEeeRxcfQ3W
X-Gm-Gg: ASbGncu/0w+qZgvSchiRIdteMtXh8aUtWmwii3mEDBDRLco8+9J+Pz3oIgUMgwZvqiK
	Tsl4v5Fe4HKDfCs5jFSSi/QlSf7bSR22QZqmYKDQli9yES7YvKcxuAyi5YVz5UKk95D/gw0JJCM
	BLbCkp1NDzx+rSCU9rgTV1emJwhn+GOP2aVziTymTNQK2tWVljIIXUpWv0I8AmBuLW34V/M5/L8
	4dmtzaZdyHxPvhllf/SxtlwcyR3D1s7+OlykYhOyT18WsniVgMh7QbS602nqnKXN/5qszd43KCu
	FS5f2X2jCDkHvP/GOCjTp6ja0x9KUMv14jwA6epegcwbWaRk7zVcjCiCilycYGD6BjyBGLPNv8u
	WRCsmeGEEOks19SaQRc7vqFAZ6qlIFvn6CANsQhPK1tVauMoEkyaw09qs+rBTM/XV9LWyBM7Xgi
	1NxVMW9X4=
X-Google-Smtp-Source: AGHT+IGsQsG7PRiJb7eAfz4ftwZpno+XvuGUcyUAKprNF7+YSwkgbokm6ADsOUlvVSxeFMNjEVusuw==
X-Received: by 2002:a05:690e:1482:b0:641:f5bc:6953 with SMTP id 956f58d0204a3-6430262febfmr17862768d50.36.1764297116199;
        Thu, 27 Nov 2025 18:31:56 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:59d3:fad0:b7e5:396a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6433c078297sm1065278d50.9.2025.11.27.18.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 18:31:55 -0800 (PST)
Date: Thu, 27 Nov 2025 21:31:54 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <bqe@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Philip Li <philip.li@intel.com>,
	Yujie Liu <yujie.liu@intel.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] rust: id_pool: fix broken intra-doc link
Message-ID: <aSkJml0FI9KGdhUz@yury>
References: <20251127213340.180090-1-ojeda@kernel.org>
 <aSkFwsx-6Gu5Eu2a@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSkFwsx-6Gu5Eu2a@yury>

+ Philip Li <philip.li@intel.com>
+ Yujie Liu <yujie.liu@intel.com>
+ Stephen Rothwell <sfr@canb.auug.org.au>

It seems, the below error wasn't caught by lkp, neither by linux-next.

Can you guys please consider adding rustdoc target in your testing
grid?

Thanks,
Yury

On Thu, Nov 27, 2025 at 09:15:31PM -0500, Yury Norov wrote:
> On Thu, Nov 27, 2025 at 10:33:40PM +0100, Miguel Ojeda wrote:
> > `rustdoc` detects a broken intra-doc link:
> > 
> >     error: unresolved link to `BitmapVec::NO_ALLOC_MAX_LEN`
> >        --> rust/kernel/id_pool.rs:100:31
> >         |
> >     100 |     /// [`NO_ALLOC_MAX_LEN`]: BitmapVec::NO_ALLOC_MAX_LEN
> >         |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^ the struct `BitmapVec` has no field or associated item named `NO_ALLOC_MAX_LEN`
> >         |
> >         = note: `-D rustdoc::broken-intra-doc-links` implied by `-D warnings`
> >         = help: to override `-D warnings` add `#[allow(rustdoc::broken_intra_doc_links)]`
> > 
> > Thus fix it.
> > 
> > It was a missed rename in v5 of the patch series adding this [1].
> > 
> > Fixes: feb3fdf1239a ("rust: id_pool: do not supply starting capacity")
> > Link: https://lore.kernel.org/all/20251112-binder-bitmap-v5-0-8b9d7c7eca82@google.com/ [1]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > ---
> > I saw this in next-20251127.
> > 
> > I think using [`BitmapVec::MAX_INLINE_LEN`] is clearer in general,
> > especially for things in other modules, but I kept the same style as
> > other links in the file.
>  
> Thanks, added it on top of Alice's series. 
> 
> >  rust/kernel/id_pool.rs | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> > index a4c37d6a0971..73a952d7dd83 100644
> > --- a/rust/kernel/id_pool.rs
> > +++ b/rust/kernel/id_pool.rs
> > @@ -95,9 +95,9 @@ pub fn realloc(&self, flags: Flags) -> Result<PoolResizer, AllocError> {
> >  impl IdPool {
> >      /// Constructs a new [`IdPool`].
> >      ///
> > -    /// The pool will have a capacity of [`NO_ALLOC_MAX_LEN`].
> > +    /// The pool will have a capacity of [`MAX_INLINE_LEN`].
> >      ///
> > -    /// [`NO_ALLOC_MAX_LEN`]: BitmapVec::NO_ALLOC_MAX_LEN
> > +    /// [`MAX_INLINE_LEN`]: BitmapVec::MAX_INLINE_LEN
> >      #[inline]
> >      pub fn new() -> Self {
> >          Self {
> > 
> > base-commit: a322638c15a678168aeb8dc11c8760f8a053124d
> > --
> > 2.52.0
