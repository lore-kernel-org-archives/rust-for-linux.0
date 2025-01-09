Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8432713E02D
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 03:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736394636; cv=none; b=ZHZyKWOCeM8Yx9V8Yp1FljlRGLloUsfDI+lszhJ1jc8L2EnlXEGMZf5Ef5Hvc95xMpbdQkH0STvzj7zNa9CCfrCFAGnLRdZDhJOEfQZNf4XKnxuZJo+z5OwwnOa1oY6sD24cLfDZdXMViUaPeCxe2snKnPBfH9Jg+Ijb/JtEOCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736394636; c=relaxed/simple;
	bh=ez5+UAxbA53MuMo50mcpaq5hIivDZMNRwQWvFinRh9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tzdv5XKxJPNDR3TahP2D2SgAX87MLu5HQvcg1on4Qj0yiPG+ks5cN3aBFSJQ6xD0caClUQHUksP0k3nM/mOSvdBFwIwIiGchnAhD4SG2YdnQnchomdlqkKeDDoiq0JRFwToxR7mydlNmDF+ZaxKHCEAEBLhx3Ju++YX/F43fbC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkhmzSDu; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkhmzSDu"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21680814d42so5494265ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 19:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736394634; x=1736999434; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lpgdpXTdEHzIeEtbhcBqaQ8chJjfy4KYtlOr7JwHaew=;
        b=NkhmzSDuUv4brB0EaW9Upg1QaaN1iNFIGpFIyFzzwjFsRoY09OALe9ahuqeWB3hBwL
         g8TKiaZyzo15Vp8T1GWL9F7YgOe7O3v6bDh6VDU4UBPFYpM6h3D/c18xkhcWlmQ4HkvM
         w3MGlQnq0clYAk/Q6aiNeOC++8mk5pSWRP9ygBMZREGdWb4gJhyhLtHFboZDEM5fV6ss
         krbTLqazWzRbVgA3aVTVUNaZ+6xia59dX73ArjoH90vBDvfHHrUZ5+11OaYPUcu2c2Gb
         +Bwh3DespKIQwMLkcpV3CE/i1A9I9MEUroRYXtwO4TqCgWO5lR6ifev8dETK6HQNEBAA
         BTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736394634; x=1736999434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lpgdpXTdEHzIeEtbhcBqaQ8chJjfy4KYtlOr7JwHaew=;
        b=sqExqP4/7NuwWqys9DsoEN4OndcddkOIw5znbvH3QjHK+8Bxp2SzhhD1JL/EqVzg/H
         n1ovFk2LJ0oQdYxOSZxnSdOdkS0RvZuyIpav6zslYfMcUowdkuA7IjttvqohdicWVSPY
         o8wfgGsVVk0QsQAQGz7jgokXm62/jl5kRZZeb/yydfEuLbXW7wXn8RJugsr/+3Lo9rDq
         YRfLnUgn4fZaK8WnpbCzyMm1SGTTCLI6bbdiYjRYlTmd1tQ7OQDv/D9xSrP+IFKL96my
         GZ1oL/B2ljWL8f/nwOYPIlGex2r7rkRrHgj/vGxBw+5woQjTxtdteb9Y5oELahfkMkFb
         0dIw==
X-Forwarded-Encrypted: i=1; AJvYcCXkziZzUMiuijhGDj45Alx8zQOts56x/QD97q7nTawnkrKWfu4dYW0oVJZeua0yCDILG4t+ZJMGuyC3xQ8ZVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVHeqU1r4eeR//gl26ZvJ0xMJAemsCSW0rbqwxvSyROummRA7X
	ncdcLFgGNBt25Tv28xsnP4FvViCoy5+1Yr0FrjpgBLqSKNN+I7k6bsihFG2CFfM=
X-Gm-Gg: ASbGnctJFe3L1AFE6JQZEr3PARMlclHPFyTpsBAtP4BDtdRYOtt6ebkO/m5WMSYbHwt
	KNPXQgtTZ+aQDDzS9n8G/PRUKkbfkVz7lMUFR3VtgTtcNUcbj3n94eJLYhkizItnFEi2YeaRZ6s
	Cenxb4v7jfUWrZbEp0RK4dA7afanP4CwVocs2pAvkpBmOzAQXH9KWQr8CtJSbWbkZuonVl5BewN
	vepnejrL8tBoaLnIXiiZP6IqvcNfNGbG1FP/b2z81M+Komm63SqMwKqFiI=
X-Google-Smtp-Source: AGHT+IFsHNdvQ1YeOjX/2zKq7r/5QBL2omM/xruCsyRaGOKjnVTYaIW2nrcHidJ2mDZ5vPOZXPqpUw==
X-Received: by 2002:a05:6a00:1255:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-72d21f4b05emr8649752b3a.8.1736394632952;
        Wed, 08 Jan 2025 19:50:32 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a317a07d050sm265068a12.15.2025.01.08.19.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 19:50:32 -0800 (PST)
Date: Thu, 9 Jan 2025 09:20:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Viresh Kumar <vireshk@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V6 00/15] Rust bindings for cpufreq and OPP core + sample
 driver
Message-ID: <20250109035029.3kr6ynlsfzslrong@vireshk-i7>
References: <cover.1736248242.git.viresh.kumar@linaro.org>
 <Z30UZwgN2nGtiTsK@pollux>
 <20250108052008.izm5ffzgrc45ms4x@vireshk-i7>
 <CANiq72krWF5a8cDJfwj4FxW7aJ2N5FD6zinFALsNAni3tmkcHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72krWF5a8cDJfwj4FxW7aJ2N5FD6zinFALsNAni3tmkcHg@mail.gmail.com>

On 08-01-25, 16:03, Miguel Ojeda wrote:
> On Wed, Jan 8, 2025 at 6:20 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 07-01-25, 12:47, Danilo Krummrich wrote:
> > > On Tue, Jan 07, 2025 at 04:51:33PM +0530, Viresh Kumar wrote:
> > > > I would like to get some of this (if not all) merged now into the rust/dev
> > >
> > > You mean rust-dev or staging/dev?
> >
> > Right.
> 
> I think something was missing there :) i.e. which one?

/facepalm

https://github.com/Rust-for-Linux/linux staging/dev

> In any case, for upstreaming eventually, then this should ideally go
> through the relevant maintainers. So I guess that means yourself in a
> few cases here.

Ahh, I thought they are all getting merged via the Rust tree. Sure I can take
them in once I manage to get Acks from you guys.

Thanks.

-- 
viresh
