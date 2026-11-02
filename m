Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793588472;
	b=0LjbRE84/C1nuLtTKj1bdX6VV3xjcGM9chzSHcCj/raLc/SKSoZLqPtDah4fyO7xgfiP
	 YoY0Hg46Ue0cVPJNaO9XzitoGCX8D5eMV9Q9K73MNE7ObJ6IrgiBKdA7bx5OhHkz1sk3v
	 4DuDQioIhnNsNBzbE2jf8kIhfk4NC2UNSKPyMcw8yrlX68qujY7UVzFPTH3u6g4YKMSRI
	 j0NOswgCEDYlLCUh2+QWNHguYp8JV+fR5OmFJpgO057TJ0d9Cy4MX6wNlvEkLeELZ9yLq
	 EZ9F9Qplq3lHynpwUI60FBpROzGBVhJ6fRivvkbB/HubsrlhWHWgd/b3l25m/OzMD6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PtOVJh8sILWvjXkODuQEoKjJmTKydzq8v+C4RQZqhO0=;
	b=zbi13Y4VmutjXUxvFh9ZZ718CFkRfiAu/jqx0+fTBB/+CF1+A8uFJN6MF32y0kwq5y09
	 NgoCCKRi5dS87GXWbMzJIRE9gWS82SFgAv59AsJJm/2gs8FMlsHiNbtnQDJVfD1KIq04U
	 4hZmjPKdIvyh9b+jV+MYyd3qYIP5z+dV1b06KKSa0quyhuYloMRNmVg7vut/2ydJTrTM6
	 r5xaSRq6HQrlA13LrUyfowNJF3XOyEmHrJbRJW+jwhSyN3zfkMNM/Dpk2aQEHyw5WuIo0
	 hXKIEJf1vV7La4gRltCaYglAeRIlgN22sasd/98h6M3sPeO6bQ96Zstrz5t9oio4Tag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qrzSm5AN;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1683A606A324
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 03:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1683A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qrzSm5AN
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so4347169c88.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Nov 2026 19:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793588471; x=1794193271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PtOVJh8sILWvjXkODuQEoKjJmTKydzq8v+C4RQZqhO0=;
        b=qrzSm5AN1z+/GrRC4FV1TKANB/WCeLkt70ZWF4OMdlEEi9g5tmDfynJNEqdh7mvptx
         4V0+vhiUe3MMmwHupXX8z0nUqbYnysdBY4mLzT/CRjRrWDK7qz73az9EVs6kSM6wKT3T
         Iu1s5WP8fXJsSIcqp0+53xiTeFmJg+KdDWnIpMxvvfN3crG+O91k4HZjawzFBQRYr6u4
         1mvhZ202ewUf1vRPRHQSust4fKKeqiikmUBcu+NK3SaBXgcwgnO66kJhACH3ltUcuo/n
         ByQIUFa2g4CT2+oh2rsn+cnGbKmu5iwREeCaXXU7fNNJQr8XELtb1SZaaqi+GUvsmN6S
         yWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793588471; x=1794193271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtOVJh8sILWvjXkODuQEoKjJmTKydzq8v+C4RQZqhO0=;
        b=KHmDbVREL33WVKoipEMd3OUCpi14LClJuxJQ+yE6MqLwtCVM5qnF/iC4yvbufoCYuF
         YSS87kd71PxLS8zz+573SbHU9Jm+sG1chVLa4hmsrbnqAy2SyU5iPdlGPMglH0J1Kp67
         950KEBO5mZrQ23C90eD8e4OxzY7s/DkEQ88J8Pnxj09lluj+yo4CWP8EIoaGS8c056aO
         I0JdDCZHPUyisyBsYCDvBvr4/tw5FPW0c+6Kru4tZvFj0RItd4LrkCSYhmRSr+WuF0kz
         IUKBfuojH3ea3oIr31sMOj62cNDpM9fFsBKUwGjlQHdKOfSSwWSilD/tZ4ggBt7WuKUd
         VwcA==
X-Forwarded-Encrypted: i=1; AKwUvBy+RC61UyhwEOrhhXOfc8DyLoXlVD98RqnoczHWKJ9LJmiEmdPu/5ZyLyhcoudQBgoyF7qPTbyMc9i67Tc3gQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKa2V1+vB0LO6D1TAlw7fUET76K/0vs9hNhVSu2DXmmDjBpjsxO
	6bnIKQPPflkN3WW2Q2JnsLpBxkAHykRQULMasnSJfk008NC4epqTU9Gg07S9Tj8QNEQ=
