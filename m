Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC11369D55
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529847; cv=none; b=bO43DurbJBUmyEL549Ou41quwzCQCR54eUeQIVh4DlL4qQb6zxD0ullobC01rJLPMjCv+Km9hDWk4WiIua8Dhb7NM5dq1m6lt/ec9tvWNN7CilXWUgiD6FFvA+VOD7v3FRtPANm63eFkQjwBXE75cUZ6gK/gt+HWRz5B8rnBPYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529847; c=relaxed/simple;
	bh=7WkKWIqNSdtquMO/UCT6lKa5xRPmY6l6PwpqysBoDeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VHzOY9xArMsmJPcP8AXv982SpviyiOtao/zdVBdw9tJSQJJPW71x438zF2GE6RYnyInRGlaF8r9M9LnaI6HzvLhmMrhcaUNdRu/m7W5JGZ8oleSbxc6oPGQooZI+djIp41PN563gqdW2DlZfrONRdtheCUbk94O3ApmjJZ0tpRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vss3t99o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vss3t99o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66AA1F00ADB;
	Fri, 31 Jul 2026 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529845;
	bh=WH2YlwaR5eHhEQZk5J0iMOLdzBdIQSx2iV/VlZ3YLwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vss3t99obNlgFO3407Gs+3ia1uSkLwvnpsCgbr3mSga8tO6dJhPh6jPLp+U2z+OIQ
	 WluTsI9tZtW7hoCNAbNSOoyPXcvcTTk7WMcasokhm12gGiCzHfz5IXLOzmxjgA4BNl
	 4YcvU2y/WWEhggxt1ScLfU7B5nKruRneclK2CUzJQReKbYsA+HVWyVneBM6vpri2Pf
	 T9t6a/zQgZSbdlvhA+Fn9rHsS7zo8cbiswEsBr5dXwuyRSwTN9wRhkAGZObW2JsugO
	 77vy53WvFZeC9em0vbHIZhCpycuOLxGAazsQMgCvqikKj+iahb2jmmeq1LaZ1/hpAT
	 mITgVcvOH4XKA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id E4420F40077;
	Fri, 31 Jul 2026 16:30:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 31 Jul 2026 16:30:43 -0400
X-ME-Sender: <xms:8wVtatFnYGJvzKfCECp-wv32JvWOAczUIgGjVVnhN7P0qlVhy7B-BQ>
    <xme:8wVtan5ZsSZIIUDAA2ggp0532N0L3OupPJ9hCLvKxa9p3ay--4wq8EdXkXaBeKsnF
    2ckzRRdWWWNPnTnEk9nE1Ih3Z84VgH9QVWkYlGI4YrHYYH8aIn9>
X-ME-Received: <xmr:8wVtaovWY6gFrhyuUFPTGN_-2DCpD_4y-Uikq50i4Yg5u3UGQWMlVYbtwQai0gbWrMNT9_yHgn7uM_dFT_WwP7LmaeDPdFjS>
X-ME-Proxy-Cause: dmFkZTFdRdBIF8ZH/aPs2g1lRw7GATpB3kPZdHQ9SRq3TCfYELIaqSZraFLrXlLQvfZ+Zw
    L2FnPfSJd952oWr+y28mIfAsYcvh2g32U0J8iwTV49f0k9Q8hXOe/2BgVhInUEnjhmC2lX
    03vYTAlN0bq9NjF03uLbRgPGL4766SVn/XbgM9h+YDdXpmZY+TYoTPsYcygLFMbtetKCiX
    MKKxau189OoX/tBJGac9kkLntk5lYAb6ORV5iOKO0UE2KpFdBfn5cZVhjAZINCJF+DQAjd
    IJX9TqJvKbTOKjLKBWundtWMSfFqKbkgkDYizysOgKGZkbbhOs1gMmPcuy0Gf54a13j8my
    FlqsBMulLnIO8WoS5D1Trn6ZCGd+ly1yaYBXFWpCCCgMdnF3hWuB50Vm/U7nwcmIzEn57A
    VMb3xwSvkUNjJDbRYj7rplT/4tZtnlOHappT7HWGIb2+s3PS2iQU8YFyRvdTxDKie4I9xR
    rp9VuGabiwIaVdcw/tYPx5NFpyP5kiGXYTJEcIkM52L5RioThonEocNzM64Xhxu3CNWta7
    DiFlVBUwVBZviGQzeKPKyu2J0Yhqw+jlp4KVKRW65hg+c2iNSGtYz9vCq4bm30yca0cWVS
    /Fym2Gi8MjeMAf5h2fF3sVJ7TsRDIthid1KFc54gk7feSUj1MhAnJnzrutUw
X-ME-Proxy: <xmx:8wVtaj957ZaX2GpeMBc3Ui3yv2IBRuGJ_Xnyz5UYO0hPMKYSmsM1Hg>
    <xmx:8wVtaqlVG3xx7kNUgX9wfLF9L0kG7lpROxUfRO90DGhgwBrqoCNroQ>
    <xmx:8wVtarOay72Xn0Ab-dijZCkqmL5RCFO2Ryj1AbvmvGr61jxaqrJ3qQ>
    <xmx:8wVtahLusGN17ySjqV6-K6vmJrDW8OGXSWtMW8Und1cqDu1UBg7rQg>
    <xmx:8wVtauEHCrkC0M8pbRa2rDe4Loomyms7UzvTjJnUwMEl4Af6C4He8ktG>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:43 -0400 (EDT)
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
	Boqun Feng <boqun.feng@gmail.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: [PATCH 03/24] preempt: Introduce __preempt_count_{sub, add}_return()
