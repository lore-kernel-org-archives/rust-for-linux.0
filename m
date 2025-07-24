Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD60D214811
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 18:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383176; cv=none; b=gQSMdmqmKHRS+BSA7DYOnJf+cqCKYDuSvoPCxt1hwMMRa4W+w0/sytKnbYVW5MmqyiS8xo7lthQ+zwmlpaUbeFYkrnr2m9ZU2R4ORLU2iULNm23v9Nw9bOOLkQR63cl4MJwWK24VoovtaC4bSni6chr3xqedhAk2yyKLNlFIuAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383176; c=relaxed/simple;
	bh=Mc3rWMMaytq+BMv7z9nIj4IY5sYmoN610zORz4cBroo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5dTdtMWwM0YKL2lTO3q7SJLCrPRXyAIGvoHPTgVq4itp5v4pgvekmpm4/gCWL1fh/GTGIfkbkmcVvqtYdDPxrWxgMygG8LU5ybG64jtuQN9+Dcuor1SdEWuynvsUiNXadvgzFiCpsp0Xf53CffhRzB6NiUGFlX4OQbdkLfHYHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BGwWXZAN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BGwWXZAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753383173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwVDmCmYVZN6ImwcpxRuuiECBLrfVSkQ1shmopmWmW0=;
	b=BGwWXZANdLCcilsApoXRG3/IqXaB9NphUHPJF3o5bYNh8TRSPGNCxxaS7Zd5F+UCLM0ulH
	tTfALt0Tw0LPSzss4dmIgt83psY4E5j/rqFZokCkUCTwyz1lCJfx1hxDdDrkNbfI3uh7RO
	LeEfFtp9N+A7ldKg6nqd/bESndtaf7c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-ytbLY9HDNjCZwQAz1VjnbA-1; Thu,
 24 Jul 2025 14:52:50 -0400
X-MC-Unique: ytbLY9HDNjCZwQAz1VjnbA-1
X-Mimecast-MFC-AGG-ID: ytbLY9HDNjCZwQAz1VjnbA_1753383168
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 74914180034A;
	Thu, 24 Jul 2025 18:52:47 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.88.223])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2F132195608D;
	Thu, 24 Jul 2025 18:52:44 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
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
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v6 1/7] rust: hrtimer: Document the return value for HrTimerHandle::cancel()
Date: Thu, 24 Jul 2025 14:49:27 -0400
Message-ID: <20250724185236.556482-2-lyude@redhat.com>
In-Reply-To: <20250724185236.556482-1-lyude@redhat.com>
References: <20250724185236.556482-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Just a drive-by fix I noticed: we don't actually document what the return
value from cancel() does, so do that.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

---
V4:
* Reword to "Returns `true` if the timer was running."

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 144e3b57cc780..6bfc0223f4f57 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -324,6 +324,8 @@ pub unsafe trait HrTimerHandle {
     /// Note that the timer might be started by a concurrent start operation. If
     /// so, the timer might not be in the **stopped** state when this function
     /// returns.
+    ///
+    /// Returns `true` if the timer was running.
     fn cancel(&mut self) -> bool;
 }
 
-- 
2.50.0

