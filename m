Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FEE2E92B7
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Sep 2025 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758273184; cv=none; b=A4J/uq2h9azKmtc2EUVbOqXoMxKhDiFMsN33Uv5/s3vuBigUV0qvzQp8vuJFFhK5zcgGvDNflzOf8RPaHCNpMz1jDwtaSWx5VsxrJfMKSJDxs8S4yXVP4mORaAhxdTvrWahWdFLTQvtDVU0haIN35fJf8pFhFqg69Fhl1r2OJFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758273184; c=relaxed/simple;
	bh=QweTAqxNpSrDrK2q0/RR+kdBUV2hZvkvOnc1TJn8Yck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NP2J82Rkj0tO8lDehiJYvtzT3DAXlcaShoaozrGnQRSxv8qv92eai9TxAWVL6wyc3lc/421PHBt2Aoy7w+yjQAtSQuBGNZ0+nZTAg+zG+st7AthcfQwHKsd9ionNm/8nIBIym1UqHeGFjuVp8FSbFqAJ5IB+NQcLVEc/3odDmWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVPmUjVX; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVPmUjVX"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-796fe71deecso11310216d6.1
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Sep 2025 02:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758273182; x=1758877982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K70gfC2VGaXawlZrrSZ8hp0QF5eghAVmIXEzCCUkbN4=;
        b=hVPmUjVX8qD57Te8PtzQaXb7pzBCYUxYaT3AmPJBcIgvd1tDfMhYhZjEmMPWZiaLEN
         91vtiIAhkGHfCFl0gV/2yFN/y23ek1ZjvYmsOIyib5wa461d8v6B7hIqdeRfNVMo+P23
         yxeOnXtX2tf8EZY0MD3PPX1Fo8bSzHpE3FwLYB2xMWZtE6Lsxd/TDK0Gl89WBIgxs9Sn
         TWhY9zUmpV9cLSWB0mto1XtmyatUBIhboUcks0AaUhdIOCUI1tz5xI85IfAy0Gz+BN2J
         7Emn7lx0c/fJHle5K9pQ8qnVkIrtQt/NLGZt4/Xw71tCkOLxetOZ7jxRC9sWaFRlwp+g
         /68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758273182; x=1758877982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K70gfC2VGaXawlZrrSZ8hp0QF5eghAVmIXEzCCUkbN4=;
        b=jPWuLM1WDavPVGp4f0tTsgL14i9osADasjLQxajU8eUVIGg3jdhxHFTlsXmxSIQqw+
         1kHcn6/p1my6edAwiug3mVjDo6BUHJ+JJF7iGIuV/MVeKqDy3FZNdt62IN0+lDfkSLvA
         d2/h4CVUjCZpIghEUuhz1pBcHHdWmmYy95d85IL82ZFwG8vcBa4BPpRYQq3N9hTBVNLh
         caeC0SGDt4d1eCtV+6mYPBlgfvkH4GEY7UwspGtx6ADu3/RJ/bs2jE+sQj34SNV1tqQ5
         H/zWNHDLZa/YSdy2EYHH/SVfOpVcLXAaO6JSir46+/tC2E1SblzdLy4Hm+o0KnjkIqiY
         Onvg==
X-Gm-Message-State: AOJu0Yzula9rKs3iAak4y09qC1yE1mvJyK+Fs1xrBr80oByebRD7OFRv
	QTJBuZislwMWQ1SKA5faBDA3OUcd7GnjsFty+OSIudvaq8MzJtgHZBag
X-Gm-Gg: ASbGncu8uhM4rORBb0fCsexACfYtV2dcK/Dx0vJ9UgckCIjfVqMsu+AQtYQ6skJuZBt
	K34+iLwEQcVklOcI9Wr1BFcS9c1D/kEIYDWMZWyyEolmvyXssKJOzteX/5ng3YQnHIAgYRS4qc5
	PMX0iwsjHjUQSRIE750g35+StuE6fVjuvpEOmjzPexEk8sVYT+7L2+GJ6v441w+8oC9C5txxYDJ
	uA41n+5X2CWbQ8DQ6CzNydP9C5SQ8w60NwZcWTsN9llm+04iaRVsl0W7c5W5MEndebBfhq+uhtK
	Ix7FkrRYlts/o2QwOZCWX8d3Oe5Ehx13Va1WN1+Auwv2wiqkPw+8EmtTKMBtdWTKaMkoIAvRC5P
	6Hex0grgLAPpWEpLgmTEtx2cXsVydFoo41QWvYbDEIFSXau+p+Y5L/Cw3FHdDvXSGc0r1p4ppFU
	mbaLmLxzLeb2UX