Date: Fri, 31 Jul 2026 13:30:04 -0700
Message-ID: <20260731203031.13679-4-boqun@kernel.org>
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

From: Boqun Feng <boqun.feng@gmail.com>

In order to use preempt_count() to tracking the interrupt disable
nesting level, __preempt_count_{add,sub}_return() are introduced, as
their name suggest, these primitives return the new value of the
preempt_count() after changing it. The following example shows the usage
of it in local_interrupt_disable():

	// increase the HARDIRQ_DISABLE bit
	new_count = __preempt_count_add_return(HARDIRQ_DISABLE_OFFSET);

	// if it's the first-time increment, then disable the interrupt
	// at hardware level.
	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET) {
		local_irq_save(flags);
		raw_cpu_write(local_interrupt_disable_state.flags, flags);
	}

Having these primitives will avoid a read of preempt_count() after
changing preempt_count() on certain architectures.

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260121223933.1568682-4-lyude@redhat.com
---
 arch/arm64/include/asm/preempt.h | 18 ++++++++++++++++++
 arch/s390/include/asm/preempt.h  | 10 ++++++++++
 arch/x86/include/asm/preempt.h   | 10 ++++++++++
 include/asm-generic/preempt.h    | 14 ++++++++++++++
 4 files changed, 52 insertions(+)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 932ea4b62042..0dd8221d1bef 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -55,6 +55,24 @@ static inline void __preempt_count_sub(int val)
 	WRITE_ONCE(current_thread_info()->preempt.count, pc);
 }
 
+static inline int __preempt_count_add_return(int val)
+{
+	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
+	pc += val;
+	WRITE_ONCE(current_thread_info()->preempt.count, pc);
+
+	return pc;
+}
+
+static inline int __preempt_count_sub_return(int val)
+{
+	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
+	pc -= val;
+	WRITE_ONCE(current_thread_info()->preempt.count, pc);
+
+	return pc;
+}
+
 static inline bool __preempt_count_dec_and_test(void)
 {
 	struct thread_info *ti = current_thread_info();
diff --git a/arch/s390/include/asm/preempt.h b/arch/s390/include/asm/preempt.h
index 6e5821bb047e..0a25d4648b4c 100644
--- a/arch/s390/include/asm/preempt.h
+++ b/arch/s390/include/asm/preempt.h
@@ -139,6 +139,16 @@ static __always_inline bool should_resched(int preempt_offset)
 	return unlikely(READ_ONCE(get_lowcore()->preempt_count) == preempt_offset);
 }
 
+static __always_inline int __preempt_count_add_return(int val)
+{
+	return val + __atomic_add(val, &get_lowcore()->preempt_count);
+}
+
+static __always_inline int __preempt_count_sub_return(int val)
+{
+	return __preempt_count_add_return(-val);
+}
+
 #define init_task_preempt_count(p)	do { } while (0)
 /* Deferred to CPU bringup time */
 #define init_idle_preempt_count(p, cpu)	do { } while (0)
diff --git a/arch/x86/include/asm/preempt.h b/arch/x86/include/asm/preempt.h
index 578441db09f0..1220656f3370 100644
--- a/arch/x86/include/asm/preempt.h
+++ b/arch/x86/include/asm/preempt.h
@@ -85,6 +85,16 @@ static __always_inline void __preempt_count_sub(int val)
 	raw_cpu_add_4(__preempt_count, -val);
 }
 
+static __always_inline int __preempt_count_add_return(int val)
+{
+	return raw_cpu_add_return_4(__preempt_count, val);
+}
+
+static __always_inline int __preempt_count_sub_return(int val)
+{
+	return raw_cpu_add_return_4(__preempt_count, -val);
+}
+
 /*
  * Because we keep PREEMPT_NEED_RESCHED set when we do _not_ need to reschedule
  * a decrement which hits zero means we have no preempt_count and should
diff --git a/include/asm-generic/preempt.h b/include/asm-generic/preempt.h
index 51f8f3881523..c8683c046615 100644
--- a/include/asm-generic/preempt.h
+++ b/include/asm-generic/preempt.h
@@ -59,6 +59,20 @@ static __always_inline void __preempt_count_sub(int val)
 	*preempt_count_ptr() -= val;
 }
 
+static __always_inline int __preempt_count_add_return(int val)
+{
+	*preempt_count_ptr() += val;
+
+	return *preempt_count_ptr();
+}
+
+static __always_inline int __preempt_count_sub_return(int val)
+{
+	*preempt_count_ptr() -= val;
+
+	return *preempt_count_ptr();
+}
+
 static __always_inline bool __preempt_count_dec_and_test(void)
 {
 	/*
-- 
2.50.1 (Apple Git-155)

