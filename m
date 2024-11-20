Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19584188717
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 22:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732142101; cv=none; b=XyJyX6fNQlFIid7ZfLcHTt2Ks6t8u4caGkGcdSoFehIiio+JQjJbF7kjkQElcxCqs/9QLzNJIEcQ5+KJN8ABxy3FKm+CxBbUbPwa03w3MsCzSCoZM5ZT5jGIOCAoFzlPTaeBLtMiUQvdag382UA3y7M8MinBqDnUx/C1EBSN0Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732142101; c=relaxed/simple;
	bh=vUpqbTvCr9GsfmjHjd8jXnR8iDKSzhLcfaSchcf+nwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CGOO/8PaAFltwzlZSY1i2IbIB0KruG49fJj9/Yud872j1++g2RMCHq6EKhNR36mnxdj8yuGHrF+hVsZH0D7yjV7ASRljOnuCT8FL23SWksv75XulpYtJXq6hWot2bDOJY0fqiC/OoZGYH6eGS16EZXcHhRRlIoveF8VkH0Ny4JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W77JT0XH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W77JT0XH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732142098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yPSHBClsaqvh7X+4hB/lx04YnyFZahjmWjBIaDBKFMc=;
	b=W77JT0XHBnCi3fWC2SOWwsq0C/weo7dVqp3qY7KsrJDz6eMuLn2Tpg3rCJHA6Zwck9ltrt
	+k8PLtg4JFnnrr6vUXUPtxL30aXt1JZlBJF7r0CARtqh62kjOGNq2KkTH+fYfSK8YazXVE
	xRFaDtgevp2NfvK3hvy8Zrc6iiDXIZY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-EPG2xKCJN7OHErd_e25j6g-1; Wed,
 20 Nov 2024 17:34:54 -0500
X-MC-Unique: EPG2xKCJN7OHErd_e25j6g-1
X-Mimecast-MFC-AGG-ID: EPG2xKCJN7OHErd_e25j6g
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C3C871956089;
	Wed, 20 Nov 2024 22:34:52 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.12])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1D8CA19560A3;
	Wed, 20 Nov 2024 22:34:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH 0/3] rust: sync: Add Lock::is_locked()
Date: Wed, 20 Nov 2024 17:30:40 -0500
Message-ID: <20241120223442.2491136-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Now that we expose Guard::new() outside of the lock module, I figured it
would be a good idea for us to actually add some debug assertions to
ensure that callers outside of this module don't call Guard::new() for
locks they don't actually hold.

This series adds the ability to do so, while also making sure that we
don't needlessly run these debug assertions for the more common usecase
of acquiring a lock in safe rust code.

Lyude Paul (3):
  rust: sync: Add Lock::is_locked()
  rust: sync: Assert Lock::is_locked in Guard::new for debug builds
  rust: sync: Add Guard::new_unchecked()

 rust/helpers/spinlock.c           |  5 ++++
 rust/kernel/sync/lock.rs          | 42 +++++++++++++++++++++++++++++--
 rust/kernel/sync/lock/mutex.rs    |  5 ++++
 rust/kernel/sync/lock/spinlock.rs |  5 ++++
 4 files changed, 55 insertions(+), 2 deletions(-)


base-commit: b2603f8ac8217bc59f5c7f248ac248423b9b99cb
prerequisite-patch-id: 8c65a39abe47832d0c98c9c266b4b9348fb3526a
prerequisite-patch-id: 211faf8533feec77907b0a1b9b2f788e72c5ac58
-- 
2.47.0

