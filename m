Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD6128F955
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 22:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752187913; cv=none; b=M6gdLzPUSwfNfhbd8lEC8JWg/Lc2DHX/TSkDTUs8zZqj0oCbrgKZ743BTjmbf3Tg3+6tVvYW+HIW1zMdkslaENvxWVzIi+s8tVVtTpWhifdX2Hyk7v/aUmUppBvprpItIPLhkj8Tb024aKUmsI0A+R93Kg6HPWZbYIFFYkRLFx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752187913; c=relaxed/simple;
	bh=uVeKJ8xBsRpkVuE4Q1BZswrNSbyNWSh8okxEnyGwfCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eoHZwf+/5pnLHOnMqhthy5B6YqgFmsHS7tHIlpvwoR5qh2P2ozp5giFs/TBdy2qvUJ8XJHc4ueBxnbdfNgL8WNcsviLuT3bbuYP8akZJZR80uRRE9avaIIUljSqoWmde0iWoLyv+kEelftaP02Gdgv3PpjSfTUkvTW8U4x6tVS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cAx0cX8F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cAx0cX8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752187910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O+Z1wrgBsDAZ+dNtmePreRESpDdntk9BeBWI/zMXSEo=;
	b=cAx0cX8Fh8N3VWvWhFjU4cU/MfaFyVf7fuyIrT6VzUrszwCK3usWzaowf0PptKGoN7OAVx
	bG55Xgj+9GmSqrud6PS9M6g3hbrsGmWS0cAW1JnOWdjAoXngwlGop7FvbbOoDVdsX1hLy1
	srInyNz9yieoF0nV9sa71tMxfQDBHTM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-538-2VNQnW15N4qoYaGp6dKjUw-1; Thu,
 10 Jul 2025 18:51:47 -0400
X-MC-Unique: 2VNQnW15N4qoYaGp6dKjUw-1
X-Mimecast-MFC-AGG-ID: 2VNQnW15N4qoYaGp6dKjUw_1752187905
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1868219560AD;
	Thu, 10 Jul 2025 22:51:45 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.88.104])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DEE76195607A;
	Thu, 10 Jul 2025 22:51:40 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rust: time: Pass correct timer mode ID to hrtimer_start_range_ns
Date: Thu, 10 Jul 2025 18:51:13 -0400
Message-ID: <20250710225129.670051-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

While rebasing rvkms I noticed that timers I was setting seemed to have
pretty random timer values that amounted slightly over 2x the time value I
set each time. After a lot of debugging, I finally managed to figure out
why: it seems that since we moved to Instant and Delta, we mistakenly
began passing the clocksource ID to hrtimer_start_range_ns, when we should
be passing the timer mode instead. Presumably, this works fine for simple
relative timers - but immediately breaks on other types of timers.

So, fix this by passing the ID for the timer mode instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>
Fixes: fcc1dd8c8656 ("rust: time: Make HasHrTimer generic over HrTimerMode")
---
 rust/kernel/time/hrtimer.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 8818775afaf69..e227fa95ab05c 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -398,7 +398,7 @@ unsafe fn start(this: *const Self, expires: <Self::TimerMode as HrTimerMode>::Ex
                 Self::c_timer_ptr(this).cast_mut(),
                 expires.as_nanos(),
                 0,
-                <Self::TimerMode as HrTimerMode>::Clock::ID as u32,
+                <Self::TimerMode as HrTimerMode>::C_MODE as u32
             );
         }
     }

base-commit: d4b29ddf82a458935f1bd4909b8a7a13df9d3bdc
-- 
2.50.0

