Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C587A3C7E1D
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 18:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785953262; cv=none; b=nSJ4w4l6OYXyWbwjHvsvGulbRuSch9Vhw0YrheR0t3DL/RIuOihdYDYpgp5VqFRbQceFovp6z+asNTwC7IkchPoxxLAKt3rrc7ZOmWSFKCjeMK1NfSMzakKFHyDTCsdoxlYWKQ7chR8vySERCmDNzsRXL0kv115uOMH9X51lo4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785953262; c=relaxed/simple;
	bh=LMXN7CclmokUO+ND2Iod9/rEAYouniZoPjbHWOHZhYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W71ZvTZDh6agBOcIZH5IBEuTexnqMNZq0MLN2fF3XGH6ylYuuBWG/DQS1rPUzeQFGKKVhhiH/neAhI7sl3AtLOXFZDCKxhXodCOWs+noOdxvd263VcQYDM9aSctlZMpK1PjLfJ/I8gIzXXC8NkMpy8FVIiOD+3c1Swvs7WpiXp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1fSg8lZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1fSg8lZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB451F00A3D;
	Wed,  5 Aug 2026 18:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785953258;
	bh=Zd2WEqRmKBa5vsuEZboBRxR3wTNuv7JxA7C5QT3nU84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f1fSg8lZVHOpbxEABhI7N8NiRbLb83xxq4kY79Er3ahd5H8IAcW7IP+qcebVrAqY0
	 TRN+tyd7VNGMbo3Ip+gxDf7eyrQMl+53gesGhIXvG6PDT3UUWqfQFm3B1lln1/ZUMB
	 qxEIzLqXkfUE6jo2h+/TQpyaA+jfj8X8k5rY2HYDrdIs9hwVzl82PJJc7pb/GDhT6M
	 9iWylGpBaXM2COlc0HFK47U1RoWsHVayF6MM+wtYRydkEfWYdcnzCewDO1BWHuVFT1
	 rx3uuA2jPrH0IFJ5GiY0dL5nBlTtihDVrnWPbv4xpzgoVPu6AvxZMHZmNCldf9wC8n
	 WwXh/lOpQFo+g==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id C2DACF40067;
	Wed,  5 Aug 2026 14:07:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 05 Aug 2026 14:07:37 -0400
X-ME-Sender: <xms:6Xtzau39nSCwTCDPsgJZZERpgKpe2-5BPmKuclbez46h324cDWmZ6A>
    <xme:6XtzaggwS41c3UT0TwsREn_2NKBJu9-QH_vio14myadhdY1AFz8OEVcZCulSw2c6H
    3XZ4fEnPDuNFB7teaMzrJYA5q-OEyk1WOzgDWOUO8sicY4wheD0Ag>
X-ME-Received: <xmr:6Xtzan-otYFI0rxiboPCk3X0nSKCIy2vQkdoReLCHEInI9Dk_uSsuap2zOFGXi8feqx8-hUdEq00vEwnk8v7wlowJNFGaARu>
X-ME-Proxy-Cause: dmFkZTFv2lYQxXDkx3+b8ZbbUVVFLle47SEO8kj/x7HBFs1Z2T/LiWFdHqJfwMCzVA5w8G
    PHdK1UylLmM05QBMpbU5Dowzk1AHKD0V0DcnvKXXty0AtSqxD4vKnORo66QkKhPM0Anb9U
    rkT4/j18GUkVwVAMS8ZQQomYZaJqRmwWT9NlfP87lzjQ2TkGC4ADvMEwydR+nyOCue9YRO
    ibr8kYYihQTFyGBMrsc4Ie7PyXIhVDBo2y1WWIrAzzzovNEM7DdRo9X2HUscL8cBTN76SZ
    6NAbXuLUnPlrERpoJDwCnrJ0QQzXc0BS1aEkvzKN9oe1Sr/+flrbM9uPetfmdsUrelV1hk
    UI6uFLNU9n+PXde4c982amyM3t6+fPC/2pGrPWgAw2kym2Shq2aV7CIE2pbKMM8+4G6JYJ
    GgmuAUZ5z/ihfKnhQnGdeH0O4W30pkiqnaAA9VIRkPli62/jKj9NZ6PaWUVbj9Ehp9YCke
    T2HW02Foetw3lUnRP8VwOJKphF+9Sqro1kMz0xsnV2XgUDI3Ki8I/8hx0Fll59NcXRvigi
    bKEIfLRavJ/ZaKMURX6svWWe6QV5BnNH++3Jk19HzzqCR9QdoYgwxJK/qfS1Djt7Uip+Ju
    oKARvsdd1XxINF6cO5DleLvr5JLrbA5gDRlVMAspwpna7Yehg5JMzbvXwwDw
X-ME-Proxy: <xmx:6XtzakJLeRpoX4kNfcBKSDHXL0ta-sgJT_0tmme6IkNGDD12yrfC_A>
    <xmx:6XtzakzH_Tw146_mgdli9TOrzE3G6DQHAmQt7Zr4MudanEICSoWfOg>
    <xmx:6Xtzav3yvfFr8WGAayUl5Lsp5yVivBc43HM1KdhWSgnlbcdx2wlP4Q>
    <xmx:6Xtzal_OFhh1gUgm0HJJ_g4m0k5m3onuOK4IEYCM0kScxavwOe2t7w>
    <xmx:6XtzavSXZhQ2zlqVTSQxgWTcNGw4dh58-ljguQ4YCphXNH7qL9ha0zFx>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 14:07:37 -0400 (EDT)
