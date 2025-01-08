Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123641F03C3
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 09:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327489; cv=none; b=DRd7CJcWyQLEDsX6tQe1dysULdy28sAZNpw/2RsPAmAQ1E4OIVXoKCNb7M5vRUJ+AqLcK0LzxK0m9Hv6cmC3DnnXhwT28HEYQuVb9zSikqFX59lF+TRw9QZ962q67NJsdwqbC1a9j6c52XfkqG0m1nwynrEyURPOxy44xXPTf8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327489; c=relaxed/simple;
	bh=PRXvJPDLmIV+SkzsVccWpjDkCQMDJtS/ouRJL97YwE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJ76pb9eO26oy+SRNqjkYXA35cfxbIBDFlgJTZC0GR58poCrNuvTPn+BXLGZ1hkuXFuR3Q9cuCPLg8n4Qe0M8dIjpay8x1swVUu19ON6wCBKcKHkJytWyfdefvk9OO9OPp4LKU2rNfOzd1YRBsJnmcUkEgOHhlaNX+Z1ki0eptw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VYuJTzFv; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VYuJTzFv"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21680814d42so206826925ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 01:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736327487; x=1736932287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ih+RxuSmmPqp1GyCbwJ2zhAAFkHO2nXzakJsmmbgiHs=;
        b=VYuJTzFvkAImL8o+KcXulmF3dM5k+cOxT+Co5zyBbCSXkqwQPH9eXzaIWi7CUlI6cQ
         lmUJ47KHthHMYTX03EAKRd/5hO6M6D2821AqVPu2REyQaqxnofa8WvPSiAY10jp5ZfaA
         QO3MGAA3IILoimPjPtstKogl4TVLFRtTe8YH2X5+TzXXwI+eA//REhbo146Zvy2cfN3l
         bEKtq8qK+88iIJkYnE/uHOcLkeeGMqEOmlqCdyEblUwcGpNI19nqYmYqMTYCdQNVmptR
         0ga4kNExtpCf1Ua0dd/cTKYf9KaV/iRgTyAMGo/+2DN+wp3WLYVseQEUa7KAvB1O2ePV
         pQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327487; x=1736932287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ih+RxuSmmPqp1GyCbwJ2zhAAFkHO2nXzakJsmmbgiHs=;
        b=PtPGOuPz/vygpWVVu/jEIbegxEb61qDAP3fo8r2n++tXY9cTaMXWGn+DtKq99tOfXu
         WezurR4L0DRMVvIBnc2IrwLRreLz0HEYsA0IZ0QuCYeu7QyAF2DuJYPOb/Mm4dUGJdSE
         ocx8URGuDkBk5AgmmaTah+EhifM4kGaglCgHNhxR4/aRGlcoEtK+Dak9JAeVuil972fB
         0y/if4Y3rwRW25kP5JmwSyMbTDIetJEaKfiikyRtHECUfZYys5KFN1txChFjZecozrFr
         II9fQmgGpx3CzOFLMJP0aIi6KqUnQC7niQFREk6W7uUiwkQ6jS+9ye9df+4beY9etqkT
         7rVg==
X-Forwarded-Encrypted: i=1; AJvYcCUeQJZoiX+GqcDOzqxJP+5OizHs5MWZsNOL0PXDcxfF9bvciZmNsTBBMvnRvjXejmyKRMIMsvYGDemEDHNdmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKcqjHq1yhZaGQibjoVqZBszFYsQdK2WWxhgl1H8h/vnMVoyVA
	Yx9fOISjmDXsMYKNY6DCeqQ5fmeLe7eOsEY4W/qs5QozH0LlOF++27QydJmlK1Q=
X-Gm-Gg: ASbGncuQ5jQHyVy6tOBFbD4byP2EOByjIcGT9ZG1+Gv35qC4riv1KklRNBh02rlZ0oH
	Xpet1cTq5ubRHomnZM886aMlZu0vWez7477JZUYFPY2jHdtpGInhqQQKhRIczcq2dKR+nzN4HaY
	JzMA9wKkdh2LhEu5yWDZh2SSmFReATejoxVX/9S6huiguHUcxtbVEmJB13MPnbNFLGLYjlWk1MA
	16vHQ7jYhjc7INjfN/MFZuYlG87gsbm16nNxOuArXXeIFBZqfpz1u8c7dY=
X-Google-Smtp-Source: AGHT+IFyNbZVZ+zegqkrmebADogddz3aKSlII6j+c+eN38z4QYi8g14gCzJV69Rzr79D9N0EVYoUoA==
X-Received: by 2002:a17:902:c951:b0:215:bc30:c952 with SMTP id d9443c01a7336-21a83f4298fmr30968735ad.6.1736327487368;
        Wed, 08 Jan 2025 01:11:27 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdf02sm323287095ad.151.2025.01.08.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:11:26 -0800 (PST)
Date: Wed, 8 Jan 2025 14:41:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg KH <greg@kroah.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V6 01/15] PM / OPP: Expose refcounting helpers for the
 Rust implementation
Message-ID: <20250108091124.3cqgjk4k45uuvppk@vireshk-i7>
References: <cover.1736248242.git.viresh.kumar@linaro.org>
 <fa014791cad083ad77125cebad11a6d5ec9592df.1736248242.git.viresh.kumar@linaro.org>
 <2025010759-errant-lather-a64a@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025010759-errant-lather-a64a@gregkh>

On 07-01-25, 12:58, Greg KH wrote:
> On Tue, Jan 07, 2025 at 04:51:34PM +0530, Viresh Kumar wrote:
> > The Rust implementation needs these APIs for its working. Expose them.
> 
> Why is the rust code unique here?  Why does C code not need these
> exported?
> 
> And that first sentance isn't really good grammer :)
> 
> Also, you created a new function here and didn't document it anywhere,
> nor do you mention it here in the changelog text, making this a
> non-starter right off :(

How about this ?

    PM / OPP: Add reference counting helpers for Rust implementation

    To ensure that resources such as OPP tables or OPP nodes are not freed
    while in use by the Rust implementation, it is necessary to increment
    their reference count from Rust code.

    This commit introduces a new helper function,
    `dev_pm_opp_get_opp_table_ref()`, to increment the reference count of an
    OPP table and declares the existing helper `dev_pm_opp_get()` in
    `pm_opp.h`.

-- 
viresh
