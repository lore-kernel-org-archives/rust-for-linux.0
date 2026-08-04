Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FF847255F;
	Tue,  4 Aug 2026 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860115; cv=none; b=ix7AoqD1EoquotMiw24g6QgUWsOKa1WwPMG2+el2ePlDl57OQ9yesubn4+Ht5m0CQgeka/JJq+ykhBV2AwwERL3OzEOvm2VDm6gzLktqGYXD6IhKEK8zpQVPytz46vXRKCuNZTy2uavKV5S0Cv6xZ9PHBsV7AUBkAhA9W8ZmHOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860115; c=relaxed/simple;
	bh=ec5Ah/8+IE+sh6duXoIfePrYPk/nTB/nNJ9FI66HfV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZyaEKY9mqAiW+DAhpC024s2dRqMd90AHyWd0j9Q+r1qsHTUuHfI9KwZ/A3mfFLXWFypemGnKwVJbTFUWOv5bKVJ/KgYE+kWXaBHAM6m9NdEvG/F2qaZlX+hE/6bQu9mrqNVZrg7vWZvL4Rb9Nz0zLTwyX1bdAygfJ8Dzywl2kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pbb3RLXk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pbb3RLXk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6301F00AC4;
	Tue,  4 Aug 2026 16:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860110;
	bh=0thUqhS5l/CCHvciQUIdxDtNj6hdUCGVYjpithCalyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pbb3RLXkyr2Y24GmRUp92u9x138YwQgyd+e8glIkFYfBKmoVO8FNwnNP/eeiDwIxg
	 iiqI0NMQJfJ61PFmzVKB5duugweh5hT0KecAKR7ekaeSIc/LwZxYOHUzRiNAZVjDLw
	 rxtECgHunow9RPnfKS5qhiKPY6t0gxpTeylOPYyMQcE7Fuwlpc9xKTrQsXzyoX79tn
	 90KElkLMKhY9GA1XqPAaqhs6lvVIgvASIUd0NJkPIaIgCMPAYwQNMKafJiVddF+WDo
	 HnJCf+mjkoR1x6YKAScQy2eA//uAeuNivSjdlvQn1o1aJEOg9MaV9MX5m+fMuVpjVv
	 zT8ke91u9Jxgg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id EC10EF40067;
	Tue,  4 Aug 2026 12:15:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 04 Aug 2026 12:15:08 -0400
X-ME-Sender: <xms:DBByal7pZR70EGm9L-SbJ9l4zCUqMkZkQZil660XyVtXCrNh_V1f2Q>
    <xme:DBByaoEYN1i82D3-KgskBlnCxiZhhxQSmyUJNpXJUMVf3J8ZSAwaVx5uV_KZ4Ugjh
    pDWsS-jGzK8jotm6CZlw_kWyKubzput6kQwzhsbYOqkiYNLwUd59Ec>
X-ME-Received: <xmr:DBByav3cz6P1IanzwXWGc_HXH48Q3w2TjQBdjTnRaL8eaNr9l0FD7GWwWgkZO-opiEMFtV7Etq1MSXPsnJib8Uu4W9lEhg_B>
X-ME-Proxy-Cause: dmFkZTEjNALs/vHMOloma/FioWgq38LEDphqLbi/MDKjZ+skyek9CBm72qNR6fF0uZPdGp
    TNcnAR4AQwTabPyqXb4b8VVQVFCNoT48fsLJV/4jNEVJ0A9eFv0ovpeauV2dgztP0aY1Y0
    jIaZAzpZKJmSr5bjx5yubrqLJ++dH6uDgWLI4XXVkSa8jJqAXQgEQlXOv7WGccuHPTRlER
    Ylu8rJket0jbyQhGWZ+weYiCIeD4wr9LDagDzAHrKU27qzYbzXZIXOYWeFfQKFS5QVbMSU
    NlfDPJ2QDHkDrdBA1iUAq2dsmA2mOrsNEsIEQsqJKBWsANZHLO8XMG8BasrOULdBqAdbrS
    T4n7Yy/xnbst++Q/7UwywmdIB2YHsJedvBGrhDBbxijp+KAZ7iBacxQdpd36fElvRz57Hs
    9dUk8MVn6xcIdkdfjBL0rTuotTXsHq23D12GbBZL2a0tK0esWgSxaaeOJHxhLmpBg8cT/y
    EPvov8JtezK4Nw/HRE6vy+0HqxCJLezdF39bf80hR00agqKJv6awtKDOuxR5ZcCDAVOgiC
    DM78SHG75Kg/k0yq9V7zqIhTvBxqvOSexKC0/g9V+mqVhrkXQu1h6eiEGK5XSdye3Nr1gb
    8OXd3GTIqqSJ1vjLdYN/zVS0pGlxJ59CKgctv22uJI+DG6Ny0qY0sP8c6uzA
