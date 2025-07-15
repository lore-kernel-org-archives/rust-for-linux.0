Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EFE1DB95E
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 03:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752548783; cv=none; b=m7137QIb9b0FteEHsifNqaFDfe0GaIJCjD3Wbewt1JYY4IDbFvDuizciLc+0QkmMkg0Uu0qE3WKgxb90cis7q/tUrInatHvq19U2zyAtLjHQlrA9SgtG4Mv7vpZeCLJjG5E51kKsdU7JJPUMKhiUSwbPlvCkKTgOVFgNzLh/EVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752548783; c=relaxed/simple;
	bh=mdcR6VzA1y3ydE/dNUPQr44ycL2PjID27Z2ee89DxoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcYeg07RSBat2e1HPyP+8nkwdWZSBpb9tk6OZAHoU6sb3Isz78rt2TmWCOF2hZarb2OKpJTR6x0t3KAxJnD0w7uQGXd4g4+4KVJsSRnYq1+w/AwFsz1T+xSg06y3zA2BhiyNCwHKhJ3WsLL/4Fqw1JiT/wZ2sIQ8yMXP9FYJcGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCvEW/5r; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCvEW/5r"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b3bad2f99f5so3930373a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Jul 2025 20:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752548781; x=1753153581; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Q49+jBq0n+KhvM5tkCOlcThaB4jtnmKLs0K74l42yk=;
        b=UCvEW/5rZFm3L9J3RI4c72AsqohkjB8GR73De6J9cWIxHfQfCUEXrX9Uu5O8rVpEZS
         Th3RWJZz8iIocZQPk1Zl1AV9Dh93jOuqAvAiFwjGvgr2cD6RMYqqSwKy9bmHA0nLZpMn
         4lyB9swxq9LeLxueIGGepbyl0e+P/NuAahvjUjse3DfiFbpTO/3Rhvao7X1mvdT6+BGJ
         /YKv7GWBu14WX6RhjEovgItemkB1WeTR3uEtW+STPGAwBmVu8tneMmLuGtuqiMDI4Xp9
         PPzqBQ/LzJ1bX8MIt0KGe3hxN4luMujpk7wI0M4g6jNCEID0VbFLHbc9QWkIwuQFzCQB
         BmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752548781; x=1753153581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Q49+jBq0n+KhvM5tkCOlcThaB4jtnmKLs0K74l42yk=;
        b=HR606+2kttJ3t7NODrzwxK9ZV0LWyBn1LXqu/cPoVXcB2Vmjl2tbJIfDpktCxEU4P3
         CLI83Dt2DIdOdsEVBcYsgH7SoxE3hizUSI6muLvMro8dH3UyQQxYP59CGomImjoLH/3c
         B0FfIGTVzY1xnoHJ1poDO/TKS9RbOA6pmDTousyoKHWogVfTExsBjmlYMEa9C4hU2LNW
         joh4WVHF6AOSfBrjF1fSeoaWdmFvV9h+Rd3I+yOd8SVhsUEPK5OfsbHkgZPpOlgly6oq
         MfHK/sCaDCUn5DdlhsBESta+d0WChMGqfLHRurq20X/obrx/Fr4dWuFvnjksEwd4IXSE
         jtvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYlsR91mbmlmBZdXTzPAoy4I0DSDf3h6ozok0AIXquY6aeaxy+ZwXvmsWrczUk7eHuJXeNBMy0YveL50wk4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+5qGnGTJVyOj+CPmPGRDhhvUAQ7CYf1CH5R2AGeuvIjT7usr3
	qEo3sd0ky64DFp4kMZ/2ZQMXmqQPkQJH29CMO7muiStlePdDoMfjmwUkubl23PnHluc=
X-Gm-Gg: ASbGncslX+EWV7sgsQBVnxRRPvHiz/A4TBdqVX2FJsyiQVJ+ySb7f3inprsu9cA6hqB
	mqtezC8JyqxwksqgDBjSarMnTDfnb1I7YbG9rOlrkMsl+AMNiAGnJqvWEUCLD8QCjxIi7H2yleZ
	FSWsCr9ylpm2xoeQr+P/GNs3qXXepX4Kxkm1ygChFYgrSD5t4cW+6e0H4P5OHMc/WzDR5kLHbcD
	nqSf8IxqkZB/yXxCI8d1uibn4rg0xEam0bMV1Lv0J/4X4NAdlrSr3oBehhK6d+elhtHMg86x0AV
	mTovleD+/ZhvjQHknCZH3x8vRioV+MornaQWLJyQBdtHo3BWLtx1noBXzLJOBDcm7YfOdcCzqlB
	ODM5gM70q00sZ52IfesG3AfI=
X-Google-Smtp-Source: AGHT+IEql4O65bX6tpWfTBLX9vUYHs9CktWCv9wPJNzqxkxP3ptffD3nnEZgTYdA1h+g25fPYhyXSg==
X-Received: by 2002:a17:902:c405:b0:236:71a5:4417 with SMTP id d9443c01a7336-23e1a425e85mr28454745ad.5.1752548781454;
        Mon, 14 Jul 2025 20:06:21 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe52ecd1sm10862745a12.12.2025.07.14.20.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 20:06:20 -0700 (PDT)
Date: Tue, 15 Jul 2025 08:36:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ritvik Gupta <ritvikfoss@gmail.com>, yury.norov@gmail.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org, Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: cpumask: Replace `MaybeUninit` and
 `mem::zeroed` with `Opaque` APIs
Message-ID: <20250715030618.ljqvviloypmfixfq@vireshk-i7>
References: <20250713190244.143286-1-ritvikfoss@gmail.com>
 <20250714045418.4ajeuetnjor4nhau@vireshk-i7>
 <CANiq72nYqOGx7FEfMyp_8VnpZargzZ0uannbO9VMCk=kiEbd=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nYqOGx7FEfMyp_8VnpZargzZ0uannbO9VMCk=kiEbd=g@mail.gmail.com>

On 14-07-25, 18:53, Miguel Ojeda wrote:
> On Mon, Jul 14, 2025 at 6:54 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Wouldn't this go via your `pm` tree to Rafael? Or am I confused?

Applied now.

I manage pull requests for cpufreq and OPP normally. I had to to
cpumask, clk, etc., as dependencies for my Rust stuff but I am not
sure about what's the best way to get them merged.

For now I can take this one though.

-- 
viresh
