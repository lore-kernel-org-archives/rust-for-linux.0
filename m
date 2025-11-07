Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E612BF3CC
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762475137; cv=none; b=pjkbWkBuyKmT/zVt1qHLL3WKrXTQ+xcgKo36hIwaCnj4YcH7hn2gWrq6l8JlowLzKbPVk43rxH5EoPm9H7BZAJx9xAxvDxcEHjpg8QFEqc2ldyCLm92bW6rszjP7OAxQVSo0velFLbs6cla9XqZRkBu+HDhyCUUoiMuuitKDYAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762475137; c=relaxed/simple;
	bh=2OYTQxpg9nb0ECcvWiDf5s06kwrR/GHJEK7e2Ia8Npo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxhklDRxMEJMvvII/LOR0Sppgk+1hRZ886+Ftqb14iSl1vKMyazG00UiQuDpXZmp5N+k7RnLg14a5YYVx8DOR3wAnG91uo+IMSxXUidcoIORGpjVZxGAiujlxcYq4GXomH8Rp5evKHwS2m/eQWqE0ey1GddRsMC0QPUZkhP0Flk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAExQ052; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAExQ052"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-89e8a3fa70fso15366085a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 16:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762475130; x=1763079930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eDrGyP4KsggNDtgfNXCVvLL5On0RJHEibXmC0ga7f1Y=;
        b=XAExQ052D5vV0ETkdo9kS4OVmh2x4pDuMJYlUhK/Ol6Wd+wrKhYo0klGF30/ZoOjQI
         4t2dICuowjIw73Yxwbj5AvcsQD2Y0ux8RmjAu+PMTYqXy9gNaZIuZ/JJh78KenaPEwdv
         nM3w+XU2HT9reieD7gWIhMO6sX9/LEr1rkSaeg72pGkH0pEC7UGwtD7J1Ir20GrC3rx8
         V+7hIIykgRumIquNoXOlBHJ6rQW8rlbGck4wL4mN6fPLCErWBgWaq6wR9PurYD/dtfJf
         LLbQHrSYbwiYS/NIPFQgW7LAGkoJSD6z+q73Q/C/Xwb7ovB6ZnAdlqpXZEugTVZOozO8
         5PEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762475130; x=1763079930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDrGyP4KsggNDtgfNXCVvLL5On0RJHEibXmC0ga7f1Y=;
        b=W2vhue/Hb+fxOsnd8DlApZGXO1L4gQLNF66k4gDPnLktHJv2Ln4KztFlE1ZcKbKNzu
         2kQTf/nLAKNcW1m/3vuisY7sjuPEnysWhUyCoGqsXrE91zVfUilN0kfMeAmr1C/jqkCW
         5sRRvBHxG1WFtxlYJ90KB96BJEgN8/6pYTZ3Rw04wpx27sTQwA9hUKL8NEQqssISktAt
         oxSZwyTE3wFAYgnAO+uOn8+3f2xsJ5MnL6yWfBxvdcB/CSTac2Uka/cysIT6AGJAzDqL
         13zl+HV3mCaAfGc9Lf89+BOceQojFVeBjOegAS+wr121Rw0my9FmC8yuF0Qs0mnbMBzf
         P+rw==
X-Forwarded-Encrypted: i=1; AJvYcCUv9NoboUMLD6NKbmkZ23mUc+C/QIzYjqW7V/CR+qpoPCOBCHyrE1nalr+6JKMepVdnqUGHt6YnpVAiKf6ZCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyszefJ4LAwVAdUag0kvT8zOxQdKqGc0RJdKmEC4hGDkboAhvGD
	N9qZrYIHop10M2nIhgnYaK3WBWpRKMEp+vYnXiDqHISSYBTqBhx1/0pV
X-Gm-Gg: ASbGncv4wAaYXg42eJjKU8p5C322xMwYtCK5nqi//y2tkdE1DXIE7R4uWRB3SOa0taP
	GuKRMjkqyWDXixn7pUDUqT1mgXqcLJcqvx69IsuA5ExJ3THIQdX756r/31+lioLiO2Nyedw7ioZ
	l5yn0mBZtsNLV6muCkpUGcrDodYrgxWo/Q8pwlVTO6WXKludFDZeDVi9a4h2LoLiQwXiEkjDi6g
	pRDT/nsVf69Ho03m96nsf3mheT1eVUZgcNmpbSstofuYhpiNZsMvpCnFSKwiUh687PFta9JkmcQ
	ztiqrH/o2IhH1xa7q+pLhYTGn4YgXU1Rbv1joINQWDVkMUxDYiyx2yAE0HRUM8wOApS4J8OG2hZ
	NdJ+yrMFrKbh7u0Tz5z+Q6qr6UH1+2l6djJJmviarcbdRainzTVfmzhAIceohttzhn3JMw9Yq
