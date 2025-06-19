Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595252B9B7
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 06:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315539; cv=none; b=hkQ4f99rlLFmwpj7yVfV6gmmctd+bVHPDiNMqtJcYHEgk49h1xd/cbAv+zK0DcidTiuPJntrAz5thMFR+HwZXBCiX+4A3YlSB1WNz3L29N1J7sXQfM/acb+r3t9ADcT8kFsXHi8t6zmRBnSeO+339lCAkzkZhPLD1Vy3h8QevYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315539; c=relaxed/simple;
	bh=+eaXs18pbIdN16VjbFQKb/82Ep6y4XInUcmQiPzMqeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPXjBj8yFgUdkf9QjWFeEIpAUUhajI04TLzH47dmc9Plro3Zq//K5fiq9fbKX9b7B4LpIDgxEJcbYAmhQ9HsScCkJPBtJ3n3hmk8eT2GuVL/u/nxtWDPmcoqYb0Pzx2LEnAaZl+rRm9Wpv9VQBC0XSIclCgsdX/uFpEXyy2NVHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hkoKGdU1; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkoKGdU1"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747c2cc3419so276514b3a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 23:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750315537; x=1750920337; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ErliHYPaGrgVEE/NGmtD/hd2ZJlTMAp3Vp1b/8FHHgk=;
        b=hkoKGdU13OY4Iw/aWO1ZtDgxoon4Us8wm1qV3TZ9LplmxbdVY33OJKwNJJM2wm1Pzz
         MYTMegM8u4PUVJGfznIDDD59S4u5iMOpl+uTZmlDi1YXAyqXLuVBIbRfCNTAGosishlK
         3MJlqu7Jeh3Mlu6rscioaO31Zf3OUTVQHKayN6l8cSisHRg7ry8ubOFK2dJ2bFg+e51i
         GElKWybjkIc/RQnXHgGDoU9v0Ao7Thr1Jm7zuAMseQX8lQtFOx/zbBg5K+JNVbLIByvh
         iOXMANgTgbQ9JXS/hkHHifWyvPLw6xltX37mK5Jv9e7htqHX/Th2wj3CF9MFN6lcIpcU
         lfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750315537; x=1750920337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErliHYPaGrgVEE/NGmtD/hd2ZJlTMAp3Vp1b/8FHHgk=;
        b=FAKuhYTZkMuvwNhMO16vcHVW4TiqNsjhXJGHr3jx2XRx4ZdKTZN8KKb/yd8Lq9dpN2
         7yz/a4ekutI3186ks1r+sakMp8oJOFl8XXS51eGFMEBciAkY1iXE/jqlrJsop0kDYxL0
         gl57gqkumbT0wBfOOZPbPHsgVy8bY+2kp/WFEvxderHIpXJwLNSMG4WAKRiMBylAZ6mS
         4yXyFM/kITAn61+5E7qMMLL3H25nlq3Kc6KjSahqa31CUecvQddk6XBNF0+0ea+rIO5W
         0KUKBW+W7VYXgnkI1o+su9PJ7pxRuIR+233W6pwBWAxA1abe17rMiObm5Sk66nzD4k0j
         F2/g==
X-Forwarded-Encrypted: i=1; AJvYcCXL5YZct/a1Df4jm5qL2GM7SmXrHyJV0lW4QwdBBoRTHNcNNRf8ZTFVQvC5SPbUjdTxC5j8DqpK31d/c2pCoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1P+DKKoFcZinDOjsjTVJfVQ563BzV012JY8I8JvUcAOMfig6w
	OGIe0UmRDBtqDislZC78Y/VlhNnZ7fS6+uBx4YvGWn1Y5c5xFH6tEXgPmHMEYeRis3I=
X-Gm-Gg: ASbGnctZl+LPqyGk5qhqwryKyzYy6BtzbQL17331/RgSz4KhlVwCU+TOvBbPgjhlnmH
	oFvZWV/A517Vrg7j6WORf1H9jVB4bobKFPhv+9vw9ObUrISDTkLM9WjjuLFo7rMy7g59NJlJM9X
	fVV0Kgk/6HxN/oRu4K6ncQYJsx6nkdpsQWFxx5AqCRPuohKsxScCXc2yHYBvhPVsA1Rur4DDhxB
	awi4Ey7MZWhLnNfwaWVxvrO0m0KOBxtj+7+cUWL5YSgaHLmC4xZBVzVnsNPxgFT4h7v7IffYGdP
	SpFkzAL+TOIycF3GYs2sx21FbTOJqjOk2+FO/FoFA/6Q8VATgLkNCwpevGibHgFtIShguTfmWw=
	=
X-Google-Smtp-Source: AGHT+IHIpRyDDmSazg/HxBTkiTvghcwJZ4JLLCka55/2JHWzaYB3i4/iq5jFfG6qzHy4OHiMpdt6Pw==
X-Received: by 2002:a05:6a21:6e4a:b0:215:dfd0:fd24 with SMTP id adf61e73a8af0-21fbd634a22mr33361216637.31.1750315537600;
        Wed, 18 Jun 2025 23:45:37 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe163a498sm10335555a12.15.2025.06.18.23.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 23:45:37 -0700 (PDT)
Date: Thu, 19 Jun 2025 12:15:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"gary@garyguo.net" <gary@garyguo.net>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
	"lossin@kernel.org" <lossin@kernel.org>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"tmgross@umich.edu" <tmgross@umich.edu>,
	"dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] Various improvements on clock abstractions
Message-ID: <20250619064534.nipg4rs2gwepxqw2@vireshk-i7>
References: <20250616200103.24245-1-work@onurozkan.dev>
 <CANiq72n0v7jinSyO85vorYRFB=y5NH5roW4xLRjwZz+DFJ5QSQ@mail.gmail.com>
 <42151750134012@mail.yandex.com>
 <CANiq72n3+qzDCCf0ct-5gtQHKXDbT2rr1fgxVQP4qBW69JmmhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n3+qzDCCf0ct-5gtQHKXDbT2rr1fgxVQP4qBW69JmmhA@mail.gmail.com>

On 17-06-25, 08:55, Miguel Ojeda wrote:
> On Tue, Jun 17, 2025 at 6:28 AM Onur Özkan <work@onurozkan.dev> wrote:
> >
> > Yes, it should be "Onur Özkan", sorry. Should I update that part and re-send the patch?
> 
> I would suggest to wait for other feedback, and then you can send a v2
> if needed.
> 
> > where my patch converts this into a single straight line which I think makes it more idiomatic.
> 
> Up to the maintainers :) So far we have both styles around.

I am okay with all the changes, the commit log can be improved as you mentioned
earlier.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
