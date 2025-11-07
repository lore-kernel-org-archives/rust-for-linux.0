Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391FD2D7DDC
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 00:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762476807; cv=none; b=sbqptFTWKdSHipwd2+eRl5OroXgf+s1shc3qCukDsXsk/ZkGnttV57VihyWsN4arQZaFUM55pH55X5R2PDrsUfEKNEUkzbyJUVThyRAbjl38xh12M/YpXAQwL5Ry3L9XkHVZASNXSVDPar25P6KonYfcSejE5zj8Hd86VdZIPSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762476807; c=relaxed/simple;
	bh=n4qYVI+5vw6nP6vialaamI7erXW0CC/vKRNitzPsQ0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptJQtMivMy4UrcVGQsinv5mi3EVYsDoBDOdSmrIgtsmKV0BDrwfxc4oRfDyy2KeTyd7s0jGrX3t70fErmwyz70pFc6nTWrkXx5kPOC5pPBtgSHxOQ388mLDffKFj9IOND2+8Ahh7dlONfgwg+8cD6x98gvH2FZLovBXo8u4ncpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEcTnDHF; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEcTnDHF"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ed811820faso1234021cf.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 16:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762476805; x=1763081605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EMYmGSsqeU1KDtEF4CxFnVpHkfjLKjnXEKwE6nhE6B0=;
        b=IEcTnDHFRbhQELUGRkstjF1kIy/uzjb6H4ApFLfp3eBhjftY00lW2m/dfT1tm1crPE
         VngnAITUHZ6OWnMkWyVAj1INd1omc4G64zCo7/RjSEal8+1yKODGnQrAOGX4HD7Um4FA
         dCRm5+w/dFBcCwJHbtaQop+7zeguM3CX3LE5+dNroyYV8hLTM/oH3f4+AQCYqTNynnWs
         G+j1FPLjhVUS1tQUBzQlORq3bDHzTwU1oCKEvBDNOJUJ0wb14RTQvvDT5bav5SUA20Bi
         pj7OlTV9fCQ42WA0d9brGB9L4PYeazXarm2d1mQKvKv3WWCRRIp5lsiMa41H63tnB4xu
         C13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762476805; x=1763081605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMYmGSsqeU1KDtEF4CxFnVpHkfjLKjnXEKwE6nhE6B0=;
        b=ocwYo0c50W61e9UExbitsuZJXh/V7/kdLU9KVcGULE3V87ssQLs42XYL+wGSO/jGvQ
         iUZaIQm5BoYWhg8gZoOyCUhvH3c4eH7OvtUexsntUyMiZdU267sv/uRR3VKKzbbSGpbz
         S390m/aGNbwXGqqtMzhgN5ElGCYT4yKKd3vcTi+hmnwtJaJrDS0VKB13+lKra8plGCTT
         4GXeeGUBXm0mTKf1IuPh8btTSne7PhVzY9pvnP2ScNFrD8SBuwcIuK5LJrYfzm7FplAE
         jPAqeGYCmaN2w65XOv+/0RXYk2Fsvel2Hse8de/Y/xgI1/03tuDPngxYgt4NYXdzB73P
         iECw==
X-Forwarded-Encrypted: i=1; AJvYcCWdf0tfvzGGqEYsrY9qQB7UztqZyRXl70aiomf0bWNXkKjujSBwwwUFdggmG/0QK811WuOZcgbOm0uKSrOvpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSn6Dvt3MDPha0MzCsO8b0FWrnAtEnPQ9VQ6abA7eBBJvM8ele
	zTLNXXxkX2RYG8ckjdah4E8zD/8atQsML2cuDDS+ZC7F8KbKL6PTF6PX
X-Gm-Gg: ASbGncuxxHLQp27BQY7BJn32MsTR+1AV8JMsu9f01mYmfbdCoI+CY2DqE3XRicZfB2c
	M1AnebX5Ul/0QgVJOi6S+uDhRqzKx6wHnWotlXEw2g4l37/GFpnd+i8K+9lJJJGaIxZuXhSMukC
	dAs9SQ22L2m8PB5Jequ7j4s0k8f9231+UdQrNrhC14n2pgdIxP4leNzbAYSJo0xSL8N9OTqR5Bu
	FkdI2WVxhQkEDv61uy9U8Ek64heMatqCWLK3MRpbnh0otuTEcVV0cAJP5iI3swV0lCU/HaxszbP
	BOBjezCysllq6YzMfFANRYOQ0Pq5f7/IxsAfI2vnAD79owSdRMbtd2Qobn7YdI0UZN3hPmFyzVW
	NcBg1zOL8ruA7wiCRvx1ZuHsZ9IFzI4WchsihooXpdzBC3lKGP7GF/LSUwQIqJvUKF8OtKG8QNE
	b5qpcsOZw=