X-ME-Proxy: <xmx:DBByatqkZj2jmseX0KwROmYNvtnrbPpsqccrnDDRb8cNZqKIjQkeeA>
    <xmx:DBByakOgQ0TKJuNafI1TqT4S1SDXELYp4oo2sseKUyUlSMY9LNtl7A>
    <xmx:DBByanXua-udxMCL4du7P0gqPh7bMSIxE9skBB3C7BVb-l2-yWTuBw>
    <xmx:DBByavs2ycHShIprxd6wRSuKqTw5V43bjVtkoPWUBJE9F_GNJ5wjJQ>
    <xmx:DBByaq3_qirNuOZg8kyJAw6a9EGIJlmvlCsO38Zqv33wvlmz91JXxC9s>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:15:08 -0400 (EDT)
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
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 08/17] sched: Remove the unused preempt_offset parameter of __cant_sleep()
Date: Tue,  4 Aug 2026 09:14:30 -0700
Message-ID: <20260804161447.84806-9-boqun@kernel.org>
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

The preempt_offset is always 0 in all the callsites of __cant_sleep(),
hence remove it. It also allows us to clear up the code a bit by
no longer using a "preempt_count() > .." comparison.

Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 include/linux/kernel.h | 4 ++--
 kernel/sched/core.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index e5570a16cbb1..24414c79e59a 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -72,7 +72,7 @@ extern int dynamic_might_resched(void);
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 extern void __might_resched(const char *file, int line, unsigned int offsets);
 extern void __might_sleep(const char *file, int line);
-extern void __cant_sleep(const char *file, int line, int preempt_offset);
+extern void __cant_sleep(const char *file, int line);
 extern void __cant_migrate(const char *file, int line);
 
 /**
@@ -95,7 +95,7 @@ extern void __cant_migrate(const char *file, int line);
  * this macro will print a stack trace if it is executed with preemption enabled
  */
 # define cant_sleep() \
-	do { __cant_sleep(__FILE__, __LINE__, 0); } while (0)
+	do { __cant_sleep(__FILE__, __LINE__); } while (0)
 # define sched_annotate_sleep()	(current->task_state_change = 0)
 
 /**
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 96226707c2f6..aa116daf21bd 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9199,7 +9199,7 @@ void __might_resched(const char *file, int line, unsigned int offsets)
 }
 EXPORT_SYMBOL(__might_resched);
 
-void __cant_sleep(const char *file, int line, int preempt_offset)
+void __cant_sleep(const char *file, int line)
 {
 	static unsigned long prev_jiffy;
 
@@ -9209,7 +9209,7 @@ void __cant_sleep(const char *file, int line, int preempt_offset)
 	if (!IS_ENABLED(CONFIG_PREEMPT_COUNT))
 		return;
 
-	if (preempt_count() > preempt_offset)
+	if (preempt_count())
 		return;
 
 	if (time_before(jiffies, prev_jiffy + HZ) && prev_jiffy)
-- 
2.50.1 (Apple Git-155)

