Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FEE36BCF2
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773304806; cv=none; b=tS4bCiZC79m5sB5zRNaeLeZmoNwaC7Diqr/DqLIJ1/wpoaYhcvDepQkP+RLUfvTmGae58oHq9OalMP07zA4CaF0YNkEYfkvFOekos7LAFyo4ARbbgjkZqPFP99rPmpx3cki3jSHZhcjCI7eMkvZDx/LC0BEBuEUdaXBVZn5gaZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773304806; c=relaxed/simple;
	bh=b691kikzwlrpXlw+lF/1l96qeUs1OvefwrE5tY/G8hM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A+H3ec/+PXgCuqN8n5kAEJBTy45OVKK7gRbeW78hePI5On4aFUXEiDUaIwxRdsP0Pb1Bbcw33PtGTSE5mWGqszMtjssChH0NE9yv3RXSzMllrytcMOg96kdtimV3E3Gi4M3P7Oj7Qv51NhkBHEasE4mD0yvu8LJXxaqp7CypxNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nhZ8FcQn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nhZ8FcQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773304798;
	bh=b691kikzwlrpXlw+lF/1l96qeUs1OvefwrE5tY/G8hM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nhZ8FcQnXpagjlxd8O075ad03yu6wOL6uQaLpnzzA5LhavQvDa6zg+0nk5arjx9Xg
	 AktOt9DIXL5A89GyYGpQERolBBcXgEKnKlgedMbAol3nsN0TbqBqEUwx6QDgLdMJpl
	 kF9QxkNpmuYZe6s2Iuzmhkd2YxgBLhG0IcjrtTIZ7SpX6CsjymB6hpFrpcfjZlprwq
	 2JHKtM/PkbIkd03Wh3gZtu8S6f8jmxOFNREFlP39fr4Ki/8gmkkBtS14QDFLjlf/Wl
	 RF03rFz1xAe8Zb0e+jsNiFfqykeacf1i6NkoWt5F+Bi48BDWwjGXEnPmQYFdQwTD/p
	 vnYe+yx3Vjk6w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF94717E0071;
	Thu, 12 Mar 2026 09:39:57 +0100 (CET)
Date: Thu, 12 Mar 2026 09:39:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Danilo
 Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Steven
 Price <steven.price@arm.com>, Dirk Behme <dirk.behme@gmail.com>, Alexandre
 Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v2 1/5] drm/tyr: Use register! macro for GPU_CONTROL
Message-ID: <20260312093953.78f53864@fedora>
In-Reply-To: <20260311-b4-tyr-use-register-macro-v2-v2-1-b936d9eb8f51@collabora.com>
References: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
	<20260311-b4-tyr-use-register-macro-v2-v2-1-b936d9eb8f51@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Mar 2026 16:03:58 -0700
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

Just a couple drive-by comments. Didn't go through all the register
definitions to make sure they are correct, but I'm pretty happy with
the transition to the register!() macro overall (maybe at some point we
can even automate the generation through some script...)

> @@ -78,11 +84,17 @@ unsafe impl Send for TyrDrmDeviceData {}
>  unsafe impl Sync for TyrDrmDeviceData {}
>  
>  fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
> -    regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
> +    let io = (*iomem).access(dev)?;
> +    io.write_val(
> +        GPU_COMMAND_RESET::zeroed().with_const_reset_mode::<{ GPU_COMMAND_RESET::SOFT_RESET }>(),

I don't see a .with_[const_]command() here, is there a trick I'm
missing, or are you relying on the fact GPU_COMMAND::RESET is zero
(which works, but is quite confusing). On a side note, it be good if we
could have a mode where fields get auto-initialized for such alias
(more on this below).

> +    );
>  
>      poll::read_poll_timeout(
> -        || regs::GPU_IRQ_RAWSTAT.read(dev, iomem),
> -        |status| *status & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED != 0,
> +        || {
> +            let io = (*iomem).access(dev)?;
> +            Ok(io.read(GPU_IRQ_RAWSTAT))
> +        },
> +        |status| status.reset_completed().get() != 0,
>          time::Delta::from_millis(1),
>          time::Delta::from_millis(100),
>      )

[...]

