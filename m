Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D097E382F01
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862743; cv=none; b=KJIO2lKYpfxyuRdL7L83xJ0aqh7CrxJT3tXfKgSSgR7lPqr468D1GqMXt6KWO8rash3udL0PEdY80dNN+3VKVClnpLpKFAB0xPfDsZ10CuVsW+6f3ETXgynewI7KlLgbNAPhESteHOCwUEZhKloSwcjLcPiwPugjlhaz5VgTgR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862743; c=relaxed/simple;
	bh=4cT0RsTUNsPGV0/FRC7g/d2Fsbrv8ngyUJ5j2S1oWB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbrsXZ6xIdl7rmm+rlI/veGojH9uUF9jpmwvJhleg9mNR/vb6GUVWUkJcrYJ/49LlQM174zdRTEd/V+nGj0kuLDXIgMxFUFMR7Bn3AGMqZ3+91wMCpNDcZNTuxHpF/eWYTKh1444GR5+axUVNwZU2rSSMNUtDW6Mdln2oFZjeZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pIjjrcVD; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pIjjrcVD"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35d96be7c13so1216792a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774862742; x=1775467542; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B8stYRZwzqp0V8QAn071tcL8Pp7ef3Yw9Bh6FKgFO5Q=;
        b=pIjjrcVDMuwRJSv06rCDqmPfhgnU2w6RtHEeZwOT9VbA7ddPx9Yhqm0EycXhPqhGhl
         b7vh11s3oKpaX0yXcBPFk0/GA8dJT6BR4gN89jJ3ocCUWqyHN/PR7H6ziX8Yzhqokf4L
         duebCwX3BJAYvrLT9Ir6G3WXOWDFDyHuQUw4VQIAW7zFPNpWi1lqOgEE4rrW6fKhPIJu
         QWGMnUZ6XOLMKszavdVUvViEOtcXq0BaNK9dbW7cTq2xmfaTCDeTK/K+JhVhSx/DvuXC
         7Z7upjWCjjgEJ+G7p7+acYj4u5IVQE5JJB0+TBVlwcc9fyuIyuGQ5Qn8Jq5/TeyIJ+SY
         qAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862742; x=1775467542;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8stYRZwzqp0V8QAn071tcL8Pp7ef3Yw9Bh6FKgFO5Q=;
        b=DqiEOaYYtGCnWYstMmCw+Nat4X4towO+NJJhklwSrb3eJkfxo2/F2/+QmPXoUxcY1p
         pNt9VyDDhC6eQqxxdEMsv8mdmmRzC16hkxKEH2nL01UZUcLK1PX8EPDKycqmjCgkKXig
         CPBJZ98lckYnEZS+xAuUYlQpqUYKiF728Kh3yOq/ZGmElobakYzPtwQwJLks4Ea9/O0b
         QLuTpmjOQJNr68hACKKR6cZ39w+BxfhlfleU2AXECOW+PvyZE9ZY5PoXg23IygNA3lFE
         Ux5XDbM5aAvVl2c8o/b8rnve5kzFucsetuYKvBKaPxDHhpyAGd4LuUJiu47K2+X4REkq
         tITQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCeCP8vE1ZRD5m1Ln0klZPEFxeEDQfRU4dyfL1twNI3b2spVclwpoxhxmUqfbHODIEIyJGyFW50N+H7ndwpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzpxmtLLD9GAIshvyz+aRc965gxiBK/yrfayzW1inlODMSwaR5
	x9WLPOxkvPzGBarluqWep4jyD/kOHkKCi3Yyg/63xT2h3nZJ4Tf9bPWP
X-Gm-Gg: ATEYQzxGiELwbxJoiQi6KiiJhhDVtfT6qfks4DMLie/YZeya6lQoTvVtZvFfl4MoSNV
	kW5+UoBRXnDNj3aIEBGaifUyIB/8upRP1tHhFJ5Hfton6e2zPaFBXYdgLbBV1dBirCYTmHtALRr
	LNkLN5+3NqAVL7vykhcBlznVdOUBrRWdXYwfglFa8AY6IHXsOBRhtHrXRqP+Pr/RL3jNflg5j6b
	xm8EiCqRz3DgPkYUmuNc+RGpnp+1GDORchBzKiLa2PYWokfxTUzsDWO0oi4xcXj4Rh4dmXzWYgN
	jVA4yp+G1qNY/2Zc/ocXqsvFQx/8f6om1SrIY5e9k/Q3G8k2U3JvV/sk6P4d7wpdaroOjSKsiDy
	xu0dHnYsSTPxn0A1AkoKVmu2oV/uw+C/7sZ51rykCQoRTRshpI4bq1dv2iSLSgsxDjp0xcZ2nHr
	5oGyhVcve+smu1MzUMLeJ3KkHpZxvFhtz/yltMIYE5ptiYenpDGnkcYHd+spwp0NGpelk=
X-Received: by 2002:a17:90b:3d81:b0:35b:952c:43ab with SMTP id 98e67ed59e1d1-35c30bb5f2amr8499127a91.4.1774862742032;
        Mon, 30 Mar 2026 02:25:42 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec9c8d8sm3685797a91.12.2026.03.30.02.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:25:41 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:55:32 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH V7 0/4] Rust support for powerpc
Message-ID: <acpBUJ9xdkS4b-zG@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260329160254.2592207-1-mkchauras@gmail.com>
 <CANiq72nUf7cikhf+kCdCgoydpMJZ7HuFWR8jzRvHSoGNGCv-0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nUf7cikhf+kCdCgoydpMJZ7HuFWR8jzRvHSoGNGCv-0Q@mail.gmail.com>

On Sun, Mar 29, 2026 at 06:20:58PM +0200, Miguel Ojeda wrote:
> On Sun, Mar 29, 2026 at 6:03 PM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > We are actively working with our LLVM team to get the target for ppc,
> > ppc64 and ppc64le in the rust compiler.
> 
> That sounds great -- I imagine you refer to a `-none` target? Are
> there any links to e.g. upstream Rust issues or PRs that could be nice
> to add for context, if any?
> 
I couldn't find any as of now. I'll try to fetch em and update
accordingly.
> It may be good to put this in the commit message. Also, other links
> that we should add:
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/105
> Link: https://github.com/linuxppc/issues/issues/451
> 
That sounds great.

> Thanks!
> 
> Cheers,
> Miguel

Regards,
Mukesh
