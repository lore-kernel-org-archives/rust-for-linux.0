Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0502345758;
	Wed, 28 Jan 2026 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769611179; cv=none; b=a0xPTwmtG0leoVpoeObOTp3fF3TuLZGHKuP0/CCcHfLX2bAlFybWDFBuWMGkiiYl47F8vIofKD9ie2nUJRiolLsUlHcc6btWICsXK5Wg7CRGXnRCnaDsBLTAQuJbBr+/KqPWlKN7y46Ir5vHfXkX2BIoUBNiPZJjyS/Lyxtk8m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769611179; c=relaxed/simple;
	bh=jSmnDzfoFuj25TpKFsm2HIAp3wQLbF1GfGNPrEVMSX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzylWNjaRd/SwoG3OyeQJ4Xt7fXCAjpk21OEp3A+VAEEtzxaJIGZKS1mt4tUuEFHRpzQ21id3C6uRwcE98mg20EH4PoQcxpq6XkKxtkTz9rK+Qe4/3IS+tMe3Icr918XkKNJrBj1Tb9fAUuxvdGlzmmMNHYan1XZEJqKFxhlCLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 804F01515;
	Wed, 28 Jan 2026 06:39:30 -0800 (PST)
Received: from [10.57.51.176] (unknown [10.57.51.176])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35A403F5CA;
	Wed, 28 Jan 2026 06:39:34 -0800 (PST)
Message-ID: <ad8ce64b-0291-4322-b8db-a8b351e2e75f@arm.com>
Date: Wed, 28 Jan 2026 14:39:31 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: dma: allow drivers to tune max segment size
To: Beata Michalska <beata.michalska@arm.com>, dakr@kernel.org,
 ojeda@kernel.org, gary@garyguo.net, rust-for-linux@vger.kernel.org,
 dirk.behme@gmail.com
Cc: abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 aliceryhl@google.com, a.hindborg@kernel.org, boqun.feng@gmail.com,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 linux-kernel@vger.kernel.org
References: <20260128135320.689046-1-beata.michalska@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260128135320.689046-1-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-01-28 1:53 pm, Beata Michalska wrote:
> Make dma_set_max_seg_size() available to Rust so drivers can perform
> standard DMA setup steps.

Yup, API-wise this goes hand-in-hand with dma_set_mask calls, so keeping 
all the requirements in sync is the right thing to do. FWIW,

Acked-by: Robin Murphy <robvin.murphy@arm.com>

> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
> Apologies for delay.
> 
> v3:
> - Added __rust_helper
> 
> v2:
> - Aligned safety requirements
> 
>   rust/helpers/dma.c |  6 ++++++
>   rust/kernel/dma.rs | 17 +++++++++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/rust/helpers/dma.c b/rust/helpers/dma.c
> index e7defeecda71..20232ac64850 100644
> --- a/rust/helpers/dma.c
> +++ b/rust/helpers/dma.c
> @@ -43,3 +43,9 @@ size_t rust_helper_dma_max_mapping_size(struct device *dev)
>   {
>   	return dma_max_mapping_size(dev);
>   }
> +
> +__rust_helper void rust_helper_dma_set_max_seg_size(struct device *dev,
> +						    unsigned int size)
> +{
> +	dma_set_max_seg_size(dev, size);
> +}
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index acc65b1e0f24..909d56fd5118 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -85,6 +85,23 @@ unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
>               bindings::dma_set_mask_and_coherent(self.as_ref().as_raw(), mask.value())
>           })
>       }
> +
> +    /// Set the maximum size of a single DMA segment the device may request.
> +    ///
> +    /// This method is usually called once from `probe()` as soon as the device capabilities are
> +    /// known.
> +    ///
> +    /// # Safety
> +    ///
> +    /// This method must not be called concurrently with any DMA allocation or mapping primitives,
> +    /// such as [`CoherentAllocation::alloc_attrs`].
> +    unsafe fn dma_set_max_seg_size(&self, size: u32) {
> +        // SAFETY:
> +        // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
> +        // - The safety requirement of this function guarantees that there are no concurrent calls
> +        //   to DMA allocation and mapping primitives using this parameter.
> +        unsafe { bindings::dma_set_max_seg_size(self.as_ref().as_raw(), size) }
> +    }
>   }
>   
>   /// A DMA mask that holds a bitmask with the lowest `n` bits set.

