Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9837A85E
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529852; cv=none; b=c+t2UAV5gZnoXxYU1Mns+qHj/5R5OeAvdlQ12O+GrMyHeFFNWhOzE4jnoD01CHY71Mjf9cqNDU9mE6jpt9sgDknhkzpnhdUiR51fklUSoRZQJWIVZSkA2xZjjzZqC/0/SqSzhlR8C3ro8Sa9cDRhNGLmkinzlCZnzZqEa444YJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529852; c=relaxed/simple;
	bh=YaVjrXKhfpqvIJygzREE5zKBOLGP3K/KF1IwfTEAxVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLdCQ7IurAv2qh/+Dn2tDhyi/j7RjniuqytUEzU6r5wudyjuFr7F4q3apcRK7/77V7qJXKSWTKM2OsExuOmPjBhv0rxV5IkhRtZEEmxX8e8gaM8V/3bIODN4oPGAaWW+V5G5ScS/1Ha9okrVyQmhQGDKFiVrqE1SaWGvh+0JpFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NV1kmXLg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NV1kmXLg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CB81F00ADE;
	Fri, 31 Jul 2026 20:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529846;
	bh=u8OFyi867RVcm393aEUm2p/F0THxOCKpMTZFIKs3ThQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NV1kmXLgL8w4igoA7q0CvnAGyuQkefzpZQ+6Icvk4JS80KcW5OBxyQQlRW4VyH0UN
	 1ihm2dQyV/ibl0LaiyqZ812xFCKfTzGBEVXyb1sBDiHSzHMfUp/+BpRE+kpZp8T11W
	 F7DmZotbQNgGOlTlpgwUaKuNH0Me9v7ITef1RsmflHjtrFa801rxP6BhDpsBRYonuF
	 aY0LfcrbfKiEkTDNJsH3XSo0ad3PzDcCPiGph45BPaq6KOapG/G8HNUQMbXLVJLJJ+
	 VeiV7HEcLvxXx8Ogl2FVRpj1T9o7nipjwHKTXJnhnRpJzbhCcepGPv2n4pMdRY5+SQ
	 SJooiGxTIOkCQ==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 77711F40077;
	Fri, 31 Jul 2026 16:30:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 31 Jul 2026 16:30:45 -0400
X-ME-Sender: <xms:9QVtarlUm1ctz8WyYoa0lVXAfJIaAzRx_3bWX6JBPqoEGPmMU6WpEg>
    <xme:9QVtapNdAusYqgvOTuHiF1GkTFVWkJ5xYwdM1kQo1s1CQETy7apIXjfeNLRE3yD-r
    3mgHAuj_Wa1NGiwa1jbUJwh-oUSkDrgspwaoVBMEacjLFh2-T1q6g>
X-ME-Received: <xmr:9QVtanyJXpo7A1yDhCITYerRNUDJU4Cj74xb3gEzcAYZj0Gbpx5PxwnYY-LgVqa3QTlKwj9nSoiRKW0IGBw1PXniWRqAFMKG>
X-ME-Proxy-Cause: dmFkZTFYc6116FG2quGqEuyKIxKnFMEmlYb32kQQ7CtbFGYD9qEYkru11crvm5k1myTjrD
    mprk+Q3zryg6Sw+VBlHk+Fh2dsP+vkQ+R6SId6D6PQHJ2MNR0r6gfBCLOd3kp8148kZ7F/
    KLgIA+5OGrlMzKnGLja63bpFSrAh19/D1KowErF7/fMLoXr6/uBxuTdAfInIovWJuydywf
    zjiEDrBy2ZQGTG+wDuq3UDJInF4v///JGqWliNx3oB8ndvgTYjGjYM24OlzqaeVHYGQ/UH
    n/uNgL2CgUXmcpbS+mAJlGjkfOgTDC/OpURLEQyF+W0WAZBtt5IfiFk+NFnrr0x50+KqCH
    wBaR2L1NGEhuJ5gFtE9UfELjCUn20ByVkTai443w5pGYQyilOMUTcSvnCN5pJbLS/Xl8Km
    /2t5w9SqtaJ6T5RX/6w/8CArOQTwePpOIBreezPuQw2Zuwr3mEfNdDsNNde15wJtoO3T5y
    U0DQYel3bjf/sEaGpRn1PWSr9xiCPwyDv1i14QGnQZp/d52dEOyAuxUT1obdfvm/pK2h26
    7SKHwU14cj5U8T7XgUXNRb9GMlLV48lYmE/KJJ/7VNaGvRbun958yK+0nzFe5CFkaMjtW/
    Ey233q2kGhKJlmOXFWY3z3YsUtPOKR/ZviUo5Eheuojtsq2291zhyyTVU0UQ
X-ME-Proxy: <xmx:9QVtausVfQvVBjHKsLP4st3tMAY-1JcpkxmpBNP4rfeEj6jCukJvBg>
    <xmx:9QVtaiZ8wtj3eq_oI4gLmGGgPSgCjtnxEVOngqDbxRuUBge-wEtMww>
    <xmx:9QVtal1zC6EEEPKzJX-CUYT44gG61_kXImAkFE5ctMvjIH5AE5ec3A>
    <xmx:9QVtasscJTwGT7Q3ZFSEPvjIlQU_ECRHy8lg54RU5Kug2F3Cw5zSgA>
    <xmx:9QVtahB0Yd8-_LrpceqGuqNCNfayVPrd7uxwYKvVeJlM10eezAi1x9LW>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:44 -0400 (EDT)
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
Subject: [PATCH 04/24] openrisc: Include <linux/cpumask.h> in smp.h
Date: Fri, 31 Jul 2026 13:30:05 -0700
Message-ID: <20260731203031.13679-5-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203031.13679-1-boqun@kernel.org>
References: <20260731203031.13679-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lyude Paul <lyude@redhat.com>

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
Acked-by: Stafford Horne <shorne@gmail.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260121223933.1568682-5-lyude@redhat.com
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

