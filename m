Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B9E379EE2
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017997; cv=none; b=cnDDhuVHfBYHIMUEu7R4d/PurwWc2w8Lq9Hpb6nNLRhIXPAqPIfFqkR18BXDQLNCTYTPJFBtiqZuq1mtx0vNCnr7u1Qjg8XoF030rgrVHdLMdzX+ifiT9/gjZSs2dgMCkG1Id+G9n+hXSCJOgNEf4Za8OTDFMAYEzrCa4ni2aaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017997; c=relaxed/simple;
	bh=pjNgn7D5+4A3j37DfrD6Q1pdbqZ6bsh85OABrwuUgno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ppq+VxVP+hPNWYLaycycu9LUd7xiDaYAh2JpXJ6jj6KpaHAkLVab7Fe0JQNzitaOrKEaWJr8LWqMmccAoafkxiOhlQz7GUymoi1/uw+E3RdFALzLnChhKnes5ivXjQLOS51o1U60nEE99pBkVLupaqj7OyvJD/5tqT/dMIfVH5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtZ3YEC/; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtZ3YEC/"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35e563b0ee7so3653254a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777017994; x=1777622794; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/RCpdNlcyc5wjzZkBzWIIC1nFpk179iwlYkDekoHWOw=;
        b=jtZ3YEC/lWF+JQwlXQ2Zk0Gk4G99alfHjKscAIf3Wz5uExt+7fvWxioqinkIPIPmmM
         HJE3gGzYubtfNKgbUF1bLIoHVsXy2izDHM9JFhltEkTT1RhA/vL8t7e+jbGXbQdyjGAr
         m4pTcH/6SHi/8wwxBH7auq22zVKX3PnQBmlVfBkJUjYxpKuBhWfpfwdqN14ELi+0M9LZ
         5exFeqOyZ8nC0QVEU9Abfe6x1i02sjhA1cEdSwNHTRKkoybY6qO/Rpv5c76TlF/nbwo1
         /e0V+vueRXQ0ZztcSh2DCIY7yVeZX+kII940dqVrJFSfi5NkrfuNHhA7yTiu3tpPSTYt
         KOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017994; x=1777622794;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RCpdNlcyc5wjzZkBzWIIC1nFpk179iwlYkDekoHWOw=;
        b=Fo2wHuiRTIy8jZMIOWYKE4AfjXiX6lbuYaMVK7ALT3BN14xHUkvZaVPc+TObh5v+xU
         LtVQjYEFVF5v2E8RIau+cboK1XUAF0B4WSDdZ8+Yi02hZi5jiEKvrAIrQ+0e6hfls/iq
         8KlLN8gqJ9KMJcQDdQ97q6VFZnxZjg8Euk/fRFs12yaF2ZA+rguBj3c9tdogYdbS6vH8
         i28sDV/WjHlMjqlziIMSZ8ynglwBwCWF/Xmdr6OJ1TuaqAQymodk6uGSnpNd0UmxnwH8
         OvTS/ofy9VbRV/BpRBsYkuBcGiiacohXGNRvI3ficyx3nGGgNt4OCnat5GETf3RyaVkS
         2GPA==
X-Forwarded-Encrypted: i=1; AFNElJ/ID51dqVTiLfSNbLKq2GvsC+WeG20pUy5Io22/T5rpgraSLzBl2Y5zPdchsXp8ZBYZ7Tc8zw2auktxW4TLtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw8PewziKGuvdfQkZPpdJX5DrGCnUo0teN6vCrb3+nWMqsUbDJ
	9weq0y6Q77j/9AIiAxEy2n2rbvGhh6XfBdSWwK3w+kLIIfcVU0l4EOhE
X-Gm-Gg: AeBDietf3M+paGmI5+MB4CgWzkSBxBBeAwPzcBVSp8IkPr+Dgm0Eyz0Bdw6m47EVl//
	RzT/irHR5DGdEIDc+L6E33s3654Pcmr2E9BKLPvhJX1DZ3i3SuAw8I6J3BJ1AuSCbX2R1+VLpaq
	1saw40lm9hYm+GleOOLLbttmg11sTYWgnltt87td7/okJDd8f+LCDpO8r8HLRHhfrjLTP8xow7K
	OytlNaefIxD9uNzIO3TsAS1BCy8+eJ08RjXHuRK49arEGaEUQx0/Irte8pAXGRCxnSjXOyd/6V2
	K+F4CYkk+tyoaO7TbnO6OPXBdhzIm0gXahjPwsT/QX/eSu1QxJG3FMxXPpZwNeZ8WPEnj7cNX+D
	2pGiuW5CnYQa7UgbePFLiJ7Ks5h5dDhXdzrss3NYmoGeqkvdBi1dYELA1FDzaNz/Qh6uos1tUlK
	REannV7I03ZXciqCQIp/5D0FWfzux+PRt88s9sMGcz1gF9GWoIkJoxe0yyElEm4iV+/yezjfox+
	8cmOA==