X-Google-Smtp-Source: AGHT+IENO3y1I+WdQckOF9/GGnaAMQ+ul1aKo9ejx3/ulS4DRfGqgjIdtHE0clXgDs5HZit1Tjxilw==
X-Received: by 2002:a05:6214:29e1:b0:794:6621:6d18 with SMTP id 6a1803df08f44-7991d549c82mr24827026d6.51.1758273182126;
        Fri, 19 Sep 2025 02:13:02 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793474ac8dasm26073756d6.30.2025.09.19.02.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:13:01 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3316AF40066;
	Fri, 19 Sep 2025 05:13:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 19 Sep 2025 05:13:01 -0400
X-ME-Sender: <xms:nR7NaOLBS26uIfK4Ed8QhVmcyJM3gZFCCmMxb0z1MgGIwt1en81uKw>
    <xme:nR7NaKY1xYyL1iVWtry5iATJBEL0a2_379ADVTfH2YfVvX59wAGqm9e1g-J8iuH_U
    Pn08rBAjNBSBvXn_A>
X-ME-Received: <xmr:nR7NaCTvg4nWwxnNKkQxz-BJwtsomwcfFw9VAZrDGjc5w-EfgdnsvhAH9lhB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegkeekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgffhffevhffhvdfgjefgkedvlefgkeegveeuheelhfeivdegffejgfetuefgheei
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    vdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesnhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheprhhushhtqd
    hfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepfihilhhlsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:nR7NaCg7YxtMhcv3IoTX_-zd2libnCl4OXYA6_Ds91efm7xQkeJ6dg>
    <xmx:nR7NaOvv6BU7R_WT2VqJsWX595xDh83Ci6pQZbGQbfzj11JVQeOKOA>
    <xmx:nR7NaEyipy6jYjepz_2klsuBBZrRw02um3fbtquJ_DrzSOtrbVE2Sw>
    <xmx:nR7NaMOpas1iBqJn84ZsG6cmaZLeBWsxafdFUkhVYYwd113Ng0MaVw>
    <xmx:nR7NaO25cC3oRhaNC4wAbHcV2E0rfR4zsyDoWN09ForWCLQKj3Y3A9JB>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Sep 2025 05:13:00 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@nfradead.org>,
	"Ingo Molnar" <mingo@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev,
	"Will Deacon" <will@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	alex.gaynor@gmail.com,
	"Gary Guo" <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	stable@vger.kernel.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 1/4] locking/spinlock/debug: Fix data-race in do_raw_write_lock
Date: Fri, 19 Sep 2025 11:12:38 +0200
Message-ID: <20250919091241.32138-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919091241.32138-1-boqun.feng@gmail.com>
References: <20250919091241.32138-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

KCSAN reports:

BUG: KCSAN: data-race in do_raw_write_lock / do_raw_write_lock

write (marked) to 0xffff800009cf504c of 4 bytes by task 1102 on cpu 1:
 do_raw_write_lock+0x120/0x204
 _raw_write_lock_irq
 do_exit
 call_usermodehelper_exec_async
 ret_from_fork

read to 0xffff800009cf504c of 4 bytes by task 1103 on cpu 0:
 do_raw_write_lock+0x88/0x204
 _raw_write_lock_irq
 do_exit
 call_usermodehelper_exec_async
 ret_from_fork

value changed: 0xffffffff -> 0x00000001

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 PID: 1103 Comm: kworker/u4:1 6.1.111

Commit 1a365e822372 ("locking/spinlock/debug: Fix various data races") has
adressed most of these races, but seems to be not consistent/not complete.

From do_raw_write_lock() only debug_write_lock_after() part has been
converted to WRITE_ONCE(), but not debug_write_lock_before() part.
Do it now.

Cc: stable@vger.kernel.org
Fixes: 1a365e822372 ("locking/spinlock/debug: Fix various data races")
Reported-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Acked-by: Waiman Long <longman@redhat.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---

Notes:
    SubmissionLink: https://lore.kernel.org/all/20250826102731.52507-1-alexander.sverdlin@siemens.com/

 kernel/locking/spinlock_debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/locking/spinlock_debug.c b/kernel/locking/spinlock_debug.c
index 87b03d2e41db..2338b3adfb55 100644
--- a/kernel/locking/spinlock_debug.c
+++ b/kernel/locking/spinlock_debug.c
@@ -184,8 +184,8 @@ void do_raw_read_unlock(rwlock_t *lock)
 static inline void debug_write_lock_before(rwlock_t *lock)
 {
 	RWLOCK_BUG_ON(lock->magic != RWLOCK_MAGIC, lock, "bad magic");
-	RWLOCK_BUG_ON(lock->owner == current, lock, "recursion");
-	RWLOCK_BUG_ON(lock->owner_cpu == raw_smp_processor_id(),
+	RWLOCK_BUG_ON(READ_ONCE(lock->owner) == current, lock, "recursion");
+	RWLOCK_BUG_ON(READ_ONCE(lock->owner_cpu) == raw_smp_processor_id(),
 							lock, "cpu recursion");
 }
 
-- 
2.51.0

