Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5882388885;
	Fri,  7 Aug 2026 07:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086153; cv=none; b=EFig9rSIRpq3AtJTWJDUAVGpblCPF9p43md74cZU3CecXQUN9iEKJurwOIL7wTe08gYBE6zn/pwDhuCLWOHeXWX6D8mf7+f2IItzg5QqqTPgSIMcQfBua1M2v97Qaa8y/uSjq8FagZeGW7V00ABH9bLyDJ2WkgoSuJvjqMbBFiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086153; c=relaxed/simple;
	bh=X8RZfaXpnjo3eZ8Yt9kgyqp+ytrFOxLZYmWiV2ArpVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxVWtygYckLshvZFtCtM1QTC71RQtXdvmMvHmhLHK0w5zhtiDoHBtTptZf7tgGn2epA/qHhsxcYMByxxlDW6CL1WQv6p/q62VhtxNFA9FhKEuxXUNI9bQcDLHgKHvyeGVPD7P06Few//7d5as2TcIcpVXgWBipM346nIbQSeTYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J97iG+HV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J97iG+HV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035151F000E9;
	Fri,  7 Aug 2026 07:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086152;
	bh=Q/FRi4i2Q2qXDY7wTkxJ2+HYMjzwJRaRncVAKmZRve4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J97iG+HVH08bA6/oUKqy2GyoquKMHzCZdai6FnIk6qVhV8aTPOnXmGrjGu0eqte7S
	 m3Z++xHLFcFMxEgyXe4Pzvf2g/4vnU5dG7N8CWLV5VUaWvlemYndVyrEE9cvTEIeEB
	 Ih7jENZ9PrGLucc5XJXHboMs2iZiP38X3vBQeQ7AhUjFVRU6LIAgXGvGLkrFMN9dmt
	 kZ6b1beCGAkWaOPw2a4ElVhxmra+D15nOquhhnkM84N4mPVBWEOgBn5WB1cPBooTSM
	 37Tp+seWRylc3JEU855CAzDXcbkSC9LCi3T76hS0Vy6ELNF5tjgyAt+akmjRcXmR0K
	 ge7kbQN2VrS4Q==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1CD1DF40066;
	Fri,  7 Aug 2026 03:02:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 07 Aug 2026 03:02:31 -0400
X-ME-Sender: <xms:B4N1alVsIL8CR2k61iqqAot7L5cS1BSzuz2YRvMb3NzTZBW7KeR6IQ>
    <xme:B4N1auUZp7M4xIj4bMi2kX4j0VUdHBGeullrRJ1SYZQS281Ev7c4A5I8EkMWzT8xg
    A-5JpkgVi6wczSMe_Ux4m4IxwQkMlONAhKK_RVuX1-nBdRfneQeTA>
X-ME-Received: <xmr:B4N1agHkJF-Jk0f45RKWwDkGicYbxQhBd_bZAtIp6_Usl1v6r4S8NrUDZyafv2ACP0boraqUxwf3jsAxxMzyHD4qnE7huGsR>
X-ME-Proxy-Cause: dmFkZTGymVtxh0AmopRY+TfTfXYPCmloL5eVBz8w4y+3KFrHM+Bwv6o50auh1636bSBYkE
    H90J+8ZvDwGP+GEnsL03hmghhkCvgcLvZRJlD0Z0K6idzeBe96fVCfVF90zAumgR10DH6A
    dzrkds6t6yssM5k8WnRKyJY7PoN9yPTJEd8yclKHhKcjgA77IEZ54Ob7IjTR0RbJw1Jd/H
    MAKXnEz1+HSwhiWHnu3/dGxtHg6i6x+jlrZPffCsJNEQERYySXee/h/1gQg2z905mRcC4Y
    mB/oQJoiVpI6TFSRaftlL1E+wAZyQH5fXLMWv+6L12SLyEAsyE0kkUaQtsxqspvPUOq9Vn
    O2zmne8NrlnW/YvyJ9H9pWzAjjivyTHsSfPmcutkdMCiQefr+zO7f0iq/BFYmzpmkrIrqB
    xw9Mq2yh5Rcs8TJcoUfIWlqMr1wlPIch825HR6eKYR3vOyXiQ3/vF0rll2PccyV/TnaRF9
    3XPyxm3EkRwJGCqUO3HVRvx+m9a1RKZLhjPU2NOXjrgvevzkpZpFhO38BU8CvkUlHy298y
    SlP8tS5cbB2BO7bMEbctUoP33YiUd8UwmfKd+mbgsRH2FTaPQ7kByEmFZgR3Ayz2dQugFZ
    Z/yPJpz+PoFenJXwYoPbO1xJKNV/re3T0bPsiI8c9zAxlTp6y1oNOEnq+ubg
X-ME-Proxy: <xmx:B4N1aquRlBgHK4AsAtG55Ae3K84YSgfQx5pLbbD1kse0kRRcvW7SgQ>
    <xmx:B4N1ajZnfCG7B6aLaDjBBDZD6tK9Gj0-3jbWhWqJA9fIPRHIGeBiCw>
    <xmx:B4N1aqUscQS7Gzcqe99L2hp2P_KK8K3FvHcJyvXWQqIKBUuK0qkC1w>
    <xmx:B4N1atJJDuZ_XU86_k3VFwLcQCuggt8FZIwR60T3i8Rk-hn7t2XDBA>
    <xmx:B4N1agF44wjNpSkFJUOT3S3-emSDKDVHB5RSWofxidoO4MDsfdXLUdSy>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:30 -0400 (EDT)
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
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Stafford Horne <shorne@gmail.com>
Subject: [PATCH v5 04/18] openrisc: Include <linux/cpumask.h> in smp.h
Date: Fri,  7 Aug 2026 00:02:01 -0700
Message-ID: <20260807070218.27144-5-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260807070218.27144-1-boqun@kernel.org>
References: <20260807070218.27144-1-boqun@kernel.org>
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