X-Gm-Gg: AYBFou1/1TZRRBJol8d3Fk78yLQy1F90WZEnSsxP/YUgGMd/G2792bGMb+GSK9yI+f/
	nzyR7+CUp2gZX8+K1AStY9VC+3xo02jvO36vNgyx5KpeqQOQFfKBwmPKwRBXmUIH5dLv3Kh1I1i
	Q9A/Wg8azf5qW9dG3BaZANp28PQtH7Z84WUNH/EtPpQA6XeOn7sGwsI/8pMK4LOxE0TvgKmKwRR
	vzglTjPECT8yZETbxPVYsndV+yxHlTxjDEgwSlHVYhKA3y5o2ecFpvJLuAhnx8QZIFRV3EC0oob
	K75cygK6sjU/shoHgo4qmUEMJWvQY0jeLX+BUh628zQSQjTgOa7B7bWZb7EcXWbYpwRrxU4+rK3
	IM5OjMwx8rVaZ/FuUGPhrIXtaGuqeLbV5w315BH+M/4923JNq0nA+t0/aiGpK2UQFeyTIPi4TuM
	WRH8u5z/e0yDzmgP2k1IQko0uB+Hjo3Qw2swCrRolVgF0fON9SmcxyIVffuO1sKyDMhdTvPMDa+
	kIkoXQTn23GApd5aDt0okKxonGwMhEtNO3jeI087vvDDNcaeM0MHRBG2qeoJK7OOoD4UVzGDm46
	xb7NmqGu8/tL2H4Rc99lb/pkjVL5EFJ2R2RcGopvzXnAIblj/M0=
X-Received: by 2002:a05:7022:f513:b0:1a7:e1c6:6f33 with SMTP id a92af1059eb24-1ac5bbb5457mr11629551c88.30.1793588470747;
        Sun, 01 Nov 2026 19:01:10 -0800 (PST)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm33436942c88.16.2026.11.01.19.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:01:09 -0800 (PST)
Date: Mon, 2 Nov 2026 08:31:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Yury Norov <yury.norov@gmail.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Yury Norov <ynorov@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4] rust: add a wrapper for the `num_possible_cpus` C
 function
Message-ID: <auf88gBJQ_0MeFiX@vireshk-B250M-D3H>
References: <20261030-num-cpus-v4-1-6b59d5470da2@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-num-cpus-v4-1-6b59d5470da2@kernel.org>

On 30-10-26, 17:06, Andreas Hindborg wrote:
> This function returns the maximum number of CPUs that can be online.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Assisted-by: LLM
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> The Rust null block driver needs this wrapper to put an upper bound on
> the number of submit and poll queues it sets up: it never needs more
> queues than the number of CPUs that can come online.
> 
> This patch was part of the `rust: add a few helpers` series up to v3.
> It is independent of the other two patches in that series, so it is
> sent on its own from v4 on.
> 
> Changes in v4:
> - Move the C helper into `rust/helpers/cpumask.c` and the Rust wrapper
>   into `kernel::cpumask`, to mirror the C side (Miguel, Yury).
> - Put `__rust_helper` on a line of its own for greppability (Yury).
> - Document that the return value counts possible CPUs and does not
>   bound CPU IDs (Peter).
> - Split this patch out of the `rust: add a few helpers` series, as it
>   is independent of the remaining patches (Miguel).
> - Rebase on v7.3.
> - Link to v3: https://msgid.link/20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org
> ---
>  rust/helpers/cpumask.c |  6 ++++++
>  rust/kernel/cpumask.rs | 13 +++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
> index 5deced5b975e..43e9d40e0460 100644
> --- a/rust/helpers/cpumask.c
> +++ b/rust/helpers/cpumask.c
> @@ -81,3 +81,9 @@ void rust_helper_free_cpumask_var(cpumask_var_t mask)
>  	free_cpumask_var(mask);
>  }
>  #endif
> +
> +__rust_helper
> +unsigned int rust_helper_num_possible_cpus(void)
> +{
> +	return num_possible_cpus();
> +}
> diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> index 44bb36636ee3..67664ec8fbd7 100644
> --- a/rust/kernel/cpumask.rs
> +++ b/rust/kernel/cpumask.rs
> @@ -16,6 +16,19 @@
>  
>  use core::ops::{Deref, DerefMut};
>  
> +/// Returns the maximum number of CPUs that may be online on the system.
> +///
> +/// This is a count of CPUs, not a bound on CPU IDs. Possible CPUs need not occupy a contiguous
> +/// range of IDs, so a CPU ID must be bounded by [`nr_cpu_ids()`] instead. That is,
> +/// `num_possible_cpus() <= nr_cpu_ids()`.
> +///
> +/// [`nr_cpu_ids()`]: crate::cpu::nr_cpu_ids
> +#[inline]
> +pub fn num_possible_cpus() -> u32 {
> +    // SAFETY: FFI call with no additional requirements.
> +    unsafe { bindings::num_possible_cpus() }
> +}

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
