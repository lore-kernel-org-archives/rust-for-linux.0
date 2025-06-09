Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6361A1372
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Jun 2025 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467843; cv=none; b=uwXcbNFib0MW/u5H6Q/SWDf3AxSv0j6Ua1H6KvewFgiUn1AqoYzr55CVGCjCA1YsBc3cgj91jjURzG1DHbBj2Su3DZBJsMGOYuEg5dyBMjjHlsZkxqfciPVP4t2JUtGHLM5mAsfgtYBe2ZzOloZCZ2L2WZOs1JMyGNYxYcsnWaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467843; c=relaxed/simple;
	bh=1rf4k3D4qfLQox3AK7UIIbUKUE/1gntkD5UCAGbx2u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oh7oHusdpHzwRdUmd7uwFt06rfO0zVHN/SeI1XntoimfNfnaCQYBSSeF+neWZvJTOF0tTPlExLSv9Kn0+v3oFcIc3RG0xBl4xNbgJhMb/lMvD2KuqPB3Va5pz2wVpL7C3cXmGG9C05+aBqW0NJuE7Nym8ivfgvHsojoP3CkCO+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fMQeG99z; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fMQeG99z"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-747c2cc3419so2813363b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Jun 2025 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749467842; x=1750072642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jmcmYhpSc0FqNNEiRx4dLKTU/hJsjGZ9t0Q+PDFigY=;
        b=fMQeG99z3RP37VErZF4qBvYuv9ljrKs2oiihvq5I1j84xL+Tysuymn6ATaf0v4QIq8
         +5JD/ztWl/3cw5P+hupm7OsL17/YV/wsBmvxpv+ogZqDTAW06RFt7qcc+ghs0yCR6trj
         cDuY+ZDIkWqHhcPiJeoZ1Q18D+/+xzXdQQ3wbw34REQtXuPoMiSHQy4x9ggDK+aWnyVq
         W5tytAMTXKKVdVvJyHOTYnHN2uug4fW4Ux6Dj9IAMCwYs/8sDI59KMSIlQNileuHgYw1
         eX3f15cXxybID/eFKvhzMSO1p2bfZ7grLQs/BNA0LsfJDdjKaELDbjvk+2Kgu+PTTTIS
         TN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749467842; x=1750072642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jmcmYhpSc0FqNNEiRx4dLKTU/hJsjGZ9t0Q+PDFigY=;
        b=RgUph7UkBEch55DXA/Whc7jHTJajkWuqUwEQGJRI0FP2t7QtNxvTbDVsonXHnew5Ht
         ZWx/w7kvM01PkG6PVXccGjxe9R1D86kl+RQ68b2trBrPPd5+hEpFdj+IteAzVAal/eJ1
         RGPxZEElTtjTAUEQ+zVOR+fBHpUvtR4/wx+X7APAYq2IL8hoPAe+F+uZwv+S/Ln8s3LO
         rUDdJpozMUDM83fCC+7izBFxPstqgsCCzMi+J95Tru4rVyBY1RSbXssazPJ+Wag4RgrZ
         hmKVDcrscuzYxT0wR+yvH1W5JzBqGD1WpYMzml52iu+fBAlhNGm3Z9T3EEIOaFnnOYCG
         8IQA==
X-Forwarded-Encrypted: i=1; AJvYcCWeQJYaLpEROs47rCGPirLlWt4R8ba1Q4p0WsU/LZvurGqyJzZ8VlX/wVXKBoIyClsCAv8hvRJidKwYBBY5bA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt2g3mV8HlhTDGsA7CPnlLklb65RFVg3fj3nBDDVMfrNBRI37W
	ytiH6g4To0WHd2sSBziavnj6BfWsjhmuNEplOqnThZ0A9A4LltU1qYGZ4XT/oCeaUxHW0atz39Z
	m8yRB
X-Gm-Gg: ASbGncsnQYXm8y7SgBgL44DVQJdAiFrzKSOuxEddr4kj5Wn4WKZbuPCGQ13RND8mJp3
	4uFnX33r83Zt+2amH87o42QS5owydYpbNsa41uDJyQKpD8N8FgayUyjAp2O6UD8T2PxBXo9NGhV
	8wcliuQLCDryFVbFlqiZ2oX+c86HQ8uPuDTZMvo6VPwYwuXa19zp5xdD5XfDrQCsps9543MJmox
	rfGgecrfDe9ygCt1aYnOeEwOsPln9ijFylPxfKwxAi/VuYSXJdnWtEKfTwxfGJLIBd3blE1cVf5
	D7FT7OCmxNvoXflLjkXouAl12085CpHccyffF344hM3W5BBVNVHJ
X-Google-Smtp-Source: AGHT+IEWqD5LrlH9rkiU0S5rSFvCTOABuN2T34dBr5ro8m9I229gWJ2E8+H+/Lj8DYJDHkqAZ13+KA==
X-Received: by 2002:a05:6a20:12c5:b0:1f5:9016:3594 with SMTP id adf61e73a8af0-21ee255c80cmr20215648637.18.1749467841762;
        Mon, 09 Jun 2025 04:17:21 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b08571dsm5502621b3a.84.2025.06.09.04.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 04:17:21 -0700 (PDT)
Date: Mon, 9 Jun 2025 16:47:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: cpumask: Validate CPU number in set() and clear()
Message-ID: <20250609111719.gne4mhchivobyv3y@vireshk-i7>
References: <8b5fc7889a7aacbd9f1f7412c99f02c736bde190.1749183428.git.viresh.kumar@linaro.org>
 <aEJwm16HSwCyt7aB@Mac.home>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEJwm16HSwCyt7aB@Mac.home>

On 05-06-25, 21:37, Boqun Feng wrote:
> While this can fix the current problem, but it's not a good solution for
> the long run. Because outside a test, we should never use an arbitrary
> i32 as a cpu number (we usually get it from smp_processor_id(), or
> something else). So the `< nr_cpu_ids` testing is not necessary in
> normal use cases.

Thanks for the feedback Boqun.

I have sent a new version and hopefully took care of all the review
comments:

https://lore.kernel.org/all/cover.1749463570.git.viresh.kumar@linaro.org/

-- 
viresh
