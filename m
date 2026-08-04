Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA034746C3
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860113; cv=none; b=EPc4l8RyK3nobyrnYkkWhssoFoOCEAK8NcZ65h2EobGmFqCf8ns3t+yBSzec0+MIe/wnmkI2mbxwxu+pvUPtygFvZPweXChcptMumEEfXZMTbswC9ftTqyfUk7ZwevG2QMJltiFU1dfV8wwMvxQlBvUkNvu8d8fOvkCOxlD4/c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860113; c=relaxed/simple;
	bh=X8RZfaXpnjo3eZ8Yt9kgyqp+ytrFOxLZYmWiV2ArpVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gtpWt6znvuO+cMPv8fBPUrUnbGISXUW3v+Hd5Cl5pQv8dZunl+x2ZubIfpYnIaK5BfyHwtP4ZfW3sS8UDAsp+1W67kqmBLxtMHgFfDyr1JpIG3ihkmSP0yBIgL2ivcujpOggNf7xIadiYZKsIc66aZQ5sIEcyIUsXoWWp573GkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpZ3hGGG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpZ3hGGG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E211F00ACA;
	Tue,  4 Aug 2026 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860102;
	bh=Q/FRi4i2Q2qXDY7wTkxJ2+HYMjzwJRaRncVAKmZRve4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bpZ3hGGG0qgU1ksRPYjkk8nqSE3RdOJ/7yvC/FDuX2GJXMvBmK6Nl5GqxJj1fqp+y
	 6Gbcpuoj5wF7LiGD+gUS95YLudyQO25yun0I3jh2p1/NGGiIyLKdN3RHAiUPNuspmU
	 04V+m06v0aVCeVDIy5h7jGZRvPJmdYYvlvC8IEa0XsjD4I7mhej/2j2/FixsJDcvYi
	 oV5Y4Ujkc2+2amM45v1prnpzfrmZ3SealhnYITu8l6ZdKYqkxB7THQOco9gvzMZch9
	 aH8KLgoDHXhs60HuNV6ph9EYI135uqK1+jp3iT5bOme9rTDo13icb+vaaB4ncKjJHX
	 q8SXvcO6jfB5A==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6166CF40067;
	Tue,  4 Aug 2026 12:15:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 04 Aug 2026 12:15:01 -0400
X-ME-Sender: <xms:BRByaslElr1-9GWAlbt5diYUZg4i_B1rvlJ60fq3GcmD1dZFvS0BRQ>
    <xme:BRByamP0SPmyNoNQiCwnCPYHDYGVmOCL4I1I3Rx6NrTZQwcUoBVH8imgTsucWiLrv
    lHtrOCnBlrWCnv30U5zjIrMon6e-lcWu5f5sQlhqPrhtCKi-JKHCg>
X-ME-Received: <xmr:BRByagygq4FuwTFadAm34Ncb_a7kww6Kd0gvSHJ0v4BDoQ9jylrphyLyr5XOGZIbNQ6QSpja7jXelkO2OO4d-f-YGQPx2bMP>
X-ME-Proxy-Cause: dmFkZTEjNALs/vHMOloma/FioWgq38LEDphqLbi/MDKjZ+skyek9CBm72qNR6fF0uZPdGp
    TNcnAR4AQwTabPyqXb4b8VVQVFCNoT48fsLJV/4jNEVJ0A9eFv0ovpeauV2dgztP0aY1Y0
    jIaZAzpZKJmSr5bjx5yubrqLJ++dH6uDgWLI4XXVkSa8jJqAXQgEQlXOv7WGccuHPTRlER
    Ylu8rJket0jbyQhGWZ+weYiCIeD4wr9LDagDzAHrKU27qzYbzXZIXOYWeFfQKFS5QVbMSU
    NlfDPJ2QDHkDrdBA1iUAq2dsmA2mOrsNEsIEQsqJKBWsANZHLO8XMG8BasrOULdBqAdbNe
    r6KExRLiZoxOyeHN7JdW9yzjQyuaIR4UBKJYWhaJvzQko+HEf2cVybRq2l9J6a2oHQflz8
    n3+y9v3TzM3d5E19jhpnSKVDeVMKItuGh1Au9gC32lk3Ey3zBiSPODgTF04T3fxxDPGikt
    ELBvlpTLLB1oUN3ocbitEiYgMnedu6Wanp6v/GWjdH28eVfswDY9lpUurpmPrN5lERepUT
    1OXx/YhnGmVUGuaB/IdDKpMZA96GAszwR0153agU1YgOd4GFV/hO4CWd17oA4O+1L2JyUv
    tMAN1hCRRTwnlh27OkBpJU1Ae8R1hm4YCafasQQITpooOfrOTkpX+EpwdxZw
