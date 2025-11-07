Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5E9303A3C
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 23:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762559819; cv=none; b=HXXYDT06QoJKL8VKxIrXI2Ovnm164wPz7FGHTi1Juva0MC+SO7jaYo89pH07p3vCCGci6siHaXW5a9ovzlcoJEhwUkSXjCRk2J6Cve0synsp6yINeI8magmP4TNjq3aLdwQzaLMsLCPq5O7MY2xdYBdPCs4cncfZQ0xf+jiRhRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762559819; c=relaxed/simple;
	bh=FeFqsI/xYgr7AfG/0So5nOJ0W1lg/e2qWzNg9391MqQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjdpJ2fMXa1sr1qy8IPGBvglO+l4fwuxQA+IOIpXk6sZ3PF8yvN7jc5GzY0F+XXYEZm3l2qj0LC9ow6ElxvUUiCQr5aLswLdhDqIkcmR6uyyVHmRj6NRm8FEyqhmAOs7w/MRtrOWtDkzmZ5s4N8b3cE/OjwNjelswbnkO60C+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDPNJfHb; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDPNJfHb"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7ae4656d6e4so1564163b3a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 15:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762559817; x=1763164617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xyrn6s3e5AdxdBxzmRFJ+DRi5jwnDtSs0lRLo55lmRI=;
        b=DDPNJfHbbxKhy7QtZ9mD7j+QvgLKdkvDb1RSsRYCBBizJ9hEFMv1R/dg75tu0fxDmh
         DHWj2IuAb5kwxjwmu3/+u2ujvxkJCH9/BOmZawRwdp668U6GclvlIssVdJseppvyQe+A
         OrvnIxGAQ9G0UP/N9egGZ8LK5SMHqBO2M98Oiy35xEUDVyggWLKU//HVA+JZyu45H4Zb
         uyGpr+475k/CjO6zR7vquoW6eWkcxT0Lp0wSOd54x+nsVq26nAz4anUp+mKP8oNHfqTZ
         ezH8zr3GfHLaxkBulHEoyW62xiSyzlYRET+vsCHIyMjModpvhpHkRJXW/2JgadViQkaU
         +dEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762559817; x=1763164617;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xyrn6s3e5AdxdBxzmRFJ+DRi5jwnDtSs0lRLo55lmRI=;
        b=AGseTukhVIsnZGnKXRXZGQYqwxD6nLQbH+oqjUYvvaOG5RSIiXAm9lCARfu3RveQS9
         7SGQvvdJZwFWI+oMv3okYJMXak+kFyJbz3FeAFo2QoSHZnYehGXf4yl1XOPYAPstxD4O
         ZuFGScLKLFpSqaVJMWAN1td0AsFR6VcFra5BmXJQYw2q08MKrB7WPQ0Hg7QBvuMq2PpS
         mEiTbKOw9LMYpT8MTBFTlESKbQO5XNZyqPIG0BrlecHs0B4NTysXGoUaaYci1ADhc1i6
         a2LittHvhegj7sImBRF4OD5Rj/TqRr0ZfVwb6t1pWtw2mBUPQD0U17OYeXVf3+zrGGkD
         DkbA==
X-Forwarded-Encrypted: i=1; AJvYcCVCUbA1Mx4jwZuwot47qT03rFgY1R3B+IcV/sEXWXV5J6+UO7FAsmlA9bjMZpHdpcUcJy4VkQuVzPEYw3J2Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzggv5PJra1x6GX73ck4SOvGg2dyixJ8/yqbJ3DuWnTqxnyY0c2
	Ka73vecUC5LaPh20/08Eimj1FQ/pySO9WeorlOb3tTsh/6Xw801jG/Gl
