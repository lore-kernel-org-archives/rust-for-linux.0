Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525512D061D
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 21:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765835697; cv=none; b=FxM1FwHkWVhMkUKL8Y1YdZJS9t4Q74AVic/fm3XLrYpmlsKjLN4XN0oolM7Fvfr4kkBlhBZ2GZ8Xu6b8jaJuq62kpTwH7IoMosdY7kOJGJ+saph3jyCKWRQoWRHRFkUQS0rWDsJzd07uGIjn70HAphmQQZOc5DIQkGdFGI6gjR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765835697; c=relaxed/simple;
	bh=Ys9PX5OJDQV3p1mo7HMt0zbWbBnDZcFRjy4JCLpTyOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OP/r+m00AGtxkPS4ehMexNA2xSnlxXReqv0OenBZxNTdZ2T+gqK2vyhoN4dybRXnCA0rj44YPFugac5eg65JH1pzck+u03QM75O+q3KIgbo46Mmqgydj1ZXvnjrWsZbEmO1raJDPLmAZsuMCi5NSk8eOtHI7J/qlw/SVSow4iuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAKUZ308; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAKUZ308"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso13617955e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 13:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765835694; x=1766440494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S0gVhXTFg9zWfdIo9rMVKiNC2uPKLwZh3wLJdvlg9AM=;
        b=WAKUZ308VupohZpk+NELZDRQdtGufgWbmAKdyTGKG9B6UviLX+MMCMJpf+EWuvwSbQ
         ClgHJo9OGTohTKy2XLTbmV5lacnycEz6sSJwiztWaDrYjV/MXJD5YifQBlp17Mkr8CBq
         P3/1fnv+5qZgu5bJe0xFX0rsJWyFn+oURcrxXRZ2Ocl3ripsk/9CK8+mytOGjzuIZDia
         kbW9EQyzpxoEu/+qiPUFiBRPX774Hlk42Mdh2zZ6vr0d3BC9VRk2xx1TG9aLKSjdtJBU
         u2yK+yyXCX5JtLsFV3FgpTyvmxzALhBoPplyKI+g5/GalzlTqOE1JzCoFNYGEN0LwOns
         FUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765835694; x=1766440494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0gVhXTFg9zWfdIo9rMVKiNC2uPKLwZh3wLJdvlg9AM=;
        b=XsI6nH4JU/WcAU2S7QO9M6v7es77+1V0r7JrFWi2ObjkE7METeY7sxGJ7gpnHZVGLf
         omGYdK+pFXcTSyX+Cl/BIONSOr1+IHRX5p6GnEGSGLS8PMF5ixllREN4D3W7LJWI2VJW
         VNSju8GIDxUhgxmeRltkC0PskDdptqRUDZHu87VlFykGpLniSZjBb+firLlkf+Et0bu6
         407V8IdHkXJZdinIp41fgBeIhH//ab+Ll6Xw9s/jiNOBS9VybnBtgrUOk8mVJvS5ynGe
         tWATkHkp9F8OJRaJLj7fruZslfFj6jxvXUg5dpH2mgyo+smAWPHZ7Rgbf0SWxEAUZqkT
         RrDg==
X-Gm-Message-State: AOJu0YyaHU4B74vGBGP2X4PApaAlJhvKTeeKjGUmdFlsSXoXoVWKDGnL
	s/kMDNoqbfRZw6tAmTQO4aZmNVns0LsTlapAyBDshnB4BMKQ9h4zADql
X-Gm-Gg: AY/fxX4cggdYIdRldhzeF0l+phZxoh8ukWYG9jF9wbBolPkaNm+p7r8wLCLoFqQDNyL
	IfmE2mFhiy1N5J5MfOnkV4QfMNMNZJwuD9AtjLFqlcqQAlCx22fqXcqOLu+ooDFNYtMY+KJ2ovW
	nw+02uAI4/ZMbquyCC+askcigxH7dxQF+36YOxoy0CLqvSEqzJdlTtI1OMOQBaVC0/dhY25r5p0
	790PZn7K/DJ787bC+i0CYn2108UkWRmjanWND5quB26V7HAIrLktrqdkb/tQlJC2miYcmWwI90P
	9AVG6xHa1yRFcyNpsrLFxMmwQbFk8qqubuSIDSRiupNNTzXOevSITWf+Y7PC56Nci2Jxk6sZax8
	GIDhHXQmj9ii2RmDFJX5pMq+hxMZBrhilZ8c89gs/xKe1pCsaltT2+wR0OQxpMVQF7MgLtEjn6G
	JMkXxRgsTRK58LeSb5OKM+zytHq2gagIvgs/xEndGzPx1rYW81hksIVO0960vq3FdG
