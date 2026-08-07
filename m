Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B333AD52B
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086163; cv=none; b=HfWgBY+1R9aw0uyJ5m6ROzfU9wz6c4YOraPmK5uYVpwB/j+jKfYHIUocj+Rcf60nOdKVNhoLmeI5GWPCBm7JetZw0vmQeu65UOvKX+E6M1ZAhLNyPLRI6T3Kp0vkeK2X6LZZyI0VvvbWX5XhiumroP55X0/giIg9rYK8UPdJOaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086163; c=relaxed/simple;
	bh=ec5Ah/8+IE+sh6duXoIfePrYPk/nTB/nNJ9FI66HfV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KReXFhOcBbc7v8iAR3cEqlJemVVxHXThkNKg1SUMn7F5+eheOrHqpjz2u1chOClhmGy872bTUAbxhs9Yz/B3pbvm9E1Dkfm7QO+VhaXGWSC0ZQmFTrtMnQuVAIOn8k4LaQtFLuaTeOyONUFFP6JDdHOiDGYtuE6EneJqj09cXKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m11ZftOA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m11ZftOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AF71F00ADB;
	Fri,  7 Aug 2026 07:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086159;
	bh=0thUqhS5l/CCHvciQUIdxDtNj6hdUCGVYjpithCalyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m11ZftOAn7lpulkzJUtOyQQw0ULphlxM8nXGezNFS7Ukf6hNZs2kFO9Q9IwinnDDW
	 /pgRo0r9ePJp5rMBm9V1T2uAcJfLtFHROYvqdlkVQqWGNOpR0yktxFIPzExaaiGODn
	 AsYUv0EyAQPo8dr/jmzljdK/Up2W8C3hb6gMuX0d8AFiv3rnHj5SLIJBchIRqSw/f3
	 QfypX+zVqluc27U07YDX6CNzf23fHT2OpFSbpjorddbDnlToCZ8hn3V0rRUT3JoNGg
	 cyw9czjIHVblKe+aob3WboyJLu5QOM4Ee8vYLEvGYmpKQx5xyuOeuGruv19ghc94fs
	 B3GlZ/PRM8LuA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 49A89F40069;
	Fri,  7 Aug 2026 03:02:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 07 Aug 2026 03:02:38 -0400
X-ME-Sender: <xms:DoN1apeXPO6V2gDeZbg1jDs-pnRixvw36esdQ1-bDecIpjmXbDrAug>
    <xme:DoN1arXXJ0ukSL1aFyhVyx1sHO5yXmOXS5OzBobzxGb8CYVU518kRJtMJVKzYtvzP
    yShKhmQUw-md7MTHTvMR6rrek80GxiSJac95pIlI-UDMix2tS0kFgE>
X-ME-Received: <xmr:DoN1avg05OVusst5HUOFqvoFGVuDAEYrbgVOf9v1XkCZI7B_-KsN9D8hmE9jGQl8gVXVhAtxIbfC2G6fnxH-vahI4Gv2jJc7>
X-ME-Proxy-Cause: dmFkZTELT6mPBN+tf+gYDjbmfxF2aJuNia3fHRbo+cksodwgHpv175RY/La8br7LVuLKD+
    xpTrulxkYenRUqjuFjoYpWp5kB81fkgSYs4cUOn9Aimg2+sWPDBZPSJD0AkLNVKo9ymnEn
    XwkNJDHucJ7KY3ALZ5VcWOWe5XHuNtoJV5e7Q54FFSKl7KOd+nrEm1L6dR4Jdu+LjwwV/e
    gMJ05NqNZsVzzu9M3eDFzAUAJPeoh4s2jJHbhIzGNi7DAZxkNRx1H6hWOvNKjwmDuMbW1g
    3/Yvg82sjVAOqgIP9o+xyvh3ddqbO1HSSPQ13n3n5YTt3W/2pxiARls47VLAs4X6PdSfn7
    FjdcdWmyNBOJOpt+tNjN4wi434/K/O/VFxjISq5bGdyaOyy7vv12JndAONN3A+H7z76zu4
    eF2Ozq4Tn/Cs1RV4VEGkwDVMevlFYq7W7n9wYWs373dMMWD7n6HKfHglJKDZPLoNcZ63qp
    2uA1GH5NSkoE5b/T9rXbH7WpQ/lLTValIdz0VKK0sIIa0FFtqkN21yNMnZ2WXOnb+q+DUc
    3Rg38qPk+i0vKaalK55l7fmiZ/uBu1PbWwgIwMFyOqcplC2FmIlLyNe4zWHVKsyMlQ13FZ
    1uHocHcpvOhORQ1Cjxv9l/D+s6ZtEZwCGVZovP09fToS8RMQOMZTAExNeK8A
X-ME-Proxy: <xmx:DoN1atj5QpEYSlpqEGVUa-sqK5ylzFsD4wulZDnwlYCs5f_sLN57VQ>
    <xmx:DoN1astJwst859gyWkP_9sxdBOURpVR85j4gMHjb2MPcUwvtFcLtXg>
    <xmx:DoN1ajuA6W0z8VaQ-UGUbWoT4YeBgozb95yRglq7uPSVZTM-FaQs8Q>
    <xmx:DoN1atM2LZPDVoByR8Sqvxo5MwzoOiWgZUbMKL16yzCJUGC1zYRIEA>
    <xmx:DoN1alcJpRiS4BVMdelDUZKuC_IJ_07ieuNVFr9mG7vuZarisIqEuAYa>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:37 -0400 (EDT)
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
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [PATCH v5 09/18] sched: Remove the unused preempt_offset parameter of __cant_sleep()
Date: Fri,  7 Aug 2026 00:02:06 -0700
Message-ID: <20260807070218.27144-10-boqun@kernel.org>
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

