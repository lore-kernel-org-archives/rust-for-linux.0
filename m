Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943DB2F5A26
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 01:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762479539; cv=none; b=aUEdf3Y6iv3h5DEK3h+zCdRXZGXti936zt63+2PUjOFIbbup2lKeZrBHB17qtvNaFh9UK4R988YiOWpG7fZm95B/GU04Iwv1n/gz4+CsBUWA2sTCnoerbdq9uKLmcdrhTEOlE9nwuIP1/MERsj1AcxZ7heq9unTwjj2oBxXvhfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762479539; c=relaxed/simple;
	bh=2A61AxR6vT49m9916jFoK7ZS90gqn9klHZrsyCdjayU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSsfvgBaiqIWAfeeU9ahuVpaykLhFVD18/T9pCHD++UBQrOXhV70JlPWZLJSecR9b3E+5rfTPW5bDsHDNKoB+wmQUaWCgkP+5sAgehAZpnQhqF0EICS1O5xjrJaXs7W3IJvQUIcpRYcwiXcuhduWXo58uAK/lptGrIl9e9IGBqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHoxJ+Tc; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHoxJ+Tc"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-891667bcd82so25879085a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 17:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762479536; x=1763084336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rs98enLfey5dyNKoNpPfMUDvxjgARsAv9EJfv0aQaHM=;
        b=mHoxJ+TcuRahORk4qnKAfnU1KpCtg/SYHR0SVlqYvaPZ9mjV93DNChsUz3f/wpp9b/
         /rAFZskoPXUH0nEaRQPvcyZRrxtmHjAZbwzMsS3C2bacuWF9e0CegqmU0byInVRPZ1Jl
         YUeYdyfnt6/ziPPqm/yoZ7GX5jdTvFuI1FGqNYqUK7VhyST1lTs+kXwkRA7da7yMXk3s
         KEr5mKpZqc4QWyf2IWZ2XP4YIjWKPZEjHoT1LsCmAA3QjSrxhqpO8raIBBPJnBmAFaMp
         jCICdv6nH76Npvh0oZBEKyPxaSwiXSbcdOSTDx7dy9yJmW8+kh38XZzS7FbUeLfXYKNn
         q4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762479536; x=1763084336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rs98enLfey5dyNKoNpPfMUDvxjgARsAv9EJfv0aQaHM=;
        b=d9Q7NPk885/Hjbvi++ZWJ/4Y4wNh8kC6fBhY5e2z2gbtulAq/2fc2Tvrg6eJ1Ekyjq
         2xkYl64EF9i3VQgQ9CsVjahsSCowlCFU0w8NwJp3wFs8J9mFEgbzoRZmaoevYrRdLAlO
         foYzm1EMaftzCMfPlJ0nhfE9Fru6V6yB29KaRm5b3ABFqd0diKBKAlslMOnYMTXPACl5
         Cer9mwLgitmjdsJwZPRgiwCaRyW8KRprc0T0aYS8SZPnx/bKcR+Cj+rqh3oCj2mruWnM
         PDB7AjLDHiL3So76x9bhQf+Uca1OVnZDNV1Rltrm5PkUYweKLJHF/tc1fIryd66pNyH3
         pytQ==
X-Forwarded-Encrypted: i=1; AJvYcCUevuGnS2luDepKjo9WoVs2MJRU6RktZjoOHwc8KO7mBCQQn3n7ECuuqissAFPyvqjZYht6qXii++7uGJcvhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaI19xUYPpCZqUWuXcAvjhAEsTI/qwqC+djPkiIXsiN3k4pkOE
	4u5hV3YxhHhUp0pDH1MWjumkd9j93cSsILt4krSh5gESC5ySePgzFLob
X-Gm-Gg: ASbGncs8iy76piLgnz3FT2kL8oqvo1gQYkB2fVhqtgxnfab6o17SjDk1UJXmO2woduQ
	MgGsTXAXfpjjOuDc1qrFNrvsOEPaTZlUqPpWk2UmBLZcJ5iLA1IMmgAeadN5rlmxDmpREz5IsXR
	51N7Tu8mC5irt8oso3ckZUx+frOkQErALihkiO8y51bbonhhLiuFjPfAW9CloT+Nh+fxclqXFDx
	dPqzfInByqIe/4WF/rwS6JHbp4i9GkWScw1kAUeBdRVVvd+qxmt18MTbToraG5CH/g4qUmdtAsX
	ZqFw+ut7hjYLmZG8mxDGtmd46Abi4n2bz8Kryg48Rc+I9S6WgIYz9wqcPTuPAAC4YVrxEd8SnNw
	lQOmvmNcnBTTtZkqiHCltAtGcBXUrO0RvUMPzEFlEzWk5Mw0LuFOwHzQGl27wJmNX47XzFr4g
X-Google-Smtp-Source: AGHT+IE+jU0nfXyJlqbjQMtkdY1xgzkKPYrFMIiy7CQmxQlV/Ewmcl9+im0LNVd5Kf6M61OnD9aj+g==
X-Received: by 2002:a05:620a:4095:b0:891:7008:f2e0 with SMTP id af79cd13be357-8b24d697a9bmr943285a.8.1762479536513;
        Thu, 06 Nov 2025 17:38:56 -0800 (PST)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2357dbae1sm308372185a.30.2025.11.06.17.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 17:38:55 -0800 (PST)
Date: Thu, 6 Nov 2025 20:38:54 -0500
From: Yury Norov <yury.norov@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Mitchell Levy <levymitchell0@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <aQ1NpPIcVIUXqgQS@yury>
References: <20251105-cpumask-iter-v1-0-7536f906d7ed@gmail.com>
 <7107432f-4d0f-4544-9592-76a5e5c6d220@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7107432f-4d0f-4544-9592-76a5e5c6d220@nvidia.com>

On Wed, Nov 05, 2025 at 04:19:36PM -0800, John Hubbard wrote:
> On 11/5/25 3:16 PM, Mitchell Levy wrote:
> > The kernel provides a number of very useful CPU masks from the C side,
> > including CPU masks for possible and online CPUs. In particular, these
> > are very useful when some operation must be done on each CPU (either
> > each possible CPU or each online CPU, etc). Therefore, it seems to make
> > sense to add both of these functionalities at once.
> > 
> > Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> > ---
> > These patches originated as part of my work on a Rust per-CPU API [1].
> > Boqun suggested to me that these may make sense to merge separately, and
> > it does seem like these might be useful beyond the per-CPU work.
> > 
> > [1]: https://lore.kernel.org/rust-for-linux/20251105-rust-percpu-v4-0-984b1470adcb@gmail.com/
> 
> Even though you are trying to get these two patches merged separately,
> I think it's best (for reviewers) if you post a patchset that shows
> these things being used. Otherwise it is potentially too unmoored from 
> reality, and hard to be sure that it's exactly right from a caller's
> point of view.
> 
> In this case, just posting that 9-patch series might work, and just
> say in the cover letter that patches 3 through 9 are not ready for
> merging.
> 
> Something like that.
> 
> I realize that Rust for Linux is being built from scratch right
> now, but including calling code in a patchset is a really valuable
> kernel convention that helps validate the code.
> 
> I say this for the benefit of others who may be reading. :)

Not a big deal. Those two patches are self-consistent enough to take
them separately. But I agree that examples are always welcome.

Mitchell, can you resend this small series after addressing my
comments to the big one, and also can you illustrate it with the
usage examples?

Maybe a small test doing:
        
        for cpu in CpuMask::possible_cpus().iter()
                ncpus++;

        assert_eq!(ncpus == CpuMask::num_possible_cpus());

Thanks,
Yury
