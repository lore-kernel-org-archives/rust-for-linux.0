Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A9D1F09A1
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Apr 2025 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506592; cv=none; b=ThG/lwOMOJidLeS99KkuitqL0PpQNYs0ZFgCrhN3QxVxDx/L68NRALu8d2UvzSB3fST/MIC6WqfyW4QXUlRcRdYtGYj+p9rfOkwxd+pCuek5yHX61xyqxfUcdmu+3/KUuOLsdSQkbXFUEZFlkPdhQv80Gq1+S2vSqNyCUfLjFwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506592; c=relaxed/simple;
	bh=VAL8eQeQLv1jZ0ItTtHH0GpG4kM4IKAFMuR0hxuIUN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncdG6mTm0A68vGRRrZKOKINzNvbpKSAgvrp2NfNOXZ2mJx/hdLtx3j6UPkwF1rU756zJzIK7qMm4+XRmD3oi0MzvmqeuT+AF9rO4APOQWSgWFSvkTo7m7JwZhqMT2iNIeNn8fmE8bVH2tGpJRUj0dIgoluMlBr3P/LFTdGwQN9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h7blEy0s; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h7blEy0s"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2260c91576aso85855505ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Apr 2025 04:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743506589; x=1744111389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rHfK3avWXg/wr5RZir9EpDN+jJ5pXFV8xfPClJ4u5GY=;
        b=h7blEy0sZCXPLZWJu/75R93+W7BNR7FLyBIXvvDSmE2gyFhgXsr1Xet+8FQ8U2RMQL
         sZ5OVxAdwOczBCh2ZDP5H5Cjh7fz5Fq6xm7BE1b9rPwUWYy7Cs5AOgxaaujnWnLUO3eN
         Kebvuf6HO7DRvy4lBBRwuSQE0JFktb849GZ4+ZsqV40qs1VcqXv/x7CfhuqA6iwgaN8j
         uSPkz/bqnLZH0hAFc2SDBNKV7omFI8dj27vD056swTndP8IJ+CFA+QaSFavbUpIc9h8x
         ez1p9v5SU4uU7PHl1vPRYkZRPSRzjP4isGaRyKI3uXfF9gn+IVzOusPBpkB5nFHUopP1
         Yx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743506589; x=1744111389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHfK3avWXg/wr5RZir9EpDN+jJ5pXFV8xfPClJ4u5GY=;
        b=c4z3up2QYGFbYWXPskJhFvqWX5rMIzgOE5wC1uYt2mQDIW45gfz6M1DIW5IZ0xsfw9
         zTbCA/rcOtoVAjv9KsDOGRupI4bufxuWYBTRQA7XCCY9s9UgKujCm4nBW5TYymV4LAg3
         pZHGr4ILAnf6/k80h2lCLiaScgwRZc7KnrZTWnXkUGaqXBhDM/GMdslBHwJF35PVKRay
         bMLVhoA+aFUTumnIShjZHD9lG4lj15RN+PFP3WLJNu6s+l+Bpqfps9I2iOGVHbJUjrHv
         1usaQn9ner0ux6hIls7Fj+99giaktOod9/QGodNf3EBhxcbyJ8Y9JnMYIjJyruUkJbtw
         LxPw==
X-Forwarded-Encrypted: i=1; AJvYcCXpFI3QWKj3+RNzKZTn/oCuS0xF7tj74LkUWiQtd7/zW0rjobegNCDVGZFE+aDzXW32vFNE5Gb0sVRl2roFjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq5vYlevQQ61uADdZok0oDJidZ6THzg9DQKuFwqaoT+RNY1Hrt
	XoBosT/EJYnvrOjnaaD/j62ZVP6EZm4AkME+CfQyD3QzGTtfWUo4GeVnr7GABhU=
X-Gm-Gg: ASbGncvj2hKS/QyJkMTdOmBvz9gc5s1P6zBLTIZB5A4TuTuNegvVKyH1ZkJnakmOvsE
	SNr5Pn29woHaD9panv61qJuXfDqfiTKRoT+I1PdcSZzK1Ww5QwdDYfuvSlGu4N0xN4UG/HTKhuW
	GQB6UVIEEoxgHNEzkyoZrjkKOqTNXyv2WKm/IFnIh6dltiLhmM63sUXQQF0P0s4UReGZhMbVMae
	ugEQyhDE45H89lK5dd75sjcDK5MmtgpOn0qBs/cZro1NAyaoGLeYnfzThtak7BtFRsIvsQAqsuM
	jBt1engOi9P7hP3Og9r2HVPTuJASPUutBcwC97fgYe2sE36ZBR/la043
X-Google-Smtp-Source: AGHT+IHETR0ZDX3a2JwDqDubub9VhOb/rg7MYqbwYjCU/FGmaqg6uSF35xx+BLX7z3+XFAebMVnSyw==
X-Received: by 2002:a17:902:da83:b0:227:e7c7:d451 with SMTP id d9443c01a7336-2292f974b3emr209239775ad.29.1743506589196;
        Tue, 01 Apr 2025 04:23:09 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf14csm85705505ad.137.2025.04.01.04.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 04:23:08 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:53:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: Re: [PATCH V3 2/2] MAINTAINERS: Add entry for Rust bitmap API
Message-ID: <20250401112306.z5krtedzzxphlwez@vireshk-i7>
References: <cover.1742296835.git.viresh.kumar@linaro.org>
 <cddb90075c7f892e30f5039c3b3d14e6a239d915.1742296835.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cddb90075c7f892e30f5039c3b3d14e6a239d915.1742296835.git.viresh.kumar@linaro.org>

On 18-03-25, 17:21, Viresh Kumar wrote:
> Update the MAINTAINERS file to include the Rust abstractions for bitmap
> API.
> 
> Yury has indicated that he does not wish to maintain the Rust code but
> would like to be listed as a reviewer.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Yury Norov <yury.norov@gmail.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 315cff76df29..c55db52590cb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4026,6 +4026,12 @@ M:	Yury Norov <yury.norov@gmail.com>
>  S:	Maintained
>  F:	rust/helpers/cpumask.c
>  
> +BITMAP API [RUST]
> +M:	Viresh Kumar <viresh.kumar@linaro.org> (cpumask)
> +R:	Yury Norov <yury.norov@gmail.com>
> +S:	Maintained
> +F:	rust/kernel/cpumask.rs

Yury,

How should I name this section now (since we have separate sections for bitmap
and cpumask abstractions now in MAINTAINERS) ?

BITMAP (CPUMASK) API [RUST]

or something else ?

Wanted to get it right before sending a new version with this change.

-- 
viresh
