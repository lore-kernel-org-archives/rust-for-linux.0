Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E48419DF62
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 03:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762572633; cv=none; b=gx02zIlZm48unwr+R29SkCNxJfxwm7g7cpzqIFS4v0umam1HOd18Cd6nqQL06ErHuXpa6RTykWnprpei2O1ZZua6Yqh6FLoFSogSePCGt+4WJbTpyIRIXsZ8S4Mv1AhotcG65+6qJq1tUH18b8Ld7At0qXFKf9dCPod+PP93GeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762572633; c=relaxed/simple;
	bh=2YEy1ITQJX+dRDNsaoI2rwt1LIYE4KTWkwVeUHeHmEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCzETDlHIlzFC4YnbZ/1wlvyqX21vBpqDPyNV6B8pDSlrA186aa3/NhERmaq/HHC02pPVKyqHKDZ38Y8iZVYDdq4Z9pYpugXDs2TIe09csWNiN7x1J8GUp8NoAn9xIxAqlcccvIwP6ZVedH6rwfNn6VHgbPSWCmOlaDgj1d+kXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPYtsMaf; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPYtsMaf"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-787ab220b1cso18765177b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 19:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762572631; x=1763177431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MD59kTzjWFWkjp3MAX/YmDqL7bC2/PHEpjJEKrmQLUQ=;
        b=fPYtsMaf/SVpjBxUQ30qZH08VsAJD+79QBtpxNx/Ns2SFw3o8WUvWl/VnhBwrktjuL
         fg1eaX+jfo/77aQSZSogh+GbX+ayW93e7BXOYMe4k/xvwvQqxS1D+yOlJ1YTmnuqyVz5
         68iCbLBjGRTz68jgASa7F97DpI3hn/t8vPuknGecoe8/bp6hfOb7B4QxHDFtahNwyV/n
         M2ujdIZeIdsThngL6dGp/ETMc0v8hDdUN8NJ1S/y1h5s2GcE/clXrB4B+t/YOxYRd/2v
         bObXBROFIriKnQobCB20gucNkhikAMp1PcbdS43Z693xbxI8kEUamT7WXuDGgak/nehv
         tDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762572631; x=1763177431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MD59kTzjWFWkjp3MAX/YmDqL7bC2/PHEpjJEKrmQLUQ=;
        b=NhFqNBBx7r/wm0C8YkerWxyc+UGWNO7n/1BHga9P2zBxqqi52cdQpn/DmgcIBUrjfy
         5qX0J3eCTLaoKhuMifrLFnlBhUpLo7sH0t7iEEMyVHyHc/PRVKnz0Jw4A4giwcWXmwSk
         Qc+pOueetkwiZT4IrGHlKdxLjaJ3jUG5LGTIhVP6rNSBYCf9JTpylLCXDP6morQmVM5D
         OQFT176o/80YbKv3cz21floyG2gHq0KhM8qyytulhi2uCmyQCONZeKC6dGdpg7tkFeEZ
         vptfHgs1q4PbuE5YTbVtdIrnHBa3ddsY9HIpg18Zx38flXLkpOPlN0JykhX2onC9fE1D
         TO6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKDyT5k3hEoQQ72j/z5eIQfJW/YsnjtM4OGuTzP5lIwJw1liF+4HYt0WHklf+MlhVjXO2mhH40/EK9n+F5Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ourf+V+1E4GXHT7ImQG1BnSj0X0hAkuvHdI5/x/o04Rhk5zu
	rUScIec3sl4Xn3hUAcvSqEt8b2ZUqXCOak3VSo5GGnRG5iCax9sQCmyt
X-Gm-Gg: ASbGncsU8iDi1G4blO0RcP6sLZNSX1oT6NISfaopVwNApWX4Ghu7EXsNRgo6D4Y2KJ9
	L5Rer0qDpmWyNpkmv45km1wgbYkLCfPA8bH8d4jrry4+dQHVVv/npIBMD8Svi6JuC38Zgmr1irz
	4YEiRxuFKlqZqv2v3K8KGteKLDEAhpVd5oNB6+ge2ag8U2mq3jBcub/0qTHp5uAL3AGkvN90Osp
	7sg+rrgXrDWqvRLT1j45Y93UEyQ44CBY9zJHcKXlLrrCJRFrXdmzJ32+474FEqHtd6T5eHKXEUe
	CQemGdvP6zqX/viFPmVKvbOjfyFtLUB6mRT0x4Y0cHh8IEHfB15mlrbF3oqwlw/6FCiNTESomRQ
	ZFUZ0sagHZE6fiu35UcHM5cUmzW8w4v51qgmEBLDzcucpHPFh3TVU/zuwGS6hGXfbCBoigWXYMh
	1d8uY13wabnsrR4zCgVwa8NALKRktAOJ9qHLFYgtLdbVbZ2ljM3HM8EA==
