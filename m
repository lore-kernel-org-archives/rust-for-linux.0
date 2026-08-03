Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDBF3750D7;
	Mon,  3 Aug 2026 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753813; cv=none; b=Q71xnCOnaCJ7vzYdlTjO+jOpiK61CiygdodU3EGu27OwEuAAhLuqVH21+v6EWc4oi5PGx8UsqYwVpuL89N/gNdZq4c50wMWWp6FahxEJfLrDd0+twwUQR63P9Z0Z1L/2sY/AGsdJ74DTYi6Sw8hzWTIQkGljL9wW975MkPU9pgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753813; c=relaxed/simple;
	bh=sR41znosV+PRI+bXHnFrYVqhGPDnOZ6F/k+RTelY1Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9Pa2IuDSETXiCJlrGyBCfhf4qjFOLg6+LbsB/QU94+k8Q2y8zEASk3Bvt3CSFu8XE68uema/mU6jeI+uggimYIpgnrMAw+Vkyals0LqdZetlGSHQeRcaA95YL771YyXm6L3i7Iv+tBopyRGy/1nsxqPzHC+dfrjCa2Z3fLccMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sUgwcjd/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sUgwcjd/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tOFw9c6yGw4pzLn7I3PRrDt/CNPekEom/YGXPPCbpJI=; b=sUgwcjd/xqPMAU+e+/+MQ1QmNd
	i9X2EnJ7W8tKjgze85CE76miyRMBF3soRUnknJ/YXSW5WbgEmHBWqp7cmRbZppRnV+PZEWaJsRXY0
	7INa2OqZLFN9EvySO4NTFbgpp9gPwJdTuQIDhAjCmzXGQp8+UIfnuwtvkB/Cqp9P+zoqQTknntzMB
	wMGBsEegnrdiU69cRMNnLtRS/M1O5nim7NWiGSpucGSz0Vk05we5UU/39H+mnFKpDj+/mAxobCPxM
	dsUcIvjEjpPlaJfB3MuL5crx1QSmIbCKbVz6SBKhHFzv9EqLWm+528aiJE+lmvpxMviB5YHGCas5W
	nIOfYnlg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqq8g-0000000DEaR-43iR;
	Mon, 03 Aug 2026 10:43:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C60DE3003DE; Mon, 03 Aug 2026 12:43:21 +0200 (CEST)
Date: Mon, 3 Aug 2026 12:43:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH 05/24] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <20260803104321.GL49529@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <20260803092910.GD49951@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803092910.GD49951@noisy.programming.kicks-ass.net>

On Mon, Aug 03, 2026 at 11:29:10AM +0200, Peter Zijlstra wrote:
> On Fri, Jul 31, 2026 at 01:30:06PM -0700, Boqun Feng wrote:
> > +++ b/include/linux/interrupt_rc.h
> > @@ -0,0 +1,67 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * include/linux/interrupt_rc.h - refcounted local processor interrupt
> > + * management.
> > + *
> > + * Since the implementation of this API currently depends on
> > + * local_irq_save()/local_irq_restore(), we split this into it's own header to
> > + * make it easier to include without hitting circular header dependencies.
> > + */
> > +
> > +#ifndef __LINUX_INTERRUPT_RC_H
> > +#define __LINUX_INTERRUPT_RC_H
> > +
> > +#include <linux/irqflags.h>
> > +#include <asm/processor.h>
> > +#ifdef CONFIG_SMP
> > +#include <asm/smp.h>
> > +#endif
> > +
> > +/* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */
> > +struct interrupt_disable_state {
> > +	unsigned long flags;
> > +};
> > +
> > +DECLARE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
> 
> I'm a bit confused by the need for this struct; afaict there aren't any
> additional members in the rest of the series. So at this point this is
> pointless wrappery, no?
> 
> Having this variable exported is unfortunate.

One option to get rid of that EXPORT would be something like so I
suppose.

---
--- a/include/linux/interrupt_rc.h
+++ b/include/linux/interrupt_rc.h
@@ -12,21 +12,52 @@
 #define __LINUX_INTERRUPT_RC_H
 
 #include <linux/irqflags.h>
+#include <linux/preempt.h>
 #include <asm/processor.h>
 #ifdef CONFIG_SMP
 #include <asm/smp.h>
 #endif
 
+#ifndef MODULE
 /* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */
-struct interrupt_disable_state {
+DECLARE_PER_CPU(unsigned long, local_interrupt_disable_state);
+
+static __always_inline void __local_interrupt_disable(void)
+{
 	unsigned long flags;
-};
 
-DECLARE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
+	local_irq_save(flags);
+	raw_cpu_write(local_interrupt_disable_state, flags);
+}
+
+static __always_inline void __local_interrupt_enable(void)
+{
+	unsigned long flags = raw_cpu_read(local_interrupt_disable_state);
+	local_irq_restore(flags);
+}
+
+#ifndef INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
+static __always_inline void _local_interrupt_disable(void)
+{
+	__local_interrupt_disable();
+}
+
+static __always_inline void _local_interrupt_enable(void)
+{
+	__local_interrupt_enable();
+}
+#else
+extern void _local_interrupt_disable(void);
+extern void _local_interrupt_enable(void);
+#endif
+
+#else /* !MODULE */
+extern void _local_interrupt_disable(void);
+extern void _local_interrupt_enable(void);
+#endif /* !MODULE */
 
 static inline void local_interrupt_disable(void)
 {
-	unsigned long flags;
 	unsigned long new_count;
 
 	WARN_ON_ONCE(in_nmi());
@@ -35,10 +66,8 @@ static inline void local_interrupt_disab
 
 	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
 
-	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET) {
-		local_irq_save(flags);
-		raw_cpu_write(local_interrupt_disable_state.flags, flags);
-	}
+	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
+		_local_interrupt_disable();
 }
 
 #ifdef CONFIG_PREEMPTION
@@ -63,14 +92,8 @@ static inline void local_interrupt_enabl
 
 	new_count = hardirq_disable_exit();
 
-	if ((new_count & HARDIRQ_DISABLE_MASK) == 0) {
-		unsigned long flags;
-
-		flags = raw_cpu_read(local_interrupt_disable_state.flags);
-		local_irq_restore(flags);
-
-		local_interrupt_enable_reched(new_count);
-	}
+	if ((new_count & HARDIRQ_DISABLE_MASK) == 0)
+		_local_interrupt_enable();
 }
 
 #endif /* !__LINUX_INTERRUPT_RC_H */
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#define INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
 #include <linux/export.h>
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
@@ -88,8 +89,17 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabl
 EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
 #endif
 
-DEFINE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
-EXPORT_PER_CPU_SYMBOL_GPL(local_interrupt_disable_state);
+DEFINE_PER_CPU(unsigned long, local_interrupt_disable_state);
+
+void _local_interrupt_disable(void)
+{
+	__local_interrupt_disable();
+}
+
+void _local_interrupt_enable(void)
+{
+	__local_interrupt_enable();
+}
 
 #ifndef CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
 /*
