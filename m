Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3128E204597
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742053956; cv=none; b=e9tNjsNmq3YSJzLA6m8/rtiijTjvbM8lZ1DENxMz1WVWrk4Azjtfw1ZrAPSsY2jT06LqPSn2b0u8Vy1Cdu6ud2NQtbZL4BFzmPnjo3tXpC1njFwUuT3H5jqCEnDejz/p/tthFq+qpXBh1hgDm7nYmEQuW7pVijy0HB3G4zr0E8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742053956; c=relaxed/simple;
	bh=1H2Zp9zT3Ov5Jw1YDxBIg5v1DVQ5gE8SiT8KloZQ3x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2QVjunPO/epiu8r9AgriXDH/rb4/9guQ1s20CBF7JqiHeQCBcTUMrftJlE1SSD7GbsPEVCXW/CfMFM0EFIeWD1FVtqsKGvPyrZhHvOFYWmowDvgUFk1v4cEz2iwDh2kuyF7UTOy4gmAINTm8S2nwVX0XGuPN15CATHSV0nN7Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYfTFEoy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYfTFEoy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56145C4CEE5;
	Sat, 15 Mar 2025 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742053955;
	bh=1H2Zp9zT3Ov5Jw1YDxBIg5v1DVQ5gE8SiT8KloZQ3x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYfTFEoyQaMo4z9F60nb8GDtYCuERuKtPvHLHb0KLG3veTxKuiqWpwJSmSM5wet2w
	 Nlqk+tTLBtSc2I1D9yUsurm6IYmxVctdlwyYo5WiX3P6U0N1reqUN2wasyM1HtTrg6
	 AXXYrDs3kXICtQt84GHE4aLlqE3V83qrtTIIu9zI7RB1i/VY12+oDbctmqiFAFlo+8
	 U0CEtwhDya/5L7EzjLcgHgchZqwOzoNoH78CbgItMgtQI+vXnwjju6TvvbKFpLbu0d
	 NPrQGgEn1Oz+nXKQyGLMLf6LXth8Kd4PqqrZnJjVBAn/SeOyH14XVYRAJZVymKnFnx
	 Q9J7p3J7XY2Fw==
Date: Sat, 15 Mar 2025 16:52:30 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Cc: andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: alloc: add missing invariant in Vec::set_len()
Message-ID: <Z9WiPlV7fZx_BbHr@cassiopeiae>
References: <20250315154436.65065-1-dakr@kernel.org>
 <20250315154436.65065-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315154436.65065-2-dakr@kernel.org>

On Sat, Mar 15, 2025 at 04:43:02PM +0100, Danilo Krummrich wrote:
> When setting a new length, we have to justify that the set length
> represents the exact number of elements stored in the vector.
> 
> Fixes: 2aac4cd7dae3 ("rust: alloc: implement kernel `Vec` type")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

[1] probably justifies

	Reported-by: Alice Ryhl <aliceryhl@google.com>

[1] https://lore.kernel.org/rust-for-linux/20250311-iov-iter-v1-4-f6c9134ea824@google.com/

> ---
>  rust/kernel/alloc/kvec.rs | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 8540d9e2b717..0a4681ad4ce9 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -195,6 +195,9 @@ pub fn len(&self) -> usize {
>      #[inline]
>      pub unsafe fn set_len(&mut self, new_len: usize) {
>          debug_assert!(new_len <= self.capacity());
> +
> +        // INVARIANT: By the safety requirements of this method `new_len` represents the exact
> +        // number of elements stored within `self`.
>          self.len = new_len;
>      }
>  
> -- 
> 2.48.1
> 
