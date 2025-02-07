Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2E21DC9A3
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Feb 2025 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738924996; cv=none; b=HG8RsN3b1PdqadJC5ygzp8j3hV9ZIt0h2K0i4U8Jc5NyguRwN8OGQlv0uKuiHOMHQStaFM+S74AQHBI1xEXyjl3SVa/bWzGAOlJREJGs9BmLcVX6VtpsN2MJ8Egb7Q+EjnDyWq1ZJJ7TfRhwoTXzmIHZFIzhIxXiufnUltU8rCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738924996; c=relaxed/simple;
	bh=hAoNykFyJ7QZhJYFf4N5rnUpO0uqECz17MfHTMXMUC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouehcxxZLoUxYP6ydB3NOJZdNrD16vdFare778nwwJcM1hx8fJgwdN681zKwLc8xcjKEApdw7xz3jhF9zFLZ0/iASU57gX75TTnaZWBrEZYtTCZDi83sUt5V5OBwNOcQODTr16vpZ5Ba+mbdJ4yddGFeXTrB9QjxxHbd3PcY2aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vnfPJdu7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vnfPJdu7"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f48ab13d5so23486205ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Feb 2025 02:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738924994; x=1739529794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g1GRWaZfYYbqC6/CdwihJesZg/YXxEXg0hSLoDojT10=;
        b=vnfPJdu7MsXDHg4E+P5wN6VqJIJQ4bNizNlTrqjj0EKHkJw2o7AANMm1iUJVtBDxql
         vchVkX8cyyp91Dg3LMll4Tr0kMj8cNcRI7kJGXruWl9177GkitVDtiEBfYhzpyetOYvp
         6U2jVjNQdCOUkUUlx2Is3QxwYoF8f7B/EwMal9xFP71geSFF7gTzsPOniYv5t5Z7VfOq
         8WJ8bNNdX6brp5a3c6jFqIjVFDhu2UkBH9uTwR0TcIDjJwoF73Tp86NCcwANA93eDNiv
         ho2tIc6IKVhl2dBRAYgStZw0+BTUmRBp2OrO5y/3eg04byd0L+ilsA6Jpz/rzEyosOHZ
         Ycag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738924994; x=1739529794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1GRWaZfYYbqC6/CdwihJesZg/YXxEXg0hSLoDojT10=;
        b=K5rByY0FAhYOtoWMoY37Mgq29YBbLN1tsK5y6k7bWPZaPb6vEkyTI95WfZUDpWn0Iq
         rAaBDAtHcw9x6VRA5C+6JQhy4mrE0EwfkOUyk+DMFbsjl03xANDGuG9Ythwln3qPi990
         31Vv+FKf6eDrPjjNlXmA2Wdk9Ovsauub4cc1RFWBvMmycjAUbeNX8FAxTgsaWoxguMz+
         2UWQXQBCFkMIhNYhN2tHI32TFzlQjQjAz9lNane/KmSijH3ub2n3qUB/ObKzPX8jD4zE
         E95g6Y/CdAg+vQb1is3JlyeVD9wplasP7R3vxMcY3YtXAQda/9SjQUOfrR8wU1qvRk/+
         1NNg==
X-Forwarded-Encrypted: i=1; AJvYcCXLnYzJ4tagWRW4peoL39y45b7rcVc/tEYclz2TkJiPbGC9VVNp6oFGGLMlBitVDSI2jHto3rPPLr+AIhhlkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjFw16G6hQttJOGLUtD7/FZQ1Ro0YQmKXJJD8XBzPqDTOmTg15
	Mt+7X4pxtm4P3qpfs+SrGS018+hLYpCdZbM+OYtOXID9C3iGSi8fB3r9K6LL80s=
X-Gm-Gg: ASbGncu4a5DW1e7KTCzLjueRBQB0tAzFvpxJbdyZbE1F3xV8D7Far+0HybFiEn+6tHM
	FfNhZMuhPFcha8V2Gl1aaLEaJhA3U/4vsdM9MeeyGgLnB+jOU3Dbud+Xyqb61jQNIe6ioz3wwk2
	tWfRxUkRoFHlFvIsq1f+yJwxjod3j3i5GeYkBkV/0+Ta+QNvC9e4gcPZa1U+NnJXXIKH1H5qpne
	kUpoY45crRdJYn7nAmY6/SRcfhMKcH8ktiskKny96q9g72ZV9lRqZxlP9IAfESlx6lBV9fcp4d4
	jsE8FCfpSe9xpFOTFg==
X-Google-Smtp-Source: AGHT+IG+GWLav9UJfqyQ68A1jcf3lhjRtJkvLA7MYkbHl336IPSn8Kmidgk/a94noG0INXD1mHf3Mw==
X-Received: by 2002:a17:902:ea0d:b0:21d:dae6:d956 with SMTP id d9443c01a7336-21f4e6e1eb8mr44938405ad.24.1738924994072;
        Fri, 07 Feb 2025 02:43:14 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653c997sm27289215ad.78.2025.02.07.02.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 02:43:13 -0800 (PST)
Date: Fri, 7 Feb 2025 16:13:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH V8 06/14] rust: Add bare minimal bindings for clk
 framework
Message-ID: <20250207104311.g2lexa75o26z6aox@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <c68081e18d939aefc7f6dac798df6b72e81bba4b.1738832118.git.viresh.kumar@linaro.org>
 <Z6ShsuLykigNscz8@pollux>
 <Z6SiiRubSXGInbgj@pollux>
 <0cd42d2d683ea057e6034978b02c7f84.sboyd@kernel.org>
 <Z6VBo51g54xAmelQ@cassiopeiae>
 <20250207092448.n5mzbt6lg6zqud4a@vireshk-i7>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207092448.n5mzbt6lg6zqud4a@vireshk-i7>

On 07-02-25, 14:54, Viresh Kumar wrote:
> On 07-02-25, 00:11, Danilo Krummrich wrote:
> > Guess this should be Opaque<bindings::clk>.
> 
> So it should be this now ?

Also, I should be using ARef and AlwaysRefCounted along with that ? I
am not sure if I can use those with the clk API. Yes, it is refcounted
but there is no direct way of incrementing the refcount unlike other
frameworks. clk_get() accepts a dev pointer and a char pointer,
whereas clk_put() accepts the clk pointer itself.

-- 
viresh