Date: Wed, 5 Aug 2026 11:07:36 -0700
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
Message-ID: <anN76PiBzRingT-c@tardis.local>
References: <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>
 <anJUuzBcWRwyw6NJ@tardis.local>
 <20260805063645.GO776954@noisy.programming.kicks-ass.net>
 <anLhM8xTlB6bN2N7@tardis.local>
 <1a6dd561-f529-433d-bc09-094924d861fe@linux.ibm.com>
 <anLj_Ryl635sxvI8@tardis.local>
 <anNAWmjK4_jfMHkl@tardis.local>
 <1eccb39d-f4bf-41d3-a999-e4bf45833c04@linux.ibm.com>
 <anNGwaegou9WJHC_@tardis.local>
 <0367352e-5578-4d70-88ae-1bfa446ec377@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0367352e-5578-4d70-88ae-1bfa446ec377@linux.ibm.com>

On Wed, Aug 05, 2026 at 08:26:49PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 8/5/26 7:50 PM, Boqun Feng wrote:
> > On Wed, Aug 05, 2026 at 07:40:18PM +0530, Shrikanth Hegde wrote:
> > > 
> > > Hi Boqun,
> > > 
> > > > 
> > > > Something as below? Going to send it to kernel build bot and see if it
> > > > works for all configs.
> > > > 
> > > > ----------------->8
> > > > diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
> > > > index b9a7f05ecf42..39f30bc65548 100644
> > > > --- a/include/linux/interrupt_rc.h
> > > > +++ b/include/linux/interrupt_rc.h
> > > > @@ -12,6 +12,7 @@
> > > >     */
> > > > 
> > > >    #include <linux/irqflags.h>
> > > > +#include <linux/debug_locks.h>
> > > >    #include <linux/preempt.h>
> > > >    #include <linux/processor.h>
> > > >    #include <linux/smp.h>
> > > > @@ -63,6 +64,12 @@ static inline void local_interrupt_disable(void)
> > > > 
> > > >           new_count = hardirq_disable_enter();
> > > > 
> > > > +       /* Is hardirq disable count overflow soon? */
> > > > +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT))
> > > > +               DEBUG_LOCKS_WARN_ON((new_count & HARDIRQ_DISABLE_MASK) +
> > > > +                                   (10 << HARDIRQ_DISABLE_SHIFT) >
> > > > +                                   HARDIRQ_DISABLE_MASK);
> > > > +
> > > 
> > > This needs a return here right? Else we will see warning for 10 times
> > > and then overflow happens and we will call _local_interrupt_disable. No?
> > > 
> > 
> > DEBUG_LOCKS_WARN_ON() uses debug_locks_off() to avoid this, so we won't
> > see it 10 times. The reason not using return here, because we would
> > introduce unpaired local_interrupt_disable() if we returned:
> 
> Yes, it could be a weird case if the overflow actually happens.
> So just warning maybe enough to catch such callers.
> 
> Maybe your kunit test can actually help test the behavior with the loop
> count.
> 

I'm sure that we can have more tests, but this is a good start, thank
you!

Regards,
Boqun

------------->8
Subject: [PATCH] irq: Add max local_interrupt_disable() nesting level kunit
 test case

To confirm the max nesting level of local_interrupt_disable() works, a
kunit test is added to the whole test suite.

Note that when DEBUG_PREEMPT=y, it'll generate a warning which is
expected.

Suggested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 kernel/irq/refcount_interrupt_test.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/kernel/irq/refcount_interrupt_test.c b/kernel/irq/refcount_interrupt_test.c
index ca904dba24b9..38dfccbaa4d4 100644
--- a/kernel/irq/refcount_interrupt_test.c
+++ b/kernel/irq/refcount_interrupt_test.c
@@ -52,6 +52,27 @@ static void test_multiple_irq_change(struct kunit *test)
 	TEST_IRQ_ON();
 }
 
+static void test_max_nesting_irq_change(struct kunit *test)
+{
+	for (int i = 0; i < __IRQ_MASK(HARDIRQ_DISABLE_BITS); i++) {
+		local_interrupt_disable();
+		TEST_IRQ_OFF();
+	}
+
+
+	for (int i = 0; i < __IRQ_MASK(HARDIRQ_DISABLE_BITS); i++) {
+		TEST_IRQ_OFF();
+		local_interrupt_enable();
+	}
+
+	TEST_IRQ_ON();
+
+	local_interrupt_disable();
+	TEST_IRQ_OFF();
+	local_interrupt_enable();
+	TEST_IRQ_ON();
+}
+
 static void test_irq_save(struct kunit *test)
 {
 	unsigned long flags;
@@ -79,6 +100,7 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(test_single_irq_change),
 	KUNIT_CASE(test_nested_irq_change),
 	KUNIT_CASE(test_multiple_irq_change),
+	KUNIT_CASE(test_max_nesting_irq_change),
 	KUNIT_CASE(test_irq_save),
 	{},
 };
-- 
2.50.1 (Apple Git-155)