X-Google-Smtp-Source: AGHT+IFiMc8RzsIBsIzMJ+XwkCfeVR2K1y5iqPGYwD/UYhIHGqwy9VQsEjUeh10FWOEZ8H4o0TionA==
X-Received: by 2002:ac8:5783:0:b0:4ec:efbf:4ef2 with SMTP id d75a77b69052e-4ed94a6a15fmr19280081cf.47.1762476805099;
        Thu, 06 Nov 2025 16:53:25 -0800 (PST)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-880828c5816sm30074976d6.4.2025.11.06.16.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 16:53:24 -0800 (PST)
Date: Thu, 6 Nov 2025 19:53:22 -0500
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
Subject: Re: [PATCH v4 2/9] rust: cpumask: Add getters for globally defined
 cpumasks
Message-ID: <aQ1DAn7Djc19CgGF@yury>
References: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
 <20251105-rust-percpu-v4-2-984b1470adcb@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-rust-percpu-v4-2-984b1470adcb@gmail.com>

On Wed, Nov 05, 2025 at 03:01:14PM -0800, Mitchell Levy wrote:
> Add getters for the global cpumasks documented in
> `include/linux/cpumask.h`, specifically:
> - cpu_possible_mask
> - cpu_online_mask
> - cpu_enabled_mask
> - cpu_present_mask
> - cpu_active_mask
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> ---
>  rust/kernel/cpumask.rs | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> index b7401848f59e..a6a130092fcb 100644
> --- a/rust/kernel/cpumask.rs
> +++ b/rust/kernel/cpumask.rs
> @@ -77,6 +77,52 @@ pub unsafe fn as_ref<'a>(ptr: *const bindings::cpumask) -> &'a Self {
>          unsafe { &*ptr.cast() }
>      }
>  
> +    /// Get a CPU mask representing possible CPUs; has bit `cpu` set iff cpu is populatable
> +    #[inline]
> +    pub fn possible_cpus() -> &'static Self {
> +        // SAFETY: `__cpu_possible_mask` is a valid global provided by the kernel that lives
> +        // forever.
> +        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_possible_mask) }
> +    }

Not sure about this '&raw const' syntax, but I want to make sure that
all this getters provide non-modifiable references. To modify any of
those masks, one has to call a dedicated helper like set_cpu_possible().

Can you maybe explicitly mention it in the comments?

With that,

Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

> +    /// Get a CPU mask representing online CPUs; has bit `cpu` set iff cpu available to the
> +    /// scheduler
> +    #[inline]
> +    pub fn online_cpus() -> &'static Self {
> +        // SAFETY: `__cpu_online_mask` is a valid global provided by the kernel that lives forever.
> +        // Since we wrap the returned pointer in an `Opaque`, it's ok that `__cpu_online_mask`
> +        // may change its value.
> +        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_online_mask) }
> +    }
> +
> +    /// Get a CPU mask representing enabled CPUs; has bit `cpu` set iff cpu can be brought online
> +    #[inline]
> +    pub fn enabled_cpus() -> &'static Self {
> +        // SAFETY: `__cpu_enabled_mask` is a valid global provided by the kernel that lives forever.
> +        // Since we wrap the returned pointer in an `Opaque`, it's ok that `__cpu_enabled_mask`
> +        // may change its value.
> +        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_enabled_mask) }
> +    }
> +
> +    /// Get a CPU mask representing present CPUs; has bit `cpu` set iff cpu is populated
> +    #[inline]
> +    pub fn present_cpus() -> &'static Self {
> +        // SAFETY: `__cpu_present_mask` is a valid global provided by the kernel that lives
> +        // forever. Since we wrap the returned pointer in an `Opaque`, it's ok that
> +        // `__cpu_present_mask` may change its value.
> +        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_present_mask) }
> +    }
> +
> +    /// Get a CPU mask representing active CPUs; has bit `cpu` set iff cpu is available to
> +    /// migration.
> +    #[inline]
> +    pub fn active_cpus() -> &'static Self {
> +        // SAFETY: `__cpu_active_mask` is a valid global provided by the kernel that lives forever.
> +        // Since we wrap the returned pointer in an `Opaque`, it's ok that `__cpu_active_mask`
> +        // may change its value.
> +        unsafe { Cpumask::as_ref(&raw const bindings::__cpu_active_mask) }
> +    }
> +
>      /// Obtain the raw `struct cpumask` pointer.
>      pub fn as_raw(&self) -> *mut bindings::cpumask {
>          let this: *const Self = self;
> 
> -- 
> 2.34.1
