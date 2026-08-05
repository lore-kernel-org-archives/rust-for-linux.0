Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA22473C97;
	Wed,  5 Aug 2026 13:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938014; cv=none; b=QVjx/HQNDY7bjCbQFNERHYlK2wy/bKzf70uNN303dORVrYQtVvQO6Y8TmCGrqamcxP/8cTiXI/IqX7siCth9nO0kuB63Jrz/I5hzWo/GxKoUo5QIrXfIGnol0tP5uhXCyg9+9aWrL6bgDSFPhnqX6Id4bq9LfqSINTC5xVMmUAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938014; c=relaxed/simple;
	bh=V11JtsD6ylKzqOLpBHAl94eL2UbNCAJfNs3KoMZsv8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjCnNvJ0oNVi7ol3wjzeSNcnEAK9+p6DLzLknrfUvTWEsvl0QsTkhOQfFAk52UnLlA9t0cArisBzZiZ+yONl3Fskp64j2vGYHoqbE9TloleLjRi1ILpMhG/KrQs3tFTTGaI5KV8m1ffvq4Kt+LShLAwlqF9XRhrRuqM381pt6zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fS+09sNh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fS+09sNh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90CC1F00A3F;
	Wed,  5 Aug 2026 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785938013;
	bh=145NE5OGoOJ01zyHOiCQHmEWW5VEhp51oQzQp+twISU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fS+09sNhIEg4urOpie5OddouUbsTmn7J8LiRskAhdnqFnmHSddEi5pkS2i1sikIiu
	 uz2Qq9hPpaQOBQxJMWyP99zxQesjLMMI0E0e9BQvopibRpKDhfEoPhOyIpL/2TP2L/
	 k/tgtPGgUKFNz6e/xUpPJNWKWP4m83iLTIKKOeVhkd3upl+m5OIW9xn6TaJVYg/T/j
	 gC7W73wYnN49yAOeQSHz4zp8HkC3u+o/1SGlydReob90oK/sFD8OOJMPxFW6fMzt44
	 VSFjUnlyVXhNomdHuoO+mJJ5bAczjhWZwK3AoDybsteMNxzbc5+E1/KyR/OhukE2DN
	 K36GiP5l8uo1w==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0A595F40068;
	Wed,  5 Aug 2026 09:53:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 05 Aug 2026 09:53:32 -0400
X-ME-Sender: <xms:W0Bzas2euMn8wIeXjzYdInVbfG9JMMuUDKl1p5-bCi67gmnrHAtbQw>
    <xme:W0Bzamjvqgj50rxkjkUgREzlW5basG-giyS9BACjPfuTX7KvqU8ymDJ8ZOlS0qJyy
    W60XNyePNdU1FXiaZfXnpI1oHFp58Luv_uZRPcBLQ3qvIVs_M2x00k>
X-ME-Received: <xmr:W0Bzal9k6ruS1_2F_DAU0WV4GYF_z2BjXqtI7SGkK8XK3iLHV2Q-NGMV5yHRXQJBvfqvrbwK_a0_vzJm7AJ20E6PJvv6bZJJ>
X-ME-Proxy-Cause: dmFkZTFRoJXWpjBKn0Jjq5qKg0vq0PfDTCWk/ELqOmIknJw408VvpLitMj/U+68XOfHyRh
    qU+EKdy/Xn7f5lGBZdX/WSENcBB1RThDQVHB+LKywQABfbYXL7G0rxL9FsgS6k9lIACwX4
    cL8iD5Dgv7IulWfbAHrNbBbm0xD3SPvaE9wNJGtQpPvkSlW8Lc/5SijuPMJBB4r2bNKQL9
    GCX7h9tYmITTL5tv08UsdqEqR3tUyA3qnZb8Li0q9rHIO+lO1nCuoKThsXqWZeP7L4T1+R
    3/4ny0aMUy3WLcFlRPUqz5/IWa0v9ChR301kW4gNJKFIYazWp7RYL++vrBKbtwyFcwSNiP
    ygfxkOzc7itUrJMkJj/lpO9EdvajIYHsUXayZKpbKoaU7oXCPzmT6sNWziHR1O+riWoyvE
    0hmrceC7xHroFxm88v3FPvZRI2p5dCV0isBaEVKZWEQWbgkAFuVuyHNZetMkaAbm9k/P4M
    UxJ9uHkex5+xP2Jz95iNAWhLY8Bj+Rwwev9JMEaq/HpRdTXhAFck4u/tpBqLyE5pwowJFr
    HaVg+1wQrxBntHD+0cL/QpgXvWzqQsAbBbz1kRa6ipfIoEopTd/vWBlubW6+m/MtYGi4H0
    5c1YIPV9qENM7joL5kO2zRTfWgMY2jzWPSXCpiT52paGgmtJBeRubS1D/mVw
