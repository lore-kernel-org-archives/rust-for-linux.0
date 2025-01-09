Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE3E207E01
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 04:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736397682; cv=none; b=qGCoEIjV4G3iPSVAQs8OJDupMbBJnwfJGeggL1aDhA85Lmo/WhxbZFCg5KS1jUDH/hBnY70GQmVqtR4xLkHHxG5nZYTfV+34NWtUON6699OcrgGvgVw39MNgcRoQcR4FN4WCKFk3zfYX7kYRMMrtYrg5HHuLIUjqflfvetrdbHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736397682; c=relaxed/simple;
	bh=/Rx0kO+7HHbNEJuz8HN4MJgSaQfoddGrDifWc+pMkZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzc+Ic0m1mfLReXpx/J9XujccdTV7jPvOUmi9vJAMRMv7erDFet0NIIX5DXxDFPVVr+tSl/sQ+2PFTKO/tN2AZIsrwUzUdB5SxEn0FmR0JS2cLFzd0wAnotNC4XfkGYnqnLuOA41q7rtfJ0/bKJUi1RWcoOPW8luilClvW6SN8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9IuM6qR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9IuM6qR"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21669fd5c7cso6649265ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 20:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736397681; x=1737002481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I+c3hHahLgLIKv6ApkF3a+1E3rNrUyMG5vSbCOT6lIk=;
        b=E9IuM6qRhEpENzdfqpKT5L/oARJN/3Dd19tgpq2e9EhFDrsDkNJOFrP4DOazYTS2EG
         R8/GXkmb+VKCQeG8jWITkV6jRRitp+9N6CtlOpWOR0ItkRpcT3CiCrTGagEwrISC862o
         WG2OM+5/84EDdrfHunzQOWIys+qsE//AX7oFqCPMbgwvTdZ7hrgdV+I9Ah+7/jM34R8q
         aeGGN8fc/5oyKZJi+jKNATosrSA422BTmjw/GSsHxnIlCBTJS8AhPje75kearOHVtwet
         eyIXIZgghfaS7FRfL3K5TkUKb+8wamwWci6RKqVAcKicgtDTQtKO9gg8WsQBrpKN1XGm
         POHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736397681; x=1737002481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+c3hHahLgLIKv6ApkF3a+1E3rNrUyMG5vSbCOT6lIk=;
        b=giy3WGNguVLD+V4b4eMEqoB/N0VC2pU/RQhVgHESIsLsfPI+r/sX5/PmHjvDmJMhCM
         BXXjZ82rnlo8Ab/MiGvgWXiEnbqq8HL3mSDevPGUiYlv4tAsPEBIGZn7O71SWW2mIrsm
         C5FWOrWR9F6/kQ7oC7ws8J37+LIPA6xcacp/1AQhomHIZKBjf+x/POuP3s+7KxgI1fn/
         AuVbA3Dn+fq5jwKYrl483S8Mrf3cEhKOXn08kaLRH5LC0slMh7nE/deTqtIQy3z38Vw1
         s4ayg6Bq0bM8MEJrRG6EWo425lg+H6Poe3605sD9oY1sdQbLlOczHy8GZ1VMuVG0m7VC
         TCng==
X-Forwarded-Encrypted: i=1; AJvYcCX9N4JK5J2RKlpxu3PBZJKbyFR7ahIWu5b/XEcetgsyZf8sUOiXbmAG6atW/GGsWvU72C/rAM8M4ENSwIehKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo7UJB9839hbi+s19QR576A1RP8FeHy0GUXOzqcjmFil8O05o6
	BYGVNiwE77DJZQQG/ZqF966cjNII7kQwffsAY0hEQW5BKeVZXRNFUJ9HW4SlLRI=
X-Gm-Gg: ASbGncvq+0+KnYYALrTTSOL1ETcjSEke2UJJacgSsfmRHNgMaV8hNi6chpFUmoemJ+L
	RbtjrsQEfrkDGOem5VBORlOh/SmVXwrnvtVOUXPqtrGqLxadXsPkAyodPI+h4dQpujW/YA9jIEC
	eerkSs2pQ48tDxb5loEWttAeCnM52NNFsDcsa75qyNC9nwnpbKIoBHVYHL6cNBbDcoKjO6ryg0m
	v825VJYGCwu5J3vQTUdvF37Lvi4fi36TofbtpMlNrKPro4DoB1xG6UxirY=
X-Google-Smtp-Source: AGHT+IEByTbi+ZfgdtinMM/71amE6izTac57ioZTlWWNLqV4D8ZJA57oCRe8JW93t/AikssAzYHE5w==
X-Received: by 2002:a05:6a20:c705:b0:1e2:2e4:689a with SMTP id adf61e73a8af0-1e88d0f2ecfmr9181952637.41.1736397680848;
        Wed, 08 Jan 2025 20:41:20 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d5047fd3sm308901a12.64.2025.01.08.20.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 20:41:20 -0800 (PST)
Date: Thu, 9 Jan 2025 10:11:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V6 02/15] cpufreq: Add cpufreq_table_len()
Message-ID: <20250109044117.s5s4dlmssamwicew@vireshk-i7>
References: <cover.1736248242.git.viresh.kumar@linaro.org>
 <867ba9728179ba21ff8f8aca97d416b72ccd63d9.1736248242.git.viresh.kumar@linaro.org>
 <2025010727-banner-monday-1941@gregkh>
 <20250108111253.tg6ixurijf2dvptx@vireshk-i7>
 <2025010855-cargo-quickness-a08f@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025010855-cargo-quickness-a08f@gregkh>

On 08-01-25, 12:50, Greg KH wrote:
> Odd, why can't Rust also know where CPUFREQ_TABLE_END is?  Why do you
> have to do extra work here?  That feels wrong.

Well, it can, sure.

The freq table the Rust code receives is part of the C code:
bindings::cpufreq_frequency_table. Since it is a C managed pointer, I thought it
is better to do the parsing in C code itself. In case the implementation of the
struct changes in future (unlikely though), we would only need to fix the C code
and not Rust, which looks to be the right expectation.

-- 
viresh
