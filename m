Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02583314B6
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 17:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760980095; cv=none; b=KO7OcZI2iqDYxjYjo3iNn6C0k9K19Vv5JDV19S44+kmO8Q+j5MnOpQ7c4OhSkxcVd2LWR61ANrHEfdCwYOBB8KVKy8CnlV3DoIW2kcfPBwqfIUAEhlTmhg29VHauJY1fP7uQLV0KWdxsRLxEvaAZZ6jFAHp2fKuUkwIhPFgTl5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760980095; c=relaxed/simple;
	bh=++JBAp2xm1Bl/YkWLfXigpQePNZ412++Qg25OLfZJHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dRv8uFy6Xr8gM67vdHwggq8JBLPhYxlYD4FYy05LshdyGBh/yGLaIVFrReTm9kYVzBn6QzaGNYdPz6+VPENfOQdJSmIWctWJCTe75UFM8ZeIIiDb3gGuuMMmudSBR9zpzHXbgWwSl3+D4UeasgfkMZMuu6MLBTagt4bxvw/udeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LRepQ9w4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LRepQ9w4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760980092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pux7rQuDYhVQLMQRoejdWlthCyHXYYQvPav2QQo4Hto=;
	b=LRepQ9w4ttXge+mYncOiM0DYdMA9cAMhDN5DU5TzQuNX1Bb5Sa6b57Tq9L+U8mjkhzmyKJ
	ElWU/zx0hys7BuzVhmWy7NrsFlGFkKDERnl8y0REYxa4rnLN9sf/sndBYpFUO/l8+Nh0X3
	1Z90yYzVyMRsT0MTAcDdkD1XD3de1bk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-hpv0dE5QNSW1AXrqN6KQvg-1; Mon, 20 Oct 2025 13:08:09 -0400
X-MC-Unique: hpv0dE5QNSW1AXrqN6KQvg-1
X-Mimecast-MFC-AGG-ID: hpv0dE5QNSW1AXrqN6KQvg_1760980088
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c1a8aef7bso190501936d6.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 10:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760980088; x=1761584888;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pux7rQuDYhVQLMQRoejdWlthCyHXYYQvPav2QQo4Hto=;
        b=ABkQ5vdPcMgoPUkoy3uaHVaaCb7I8hooomUuttcYPqenbXKfxk79y0hCxcyHxU+iBp
         E86YYReP5bSml5MPDpqfmZ12N50G0EqbnDCfDb6iMP5I2l7m/z4zL0zJlZo3/FFCbWvs
         KOnvOWoNLrqYVpRy46I7Yx4otzxC44ixSNpFQ8Yxj9o2ApzAfYePxJYW5Rd1bUYvAJbs
         jmaEiakoTqeJ5+hEeb2xpMeMdltHGkTiDSaBKysLQxUhyA7SsvUcBySX/OGIn/gxHsWv
         iGbQQLCCH4dbxAeMED3/THWPAPwukG4fFciHKYukICpxG/m9HBzF+Ye8jYNSVvcMybiG
         5/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUvprkj1DThTRJJi3pGqJpSay5/C11ll9qQMqECHdTNfYV0YJBdJJmJvM+5xoaRGlNTf+J6CeI2tQABls/TZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYv3lslWTS2ypGGcf1zbfpDu6uIzDFhronKpjpKqIBs7zp+TCi
	q6JqkTRPKUYTeGR3uJDl9kLeJpEjmtjV+JWV03X8efRf+Pt/eBzLoAXeRlxCsGEOBFAalAul91K
	ZutQEuP09y/fRn/PnwLpovJyjSvFyoPmlDGMkdSP15cBxN4DVWr0Fj/vH73d7B374CJ/t
X-Gm-Gg: ASbGncuGn0+hHbOF8+1sgC1Tjpo0j+TVsMmqYsADXF9f2oboKVqe3ASXWT4Er4pqnvD
	EPoBj+0+cn56jiwPd1TkKKXDfKMvLIyjsKccEgCFvWFgdvHFhhUUho/ZyEVSKlaslrnt95TVjRJ
	jkh0NXFtndouG7h37X8uDhjT2EVl+xAWjav97b73h/n2NXzwhS3AEVUrGeZ0TB8ntRFvauyRWUD
	SR8jft1ES4mcufpON6XoLeHtsRFy32zmMs9ttDfr0UBflaUcdWGgEd69XO5abdUKJd126QPuity
	yTMwYWyEA0rTUxkMXR656XMM6MpJlEkZ0Tl5wMUjYMoQbe/etndBnn1AKcx5Ki9BFqCVafDgXfs
	=
X-Received: by 2002:a05:6214:629:b0:7ee:aaf0:b759 with SMTP id 6a1803df08f44-87c20545ce6mr186916646d6.7.1760980088286;
        Mon, 20 Oct 2025 10:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2dJ1otsnjO4gPqjD5cms9cnStOkEvPQXBCTaBj9kaoCae+He0cJx4lWam6Mw/3/Lz8ib0iw==
X-Received: by 2002:a05:6214:629:b0:7ee:aaf0:b759 with SMTP id 6a1803df08f44-87c20545ce6mr186916106d6.7.1760980087735;
        Mon, 20 Oct 2025 10:08:07 -0700 (PDT)
Received: from localhost ([2607:f2c0:b0fc:be00:98f9:e204:8ae3:6483])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-87d02d90b05sm54655476d6.63.2025.10.20.10.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:08:07 -0700 (PDT)
Date: Mon, 20 Oct 2025 13:08:06 -0400
From: Peter Colberg <pcolberg@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] rust: pci: consistently use INTx and PCI BAR in
 comments
Message-ID: <aPZsdplimqnRheb1@earendel>
Mail-Followup-To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20251019045620.2080-1-pcolberg@redhat.com>
 <DDN4FLSD09W9.30I0BJXFAU5YB@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <DDN4FLSD09W9.30I0BJXFAU5YB@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w5oVOWp1nZ2LZG1oWTORYT9FLgVD-ygPkkh6usjD-ek_1760980088
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 20, 2025 at 01:43:16PM +0200, Danilo Krummrich wrote:
> On Sun Oct 19, 2025 at 6:56 AM CEST, Peter Colberg wrote:
> > This patch series normalises the comments of the Rust PCI abstractions
> > to consistently refer to legacy as INTx interrupts and use the spelling
> > PCI BAR, as a way to familiarise myself with the Rust for Linux project.
> 
> That's great to hear! :)
> 
> Can you please rebase the two patches on driver-core-testing [1]?
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/log/?h=driver-core-testing

Thanks Danilo, I have sent a v2 [2] rebased onto your "Rust PCI
housekeeping" patch series in driver-core-testing.

[2] https://lore.kernel.org/rust-for-linux/20251020170223.573769-1-pcolberg@redhat.com/

Peter