X-ME-Proxy: <xmx:W0BzaqKJOLbq9b5Xs1LWYVfyQdzHFt1AZTFZYSAneNs4qsxkNZjLpQ>
    <xmx:XEBzaiyW9R8TCmHQvq9iiXk5i2YRjXEJ1C0AbdIn4F2oafW-cIYkag>
    <xmx:XEBzal1Ini9HHneVoWEyaaFGedeXDPTHGsfy_WxUsnAWYP-XicxEKA>
    <xmx:XEBzaj9oz_GVAzFRwgcLQybM-3p3zt6gFVnlu-jnvfQ0VrhSDALwmw>
    <xmx:XEBzalRcv7yW7EGf3O0Xd_OgoDTqGBX7XbTWWJ8Bz6r7yDDu-EZ2F-yW>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 09:53:31 -0400 (EDT)
Date: Wed, 5 Aug 2026 06:53:30 -0700
From: Boqun Feng <boqun@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 05/17] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <anNAWmjK4_jfMHkl@tardis.local>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-6-boqun@kernel.org>
 <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>
 <anJUuzBcWRwyw6NJ@tardis.local>
 <20260805063645.GO776954@noisy.programming.kicks-ass.net>
 <anLhM8xTlB6bN2N7@tardis.local>
 <1a6dd561-f529-433d-bc09-094924d861fe@linux.ibm.com>
 <anLj_Ryl635sxvI8@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anLj_Ryl635sxvI8@tardis.local>

On Wed, Aug 05, 2026 at 12:19:25AM -0700, Boqun Feng wrote:
> On Wed, Aug 05, 2026 at 12:39:36PM +0530, Shrikanth Hegde wrote:
> > 
> > 
> > On 8/5/26 12:37 PM, Boqun Feng wrote:
> > > On Wed, Aug 05, 2026 at 08:36:45AM +0200, Peter Zijlstra wrote:
> > > > On Tue, Aug 04, 2026 at 02:08:11PM -0700, Boqun Feng wrote:
> > > > 
> > > > > > > +	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> > > > > > > +
> > > > > > > +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> > > > > > > +		_local_interrupt_disable();
> > > > > > > +}
> > > > > > 
> > > > > > Maximum nesting possible is 256 right? Whats is stopping here to do more than that?
> > > > > 
> > > > > Yes. Currently similar as softirq, we don't detect the overflow.
> > > > > 
> > > > > > Should there be a warn_on?
> > > > > 
> > > > > A simple warn_on could be problematic because warn_on() itself may take
> > > > > an irq-disabling lock, and that may trigger another overflow on top of
> > > > > the existing overflow. It's a bit tricky to do a proper detection. But
> > > > > I'm open to ideas.
> > > > 
> > > > DEBUG_PREEMPT's preempt_count_add() does:
> > > > 
> > > >          DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >= PREEMPT_MASK - 10);
> > > > 
> > > 
> > > Yeah, but this is behind a kconfig (DEBUG_PREEMPT), so not sure whether
> > > it's what Shrikanth asked here.
> > > 
> > 
> > I was suggesting to have a mechanism which allows to debug it/
> > find the callers.
> > 
> 
> Ok, I can reuse the DEBUG_PREEMPT kconfig and the DEBUG_LOCKS_WARN_ON()
> here, but it'll be similar to the detection here, not a 256 maximum
> nesting but a 256 - 10 value (and I'm not going to explain why we think
> 10 is a good buffer, unless you think we should have a discussion about
> it ;-) )
> 

Something as below? Going to send it to kernel build bot and see if it
works for all configs.

----------------->8
diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
index b9a7f05ecf42..39f30bc65548 100644
--- a/include/linux/interrupt_rc.h
+++ b/include/linux/interrupt_rc.h
@@ -12,6 +12,7 @@
  */

 #include <linux/irqflags.h>
+#include <linux/debug_locks.h>
 #include <linux/preempt.h>
 #include <linux/processor.h>
 #include <linux/smp.h>
@@ -63,6 +64,12 @@ static inline void local_interrupt_disable(void)

        new_count = hardirq_disable_enter();

+       /* Is hardirq disable count overflow soon? */
+       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT))
+               DEBUG_LOCKS_WARN_ON((new_count & HARDIRQ_DISABLE_MASK) +
+                                   (10 << HARDIRQ_DISABLE_SHIFT) >
+                                   HARDIRQ_DISABLE_MASK);
+
        /* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */

        if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
@@ -73,6 +80,11 @@ static inline void local_interrupt_enable(void)
 {
        int new_count;

+       /* Unpaired local_interrupt_enable()? Warn and abort. */
+       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
+           DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) == 0))
+               return;
+
        new_count = hardirq_disable_exit();

        if ((new_count & HARDIRQ_DISABLE_MASK) == 0) > 
