Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D88825C81C
	for <rust-for-linux@vger.kernel.org>; Tue, 20 May 2025 06:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722141; cv=none; b=iaocmSOZtyRzqc6xZG1wzQMEAREIZCK7Gpz/y8rI2Xv+3wTAnHomGIDVg7OyrE8ZoJQ0gStV/sGsaXQqORZzWWJHPhRLXOkW6XSeFpqXJ2tK9ivTh0kIh7vvBuNaLIQItWyShHaVAb7EkclgAO8vhnn40gqPb0HJ8GMOGUCJqoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722141; c=relaxed/simple;
	bh=B/X6KNDiCJa6ANQuk/d5rOGAHgPZdwkWQandSI2PQck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+KXQ28tqwlIwIxf+F/l1nTbmYSli/K/FE/woRAsOst2fOcdHmfL7dUuTCuRrR3/Hv0oknX0wTS/V6NJh3IG6Ou6F+ynW6B4QRNCvFBSHlSILx8SNUleVw4Og2iGXGOhhBkiLiszAL85eJgGdnuwZRPunfwk2LMq4+2nJYx6UPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SU4QjGgK; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SU4QjGgK"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22d95f0dda4so56103255ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 23:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747722139; x=1748326939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HrOBdBL/ajwXK2WrufVyFeTUDJmhOQ5UWLvVqOesTt0=;
        b=SU4QjGgKN3wg9epxAawEM9OWJgzIxLhjEF7cH8MYUxPjfNSQczKVMzaJYTg5Zw2s+i
         PRx8sCUwKmJz2rRK6KGvgs79JAeuttnjh4HjyQytURxmkvxiBXIR0VbfzuBEEWkaAWIR
         JjId95bnOLTIU4g92JBE5R+l96SRKkpxBLkgYX3HVACBQtg/uIVYi7bh4bthP4yYis/+
         vki2IRJ73Xqn366iJYf4++9XdG1vLAb3h0dzUOi5H7x29Lg54PlvJwLx6XsjtagitPTv
         FM6Q/QMKQuz8ABN0KfyfwEPK2Sr+3Jt12wlnY2gCWzFWu7BWj4WsOHcXmkW3kla7UHIO
         tqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747722139; x=1748326939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrOBdBL/ajwXK2WrufVyFeTUDJmhOQ5UWLvVqOesTt0=;
        b=j6I9/vhr+LAwpzUvMjuSv8uZWKwEAE/+kzNXGQlVAS0+sklnWGVABe203H11j9mvfV
         rmh73C4bNfa//t1WmcbiCN6+fv2QNlgXgL9QT9KVJ8U8jpHMjpFo602KMzU/E+1BkHu2
         cHJGPBD4eFmF6lPx5JFbpHebuYipmoFk0dXnBPSjTRIOU1Qou6DTCLFvnn+qEfaN8yjG
         dZkNTgGqXQ+LDO/cZxFQxoUY/RVW2HioKezaZSVo1aFkPZVL0x8jp9Y6p5cQokxAX0Pp
         acwlj2tX1TcG4PevmV/6D4GE16yiidEjyAImkXhbf7tvObVuKdfL/hzemUlX7WGzkBSC
         vNYA==
X-Forwarded-Encrypted: i=1; AJvYcCU9cqJKPJsxmzPAf5FoccLsVcVWobBzmdNVCUET3F9fQzKcNIrwALHJ4lxMWAcDXuGr2D+SxJoLkbTN/td7ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx95X7k/HA+J3IPSNeAwJzbEjjHMZkBtv7Ur1Pok5Nh3Wz6bPyo
	tjP+J1Rk++Q6XMZB105oSlhE50PGllxtqgq+68+4asxmPLm2iT9EgXPoqgW7ET8ZGWs=
X-Gm-Gg: ASbGncu4BSprSaJ1gu76mj60In2ocL1HsmKnNdldjWa1Dg+ikpbOsaFZBv/Z4+dQspz
	mhCkwMaq37KGnMiHIzViEjArglojqkU+XgQwAJ04UXhBhb+nkc0NVyMwZLH7aAf95w2rrC920rQ
	yCi90Rf/omgwDKpBfs7fRxWCTowRjv7IKzh3S5/vp6PUlsBzlcVDUC8r2By3i3V/sRXeWVO7LfA
	nOVzirf7HoCGz3IiEqSuF/D2yz3387Tm6g4nU9Yf3WLgBE2dVc9ozW9ZmE+n72VMAaDU3A5PP8e
	cWnCvGRqgboiT3g0SiBeLwa2hdbXhN9VUlYK4I4Z061WmDaiTbIl
X-Google-Smtp-Source: AGHT+IHqX4UIh9iZKFgN3Ay/GR1l8mxNVHiGVA+Xwyg70cgbG5KGI7VYQskHB7LBusRKk6dj1H1mWQ==
X-Received: by 2002:a17:902:e801:b0:22e:4cae:5958 with SMTP id d9443c01a7336-231d44f6bffmr191916275ad.18.1747722138909;
        Mon, 19 May 2025 23:22:18 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-232044a59casm51435295ad.244.2025.05.19.23.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:22:18 -0700 (PDT)
Date: Tue, 20 May 2025 11:52:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anisse Astier <anisse@astier.eu>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12 06/15] rust: macros: enable use of hyphens in module
 names
Message-ID: <20250520062216.7lyqzvhv4mgzoudl@vireshk-i7>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
 <21b4c30db60f22d56cc6386a18564705ad3a6f4a.1747634382.git.viresh.kumar@linaro.org>
 <CANiq72mNHYKXcDm6DiB=69W0w8pZ1KhqeARqqKBK_s01PPRsmQ@mail.gmail.com>
 <20250520043355.wjkrslnripaqj6mm@vireshk-i7>
 <e8a404b2-4ec6-4e1d-a973-15684676e870@app.fastmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8a404b2-4ec6-4e1d-a973-15684676e870@app.fastmail.com>

On 20-05-25, 08:13, Anisse Astier wrote:
> Thank you Viresh for iterating on this and picking up review
> comments. Do not hesitate to add your Co-developed-by.

I haven't added Co-developed-by, but I did mention the changes I have
made in the cover-letter. This is all your work and thanks a lot for
this patch. I was struggling with this for quite some time and was
desperately looking for help :)

-- 
viresh