X-Google-Smtp-Source: AGHT+IE3wHS1UJmfiT2G9cUOC3xFxU6u/uO+VhHYvECIZct+pRXqPd9d6g9YleM22aR0m7kB5P9qtQ==
X-Received: by 2002:a05:620a:2943:b0:89e:da49:7967 with SMTP id af79cd13be357-8b245286758mr198236785a.18.1762475130279;
        Thu, 06 Nov 2025 16:25:30 -0800 (PST)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2357de61esm299869785a.32.2025.11.06.16.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 16:25:29 -0800 (PST)
Date: Thu, 6 Nov 2025 19:25:27 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Mitchell Levy <levymitchell0@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Tyler Hicks <code@tyhicks.com>,
	Allen Pais <apais@linux.microsoft.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 1/9] rust: cpumask: Add a `Cpumask` iterator
Message-ID: <aQ08d2NUVsIf5ukH@yury>
References: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
 <20251105-rust-percpu-v4-1-984b1470adcb@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-rust-percpu-v4-1-984b1470adcb@gmail.com>

On Wed, Nov 05, 2025 at 03:01:13PM -0800, Mitchell Levy wrote:
> Add an iterator for `Cpumask` making use of C's `cpumask_next`.
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> ---
>  rust/helpers/cpumask.c |  5 +++++
>  rust/kernel/cpumask.rs | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
> index eb10598a0242..d95bfa111191 100644
> --- a/rust/helpers/cpumask.c
> +++ b/rust/helpers/cpumask.c
> @@ -42,6 +42,11 @@ bool rust_helper_cpumask_full(struct cpumask *srcp)
>  	return cpumask_full(srcp);
>  }
>  
> +unsigned int rust_helper_cpumask_next(int n, struct cpumask *srcp)
> +{
> +	return cpumask_next(n, srcp);
> +}
> +
>  unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
>  {
>  	return cpumask_weight(srcp);
> diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> index 3fcbff438670..b7401848f59e 100644
> --- a/rust/kernel/cpumask.rs
> +++ b/rust/kernel/cpumask.rs
> @@ -6,7 +6,7 @@
>  
>  use crate::{
>      alloc::{AllocError, Flags},
> -    cpu::CpuId,
> +    cpu::{self, CpuId},
>      prelude::*,
>      types::Opaque,
>  };
> @@ -161,6 +161,52 @@ pub fn copy(&self, dstp: &mut Self) {
>      }
>  }
>  
> +/// Iterator for a `Cpumask`.
> +pub struct CpumaskIter<'a> {
> +    mask: &'a Cpumask,
> +    last: Option<u32>,

This is not the last, it's a current CPU.

> +}
> +
> +impl<'a> CpumaskIter<'a> {
> +    /// Creates a new `CpumaskIter` for the given `Cpumask`.
> +    fn new(mask: &'a Cpumask) -> CpumaskIter<'a> {
> +        Self { mask, last: None }
> +    }
> +}
> +
> +impl<'a> Iterator for CpumaskIter<'a> {
> +    type Item = CpuId;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        // SAFETY: By the type invariant, `self.mask.as_raw` is a `struct cpumask *`.
> +        let next = unsafe {
> +            bindings::cpumask_next(
> +                if let Some(last) = self.last {
> +                    last.try_into().unwrap()
> +                } else {
> +                    -1
> +                },
> +                self.mask.as_raw(),
> +            )
> +        };
> +
> +        if next == cpu::nr_cpu_ids() {
> +            None

Please:    if next >= cpu::nr_cpu_ids() {

> +        } else {
> +            self.last = Some(next);
> +            // SAFETY: `cpumask_next` returns either `nr_cpu_ids` or a valid CPU ID.

Now that you've handled the no-found case in the previous block, the
comment doesn't look correct. Can you either move it on top of the
if-else, or just drop entirely?

> +            unsafe { Some(CpuId::from_u32_unchecked(next)) }
> +        }
> +    }
> +}
> +
> +impl Cpumask {
> +    /// Returns an iterator over the set bits in the cpumask.
> +    pub fn iter(&self) -> CpumaskIter<'_> {
> +        CpumaskIter::new(self)
> +    }
> +}
> +
>  /// A CPU Mask pointer.
>  ///
>  /// Rust abstraction for the C `struct cpumask_var_t`.
> 
> -- 
> 2.34.1
