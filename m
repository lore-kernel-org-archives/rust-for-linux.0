Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598E02236FB
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754040562; cv=none; b=Mhjx8pjzAkLJXWgADch24FNUzlwFHa+A0JuheJkXDBu279xpwkqOpn23N6rZCc4BK+lbaukoDSAPMIWpMf1W6V9j8OpVgy9+bW9AaLeAVvQp0nHovxBwlNbzvGKL9HYJR5xH25ajGz2HSnlqmdDTPQ/7hNAZ54g9SuoR5Al5mcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754040562; c=relaxed/simple;
	bh=1BYe56e9HMVy3xgaf1Iz6V2qbe4t2sz09d39moFk99I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VST5dZukxgHxThAXmanq9eIw8ad7kGThC4wdWSDv/brAl0S3LcysjHbh1YzB4v/JxSPKq3HIogI5Ad6n2sbabU9s8RcjbkVpDix6uRtW7pbL8oZRtEbB7yE+xFNK4ecSYoIrT0inYfPFOLfz3EIGav9DtkqHqMk2bOM2R+/afc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nJjz5eXA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=327q2dIM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nJjz5eXA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="327q2dIM"
Date: Fri, 1 Aug 2025 11:29:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754040556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ova+vNI28FPI82CeUH4i8eEwaxh8Bm7iD+PyNauGWGA=;
	b=nJjz5eXA3X2ChMFpvoQzS3IZ2f6/shakOjreJFg1B91MTBn0QBf3PmDM/Cbx+/lEx/Bqwa
	Xf7OsqF4T2FdJ10xKGDxVzRhKYThHWHIZUiqiMIuxQmwKsdLBeAg8PoWCdxm4RhDzPouIH
	+mKqwC4I+K4uuc10vt37nSznSRv+o1twaQWPxKHLyKTW6Oob+oDztMMfjbrqbMz4Z/5fNq
	48hYnr0qLdpu4lvZWgNsNAmGZmKvognSMAf+yhlIFNQLHcTB0SETrNvwMLpDrSlKaWzwm2
	bwVgMm3/saJzeWaSgZxDdhRbWOITnivatH4ehQlVg6zbEfA56gbFrJxuTOHZZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754040556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ova+vNI28FPI82CeUH4i8eEwaxh8Bm7iD+PyNauGWGA=;
	b=327q2dIM7AHakBddR0i7X0tidlD4HhV2QL29/7LGORZKj1I3BhEhcMGrjfMqsYOIs6rpEc
	HgPIZkqQYxSVpvDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Paolo Bonzini <pbonzini@redhat.com>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Javier Martinez Canillas <javierm@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/panic: Add a u64 divide by 10 for arm32
Message-ID: <20250801111922-3af19987-9141-47a7-b67a-d10ac091ce2e@linutronix.de>
References: <20250627123854.921704-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627123854.921704-1-jfalempe@redhat.com>

On Fri, Jun 27, 2025 at 02:38:19PM +0200, Jocelyn Falempe wrote:
> On 32bits ARM, u64 divided by a constant is not optimized to a
> multiply by inverse by the compiler [1].
> So do the multiply by inverse explicitly for this architecture.
> 
> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic_qr.rs | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index dd55b1cb764d..774a17de4f2f 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -381,6 +381,26 @@ struct DecFifo {
>      len: usize,
>  }
>  
> +// On arm32 architecture, dividing an `u64` by a constant will generate a call
> +// to `__aeabi_uldivmod` which is not present in the kernel.
> +// So use the multiply by inverse method for this architecture.

I think the problem here is the u64 by u64 division. u64 by u32 should work.
Unfortunately Rust doesn't seem to have a way to perform a mixed-type division.
We already have optimized C/ASM helpers for u64 divisions. For example
div_u64() does such an u64 by u32 division.
While it may be slower than the inverse multiplication, it is less code, easier
to understand and will work for all architectures automatically.

> +fn div10(val: u64) -> u64 {
> +    if cfg!(target_arch = "arm") {
> +        let val_h = val >> 32;
> +        let val_l = val & 0xFFFFFFFF;
> +        let b_h: u64 = 0x66666666;
> +        let b_l: u64 = 0x66666667;
> +
> +        let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
> +        let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
> +        let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
> +
> +        tmp3 >> 2
> +    } else {
> +        val / 10
> +    }
> +}
> +
>  impl DecFifo {
>      fn push(&mut self, data: u64, len: usize) {
>          let mut chunk = data;
> @@ -389,7 +409,7 @@ fn push(&mut self, data: u64, len: usize) {
>          }
>          for i in 0..len {
>              self.decimals[i] = (chunk % 10) as u8;
> -            chunk /= 10;
> +            chunk = div10(chunk);
>          }
>          self.len += len;
>      }
> 
> base-commit: 3529cb5ab16b4f1f8bbc31dc39a1076a94bd1e38
> -- 
> 2.49.0
> 
