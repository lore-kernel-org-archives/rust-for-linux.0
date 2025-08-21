Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2712C21E8
	for <rust-for-linux@vger.kernel.org>; Thu, 21 Aug 2025 19:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755804811; cv=none; b=ScfCmw0ikAtSbWaJP0k0dJhZDw4DR4oqntm47wQEoqAJva2c6cF0HJGVXkxCPquiud1zil0TdBvpXwneQr3cK5R0WK0ShoY5L2xSyFt68b9doWI7eVFmQjp/IVx2xfmLoUKJqMHwijBOfu4YyxbAcJsVIej8Ii08XT4H61AaIvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755804811; c=relaxed/simple;
	bh=qlwaWio57GqLMA9Fb4mvAHFlhGAkvsC98uuNEQObk/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXmrGTU4Op7ezM7lt5N+DGSVqN2r6nfm/ouzqJm9UiJehYzQbDjHbrOsjKDOyJYa07k2pgeDDJZEQOA1aZR+mJb2j5lVPrT7CdlLzCQO5s4Awb26B5aGiNNznX1yUXcLkdTGtw55VHdS1ABaGGN3dyLDk7ugu/AZyMYnvpLQqEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a+AVPSVB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a+AVPSVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755804809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BLWwbEpsyDLokTeeRPGfQvr4ehtZaUWiSPjkeJIZb9w=;
	b=a+AVPSVBgva9HSCoGI/W3ckhNiVYM6L3Vb+yvt8qQpsqvAgrOmraSuYd+TK90/aUwWh4no
	E8uy8nUhIlO7IfquwNE5KkG3M0OBQpY+MUugHHy7v9Sjtm4n+kTgkfUQcyeF1X1zTRpkAI
	bUbBS3DD/y3kbvH/rTVrqzYVq8PiRQw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-124-HtXK0WiUOMybVkIS9GR2gA-1; Thu,
 21 Aug 2025 15:33:23 -0400
X-MC-Unique: HtXK0WiUOMybVkIS9GR2gA-1
X-Mimecast-MFC-AGG-ID: HtXK0WiUOMybVkIS9GR2gA_1755804801
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CFFE0180028D;
	Thu, 21 Aug 2025 19:33:20 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.89.200])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C9E38197768A;
	Thu, 21 Aug 2025 19:33:16 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: 
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
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
	rust-for-linux@vger.kernel.org (open list:DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST]),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 1/7] rust: hrtimer: Document the return value for HrTimerHandle::cancel()
Date: Thu, 21 Aug 2025 15:32:41 -0400
Message-ID: <20250821193259.964504-2-lyude@redhat.com>
In-Reply-To: <20250821193259.964504-1-lyude@redhat.com>
References: <20250821193259.964504-1-lyude@redhat.com>
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
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

---
V4:
* Reword to "Returns `true` if the timer was running."

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