X-Google-Smtp-Source: AGHT+IFtTZV8uCctV+DRq/WPYVS0Et7MbCQXMalMyhn0/VU6fhkR12xGNRBZ1xwXvsb/MYqRb+VusQ==
X-Received: by 2002:a05:690c:600b:b0:787:c607:5eef with SMTP id 00721157ae682-787d4f2f82cmr14787567b3.28.1762572630957;
        Fri, 07 Nov 2025 19:30:30 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-787d6a03a0dsm3394967b3.49.2025.11.07.19.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 19:30:29 -0800 (PST)
Date: Fri, 7 Nov 2025 22:30:28 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Mitchell Levy <levymitchell0@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] rust: cpumask: Bindings for core cpumasks and
 cpumask iterators
Message-ID: <aQ65VJxP83xr1yIW@yury>
References: <20251105-cpumask-iter-v1-0-7536f906d7ed@gmail.com>
 <7107432f-4d0f-4544-9592-76a5e5c6d220@nvidia.com>
 <aQ1NpPIcVIUXqgQS@yury>
 <690e8748.050a0220.22e404.3a1d@mx.google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <690e8748.050a0220.22e404.3a1d@mx.google.com>

On Fri, Nov 07, 2025 at 03:56:54PM -0800, Mitchell Levy wrote:
> On Thu, Nov 06, 2025 at 08:38:54PM -0500, Yury Norov wrote:
> > On Wed, Nov 05, 2025 at 04:19:36PM -0800, John Hubbard wrote:
> > > On 11/5/25 3:16 PM, Mitchell Levy wrote:
> > > > The kernel provides a number of very useful CPU masks from the C side,
> > > > including CPU masks for possible and online CPUs. In particular, these
> > > > are very useful when some operation must be done on each CPU (either
> > > > each possible CPU or each online CPU, etc). Therefore, it seems to make
> > > > sense to add both of these functionalities at once.
> > > > 
> > > > Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> > > > ---
> > > > These patches originated as part of my work on a Rust per-CPU API [1].
> > > > Boqun suggested to me that these may make sense to merge separately, and
> > > > it does seem like these might be useful beyond the per-CPU work.
> > > > 
> > > > [1]: https://lore.kernel.org/rust-for-linux/20251105-rust-percpu-v4-0-984b1470adcb@gmail.com/
> > > 
> > > Even though you are trying to get these two patches merged separately,
> > > I think it's best (for reviewers) if you post a patchset that shows
> > > these things being used. Otherwise it is potentially too unmoored from 
> > > reality, and hard to be sure that it's exactly right from a caller's
> > > point of view.
> > > 
> > > In this case, just posting that 9-patch series might work, and just
> > > say in the cover letter that patches 3 through 9 are not ready for
> > > merging.
> > > 
> > > Something like that.
> > > 
> > > I realize that Rust for Linux is being built from scratch right
> > > now, but including calling code in a patchset is a really valuable
> > > kernel convention that helps validate the code.
> > > 
> > > I say this for the benefit of others who may be reading. :)
> > 
> > Not a big deal. Those two patches are self-consistent enough to take
> > them separately. But I agree that examples are always welcome.
> > 
> > Mitchell, can you resend this small series after addressing my
> > comments to the big one, and also can you illustrate it with the
> > usage examples?
> > 
> > Maybe a small test doing:
> >         
> >         for cpu in CpuMask::possible_cpus().iter()
> >                 ncpus++;
> > 
> >         assert_eq!(ncpus == CpuMask::num_possible_cpus());
> 
> Sure, will do. My current plan is to do rustdoc tests that will double
> as examples in the generated documentation. However, if you'd prefer
> something in `samples/rust` instead (or in addition), please let me
> know.

I like traditional tests. If you do both - even better.