X-Received: by 2002:a17:90b:3ec5:b0:35f:b4c1:91ea with SMTP id 98e67ed59e1d1-361402ee818mr23969038a91.13.1777017993532;
        Fri, 24 Apr 2026 01:06:33 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361419739dfsm23565688a91.13.2026.04.24.01.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:06:32 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:36:18 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, sumit.semwal@linaro.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, 
	simona.vetter@ffwll.ch, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V13 2/7] dma-resv: Fix undefined symbol when
 CONFIG_DMA_SHARED_BUFFER is disabled
Message-ID: <aeskOeb9uBiPptEJ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-3-mkchauras@gmail.com>
 <b4dcb464-7784-47e2-a973-6d731ab9ccf8@amd.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4dcb464-7784-47e2-a973-6d731ab9ccf8@amd.com>

On Fri, Apr 24, 2026 at 09:56:16AM +0200, Christian König wrote:
> On 4/24/26 07:47, Mukesh Kumar Chaurasiya (IBM) wrote:
> > When building with LLVM=1 for architectures like powerpc where
> > CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:
> > 
> >   ld.lld: error: undefined symbol: dma_resv_reset_max_fences
> >   >>> referenced by helpers.c
> >   >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)
> > 
> > The issue occurs because:
> > 1. CONFIG_DEBUG_MUTEXES=y is enabled
> > 2. CONFIG_DMA_SHARED_BUFFER is not enabled
> > 3. dma_resv_reset_max_fences() is declared in the header when
> >    CONFIG_DEBUG_MUTEXES is set
> > 4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
> >    which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
> > 5. Rust helpers call dma_resv_unlock() which calls
> >    dma_resv_reset_max_fences(), causing an undefined symbol
> > 
> > Fix this by making the function declaration conditional on both
> > CONFIG_DEBUG_MUTEXES and CONFIG_DMA_SHARED_BUFFER. When either is
> > disabled, use a static inline stub instead.
> 
> Well we are clearly missing something here, but of hand that doesn't looks like the right fix.
> 
> When CONFIG_DMA_SHARED_BUFFER isn't enabled then the whole dma-resv.h header can't be used at all.
> 
> So you also can't call dma_resv_unlock() from the Rust helpers. Which means that we need to make the Rust helpers somehow depend on CONFIG_DMA_SHARED_BUFFER.
> 
> Alternative would be to provide dummies for the functions in dma-resv.h when CONFIG_DMA_SHARED_BUFFER isn't set, but that looks a bit like it just hides the issue.
> 
> Regards,
> Christian.
> 
What about something like this:

diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
index 71914d8241e2..53c119f1b144 100644
--- a/rust/helpers/dma-resv.c
+++ b/rust/helpers/dma-resv.c
@@ -2,6 +2,7 @@
 
 #include <linux/dma-resv.h>
 
+#ifdef CONFIG_DMA_SHARED_BUFFER
 __rust_helper
 int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
 {
@@ -12,3 +13,4 @@ __rust_helper void rust_helper_dma_resv_unlock(struct dma_resv *obj)
 {
        dma_resv_unlock(obj);
 }
+#endif

This seems to fix the issue and makes sense, whoever wants to use the
dma shared buffer will anyway enable the config

Regards,
Mukesh
> > 
> > Fixes: 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  include/linux/dma-resv.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index c5ab6fd9ebe8..23c8db0b5214 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -311,7 +311,7 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
> >  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
> >  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
> > 
> > -#ifdef CONFIG_DEBUG_MUTEXES
> > +#if IS_ENABLED(CONFIG_DEBUG_MUTEXES) && IS_ENABLED(CONFIG_DMA_SHARED_BUFFER)
> >  void dma_resv_reset_max_fences(struct dma_resv *obj);
> >  #else
> >  static inline void dma_resv_reset_max_fences(struct dma_resv *obj) {}
> > --
> > 2.53.0
> > 
> 