X-Google-Smtp-Source: AGHT+IFTI4sYZEjMk9f2jahtygMSkLe3aHnWEHuPYwgG0FKH1gYqgH6WE4YA1M3QQ33/1/9P9JEDFg==
X-Received: by 2002:a05:6000:186d:b0:425:86da:325f with SMTP id ffacd0b85a97d-42fb3ee6156mr13239778f8f.27.1765835693293;
        Mon, 15 Dec 2025 13:54:53 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fb7118267sm24170397f8f.27.2025.12.15.13.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 13:54:52 -0800 (PST)
Date: Mon, 15 Dec 2025 21:54:51 +0000
From: Stafford Horne <shorne@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v16 04/17] openrisc: Include <linux/cpumask.h> in smp.h
Message-ID: <aUCDq_hDrQHjMAn5@antec>
References: <20251215175806.102713-1-lyude@redhat.com>
 <20251215175806.102713-5-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215175806.102713-5-lyude@redhat.com>

On Mon, Dec 15, 2025 at 12:57:51PM -0500, Lyude Paul wrote:
> While OpenRISC currently doesn't fail to build upstream, it appears that
> include <asm/smp.h> in the right headers is enough to break that -
> primarily because OpenRISC's asm/smp.h header doesn't actually provide any
> definition for struct cpumask. Which means the only reason we aren't
> failing to build kernel is because we've been lucky enough that every spot
> including asm/smp.h already has definitions for struct cpumask pulled in.
> 
> This became evident when trying to work on a patch series for adding
> ref-counted interrupt enable/disables to the kernel, where introducing a
> new interrupt_rc.h header suddenly introduced a build error on OpenRISC:
> 
>      In file included from include/linux/interrupt_rc.h:17,
>                       from include/linux/spinlock.h:60,
>                       from include/linux/mmzone.h:8,
>                       from include/linux/gfp.h:7,
>                       from include/linux/mm.h:7,
>                       from arch/openrisc/include/asm/pgalloc.h:20,
>                       from arch/openrisc/include/asm/io.h:18,
>                       from include/linux/io.h:12,
>                       from drivers/irqchip/irq-ompic.c:61:
>      arch/openrisc/include/asm/smp.h:21:59: warning: 'struct cpumask'
>      declared inside parameter list will not be visible outside of this
>      definition or declaration
>         21 | extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
>            |                                                           ^~~~~~~
>      arch/openrisc/include/asm/smp.h:23:54: warning: 'struct cpumask'
>      declared inside parameter list will not be visible outside of this
>      definition or declaration
>         23 | extern void set_smp_cross_call(void (*)(const struct cpumask *, unsigned int));
>            |                                                      ^~~~~~~
>      drivers/irqchip/irq-ompic.c: In function 'ompic_of_init':
>   >> drivers/irqchip/irq-ompic.c:191:28: error: passing argument 1 of
>      'set_smp_cross_call' from incompatible pointer type
>      [-Werror=incompatible-pointer-types]
>        191 |         set_smp_cross_call(ompic_raise_softirq);
>            |                            ^~~~~~~~~~~~~~~~~~~
>            |                            |
>            |                            void (*)(const struct cpumask *, unsigned int)
>      arch/openrisc/include/asm/smp.h:23:32: note: expected 'void (*)(const
>      struct cpumask *, unsigned int)' but argument is of type 'void
>      (*)(const struct cpumask *, unsigned int)'
>         23 | extern void set_smp_cross_call(void (*)(const struct cpumask *, unsigned int));
> 
> To fix this, let's take an example from the smp.h headers of other
> architectures (x86, hexagon, arm64, probably more): just include
> linux/cpumask.h at the top.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  arch/openrisc/include/asm/smp.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/openrisc/include/asm/smp.h b/arch/openrisc/include/asm/smp.h
> index e21d2f12b5b67..0327d8cdae2d0 100644
> --- a/arch/openrisc/include/asm/smp.h
> +++ b/arch/openrisc/include/asm/smp.h
> @@ -9,6 +9,8 @@
>  #ifndef __ASM_OPENRISC_SMP_H
>  #define __ASM_OPENRISC_SMP_H
>  
> +#include <linux/cpumask.h>
> +
>  #include <asm/spr.h>
>  #include <asm/spr_defs.h>

This looks good to me.

Acked-by: Stafford Horne <shorne@gmail.com>

