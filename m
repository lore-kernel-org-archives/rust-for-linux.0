Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC3637AA77
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529856; cv=none; b=D2NGOYeumRXfxLn+6HVkKsHaG9J3EsVPYYnPmdF28Wp/aPqokvtqFvp5vVC34flidGSpW5tcU3Q+jDcfgsaMGei4XnIa5GzbUot6L6Hukcm6wDTjNg9N+o+r8q9/958jsoZ3Pji7TtJjzvfWFegnqnsEAvYLZahoW0GACjxIGEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529856; c=relaxed/simple;
	bh=8OKC93kjB3OAypdTgsLvav/Sby5CFIUSiI4GpwugfeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EApwsuJAoUbHBiZoVPzeMoK6yKW9W5VBPJa2GonCUh97Z70MrKaRlRK5xyY9b/qxeU2x0cofIjYUK+N4mqUXGvgb8x/BNJP3R7jt6BA4a96Iy7Add7lxO1NTVrlYYv3ObVlmTxwrpW45gI9EsFcAu27WQg02XCtybsNJHxtPWKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htBRWhnk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htBRWhnk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1721F00AC4;
	Fri, 31 Jul 2026 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529852;
	bh=IbUwG4eVfO2Hr5V4NtBdJhOCd9mCcXdlK71q0O4GZ2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=htBRWhnkYkIibQ3i/CWMFx8xJlmExYUtHIORxKGTHNEHzPQsU54XIlEvyI0iRJzC9
	 5EWxTNpSFcAXH9ds9/UwbNmQU+4rW1UAOcNLnV/5LBLK2Vr4rqb097sBHu9UsNXx6M
	 Rvs9DM1piPn2asSNYcvxlKnkzncJZ1m4XllvpzyvpZyadrUVpNj+e01I1bQ1ndp4C8
	 KwCp8iHmDIUxAZ/LrJ6yZewtiIzEeMFEm425ZZSOTvk4F5Dyr6bA/k4NespxD+vaDu
	 t3CQvRXFKTkBaihkh2oPiwbY98ChPeHKgkmEtwDGkcol4hp87ttQ9I/wUjr28Kyub5
	 +41C9MFv/q/0Q==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 49D0EF4007A;
	Fri, 31 Jul 2026 16:30:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 31 Jul 2026 16:30:51 -0400
X-ME-Sender: <xms:-wVtai9MSSHRsxbwS5VuIzdPD_Fbcb4TZlL7BPxe4YXFXlClFbn-ug>
    <xme:-wVtan7xezRE6O_5xFeJ-fc2iTn9VXZoOe8Q0yrc1_GX3uj4KKjofOidr43rKb1Vw
    toL_gcvVyGGwicpBXYmPm4g31d5EvEJP03Yb3uSFarXteo4ub8Uqjo>
X-ME-Received: <xmr:-wVtaraOT7dcYYspzJuNoALYjkqa7TG0QcwurJQil27qVDp6SA59H7BTfngrgvXzGY2tmmh6hZG9WKlSPIgmDXZIIRnkWbW4>
X-ME-Proxy-Cause: dmFkZTFIC2VVTLK13uDkALWshPgkkwS9DC5Q8ljHaA42IPRnmgkrxQSeK5HYsDRhN4GhLk
    6Lg9dLbHgT0DH+qVaNoW+UUFxptAXHUIdqGwEJPczm0ywmTmF9/CSNIQrGZfaA0/SYDXt9
    FCHeSX4ZePBeVl3Top6EjJd42yXsFqp+L0LPuLnabUXIo8fT3yX5hMg5WmOramFVWkXrXb
    dtjJi0qTpjt7TXVawGUwOyoJ/Q6jP1wNaVQH+6xYGS7UXVpHVglHDWcX7SjmpbiByeHS7C
    oLMM3JHkGXdP7WkAt31sGvl3IAmYfCODupTHvovIO6+oDBZmEBw2YefLw5AUKyninHXIXr
    uU/aqZFDbwNRTuq+1lI9CTvFVdIPMn2W/4VbpaHwADVTXn7+LRw/juI6GV1qY58R3RNgFQ
    W3lq0jHm9OqmqYu76jnoEZYpMtIHUw7gsMYB0j6tSirJ8Gb9xN6hizDFmhtK5jFBWtNM7e
    3v34M0evk1u2PrF+7KdfkDWe0s+5yP56Q5k9D1bqwESGSlfvHh7PtiJmNDhrFsFIcBJlqz
    9+QlAOSbV+rp5rFAlBW8OOYAr/K0c++465XjATKopuI70y7VP6Z1UQnse93nlYdQefsPME
    JX3rVMdSY391nQrwT0v34tVUP7notG4f4YvRMj07GI1c7YQ0nKuNV6XLTD0Q
X-ME-Proxy: <xmx:-wVtap-G_Yhsy4onW0JLkBfiTrh6N5N-M8kCI9S1qKZkCwQiSfxhmA>
    <xmx:-wVtaiS_9Pn40SeFMRN40VivZ0BJBj7yk1h8zyP3j9RzrpKhAEQQ0Q>
    <xmx:-wVtakI6AP8w2Fwg2hLkxdG80UGQTbxlD0UopYfoGbzYFr8KD82wdA>
    <xmx:-wVtakSrA_t0MYI7JqkJl29JFrUbJxUGHXAb-Qvy-m6elAhaFHISfw>
    <xmx:-wVtasIYVI5RrKquqtLYa0GZKZ5gnXNFu0iNZF3vblk5L3WN-YAA9nl4>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:50 -0400 (EDT)
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
Subject: [PATCH 08/24] sched: Remove the unused preempt_offset parameter of __cant_sleep()
Date: Fri, 31 Jul 2026 13:30:09 -0700
Message-ID: <20260731203031.13679-9-boqun@kernel.org>
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

The preempt_offset is always 0 in all the callsites of __cant_sleep(),
hence remove it. It also allows us to clear the code a bit by stopping
using a "preempt_count() > .." comparison.

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

