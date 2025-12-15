Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D6433859E
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765821877; cv=none; b=pz6cehoo+t3+vKHB8U69QlYntaOQZWn9fNnOm1Q85x0NLC/FOkAu3PIOpzUchvh3oRoHkGhDSQtB5eYJLszcI0tOBz2tFqnMoG2x/kCs8mtEk643oDL+y4nGI93U0foorf1M1KH+IY3gAYaO9YAp4aABn+Vii6kwge+EkeuO5Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765821877; c=relaxed/simple;
	bh=Nsew5WVYcnIVKjzy9ZH47Z7m4Gui0DMYEziJL+DQ+WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dIihtZlcUcq0jmtSTnVKVOsbSUQ6dbRKjGIKvsF1Cct4bW1DVGx9D9T5o/shvoRrX29FdC9uuKFG8tbx8tePK6HtG3BGkxvDjORYc0QDZPrOyn/VmF65xwdKlUH5e3R0GKtD93YF8TQuob8/avwr7FZt5YgPUGDmiFgBIRZ7z8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MM2DysMf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MM2DysMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765821874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EH3ES6AA+QRCOsHlcZKtsYa2XtonPK9oiLh9VZOeMQo=;
	b=MM2DysMfypoJDhpVrCx0fqo/oFyVuT3oJ7V9IZjXIXI6U1Wk95ntAuEI+J2vUpJrbT5bEG
	XFfGGDhv7A3e4yAJieNqWHkP+dMH9H1A1uqkikEknr1fvQByZWRFnKaXmcRvcS1LhdpVfv
	XfURda4ZMV6mKw3uwqRFAZNnkRSQJp8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-EmAb8MXqORmqzNSaOv4-SQ-1; Mon,
 15 Dec 2025 13:01:35 -0500
X-MC-Unique: EmAb8MXqORmqzNSaOv4-SQ-1
X-Mimecast-MFC-AGG-ID: EmAb8MXqORmqzNSaOv4-SQ_1765821693
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D6BE01860168;
	Mon, 15 Dec 2025 17:58:33 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.81.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5844B180044F;
	Mon, 15 Dec 2025 17:58:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v16 04/17] openrisc: Include <linux/cpumask.h> in smp.h
Date: Mon, 15 Dec 2025 12:57:51 -0500
Message-ID: <20251215175806.102713-5-lyude@redhat.com>
In-Reply-To: <20251215175806.102713-1-lyude@redhat.com>
References: <20251215175806.102713-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

While OpenRISC currently doesn't fail to build upstream, it appears that
include <asm/smp.h> in the right headers is enough to break that -
primarily because OpenRISC's asm/smp.h header doesn't actually provide any
definition for struct cpumask. Which means the only reason we aren't
failing to build kernel is because we've been lucky enough that every spot
including asm/smp.h already has definitions for struct cpumask pulled in.

This became evident when trying to work on a patch series for adding
ref-counted interrupt enable/disables to the kernel, where introducing a
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
---
 arch/openrisc/include/asm/smp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/openrisc/include/asm/smp.h b/arch/openrisc/include/asm/smp.h
index e21d2f12b5b67..0327d8cdae2d0 100644
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
2.52.0

