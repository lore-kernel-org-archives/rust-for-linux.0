Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3083F1114
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732696623; cv=none; b=TF49RjiC/aS/MwpogxqS1nSYg1k5qYIbBdv74u4rR+aa6L4ZagXLRBxC45qREUOWprPO8UpazawxUMvcxY72pU2cffRUhB18pRFVIM7uy/WwkPfg2ajesp6LoQSUENjxp0gp6oSJCYMPGb14lQQiBjPCExuRBX8VvCQGLpJyIns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732696623; c=relaxed/simple;
	bh=g2U1IfQ08m2PGyZEiKk0mTiObuKSmhwTTnTN06IUY80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sg78Kfw95vL6K5O+ZTS0VFcWgd1zezCAUTlWTFhJOgyI4Lm4tghyjud/q8M2+QJEwm3PfY/euhL8xJPWDFEEVUrCJEP46E3R45xOwDBZpbYpS/eRZtvbNo/mGW1bhliFRlZQqUSy2U/+sKnEjrm8jIC2zZhy/0FstQvVF2J1xcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=z2K/GRzn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="z2K/GRzn"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53da209492cso8269699e87.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 00:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732696619; x=1733301419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FfYfEL0hhmOeac7hut/RFezDjxPNxDFZw5/N9awvskA=;
        b=z2K/GRzna5Zt4Gnn7PovnR9JmiuCPZYZfz9G7UAqYbsFGjPovF2gnpXNqidofwGK8c
         AmuI2RvY7wSqXs60zERhNo04hjjw+G329AlR8TSfYMzERnugJmQ6SJgRW7Hvjxeoab4x
         c27/TieDIJyTTj/Y7yO380EMCBAootxikqQUtHC8KT72ahp00TVAiUjdXO5fQ79qbGDq
         g+EeWRujwWe9m+PNzPtqGCi7IXK8f4al0wNEHZcVqya8f1OMWmilxCri4ZJJPneTq7I4
         C4AInf2hif73kk49hqauXSarj861O+E2qLpfmBqJZXkx5S/omIJRlvgkTYdWR85CdRBr
         uaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732696619; x=1733301419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfYfEL0hhmOeac7hut/RFezDjxPNxDFZw5/N9awvskA=;
        b=ovgBoFbvYWYDdJItQ8RjxGq7eYVTAOSY/9wT6mHFHTv9JqLiiU5WzofcKadvideiDb
         l0K/4r+UMwiSWAuX96DDdxVBGx7cTJyN98w8V4ioX/u0qrnf/AnXq4U+zo7Cc6R4KtHc
         zu8uCASKRcmId3T9LwBJUPALdCkUwWkp8zQe31CUUdDh+N+887mwXPwmrNIrTPXgTZb3
         fJq/CWywZZbEqgN2huw9NqumMuipgaikvO+Aoj7cDzvB0pAl9fFeSocmVGxhlA1wAVBv
         DoG8ZCIOsvoxnZFYW3CtwDgc6ayDDbbNz1MuYHhqU2XpvIAQ8W8LNASzDEXgLZGSyXsu
         OqrA==
X-Forwarded-Encrypted: i=1; AJvYcCWa2Fv8Jm1YxwnEpL4u3hEml/Y5EMIWZasR8lx2NO/KoMWNyuNFukqn0mku9sSdP55TPVuTkalTxgmKd61N5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxngeUy9TQC8HV0rrUL0W5dnIQUcu5FL5PpOwIR4cuFY1Oedj7J
	ovz8Lt9dY1j057nOaCFQIp1mi3Za4tnI0ubttJn+bhT1SwbNsrWsA30NCbgT8uw=
X-Gm-Gg: ASbGnctErf8g2yTdO7pfBZ64Ax0oyb5D052GgyDfSXZtXvMLkWdnQPo4wbkmoRGJeQ7
	aDyNRMD05mVTRCzmMrAIYfI2+OJRan+mG/2GWDYi8rd5z+260vSxPpVY+Fg6zV4KJOjl1SAQdHC
	9Io5tugJ3Fij1JDLtG/01nBX++2j57avj7VZqeNUDfjnDSm7Iaz/wZL6Yy9BE9HcfLtjKTE8ERq
	QeJchX20jI1Skq77qYWGQoKyR/sqUKgsQ0x00pyUx6tuI0j3UwrUW0VlYJA
