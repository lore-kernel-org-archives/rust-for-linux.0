Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4A233507C
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 05:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780291668; cv=none; b=R22w0MNatn2U4QkQtmf1wjWjDFnHJwfdqR14O3E9Wld6g24kxYvFv80yXEG2ariFXSDTRxNZdNhlrr2uJ5LjMcSGPXji0Q5sByK2WJrf7VaPg0qXN0QD1b/wgReTKDyJdPzAegIL9gQGtfkvCKVAyfgUvbtVQE0MZxscAPANCFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780291668; c=relaxed/simple;
	bh=fCdzHVcZDhDh6SWNC9dgzMUJjZKOzYY3G2zn8sV+498=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3H0v/OjZLyI9R6944SbE7u6lMUYr0t5PatD0JLMt8lJqnkr9YgRJAG1Q0AX0ifTdo+/GrAI4LDcDa4FRnf513Bb8SAS/JL0RBNd5MMd0KwvHI07j6cQNt+yBb83gL44SZ9EUUvpGt2wT7xAV6H2AcjRDAusUTeobD5EN2f1xeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VrDsGu1O; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VrDsGu1O"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf2247e38eso22390825ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 22:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780291667; x=1780896467; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ouIO0zeZKWepmc4HQsvg0VN69/QHmiQ+jY/+kkRsAoo=;
        b=VrDsGu1OkAGiMPeiJGldzkoRA8+O6Chous83DwetnfkQOlREy3G3+soB10FRnyIWR1
         EsmX0am5HS9qVlSh7MFMbsUaoavGAjRClGTNtJ0gmbvxInlPQsV6t2+C7FulNj8US0gY
         j9WyGAkoN1IKjU1jpg+TH+fxGfjuDrtzCK90bNKokXU8J3DZaxs9R34dudj8BQll81XP
         0Yh3bYlTc3qVOdr37pqVMBe2uX6jwDC4RPgHxVqsQNrESG+5Ld+eU0STZLLgaNqqzQYB
         TqgOedrq3N6vFB7lRI8jJu5B9gyrULVvdXLOJlcwWiMZWwzYo9ffaOY4527GPsohOXH7
         SnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780291667; x=1780896467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouIO0zeZKWepmc4HQsvg0VN69/QHmiQ+jY/+kkRsAoo=;
        b=XlyJcvty/4dKfSkYTz70DcKEZzhnER1F54O0IjfFX8lPuTLlsk9Jc6qyGMktZ5kINs
         CVJI8pwRtesUB+SmwcseKFPqoEOXxi+FtN+d0QsqpCg5SoIJ2MW5OwmSS5RtrZZbzTDz
         yQcsGzeoraVou/Bag31TYxDV7XZ2YuI498vFC0viErSSir7V5fREjDEWkSZd/u82f7sw
         lvVwNRg3P1cKn+g7eZKpWV/w35FkQ3GI1VPdAChu/fWLiOSb0SwE5ZqnZXPb2oamWqxf
         fe1yojaf/Cpg+7o+fsu52Xo7Jjr9xJzvZ++mhn+Z8ITvehxquMp2dU7g2as7pmmna41k
         UaUg==
X-Forwarded-Encrypted: i=1; AFNElJ8gItznozHZylI8QyviBltryQrhpkTTwyeQgLoV5FrRTElWQO++Es6sOYpFedd9XPkI4Y/j+q35tBeoF6Bs5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw9N6g67Ib5YyCmEK5sCgbayvtFsvdmpDqRgtX2hiLR57ZRRCT
	HWr0zjHy7h1mSBse4/dybeBewD/S5s5p41I/XsuwC+bnC2mCv+JLbZWTzf96Hfl8eG0=
X-Gm-Gg: Acq92OGCi6m4NvGBOFimlbV0YQfy72NjCsM8qzQNdqyDWHoq23urkrAUCLjLWvnmI/R
	krsfBjJCpDRYapEpkFLEKlXB7obu4ZYamsYDG3RA9v1FEbc7YCz4ZP8gy34xmroaFp6Wshizl+0
	TMzDcEHW9p9TL8pIwL2HeuDKzx0yzII8X4Hrq5EDCFp8DgKNgn9Th2VZJZmBqgIM/FqOYpM3cZS
	lOd3d3Ul1OyhoAKmO2Yfi0tMYUw1JkaIsBILt8ItwSChJc74J7bo7lsGHHpJI+xe4WAP5X8JYn1
	Rs3BvmfbqNr+WbdVIAccbd6YdrdfgGIYwUv/q3E2nXDU0EO0aCwPmpY+w/RJm6kLTCE2Ce2JUED
	w6kySaIybMQE7bX9au7SusvzxvRQiZgLtp2JPckxYBIwPqFf+Zef3UwPZs0QFdj8LcwbXtA2E8S
	+GozREiy6s7WBWzKMfZpWml9M9767DLq1LTw==
X-Received: by 2002:a17:903:2311:b0:2c0:cb90:1dfc with SMTP id d9443c01a7336-2c0cb902165mr50479455ad.12.1780291666708;
        Sun, 31 May 2026 22:27:46 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm94259985ad.80.2026.05.31.22.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 22:27:46 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:57:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] rust: cpufreq: clean new `clippy::map_or_identity` lint
 for Rust 1.98.0
Message-ID: <3s5sqsgwb2juanpromxdklc6mxhahojoflezdpi6nzsbip2hqo@txxh2lou26np>
References: <20260530095809.213611-1-ojeda@kernel.org>
 <CANiq72ncuqxjjx+1SMV977UC-TZL9aPrbFECmCPPdzSLi-Oc=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72ncuqxjjx+1SMV977UC-TZL9aPrbFECmCPPdzSLi-Oc=Q@mail.gmail.com>

On 30-05-26, 13:34, Miguel Ojeda wrote:
> On Sat, May 30, 2026 at 11:58 AM Miguel Ojeda <ojeda@kernel.org> wrote:
> >
> > Starting with Rust 1.98.0 (expected 2026-08-20), Clippy is likely
> > introducing a new lint `clippy::map_or_identity` [1][2], which currently
> > triggers in a single case:
> >
> >     warning: expression can be simplified using `Result::unwrap_or()`
> >         --> rust/kernel/cpufreq.rs:1326:60
> >          |
> >     1326 |         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::get(&mut policy).map_or(0, |f| f))
> >          |                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >          |
> >          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#map_or_identity
> >          = note: `-W clippy::map-or-identity` implied by `-W clippy::all`
> >          = help: to override `-W clippy::all` add `#[allow(clippy::map_or_identity)]`
> >     help: consider using `unwrap_or`
> >          |
> >     1326 -         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::get(&mut policy).map_or(0, |f| f))
> >     1326 +         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::get(&mut policy).unwrap_or(0))
> >          |
> >
> > The suggestion is valid, thus clean it up.
> >
> > Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
> > Link: https://github.com/rust-lang/rust-clippy/issues/15801 [1]
> > Link: https://github.com/rust-lang/rust-clippy/pull/16052 [2]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Viresh, Rafael: I can put this into `rust-next` if you prefer (I
> considered `rust-fixes`, but it is not important enough at this
> stage).

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
