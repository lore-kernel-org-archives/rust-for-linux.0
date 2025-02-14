Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2031519BC
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Feb 2025 03:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739504168; cv=none; b=QuGPYg0LPKjaqe/iU2ol62Vc8mIJr0ZvlZOxiY5M8VaUDVGM4seX7EJcA9/Bjbg1JTQmQDHQi58XPcHH9QZ2L2ZENT/5XLn413WPZmO400aROBMTK1xpq/eiwmRQXQrCCdGW3Ejpgk7hg1ngEDIKoKKQadXaSqx92YYyeJbIft8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739504168; c=relaxed/simple;
	bh=vMKEor5hreZ1dlWbtETrNJW5GK3fo/uguUnHcn/DwL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGlLEnOX1s/DMuOZhgo9bsko5r+LGmwRJ1ZEIVIBJAafTGZSKhmmr5HD78ukiMof/ksPrCRIrl4H2sexvMx52gVFTPINsZMbbHl5xVDjHjQuJXGZcfPXgmXeJq6a2eBhcNFGj7waDi0Y+7xnhm+vLCWl6N77Ly546rYFKJnkvCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NK5AKkm/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NK5AKkm/"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220f048c038so1945045ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Feb 2025 19:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739504166; x=1740108966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qJWOFTUzjczTlnRMMm4MfirAqHPejhZpCYaLI3jfPow=;
        b=NK5AKkm/kfGVQsy4ZRu1tBryOatgarQyj+WpJst2003iPbLFKbQC3ja7QoOTyNaPV6
         0zTcb/iWTqU+icCsz0pR7dyA+wVqgzEDQJTAxXeXoz0/324733ShM4sO4HbOnEdehfOE
         k2Tkl4xwMz2B9pjd93r9mnF2sbTei0ge2dMepf1E3mxSOVW1oMgsUTeEIBk5Mo0ztPax
         iVADuEK58d0tzU+dvLeXmzsim0kmbE5sSx49CS6du7afo59Sxhrm2hRxy9BS5eOaVqm7
         6ntppZX6KGkDwsY9F6f7HR6QBFkokmaoBlb4gN27aRXBgRSoCK6ANMJUGgwrIJ/jH+jF
         XElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739504166; x=1740108966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJWOFTUzjczTlnRMMm4MfirAqHPejhZpCYaLI3jfPow=;
        b=SFd/QJPGejSmjq1plIC2GU6/6NNmBx5muYKLMvI3ypCfz8B9Cxw0m1a1DhEKR3umwM
         MvPdqsvU71GeQfZwNREnfI4VGxrMeJoESmvLgvBkR9Q2bC0pcLDY/IGBR5fmWT3Jo5if
         I1VYN2NPAJV/NxvXxzO1h5dpCxw2a2h7Smv7IHElKiq1gL0gWretHDpnZSz9bKGdGAaE
         rKjSLAKjskEVZ1zi0psTOitQHYyJel3vGNVCq14ylc5PQM5O5nFzWo//2hTjm6QEpLBT
         zDIqt90HIUS+D1aodhI19UxCEsVvvhaO4RVyLE+G2hIuoAfNY6j8On7ABUO7FMmn4bil
         kKaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwI8ijM5unI4gxoN4ORb9KO4v5Iu20yAgWAjItfKG5v5OpCH6WbWNtcRAh7iAZraNvf6V9Nz2y576LB7p4hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx37mXtPefNV46D8w2BHiRJIeHkDILovY17BLEcEy6Ihf6aVHFD
	SvB4ncivngkLy0RK7IuzGIJKMAf64orZ6ExgpB4MAJdRamWprur8VN4cAyZPDiU=
X-Gm-Gg: ASbGncvAUoS5tZa1mD3aPQmtz9y0bUPt/2+DFmWlMA14noXGKChUBk3zJn82Rn5aBmX
	G6vhhvFYYmmRH5x1C41K9K4XjUiWzQD2y7ebm36/XDsW3bkRYue/vme3d5sSjIRXZ/ghdxlpTz1
	+iIDo6e9nrwo08QqoKNiquRhXXmObu9UXVbRflX97sEo2iIXVW5P9UW+LlQ4mwDvc1Rj/hKuo6n
	MFqj5OV3VaylOofst6ktf85HKLsjtj9HyYJprqEHzWh5VrbC7loCv11caxtLsxzN58M7otzoS2x
	l8Kl2VyUSBPYF7MmTQ==
X-Google-Smtp-Source: AGHT+IH1VH4H6wqh/ikwjcQenmn4DFt2gxLMOXV05N/JZrNUG0kmpRxr8eP2IrIjgic5np9r8UgFDQ==
X-Received: by 2002:a17:903:2f89:b0:21f:3abc:b9e8 with SMTP id d9443c01a7336-220d215943dmr95010255ad.43.1739504166134;
        Thu, 13 Feb 2025 19:36:06 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d093sm19929755ad.128.2025.02.13.19.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 19:36:05 -0800 (PST)
Date: Fri, 14 Feb 2025 09:06:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 04/14] rust: Add cpumask helpers
Message-ID: <20250214033603.wijovkici3rutock@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <db0166341ce824c157d0c58c240b3efc6aec6f6e.1738832118.git.viresh.kumar@linaro.org>
 <Z6qTelPSqpFk439l@thinkpad>
 <20250211042908.nyftiw7gtxosfjwc@vireshk-i7>
 <Z6t51xodSV21ER4M@thinkpad>
 <CANiq72=3MR9F9ur-aQYP4P81RBreAr=UiGg5iaSuFjjd5Q4Y7Q@mail.gmail.com>
 <Z66oWuLwY4X9Ou9D@thinkpad>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z66oWuLwY4X9Ou9D@thinkpad>

On 13-02-25, 21:20, Yury Norov wrote:
> I'm the right person to look after rust bindings for bitops, inevitably.
> I will take over patch 4/14 and submit it separately together with a
> new maintenance entry.
> 
> I will not maintain any rust code. For 5/14, after I'll send my series,
> Viresh, can you submit 5/14 separately and create a separate entry in
> MAINTAINERS. Please make me a reviewer there.

Sounds good. Thanks.

-- 
viresh
