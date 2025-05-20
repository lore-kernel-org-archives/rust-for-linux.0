Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82253257451
	for <rust-for-linux@vger.kernel.org>; Tue, 20 May 2025 06:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722244; cv=none; b=LZb3dYv0u2PVeE3/8zmnyKZEjyQ9elHkJlbC6XNRKnCmzbEaivk54E43uoyK/ZUy3rfUHU+zcnRSbN53xKtoeKP4CwMxLwEW4KwCKe0DLcP8EHRaA4aT+MeemOCc9iznocz/+N8IDZ8OUS6QfXB2y/2MArXwfdYu6Es7MWkixXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722244; c=relaxed/simple;
	bh=OErLSkE/m1BgaO00NjK5OW2PuAYt7QDHMHCcdsySpeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7PrsLhi25R0Mkmq3gWuhTMVhHeem1p9N23JD1AyJZSGMibTjWC62UR3UqySGebNw6Pqye+DkQvxf54BQhm6Hxwb0ABy+W1bGkJLhLRVIXIq/zTx25CF2hYnrmSEvvcVUEL7WIE7ZjHzSncFI5/gagQV/iaecUOSY71b/uTZTQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xxvDIST9; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xxvDIST9"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30e9a44dbb9so4125165a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 23:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747722243; x=1748327043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOOxKXVW+mfOfzJmAX4sL2q7PTCJ7BSmtyABQv/dOSg=;
        b=xxvDIST98ZmUGClwtCZ1V8zaW6UkaSftWh70vM+tKUL5mKWJNVXfO+hWqXglXNR2pZ
         uy5c8IyRLbUyJdN7vuDdOOisyG6NCChfVX/38mQ4jje8kDpbx3zNB3eEa+26GF6uaoqO
         nkpcmhJ6I6HZePUwE1m1vpHRgyC5iu+G5hn440eWjwa4URvNlt0CkpqthPxQVA53oMEw
         liLGTmFMdGqi9ESszqHbFfdVZ4fWU89FF/ZSC25c3BflElXOw6BTJYR/F5hDEp2hnZqv
         nshJ5t6BwkN4DXHf49j788sSJbZDjKQAW5xyjU5Izh3ZpRI/1WjGvwxhAfw6Tdpwiyan
         hpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747722243; x=1748327043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOOxKXVW+mfOfzJmAX4sL2q7PTCJ7BSmtyABQv/dOSg=;
        b=T4YyL1I+QNwFJlI8QN2oZQ4maqZnYdDvWpFibQXN40M0DI+IO7NHDJPUATAcVtz24O
         Z4Lg54hMsiJu48RCVMF4TEKqCTashvAldh3ceLvXVUUz77h933grO+IMGxha3GeoRTI8
         xsSVvLtRIff2D/Jajzy1VsPJk0R8LMxvgCiyn0z8rqZJYJWg6z3/YwoL1f9zN8c3h32/
         zbo3wMHis+f/jdJzRmMP6SrCzrGQi4UZKXk2q9p8o5d9VG8EfWb63FP7IhgywCnPjm6k
         5Jo1CWrk1CynDaQti2dwJwiGl6ZLkrXSDzejL7saO+sNXpaREAEk8HNNpXAs6iNq/EwJ
         ++1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV06v4JU/o368wdisSHLfmvhFKj5/Z5QsJmoGOGaNyWqxV0TnSpAGayFh3d/LVDM//daFX5L8W6Mt5y/yna0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU/QUX1BQgcPjeFCP5vPHLT/uHSbG8d4nngi0mhoMpgBMUA3OT
	Y1rGWzgOiHq5KWtWlIp5eURcvLKbD+2g+UG5CnB8AsiwlAAeLqQ2rKLlZ2rod5+4M7A=
X-Gm-Gg: ASbGnctKp9cu9XnmHBpbYWnZyftGyBz/tjji1krIzPB9PGArTNpZaldxwC+T729i4Vt
	sO1DQuVwX/L+oHnK+W43zVyJ35ollSrWE8pjNXgnPn6R4+7uck3xABdVWUyIJqRLRjIoEig77qv
	YwJhaRErzIcIDBGFI+uUshAiURomG9OhtTRk1SYmEQfFvFjcDE5aVeEJ35vL49Jo3bxs52XEtnz
	rjgTNbqxfz66NDMGkMKMvGMJ32MGaju5t7TnGAewLRHnaRS7d6T2LQjbmMSLT1wadNvTf8NTLy2
	avC8ZzhPlcChfiQCtXbNA8AhVga5EcBTK5v0zgsluYb0RwGaSRwC
X-Google-Smtp-Source: AGHT+IHX+LQFIfZztGFcwBpfpATN8GuvitXJDkA2u+hyNtGRg1r5lgWVjoOyMg8lPkAa6aTJv5nQeA==
X-Received: by 2002:a17:90b:394d:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-30e7d5bb433mr28527339a91.33.1747722242148;
        Mon, 19 May 2025 23:24:02 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36515776sm934684a91.48.2025.05.19.23.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:24:01 -0700 (PDT)
Date: Tue, 20 May 2025 11:53:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>, Viresh Kumar <vireshk@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Andrew Ballance <andrewjballance@gmail.com>,
	Anisse Astier <anisse@astier.eu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12 00/15] Rust abstractions for clk, cpumask, cpufreq,
 OPP
Message-ID: <20250520062359.paojvjytle4yznpz@vireshk-i7>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1747634382.git.viresh.kumar@linaro.org>

On 19-05-25, 12:37, Viresh Kumar wrote:
> I have queued this up for v6.16-rc1, will merge it via the PM tree soon.
> Thanks.

Sent for inclusion in the PM tree for 6.16. Thanks everyone for
reviewing the work.

https://lore.kernel.org/all/20250520061944.pl3mqw2clo2roe3s@vireshk-i7/

-- 
viresh
