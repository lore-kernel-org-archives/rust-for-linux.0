Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6BD30FF29;
	Tue,  6 Jan 2026 22:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767739464; cv=none; b=EoWYxMRglCR8wmPP5mhRODhuBFiLF3EZxMjS9eodZoUdNYPw30KeLZZFQ4C7CDRfnlbqqb8JKIk8eotQwknvEegV5j4uq8d9eDE2nMj7a6We+dTrgwXg77f9P0QDSbPSHIj0Y/ZK9oQcSjo/Bf/koiJ/TMI17uzxcy+ZdRtxRb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767739464; c=relaxed/simple;
	bh=2ab/KARjjTASRxH1G2UQX810qb+gcVXxaHxCsKph2R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1HvmmPX28hHjPzi2Ays2A4A1g1GbndfvIKYDh0mY6YAsWwrp9wu4lmfx9RYDU2mf3BAl6O/cu/3LKDgTjt0cw7PPOZbUcnYR0scjL2EixSqVnpWHH0GdyqwV2voP9eWbgipF9USt9E5Y86bivMAEflR2jrOPlYVzNzH0u4LHYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBoBt55c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBoBt55c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF847C116C6;
	Tue,  6 Jan 2026 22:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767739462;
	bh=2ab/KARjjTASRxH1G2UQX810qb+gcVXxaHxCsKph2R4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KBoBt55cEK8Z5F8h93u3KInDvV8vxkXbZqDInAEg32+AghOmQRZoYgeazDQPWazO4
	 ZnZSGeh588eD9bLUUFU7Cjj8krNzU5/W86FQ98CXRAtfHN8eokNCvEVMF39if7uUBZ
	 XdBKbYenw3eJRhijeOpiRfGxNrtI5PeMXvBf1MpOwok8vWKHs8ScUQV7gSsl0vMgar
	 Sl+eUU2nwVXpl1bvTt1QrueLgKcZJpaT5JvEd4JV004sG0hL0XYrV9YY2Fz8RqQth3
	 eweZLH8yUkpmhcZxNRB3hElWwz3ceGRHwgbgefhkjUMq5zS37eFRn1qxfWZr50kzpA
	 jw0jFPec1/+2A==
Message-ID: <9a8f8500-aa1e-4145-b84d-7ce424ead644@kernel.org>
Date: Tue, 6 Jan 2026 23:44:17 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: use CStr::from_bytes_until_nul() and
 remove util.rs
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260103013438.247759-1-jhubbard@nvidia.com>
 <DFHHP3LVYW43.247TW37BCGYHE@kernel.org>
 <09e0454c-222b-41e6-a8e5-6d6240b20479@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <09e0454c-222b-41e6-a8e5-6d6240b20479@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/6/26 11:09 PM, John Hubbard wrote:
> Yes, so that would look approximately like this, I can send this as
> another patch if it looks reasonable:

Thanks, looks good! Two comments below.
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
> index a53d80620468..71fca7350b94 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -238,11 +238,11 @@ pub(crate) fn boot(
>  
>          // Obtain and display basic GPU information.
>          let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
> -        dev_info!(
> -            pdev.as_ref(),
> -            "GPU name: {}\n",
> -            info.gpu_name().unwrap_or("invalid GPU name")
> -        );
> +        let gpu_name = info
> +            .gpu_name()
> +            .inspect_err(|e| dev_warn!(pdev.as_ref(), "GPU name: {}\n", e))
> +            .unwrap_or("<unavailable>");
> +        dev_info!(pdev.as_ref(), "GPU name: {}\n", gpu_name);

I'd probably only print one or the other. Also, I think this should be
dev_dbg!() instead of dev_info!().

> +/// Error type for [`GetGspStaticInfoReply::gpu_name`].
> +#[derive(Debug)]
> +pub(crate) enum GpuNameError {
> +    /// The GPU name string does not contain a null terminator.
> +    NoNullTerminator(FromBytesUntilNulError),
> +
> +    /// The GPU name string contains invalid UTF-8.
> +    InvalidUtf8(Utf8Error),
> +}
> +
> +impl kernel::fmt::Display for GpuNameError {
> +    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
> +        match self {
> +            Self::NoNullTerminator(_) => write!(f, "no null terminator"),
> +            Self::InvalidUtf8(e) => write!(f, "invalid UTF-8 at byte {}", e.valid_up_to()),
> +        }
> +    }
> +}

Do we need this Display impl, or is the derive(Debug) you have already good
enough for the warning print?