X-Google-Smtp-Source: AGHT+IG3sMF84XPvgz8pLoCLIdG2dlHXM2lXAxoM5/3eyIXVSJbpcsQPSRSV++v9uT631uOC7VhCwg==
X-Received: by 2002:ac2:5399:0:b0:53d:f1d1:13c5 with SMTP id 2adb3069b0e04-53df1d11418mr362352e87.16.1732696618643;
        Wed, 27 Nov 2024 00:36:58 -0800 (PST)
Received: from [10.0.5.28] (remote.cdn77.com. [95.168.203.222])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3a3f8csm5857861a12.6.2024.11.27.00.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 00:36:58 -0800 (PST)
Message-ID: <10078f6c-ce93-4652-b639-6f9c0ed845c1@sedlak.dev>
Date: Wed, 27 Nov 2024 09:36:57 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: add safety comment in workqueue traits
To: Konstantin Andrikopoulos <kernel@mandragore.io>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Vangelis Mamalakis <mamalakis@google.com>
References: <20241127005204.713495-1-kernel@mandragore.io>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <20241127005204.713495-1-kernel@mandragore.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/27/24 1:52 AM, Konstantin Andrikopoulos wrote:
> Add missing safety comments for the implementation of the unsafe traits
> WorkItemPointer and RawWorkItem for Arc<T> in workqueue.rs
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/351.
The link tag should be grouped with other tags.
> 
> Signed-off-by: Konstantin Andrikopoulos <kernel@mandragore.io>
> Co-developed-by: Vangelis Mamalakis <mamalakis@google.com>
> Signed-off-by: Vangelis Mamalakis <mamalakis@google.com>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
See [1] for example, the ordering of tags do matter. Your signed tag 
should be the last.

[1]: 
https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by 

> ---
>   rust/kernel/workqueue.rs | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 4d1d2062f6eb..fd3e97192ed8 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -519,7 +519,15 @@ unsafe fn raw_get_work(ptr: *mut Self) -> *mut $crate::workqueue::Work<$work_typ
>       impl{T} HasWork<Self> for ClosureWork<T> { self.work }
>   }
>   
> -// SAFETY: TODO.
> +// SAFETY: The `__enqueue` implementation in RawWorkItem uses a `work_struct` initialized with the
> +// `run` method of this trait as the function pointer because:
> +//   - `__enqueue` gets the `work_struct` from the `Work` field, using `T::raw_get_work`.
> +//   - The only safe way to create a `Work` object is through `Work::new`.
> +//   - `Work::new` makes sure that `T::Pointer::run` is passed to `init_work_with_key`.
> +//   - Finally `Work` and `RawWorkItem` guarantee that the correct `Work` field
> +//     will be used because of the ID const generic bound. This makes sure that `T::raw_get_work`
> +//     uses the correct offset for the `Work` field, and `Work::new` picks the correct
> +//     implementation of `WorkItemPointer` for `Arc<T>`.
>   unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Arc<T>
>   where
>       T: WorkItem<ID, Pointer = Self>,
> @@ -537,7 +545,13 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Arc<T>
>       }
>   }
>   
> -// SAFETY: TODO.
> +// SAFETY: The `work_struct` raw pointer is guaranteed to be valid for the duration of the call to
> +// the closure because we get it from an `Arc`, which means that the ref count will be at least 1,
> +// and we don't drop the `Arc` ourselves. If `queue_work_on` returns true, it is further guaranteed
> +// to be valid until a call to the function pointer in `work_struct` because we leak the memory it
> +// points to, and only reclaim it if the closure returns false, or in `WorkItemPointer::run`, which
> +// is what the function pointer in the `work_struct` must be pointing to, according to the safety
> +// requirements of `WorkItemPointer`.
>   unsafe impl<T, const ID: u64> RawWorkItem<ID> for Arc<T>
>   where
>       T: WorkItem<ID, Pointer = Self>,

Thanks, for working on this!

Daniel