X-Gm-Gg: ASbGncuTdEx80ZB/1sNAAyINua/fjraqtO4SZwjWd45Dxhc5fIyrXoe1Xn398m1lkrb
	FSV1ukuTKkYaJiRGz39QrJLx9qcaNe2qywEuxvvNGnKGeMwslnPtxgzUsbv0FCYPy2NWGgl6q5D
	g/7WndnpMAlTqBtUmCASsXC+sGNRJ7mjejsSwImU7sZapDjAlcvzJDsIFSiB2ImuBVKIO/29XfG
	COFF9m4B9dOzDc9fvzT4q09Df6DC9XRk9LW3nxnwmxMvkAmKKxelwgOxU0zZSJFmxNFaYsc95th
	wA6jeQngaTVl8pNIO5crxpMnf7Y3YXY9IyysnNqPJYCKSLkPYooQsF1kTljafSNI+auSyrUHeaQ
	yxA2739JYjcz++Vh2ssaHr/LzrkDqi3+Q0oCp1fwn74yZK4bwnBBHaez+JPqv/R68SayMd2JEcp
	ByGoVk
X-Google-Smtp-Source: AGHT+IFDs0+vuIgKNMalX90Xs3buViP7wrslB+2hOH9XtyLnNMHMWwyAZzwdahX6iyGt7Hher2TH/g==
X-Received: by 2002:a05:6a00:23c1:b0:7a2:7a93:f8c9 with SMTP id d2e1a72fcca58-7b227085bb0mr1191767b3a.27.1762559816785;
        Fri, 07 Nov 2025 15:56:56 -0800 (PST)
Received: from Cyndaquil. ([174.127.224.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b214155c8esm719881b3a.38.2025.11.07.15.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 15:56:56 -0800 (PST)
Message-ID: <690e8748.050a0220.22e404.3a1d@mx.google.com>
X-Google-Original-Message-ID: <aQ6HRrnRB/E3169n@Cyndaquil.>
Date: Fri, 7 Nov 2025 15:56:54 -0800
From: Mitchell Levy <levymitchell0@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
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
References: <20251105-cpumask-iter-v1-0-7536f906d7ed@gmail.com>
 <7107432f-4d0f-4544-9592-76a5e5c6d220@nvidia.com>
 <aQ1NpPIcVIUXqgQS@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ1NpPIcVIUXqgQS@yury>

On Thu, Nov 06, 2025 at 08:38:54PM -0500, Yury Norov wrote:
> On Wed, Nov 05, 2025 at 04:19:36PM -0800, John Hubbard wrote:
> > On 11/5/25 3:16 PM, Mitchell Levy wrote:
> > > The kernel provides a number of very useful CPU masks from the C side,
> > > including CPU masks for possible and online CPUs. In particular, these
> > > are very useful when some operation must be done on each CPU (either
> > > each possible CPU or each online CPU, etc). Therefore, it seems to make
> > > sense to add both of these functionalities at once.
> > > 
> > > Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> > > ---
> > > These patches originated as part of my work on a Rust per-CPU API [1].
> > > Boqun suggested to me that these may make sense to merge separately, and
> > > it does seem like these might be useful beyond the per-CPU work.
> > > 
> > > [1]: https://lore.kernel.org/rust-for-linux/20251105-rust-percpu-v4-0-984b1470adcb@gmail.com/
> > 
> > Even though you are trying to get these two patches merged separately,
> > I think it's best (for reviewers) if you post a patchset that shows
> > these things being used. Otherwise it is potentially too unmoored from 
> > reality, and hard to be sure that it's exactly right from a caller's
> > point of view.
> > 
> > In this case, just posting that 9-patch series might work, and just
> > say in the cover letter that patches 3 through 9 are not ready for
> > merging.
> > 
> > Something like that.
> > 
> > I realize that Rust for Linux is being built from scratch right
> > now, but including calling code in a patchset is a really valuable
> > kernel convention that helps validate the code.
> > 
> > I say this for the benefit of others who may be reading. :)
> 
> Not a big deal. Those two patches are self-consistent enough to take
> them separately. But I agree that examples are always welcome.
> 
> Mitchell, can you resend this small series after addressing my
> comments to the big one, and also can you illustrate it with the
> usage examples?
> 
> Maybe a small test doing:
>         
>         for cpu in CpuMask::possible_cpus().iter()
>                 ncpus++;
> 
>         assert_eq!(ncpus == CpuMask::num_possible_cpus());

Sure, will do. My current plan is to do rustdoc tests that will double
as examples in the generated documentation. However, if you'd prefer
something in `samples/rust` instead (or in addition), please let me
know.

Thanks,
Mitchell

> Thanks,
> Yury
