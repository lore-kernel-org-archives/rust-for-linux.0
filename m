Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA872116F6
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 18:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383175; cv=none; b=OQZWH88K6td5DSLqqbayD0P7SK8w9opLOyIWDMNjLvJlDYW58rT7nb8BhxXDb5CQwc9PuUmLNDtBJ+F9+bGYkPxPxqUk0rDtGJCj1WlynNkWuDHdzUgNDG1CgOiTPQ19giDd0PzGQCkk5LpztZ/MEQB4YhIfebUZu0d9ztdez94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383175; c=relaxed/simple;
	bh=nlZa/aDlSvtAlvgrAuTf5BbMPUoVpU8q8jqm1GfequY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FhtM2GCHDS8I3NlWdJSgdNjEAc8Ena41IoiXWMz0R8TsGfvUhpdweLG44+M5K6+O7naqbd4JsTd+V2C1fEhLsH/7DSidWI0hyzZvjIcF4FcZwAYywHWHZIupGD1V0/vM/v+LtN/n95MRRaky63veyvz6TpZ31kDw+59fFwZvLqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FQ/ZvnV4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FQ/ZvnV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753383171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rdWBZILBS/MhPZLsg02K6QrAHwRnYUzZfvFSdy9QiDk=;
	b=FQ/ZvnV404XhnmyUvtbDIti0MGwk80NAD7r6DO/QQmoch+kVze22YImt1dS0iykUBTfWSu
	d6lyAGsp4nK7YsFVySidAwQb/6YYIj3hmgcEoT19re808pzk7G3lXLk05mWlfGJkQqaOpz
	gd9sk5DpMee0ERBq5UCFkBaE5c5dc4w=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-r7MsJazPMLu1V4VgoUXkcA-1; Thu,
 24 Jul 2025 14:52:46 -0400
X-MC-Unique: r7MsJazPMLu1V4VgoUXkcA-1
X-Mimecast-MFC-AGG-ID: r7MsJazPMLu1V4VgoUXkcA_1753383164
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD05B180034A;
	Thu, 24 Jul 2025 18:52:43 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.88.223])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 11562195608D;
	Thu, 24 Jul 2025 18:52:40 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v6 0/7] rust/hrtimer: Various hrtimer + time additions
Date: Thu, 24 Jul 2025 14:49:26 -0400
Message-ID: <20250724185236.556482-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

This is a collection of various bindings that I added to hrtimer when I
was originally getting it ready to be used in rvkms. I've mostly been
waiting for Andreas's hrtimer series to go upstream before submitting
these.

All of these are currently being used within rvkms for vblank emulation.

Previous versions:
  Version 1: https://lkml.org/lkml/2025/4/2/1474
  Version 2: https://lkml.org/lkml/2025/4/15/1750
  Version 3 (only a revision of one patch): https://lkml.org/lkml/2025/4/15/1780
  Version 4: https://lkml.org/lkml/2025/4/29/1715
  Version 5: https://lkml.org/lkml/2025/6/13/1785

Usage example:
 (keep in mind, I haven't rebased the example entirely - but the only
  differences there is a few comments)

  https://gitlab.freedesktop.org/lyudess/linux/-/tree/rvkms-slim/rust/kernel?ref_type=heads

Lyude Paul (7):
  rust: hrtimer: Document the return value for HrTimerHandle::cancel()
  rust: hrtimer: Add HrTimerInstant
  rust: hrtimer: Add HrTimer::raw_forward() and forward()
  rust: hrtimer: Add HrTimerCallbackContext and ::forward()
  rust: hrtimer: Add forward_now() to HrTimer and HrTimerCallbackContext
  rust: time: Add Instant::from_nanos()
  rust: hrtimer: Add HrTimer::expires()

 rust/kernel/time.rs                 |  22 ++++
 rust/kernel/time/hrtimer.rs         | 152 +++++++++++++++++++++++++++-
 rust/kernel/time/hrtimer/arc.rs     |   9 +-
 rust/kernel/time/hrtimer/pin.rs     |   9 +-
 rust/kernel/time/hrtimer/pin_mut.rs |  12 ++-
 rust/kernel/time/hrtimer/tbox.rs    |   9 +-
 6 files changed, 204 insertions(+), 9 deletions(-)


base-commit: dff64b072708ffef23c117fa1ee1ea59eb417807
-- 
2.50.0

