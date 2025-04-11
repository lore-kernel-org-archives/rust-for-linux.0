Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CA31F03C4
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Apr 2025 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355387; cv=none; b=LPMEyw4SC56RGbbD50lhxKiLbPjPS6E6E5w0rX14e+5lQLK6SD0jCbPbZZDLr06EMWK03swUmjkYTJkrf477gcejT+zA0RCLg+JpRytsPMHaKzWx90auLixDwgpzWO5ULYzVNvt8cYnoQM4WCYHgbEEh1fW1qINdJAdptXhCbNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355387; c=relaxed/simple;
	bh=2HKkKC82etiMsqe1ATwTtzyBnGYDYBFXiV6zeDl4Fys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7ExCuhyxSUi2IY4SByx5POXNKZda5O/yEvD9YT7/OPs6jSa8oIYGD8J63k7KiKeaJA+INSB8GfWegepN5+5/ZBDkCi4tF2diCNzID45g9T8Vq4VdlixhYb66XfgjPbdxXAIPvfMwAfKrau/ApBwBj2TmeJYSHQtCwm2OOK7RUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n9xMDIBd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9xMDIBd"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22580c9ee0aso17629835ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Apr 2025 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744355385; x=1744960185; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SsaZNHdeANXtSEjMxf+DUvyz9Eisyu48b8JNmNeFVJQ=;
        b=n9xMDIBd9w69awd+45JOJMBrruaUOV93mNs/5WEnq/vQcIT3OsRurowehVFGSez8ZR
         CRb73DMes08+Z7yTPV5MaoeGoLiakUEhfjol1XCt5OCZ9dTpBexoPOKy18O+ChkzODY+
         sHpS61CFZElGq5MWFbnv5cIzX1GCBTZ4qvHKVCy5CiDUfiD+U19uqdVH2RnNi346s6ew
         h2i9V8UMMf9349e66iR0ZEGdpdjOHEmXj/7ZQZkeyljxqo2PQ3b6X1YI7W53kqzWH52a
         /lVb92Zij+eIj8x/Mp1nwR/qMxR77XeuhpVqNSE6J99po16+ffI4W4rwVX/75HscTn+O
         cs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744355385; x=1744960185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsaZNHdeANXtSEjMxf+DUvyz9Eisyu48b8JNmNeFVJQ=;
        b=Wh29/aZouu2rj/bInJO/TwLnxfnMbHb3jCwV0KolT3Gp9B+NwPXtB6Xf8MK3t0qitU
         7bJ3jr/LUTbXfXJ/uX0cg1fzwVTJEMCRlVFc/4JA6v77qe89u2uPMvaKW6SAraZsNHa6
         spKQm6kLvinAVTZCYFlhUsw66XWoYfX4YyAc0Z+XrpnoXY8/riBamGGkKApvhAydHztj
         3XHKrrvv6tIXOPmxx1xSNBEgKTTHwdH+RQoSmGO9O7Euug42TUXU7NPPIpY7SuFqufFB
         nxvftYlIMpgkP4b7mDeWv7X4IJO6Q5CZqXtnwF6dBqCr+6kSice3PkhkXTto3eF4IdU6
         2ihQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE++eQxb6bOfxUSC01bB/Hz/e+b2k6NrkBPlVbKMLV3wWCqqJiYBZOs8Nzn9c8pdEP7v5QjIv9/M9XiOlljQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68x11LZgSOqeAOoFpKiyPP8KdzgUnpWddIGe/68X2GOcYn2j4
	EfA47wyS+0RKEAMijB3oTdEd2g7yQUevpjhJs79n8HEpupYKmyOISMB2RBVMxeY=
X-Gm-Gg: ASbGncsA3VRHWb1qvarpllVGG6qxEOYmq2Dnx6Byo0vagqSHAZI+7XR5KvaeIygXyp1
	OZTvsuxWMapqo7mp4hLi80O2iHwnwxpXPZ3idm8U01dGRb27wavvbdObnyFqYAS5IaNnclacgch
	BD0VJQAOLWGaGqCpwBDcQAhhUs94a6U/MOeKxOdmAbaS9tRtBkro1Thlgc9rFhfgGtweetSHN64
	Ln/qB1ggivGoX0RXzsJyiUpFYqT8iN0zWCEqH/paJ8MkDo16+8Zmdkd+S8J4P8Xu7BUk9Te0MFq
	giIkRNnSor7V+ndlZQnpQhdxa92ISc2MbiEPoEoZS9+4ydRP7iJO
X-Google-Smtp-Source: AGHT+IHQQmLLJrkqWF9B7mkZc3DCkY3lsb5cw00cICBBOVuQHLOx7UsWGycFoczOYNtiuWWk6Tj2Mg==
X-Received: by 2002:a17:903:22c4:b0:224:a74:28d2 with SMTP id d9443c01a7336-22bea4c6cbcmr24391065ad.26.1744355384775;
        Fri, 11 Apr 2025 00:09:44 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb569sm42002035ad.225.2025.04.11.00.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:09:43 -0700 (PDT)
Date: Fri, 11 Apr 2025 12:39:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH V4 1/2] rust: Add initial cpumask abstractions
Message-ID: <20250411070941.6xbz4lrwkejr3aqf@vireshk-i7>
References: <cover.1743572195.git.viresh.kumar@linaro.org>
 <35f4223be4a51139348fed82420481b370d7b1db.1743572195.git.viresh.kumar@linaro.org>
 <Z-1b_FkYUJEIj-YW@thinkpad>
 <CACQBu=WMu_CmzERJAHmjiuQ-NZe6DK2kAkvP0cnFN-Y+QhRwvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACQBu=WMu_CmzERJAHmjiuQ-NZe6DK2kAkvP0cnFN-Y+QhRwvg@mail.gmail.com>

On 02-04-25, 18:00, Burak Emir wrote:
> On Wed, Apr 2, 2025 at 5:47 PM Yury Norov <yury.norov@gmail.com> wrote:
> > On Wed, Apr 02, 2025 at 11:08:42AM +0530, Viresh Kumar wrote:
> > > +    pub fn set(&mut self, cpu: u32) {
> > > +        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_set_cpus`.
> > > +        unsafe { bindings::cpumask_set_cpu(cpu, self.as_raw()) };
> > > +    }
> >
> > Alright, this is an atomic operation. For bitmaps in rust, Burak and
> > Alice decided to switch naming, so 'set()' in C becomes 'set_atomic()'
> > in rust, and correspondingly, '__set()' becomes 'set()'.
> >
> > I think it's maybe OK to switch naming for a different language. But
> > guys, can you please be consistent once you made a decision?
> >
> > Burak, Alice, please comment.
> 
> I really like the explicit naming convention that includes "atomic" if
> an operation is atomic.
> It seems also consistent with std library.
> 
> > Regardless, without looking at the end code I can't judge if you need
> > atomic or non-atomic ops. Can you link the project that actually uses
> > this API? Better if you just prepend that series with this 2 patches
> > and move them together.
> 
> The type &mut self gives it away: the Rust type system enforces
> exclusive access here due to aliasing rules.
> So a non-atomic operation is sufficient here.

I should leave it as is then, right ? Don't rename to set_atomic() ?

-- 
viresh
