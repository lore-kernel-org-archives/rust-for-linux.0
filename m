Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FDC1F4C9B
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 21:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743630088; cv=none; b=JWQfC0VMwHNShEKGlFEOnT92dczVJiGzEv+tIVeyT1P2nOXXF8AMQYvBloFF/HHrTiyeDNB0wV1iVAnfO70tEbUiyncKdziY0DdsWAJ9ha4AQq476ygGYr5y039sT5HaOPxj/2t/xww7pwKaz7gf6N+RSCQI9MOIeGeN8Y9rieI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743630088; c=relaxed/simple;
	bh=s1i2efafUocD8B1FsnmEzNkQUh09IlxbAwEz0Pc0PHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BsO2/jM6vO+BHYQ00GPVaUBVA4P4uRrwhxlgpapGBidY7lsqppFzkK+M57BCeECxgHkaCWBwCUdjq6BsSxDrS5d1ARf8CRXgC0PuOn8x4qLsXDR17nEJhiEcZXujsBEhFgRsr3Ki343oNc5xvkLeW7zTlXQXSVzgt56BCELWJL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ip5LyqGV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ip5LyqGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743630085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tFmXaoae9vzjlYX5SpA0XBLQfjUbxrFvPjU9PznbSk4=;
	b=ip5LyqGVlPj55Imk0iNi9Nuyrm/1UxJkLosg5RCLvMvvRR+qh1O8edBJ3YWWSKH/M9t+Qz
	Wo52AxvJEpjKpgJt5WJZ3Dxs2YqhyGiFnurr/DnAPRymBHRI/xIrllyxu0459qDUfvmUBb
	tERnXXbnlV8N92VwU0EQIFVEwYXKAdo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-513--BI9VzxrO3G87IArOAplww-1; Wed,
 02 Apr 2025 17:41:19 -0400
X-MC-Unique: -BI9VzxrO3G87IArOAplww-1
X-Mimecast-MFC-AGG-ID: -BI9VzxrO3G87IArOAplww_1743630078
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA44B180034D;
	Wed,  2 Apr 2025 21:41:17 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.80.95])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 37A3A3000704;
	Wed,  2 Apr 2025 21:41:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH 0/6] rust/hrtimer: Various hrtimer + time additions
Date: Wed,  2 Apr 2025 17:40:28 -0400
Message-ID: <20250402214109.653341-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This is a collection of various bindings that I added to hrtimer when I
was originally getting it ready to be used in rvkms. I've mostly been
waiting for Andreas's hrtimer series to go upstream before submitting
these.

All of these are currently being used within rvkms for vblank emulation.

Lyude Paul (6):
  rust: time: Add Ktime::from_ns()
  rust: hrtimer: Add HrTimerCallbackContext and ::forward()
  rust: hrtimer: Add HrTimerClockBase
  rust: hrtimer: Add HrTimerClockBase::time()
  rust: hrtimer: Add HrTimerCallbackContext::forward_now()
  rust: hrtimer: Add HrTimerCallback::expires()

 rust/kernel/time.rs                 |  10 ++-
 rust/kernel/time/hrtimer.rs         | 127 +++++++++++++++++++++++++++-
 rust/kernel/time/hrtimer/arc.rs     |   7 +-
 rust/kernel/time/hrtimer/pin.rs     |   7 +-
 rust/kernel/time/hrtimer/pin_mut.rs |   9 +-
 rust/kernel/time/hrtimer/tbox.rs    |   7 +-
 6 files changed, 157 insertions(+), 10 deletions(-)


base-commit: 142d93914b8575753f56f0c3571bd81f214b7418
-- 
2.48.1

