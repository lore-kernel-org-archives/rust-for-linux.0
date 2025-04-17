Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90A722DFB2
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877305; cv=none; b=qwh0CWJDU8V1DykUFPm4Fg4xQAuh/thJwIMd7Ha0jhPLYxRj+6y4nlqrdCEmNOr6x2t4Fx3kSIUz2R/D7Vw10mfVyotpnjWkSUIepCO4awB98g5Lb1yjMvn2Tjdif6xnIO/bnF9KIjBHAYtJH6UuafBLiYA+hHaZ+ya+/XLycbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877305; c=relaxed/simple;
	bh=4cF367okumOtMyrY+/1TraFd2LxC9LrQ9zF2MGTBNSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFYKS74sOEi4mY08sdeqWunEdVLBA+1w7csIvMRgTlK/zroz2yfiAAmNhgePDfzNzABROvYvsETq5lr0KH2RvLdgVQA986Cb/vLUqIBDD1Y3sBsL2E+t++qRrXSRF6LYy+CcGabr94bLY7lgMOkRrZGhokCpOvNk4VitGsfNtOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XIW1+F8c; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XIW1+F8c"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227a8cdd241so6454535ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744877303; x=1745482103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEswYqyGTpfH/GkJDbyZKkriSMlUpRORadm4MA53jxA=;
        b=XIW1+F8c/RmcAocej3ZzD/IboDijfcNsukkc252fAakXKYywZFa/q2sUDPMMo6QGsW
         hfY8sCcvw6b2ucsIWaiHuM7pL7zLTqhIigZW3ic20aeAP8X7/HA9DRCcXqApUgkSaWgP
         Nx38T7la54YWktmAKPRLyuRgDpxzmUu3foag4V/T7HSYau/Gm2OoeeB6j9UPZhWYTT/8
         Pu3ftnaOKwX3T3VOvxP6fKutbHCIIw244Rp48wf+FDmNZpxLkHsJgZ2N2qbxUi9me+/U
         gETu6hHk//hz5i8ZsDoQKVZ5Q4biGenvnIfWiQ+RKFtWxc7h78dYdJYO4CONmPsaMlWN
         l/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877303; x=1745482103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEswYqyGTpfH/GkJDbyZKkriSMlUpRORadm4MA53jxA=;
        b=N8wppfQIvKgHjdafmqrPRBB1rL2Jq9V9bUofTpNFNK5d6EOfI5NYo2Jz60v/hxdo5U
         OEOmyv8+HSxUJTw87F/Nov7XT1hJ8I44HHdiVxxJZHErsfHTG7PMKsyAEvIJl2KHOdX3
         w/7e2H3KKWUH09NBZSOSyIzyzpuMCJXKeyB5o98yvp9AKeYq89xuBcyEmp2m0huxoor3
         p4QaZKsusZMiHdorPHeDwAo7UqNbIIUuH9V2hqhfHpek6oGfgq6rAc8lpkNBkcbzCX9p
         8TSxLNXEgkAGcJ+e1LAAWyDZnayuc7zQn6sUrjrRlZV3011kEg/VMXmGzE+ykwaoV1fE
         fXCw==
X-Forwarded-Encrypted: i=1; AJvYcCVwCe5SAfopu1pgvs5rKYo9qgfyyd15KxRDxnL/GxOzwfpXdl9ovIHzd4r1VJzyOe4YBSn7ckQbcOnvUufIZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZmisB6Rh3lwOV4PoKVim+HuOlBFyYrikNETT4B3ZAdT9gg36M
	liQ0MqgXeV1D7cFHCu6QKipfGUUX2p65fDbw7DI555bX2QAiSihhluFa4fl6kI0=
X-Gm-Gg: ASbGnctO+kOwxHhor5icbofOyLKVBaN84D9QR2d87wPK7YEYWdJF0MnYQ64ee6qmqUa
	C49s0BTJi/3vAisJrvE2Xu0IaPf7jKp5X8RhszGUgksKAv9te7s/tqWGKh/hzIYpu7XXvG/FQ90
	ug02akMe6DP8+o6kz6aIkR3N9BrbnpWaDHyR2P/VxMTWQ4HQj2QUd9dPCalgLypItrGe9wZnoea
	iKKcEaMfzSCFwyqOiaksGvnq1eKCpr70wjsm4GIFUjeg9h+P0PZ5gtu8wD7ulbf4Lgg5OZwnVMf
	c10oW/iTDCruBwyONxAr8NUM0Pz4KsOgAXqcLtHruw==
X-Google-Smtp-Source: AGHT+IGbQUi7VXIrD1diQICyOW/Hg7ynTMZy+UxNRxvbnJKiuF+BWnPMCK+kOiADSqf+l9bWIgL3Uw==
X-Received: by 2002:a17:903:3d06:b0:220:c164:6ee1 with SMTP id d9443c01a7336-22c3596beebmr89236705ad.32.1744877303213;
        Thu, 17 Apr 2025 01:08:23 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe98d9sm27413715ad.250.2025.04.17.01.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:08:22 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:38:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 11/15] rust: cpufreq: Add initial abstractions for
 cpufreq framework
Message-ID: <20250417080820.zl4354gsmlmup4lv@vireshk-i7>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
 <ac6854885277b23f100c6033fab51a080cdb70eb.1744783509.git.viresh.kumar@linaro.org>
 <Z_904KuBhKbO738_@pollux>
 <20250416093720.5nigxsirbvyiumcv@vireshk-i7>
 <D98R7PHH6TYX.2DUASKIXS5F8W@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D98R7PHH6TYX.2DUASKIXS5F8W@proton.me>

On 17-04-25, 08:00, Benno Lossin wrote:
> In the future, instead of using `allow`, you can try to use `expect`. It
> will warn, when the code is used.

Sure. Thanks.

-- 
viresh