X-ME-Proxy: <xmx:BRByajsRVXa_YOlsyX7GU_-w3y4vzIBPlARy3VjtlZ5mp4HPvcxmzQ>
    <xmx:BRByajZdQnBDQ2a-aqFy1Y4868UIUFDwUM4Eq9DVHYHeQV2yGkumrQ>
    <xmx:BRByai2ncmFDbRstkfH7lTolpVer1NM-VoTHT0_rTuLd40A3OC1www>
    <xmx:BRByalsMYwTv6QXn0ayUQYrRCostY0dLSO9KfCI7Ldi05OjJWSwMsw>
    <xmx:BRByamDUu39Z5wr7GrphXnai9ooZsLVRCzSNHdOCNo1C2R-pi4JWU1dg>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:15:00 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Stafford Horne <shorne@gmail.com>
Subject: [PATCH v4 04/17] openrisc: Include <linux/cpumask.h> in smp.h
Date: Tue,  4 Aug 2026 09:14:26 -0700
Message-ID: <20260804161447.84806-5-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260804161447.84806-1-boqun@kernel.org>
References: <20260804161447.84806-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lyude Paul <lyude@redhat.com>

While OpenRISC currently doesn't fail to build upstream, it appears that
including <asm/smp.h> in the right headers is enough to break that -
primarily because OpenRISC's asm/smp.h header doesn't actually provide
any definition for struct cpumask. Which means the only reason we aren't
failing to build the kernel is because we've been lucky enough that
every spot including asm/smp.h already has definitions for struct
cpumask pulled in.

This became evident when trying to work on a patch series for adding
ref-counted interrupt enable/disable to the kernel, where introducing a
new interrupt_rc.h header suddenly introduced a build error on OpenRISC:

     In file included from include/linux/interrupt_rc.h:17,
                      from include/linux/spinlock.h:60,
                      from include/linux/mmzone.h:8,
                      from include/linux/gfp.h:7,
                      from include/linux/mm.h:7,
                      from arch/openrisc/include/asm/pgalloc.h:20,
                      from arch/openrisc/include/asm/io.h:18,
                      from include/linux/io.h:12,
                      from drivers/irqchip/irq-ompic.c:61:
     arch/openrisc/include/asm/smp.h:21:59: warning: 'struct cpumask'
     declared inside parameter list will not be visible outside of this
     definition or declaration
        21 | extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
           |                                                           ^~~~~~~
     arch/openrisc/include/asm/smp.h:23:54: warning: 'struct cpumask'
     declared inside parameter list will not be visible outside of this
     definition or declaration
        23 | extern void set_smp_cross_call(void (*)(const struct cpumask *, unsigned int));
           |                                                      ^~~~~~~
     drivers/irqchip/irq-ompic.c: In function 'ompic_of_init':
  >> drivers/irqchip/irq-ompic.c:191:28: error: passing argument 1 of
     'set_smp_cross_call' from incompatible pointer type
     [-Werror=incompatible-pointer-types]
       191 |         set_smp_cross_call(ompic_raise_softirq);
           |                            ^~~~~~~~~~~~~~~~~~~
           |                            |
           |                            void (*)(const struct cpumask *, unsigned int)
     arch/openrisc/include/asm/smp.h:23:32: note: expected 'void (*)(const
     struct cpumask *, unsigned int)' but argument is of type 'void
     (*)(const struct cpumask *, unsigned int)'
        23 | extern void set_smp_cross_call(void (*)(const struct cpumask *, unsigned int));

To fix this, let's take an example from the smp.h headers of other
architectures (x86, hexagon, arm64, probably more): just include
linux/cpumask.h at the top.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Acked-by: Stafford Horne <shorne@gmail.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 arch/openrisc/include/asm/smp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/openrisc/include/asm/smp.h b/arch/openrisc/include/asm/smp.h
index 007296f160ef..84653aaffa96 100644
--- a/arch/openrisc/include/asm/smp.h
+++ b/arch/openrisc/include/asm/smp.h
@@ -9,6 +9,8 @@
 #ifndef __ASM_OPENRISC_SMP_H
 #define __ASM_OPENRISC_SMP_H
 
+#include <linux/cpumask.h>
+
 #include <asm/spr.h>
 #include <asm/spr_defs.h>
 
-- 
2.50.1 (Apple Git-155)