> @@ -182,37 +105,67 @@ struct GpuModels {
>      prod_major: 7,
>  }];
>  
> -#[allow(dead_code)]
> -pub(crate) struct GpuId {
> -    pub(crate) arch_major: u32,
> -    pub(crate) arch_minor: u32,
> -    pub(crate) arch_rev: u32,
> -    pub(crate) prod_major: u32,
> -    pub(crate) ver_major: u32,
> -    pub(crate) ver_minor: u32,
> -    pub(crate) ver_status: u32,
> -}
> -
> -impl From<u32> for GpuId {
> -    fn from(value: u32) -> Self {
> -        GpuId {
> -            arch_major: (value & genmask_u32(28..=31)) >> 28,
> -            arch_minor: (value & genmask_u32(24..=27)) >> 24,
> -            arch_rev: (value & genmask_u32(20..=23)) >> 20,
> -            prod_major: (value & genmask_u32(16..=19)) >> 16,
> -            ver_major: (value & genmask_u32(12..=15)) >> 12,
> -            ver_minor: (value & genmask_u32(4..=11)) >> 4,
> -            ver_status: value & genmask_u32(0..=3),
> -        }
> -    }
> +pub(crate) fn gpu_info_log(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
> +    let io = (*iomem).access(dev)?;
> +    let gpu_id = io.read(GPU_ID);
> +
> +    let model_name = if let Some(model) = GPU_MODELS.iter().find(|&f| {
> +        f.arch_major == gpu_id.arch_major().get() && f.prod_major == gpu_id.prod_major().get()
> +    }) {
> +        model.name
> +    } else {
> +        "unknown"
> +    };
> +
> +    // Create canonical product ID with only arch/product fields, excluding version
> +    // fields. This ensures the same product at different revisions has the same ID.
> +    let id = GPU_ID::zeroed()
> +        .with_arch_major(gpu_id.arch_major())
> +        .with_arch_minor(gpu_id.arch_minor())
> +        .with_arch_rev(gpu_id.arch_rev())
> +        .with_prod_major(gpu_id.prod_major())
> +        .into_raw();
> +
> +    dev_info!(
> +        dev,
> +        "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
> +        model_name,
> +        id,

This was previously right-shifted by 16. Now, I'm questioning this
decision to filter out the version fields. I think it'd be better to
print the raw ID directly. We're already extracting and printing the
arch major.minor and version status, but if there's anything else
we want to clearly extract from this raw ID, we could add more.

TLDR; that's probably one place where I think it's not such a bad idea
to diverge from Panthor and print an unmodified GPU_ID. Maybe s/id/raw
GPU ID/ to make the distincting clear. None of this should happen in
this commit though. Either we do that in a preliminary commit that
drops the `>> 16`, or we keep the `>> 16` here, and change that in a
follow-up.

> +        gpu_id.ver_major().get(),
> +        gpu_id.ver_minor().get(),
> +        gpu_id.ver_status().get()
> +    );

[...]

> +
> +    impl GPU_COMMAND {
> +        /// No operation. This is the default value.
> +        pub(crate) const NOP: u32 = 0;
> +        /// Reset the GPU.
> +        pub(crate) const RESET: u32 = 1;
> +        /// Flush caches.
> +        pub(crate) const FLUSH_CACHES: u32 = 4;
> +        /// Clear GPU faults.
> +        pub(crate) const CLEAR_FAULT: u32 = 7;
> +    }
> +
> +    register! {
> +        /// GPU command register in reset mode.
> +        /// Set command to [`GPU_COMMAND::RESET`] to set reset_mode.
> +        pub(crate) GPU_COMMAND_RESET (u32) => GPU_COMMAND {
> +            7:0     command;

Alexandre, dunno how hard it would be to extend this alias syntax to
provide auto-initialization/expected-value of certain fields, like:

	pub(crate) GPU_COMMAND_RESET (u32) => GPU_COMMAND {
            7:0     command <- GPU_COMMAND::RESET;
            11:8    reset_mode;
        }

so that when you instantiate a GPU_COMMAND_RESET, all you have to set is
reset_mode and the command gets set to GPU_COMMAND::RESET for you.
(that's for the write path, for the read path, you'll need some sort of
match to do the re-interpretation anyway).

Just to be clear, I'm not asking for any of that in the current
register!() patchset. It's more a suggestion for a potential future
improvement.

> +            11:8    reset_mode;
> +        }
> +    }
