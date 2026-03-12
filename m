Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E8238C2A8
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305975; cv=none; b=V1uEGeHxzNxXp7WM5tNeeyq4G8/19rPip+VX7u+wAfRNiUqUS+41/xk8NNw8P6sXEjYfd/z7PEmFwliKZlwlqtToOAHS43M0u7+2tTOd+3ZqkA3zisBXWniNYN9evcJ5IsyytGOsrk+nVoaOP6YknmuCHyeRdCJA167h9NEuFnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305975; c=relaxed/simple;
	bh=komqTh+mbrmTn4WLTFvJVBOIg1iaONRELVwBktcm6cI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nOXhqgOQeQyjSdy3xg9wBM2/zImEXYK3GqW06Wwfn26bpdMEJ2L3ZyBVjC9346Gv8OcKBoCj88OnCa9By+EadkG7767PwOgd3hn/Fkb+gAUs3kCZUrDR7CRYFR19ctxwF6NxHSdqAbCbjiRQ6NWXrQ8QWO+UDvw1/7lgVy9dZSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fe2ls4xV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fe2ls4xV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773305970;
	bh=komqTh+mbrmTn4WLTFvJVBOIg1iaONRELVwBktcm6cI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fe2ls4xVJvd8MESqqojqNS9P+9PCh8qIXrWs65Suys4NXzoh1GKh4QKQoVelNCtc3
	 D6Mou5Ja717ZR/10VxZm1VGetA4vcGQvpuoOSEIIvbUBBO9EsIO0ZxPmV5Av7dEOEf
	 bh9HLDaCV1FhY0VwSRxkNcBQKJOLZRVDDA80sKrGp5wWcj/80fz7dFr8xZTM1OSV8n
	 cAfHqPtZz2qknGKDx64IAWGVxufPTuN4KnVGe35sT946LpI4RT3veFmnA5qmKdWKf5
	 9NgVwYOExQqiRBsQnKnATS+Fg4RPu8l0SrON8CVoYgrTGtF+HYCJDHrytU7fH9qDG9
	 56t33DDeqx3Yw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B627717E0071;
	Thu, 12 Mar 2026 09:59:29 +0100 (CET)
Date: Thu, 12 Mar 2026 09:59:24 +0100
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
Subject: Re: [PATCH v2 4/5] drm/tyr: Use register! macro for MMU_CONTROL
Message-ID: <20260312095924.09fa443f@fedora>
In-Reply-To: <20260311-b4-tyr-use-register-macro-v2-v2-4-b936d9eb8f51@collabora.com>
References: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
	<20260311-b4-tyr-use-register-macro-v2-v2-4-b936d9eb8f51@collabora.com>
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

On Wed, 11 Mar 2026 16:04:01 -0700
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Convert the MMU_CONTROL register definitions to use the `register!` macro.
> 
> Using the `register!` macro allows us to replace manual bit masks and
> shifts with typed register and field accessors, which makes the code
> easier to read and avoids errors from bit manipulation.
> 
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  drivers/gpu/drm/tyr/regs.rs | 56 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 51 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> index 686986536297ac2cc53ff14b162b19eaa759c192..6c16a041ab3c36f8aaf785487ad61925be65a026 100644
> --- a/drivers/gpu/drm/tyr/regs.rs
> +++ b/drivers/gpu/drm/tyr/regs.rs
> @@ -627,11 +627,6 @@ impl MCU_STATUS {
>  
>  pub(super) use gpu_control::*;
>  
> -pub(crate) const MMU_IRQ_RAWSTAT: Register<0x2000> = Register;
> -pub(crate) const MMU_IRQ_CLEAR: Register<0x2004> = Register;
> -pub(crate) const MMU_IRQ_MASK: Register<0x2008> = Register;
> -pub(crate) const MMU_IRQ_STAT: Register<0x200c> = Register;
> -
>  /// These registers correspond to the JOB_CONTROL register page.
>  /// They are involved in communication between the firmware running on the MCU and the host.
>  pub(super) mod job_control {
> @@ -681,3 +676,54 @@ pub(super) mod job_control {
>          }
>      }
>  }
> +
> +/// These registers correspond to the MMU_CONTROL register page.
> +/// They are involved in MMU configuration and control.
> +pub(super) mod mmu_control {

Feels weird to have pub(super) here, and pub(crate) on the reg
definitions. I know it's the same thing in practice because super is
the root of the crate, but I was wondering if there was another reason
for this distinction.

> +    use kernel::register;
> +
> +    register! {
> +        /// IRQ sources raw status.
> +        ///
> +        /// This register contains the raw unmasked interrupt sources for MMU status and exception
> +        /// handling.
> +        ///
> +        /// Writing to this register forces bits on.
> +        /// Use [`IRQ_CLEAR`] to clear interrupts.
> +        pub(crate) IRQ_RAWSTAT(u32) @ 0x2000 {
> +            /// Page fault for address spaces.
> +            15:0    page_fault;
> +            /// Command completed in address spaces.
> +            31:16   command_completed;
> +        }
> +
> +        /// IRQ sources to clear.
> +        /// Write a 1 to a bit to clear the corresponding bit in [`IRQ_RAWSTAT`].
> +        pub(crate) IRQ_CLEAR(u32) @ 0x2004 {
> +            /// Clear the PAGE_FAULT interrupt.
> +            15:0    page_fault;
> +            /// Clear the COMMAND_COMPLETED interrupt.
> +            31:16   command_completed;
> +        }
> +
> +        /// IRQ sources enabled.
> +        ///
> +        /// Set each bit to 1 to enable the corresponding interrupt source, and to 0 to disable it.
> +        pub(crate) IRQ_MASK(u32) @ 0x2008 {
> +            /// Enable the PAGE_FAULT interrupt.
> +            15:0    page_fault;
> +            /// Enable the COMMAND_COMPLETED interrupt.
> +            31:16   command_completed;
> +        }
> +
> +        /// IRQ status for enabled sources. Read only.
> +        ///
> +        /// This register contains the result of ANDing together [`IRQ_RAWSTAT`] and [`IRQ_MASK`].
> +        pub(crate) IRQ_STATUS(u32) @ 0x200c {
> +            /// PAGE_FAULT interrupt status.
> +            15:0    page_fault;
> +            /// COMMAND_COMPLETED interrupt status.
> +            31:16   command_completed;
> +        }
> +    }
> +}
> 

