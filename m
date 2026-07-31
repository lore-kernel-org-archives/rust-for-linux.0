Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C385369D55
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529856; cv=none; b=Pva/81zGevVrObdX0jYeKiquOc4a4dG7QW3Wyu/r7s/RjvUk63kUkxNhmI5AbuVrAFsubP84kroxQRvbAoJMuMj4o0pU9wPo44NFmd1g92DL2Hei/AGlHheZmnZLkfHB7boFdpcL/KpudW+J4iIb/6FKcV7vXatdniKpy0UXgZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529856; c=relaxed/simple;
	bh=DDKCSBmWdh69FjGpE3KtoKKl8diHs5FB1tKxxEDIwtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9rXD/CcMcCTenkVznc8Ns9jLN+fwpDtHKRd6LirtLB1VDRVBG3H75sLJa2FEuyCNFaf9kMVIH0CNdpdd+ci9HhgV007X9fKCZFsUf6Dy1e3hAuy1QF+4fZV7sxVAvOXPmxp4t+9Ba4EXVluMXN++NLvZXs9XD3kbGdX/1OsHRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/hbaPJ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/hbaPJ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F83D1F0155F;
	Fri, 31 Jul 2026 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529853;
	bh=XDCFK0Pykwc7yJhmq8+Cu0tsCgs0jRR2+x2RB8Lxd70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T/hbaPJ45q7zs2zifUXRStZDCLGs5HlF9QIzPDWbPyb4FWgWR8qGnPf+uJ6/OBDv5
	 pwUon9jYMwOnQ35PjS7NtzZrcELqeNzvSsT175FVmvYitgoj/7pbpPpD9hxLgyZXH/
	 at3FXcD/Bwov7n8kMXIc/PUAJo/GWynXtweoNEg0yKT2PdTYn3UiSM2zxIPUUrq0Nv
	 oURy1t1Qtv/eAfCMmMeVd1i84n7FuUJQlYyhKDJC9P7pQQuZvdFUYBoMC0CpnSuRxh
	 jyaIoYpJj/aM8pAqhJ9sjwnV1Nb4BLOHV4EOfC4L7UmlXJmqvqyqmMQk4IlRjn4X5i
	 SJc+LeEk/LKBA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id AEC11F40077;
	Fri, 31 Jul 2026 16:30:52 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 31 Jul 2026 16:30:52 -0400
X-ME-Sender: <xms:_AVtasngZAtbEfJtmnVuVPeRqLzMQjVQZ_Y6Y7c7rJfJxoLtHJVTZA>
    <xme:_AVtahCTtDMXbIIILWGeMKOgCb_n89hnLHXBXumbAEtd6yANx8zXSSTZL9J3ZFxn2
    ieQX6Uo9lkkoxP2v121duKcBpaJnfxxgKxjduRxUfafRQ89gwqeew>
X-ME-Received: <xmr:_AVtauCFLdIP2McKwX8ma_lP3B37A-ADWAcEju0AoeNls_8K8KPWtNXUOP45RB1gi2ifMHs5fLyKzAOOORnZ5WaMksPzlbIB>
X-ME-Proxy-Cause: dmFkZTFIC2VVTLK13uDkALWshPgkkwS9DC5Q8ljHaA42IPRnmgkrxQSeK5HYsDRhN4GhLk
    6Lg9dLbHgT0DH+qVaNoW+UUFxptAXHUIdqGwEJPczm0ywmTmF9/CSNIQrGZfaA0/SYDXt9
    FCHeSX4ZePBeVl3Top6EjJd42yXsFqp+L0LPuLnabUXIo8fT3yX5hMg5WmOramFVWkXrXb
    dtjJi0qTpjt7TXVawGUwOyoJ/Q6jP1wNaVQH+6xYGS7UXVpHVglHDWcX7SjmpbiByeHS7C
    oLMM3JHkGXdP7WkAt31sGvl3IAmYfCODupTHvovIO6+oDBZmEBw2YefLw5AUKyninHXISS
    fcBtE/oYMBzM/w4XXdH/a5eaaRY1NV57i2omU3LHbqUblqPHtNVtoFNc+U3a0UA2khKoQp
    ZcuvCggAZ8WU9KZiPN3M5l0Vf5AG8lSohqpQXwbEe+EnT3a3fC3f+hT55Tj8i6/P4aBCZz
    GZhzJOE9yx1tCkUrpU0MBWhBNvnlF3OhZdTcXtvkpeOmTia5KwxMsi2qrl6EENEkT2QF2A
    uOWKtM5Ftuo66Ouox10iJQG2RaTEYmCP4nqpafXKZ3B70Z6aTXz3dC3Ks/8/xYuX0uCCss
    8osp5gC0z6GKsP6MowYZL7nF8XFW2CpD2ena+A3Fn6b/k1BhhtqnYLX9alJg
X-ME-Proxy: <xmx:_AVtaoF_R6y9YwicNyCcn0jPCVJHQOhY225_J9gkRY793zmUYeaRqg>
    <xmx:_AVtal7DZuIsHthXbGqbNtvitILmc56v0qF8w9SrREo003CPLKPnTA>
    <xmx:_AVtavQi0JgK4hErM7J_ZqTpsWcIf4qodclvGoU_fGxeb-PiwprM6w>
    <xmx:_AVtag6rsSM2xiHX2ySvmr1JBcAUn-FY9G62q5B88h_zgMHSCWDQeg>
    <xmx:_AVtasR9cS60r8hQ4tpmWvPQRQ_ijYn488lsXy33dBvhIEBlCQictw9E>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:52 -0400 (EDT)
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
Subject: [PATCH 09/24] sched: Avoid signed comparison of preempt_count() in __cant_migrate()
Date: Fri, 31 Jul 2026 13:30:10 -0700
Message-ID: <20260731203031.13679-10-boqun@kernel.org>
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

Currently preempt_count() is always a non-negative int on all archs
(PREEMPT_NEED_RESCHED archs will mask out the MSB when return
preempt_count()), hence the checking in __cant_migrate() is in fact just
checking whether preempt_count() is 0 or not. In a future change, we are
going to use all the 32 bits of preempt_count(), which would make
negative int values possible from preempt_count(). Therefore convert the
"> 0" comparison into a zero checking to prepare for the future change.
No functional changes are intended.

Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index aa116daf21bd..9b3f1764fa9e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9241,7 +9241,7 @@ void __cant_migrate(const char *file, int line)
 	if (!IS_ENABLED(CONFIG_PREEMPT_COUNT))
 		return;
 
-	if (preempt_count() > 0)
+	if (preempt_count())
 		return;
 
 	if (time_before(jiffies, prev_jiffy + HZ) && prev_jiffy)
-- 
2.50.1 (Apple Git-155)

