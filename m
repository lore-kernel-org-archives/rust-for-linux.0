Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6322B1482E8
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 00:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762477055; cv=none; b=grta8YH3a8BjtWoyRyNxXolimKLl6wxWFtyRreWdN4lxhpXMUWPJy0aixbbSt2hgUY4WuJ0pT7iVzjckEdqRs+vClSCUJiO8UMK70MnU5DI8koCYeMwS84Dr5dJ1wXq0RCTqZo3sceqOY/hQD1+kxC9PWuvBnams7AfVGQIykLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762477055; c=relaxed/simple;
	bh=QIx6rKMBFfDiS4HvXP04MT76FwtFqaWP2qYF1ZDThYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoSA9QwLMx9bXE7ZWX5nENMEoukaLFGEsqetCPp2k6wq8cvfGuYuXneku5zceeAX4gywp1gg23nrJhhqrm2DxcSp5rNvGcsn9eoh/16EjD2jOY2QwP5eYijfQwjPsh9bM1hP5WScI1aiJ5ne1EP+Nrv+czd+HrSZxo57i8C1Ucw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCswt0EE; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCswt0EE"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b22b1d3e7fso22599585a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 16:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762477053; x=1763081853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AmTmAuWcZZ8TrHlA0PNPFsEDtNa6QN4lB5lfJtGBXPQ=;
        b=XCswt0EEjW91IQUjsE6B0RaR0qEti4w3ukxxGi7xg1IPt0ad1+TbTSMf+2/gfvTIkD
         DUia/NPO/8SZOqhBS6PfYCa3bQPXR6mV9jb5YVovpRRpfWieaSgc6BQUVGO8Df71RzJS
         es7n4stLPdSbVLFCPuVcrQZYs3B5PDtIJPmUCjTIUKJ8UOwBbhI0w7Tg1maU9XhoHESg
         M9rIOS34rjtIzcKE0+aP3nyjCJLta8AV6Ef99Hjlkdzx5FcS1aU1rv0kBI+8PzrSRJvd
         NHChOPsniQtkA8qw6MYPEQ9HhjErxXOgm+qIKsG89YBLZkEhzspGrSWsnkSuA/81PH32
         mC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762477053; x=1763081853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmTmAuWcZZ8TrHlA0PNPFsEDtNa6QN4lB5lfJtGBXPQ=;
        b=E3YVpEDJMzPtx5RWaaHcCo/ImD2mJWf9UgK9/ur82DOVzbgnthD6vYIBqNidZaVF5g
         FamCEh+wj8zWz6aoF/jw7utsGRqy28WbPlqfFtTCTb5YqgqQjNP6mfAMKevh++wtgihZ
         hWq8C5pqaGnj7ef+/LSepFUaWbw2Ls3xCjJ7niWHQUJ7fyvleqh1oj89SZCZbknb0O/9
         yhQHrOjpYrEyR0OJe9Qa8DCmU9QJkIYcgXhm5pvlVFAcbbTut/efhPHfN8AxtgheA0us
         9P7gfrDgmi9b77b5lu1T8jnuiketXFVj7hFOpZ0WNZVvml0hwgJsLG/KOfoiwNsc5af1
         ESSw==
X-Forwarded-Encrypted: i=1; AJvYcCVlwUV1ursagCIZO/pO5MjST3DjL+6N3KDGLv7qvKPqOmxdC6yE0WTkca3pQgWhUVNxSYuxRiWLmKh6/8ObAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEX3LLi1w0wbvVjXYj430rI4NN90Fksha/bVpKE5zpsaO/H5wz
	863bmKtIR/biLGF3fWQhRokBq2giiFR1GXS+fSIImou2AD0eR3BgwKNt
X-Gm-Gg: ASbGncsbaSdzDL5qh5jTuCvlNK4ZDCpgwt75yAsmwtYkhAakhwBZ/YRbbRApTAWdEse
	RA2//aRY4kK2NU6FsXSXS59S4tmjTQ/RdeoFtJ/ba0bhdX+iLuK8F6kZntlzE74mU+xgMivw9aU
	xjMmyd8CwIU24e4C6xOlIfXbvPvIGsPKgCsU4VCGCFd1G5Pg9utsEic0HRZiMUHY5m7floH6ETF
	kqcS6BTGp00XzV8TtnzAA8WmldqKi+hkpYXF2SxsCZJC9JZaGL+DDBl7zgmuXSLMchp9dDgqEOS
	mmxDD2HyTnkv2sv6CGAUaAMqV+YKMlb9Q3JqnlQIYCn/uSHLsP7xvy14WLA11DLBmrE1vfZsztF
	DC4Jy4ip14SX3R12SeKZPkP8IeHV3IfNkrl2yq53809cTmPotGwWVzAtW+aenHAzXhpgEI+fj
X-Google-Smtp-Source: AGHT+IGSPrynqp7inqEF4hBhUuDdjVXrb1BDsz7SS+ixO0ukO9wh+YU5CvVH5IrgWRaBImngE8S1zA==
X-Received: by 2002:a05:620a:4541:b0:88b:72c0:aaec with SMTP id af79cd13be357-8b2453689fdmr201926585a.88.1762477053268;
        Thu, 06 Nov 2025 16:57:33 -0800 (PST)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2355e9a35sm300204985a.20.2025.11.06.16.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 16:57:32 -0800 (PST)
Date: Thu, 6 Nov 2025 19:57:30 -0500
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
Subject: Re: [PATCH v4 3/9] rust: percpu: Add C bindings for per-CPU variable
 API
Message-ID: <aQ1D-skdKLV6xmJo@yury>
References: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
 <20251105-rust-percpu-v4-3-984b1470adcb@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-rust-percpu-v4-3-984b1470adcb@gmail.com>

On Wed, Nov 05, 2025 at 03:01:15PM -0800, Mitchell Levy wrote:
> Add bindings necessary to implement a Rust per-CPU variable API,
> specifically per-CPU variable allocation and management of CPU
> preemption.
> 
> Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>

Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

> ---
>  rust/helpers/helpers.c |  2 ++
>  rust/helpers/percpu.c  |  9 +++++++++
>  rust/helpers/preempt.c | 14 ++++++++++++++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 7cf7fe95e41d..2fc8d26cfe66 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -31,9 +31,11 @@
>  #include "of.c"
>  #include "page.c"
>  #include "pci.c"
> +#include "percpu.c"
>  #include "pid_namespace.c"
>  #include "platform.c"
>  #include "poll.c"
> +#include "preempt.c"
>  #include "property.c"
>  #include "rbtree.c"
>  #include "rcu.c"
> diff --git a/rust/helpers/percpu.c b/rust/helpers/percpu.c
> new file mode 100644
> index 000000000000..a091389f730f
> --- /dev/null
> +++ b/rust/helpers/percpu.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/percpu.h>
> +
> +void __percpu *rust_helper_alloc_percpu(size_t sz, size_t align)
> +{
> +	return __alloc_percpu(sz, align);
> +}
> +
> diff --git a/rust/helpers/preempt.c b/rust/helpers/preempt.c
> new file mode 100644
> index 000000000000..2c7529528ddd
> --- /dev/null
> +++ b/rust/helpers/preempt.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/preempt.h>
> +
> +void rust_helper_preempt_disable(void)
> +{
> +	preempt_disable();
> +}
> +
> +void rust_helper_preempt_enable(void)
> +{
> +	preempt_enable();
> +}
> +
> 
> -- 
> 2.34.1
