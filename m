Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7056D205E02
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 18:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383439; cv=none; b=HVeWpqpN12TWq9SPVjqD797ugqK3FO3gafnFohw3fcLMEBIRdNsEiEJR/+rx9ltQMC0bfby2qqnuVgih+W0sW4cCAAcim23p/Pt8FiPU1AKizO2JwI3cm3NSHwuRwvnVZPxhVU8xNW7EyLvwPm21yn+qiM9C3HLb0l/fIDPRH+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383439; c=relaxed/simple;
	bh=n4kt9r4mEclx1NN9F8/S4ryqbdZwsApz1DAl59dkNP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NHubfoyld9rP0oAZmVaREhLJZIdnIi127cuHlL32dbhFJ7fGOly2U+mWvXSg5e38RtPhFLqwBXw7puXJBAgTmXjPJJ5oTNZzGaX04ijztP4+Ko06P0YD80KhBK4OJVRRQoqKVArOK0N7xoKdaHFdorFtc3XEjZrXtZTbvGFzDQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ApNTAUvf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ApNTAUvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753383437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GwsSb605ckTPK8iuLovIMbfX8h9jkGkILDlWm/zGsjU=;
	b=ApNTAUvfYhRQ4Pw6Qx3XJzFIqmiXpn3gXSH1B2+kkatxgzIpqhV+ncZFtckVl/WKMeu7NS
	bEynVRsiH8uPjjlWXPObvpAHzt+aVzwLkwIMibJPL+ks92Iei5NNck602lcrdaIxe9HlxH
	nOY4vKLmzSDx04D2uzrGITMw5mJfjXA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-333-f8jrWir-MLqcdypW4K-vNw-1; Thu,
 24 Jul 2025 14:57:13 -0400
X-MC-Unique: f8jrWir-MLqcdypW4K-vNw-1
X-Mimecast-MFC-AGG-ID: f8jrWir-MLqcdypW4K-vNw_1753383430
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 91F8E19560B0;
	Thu, 24 Jul 2025 18:57:10 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.88.223])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 62934195608D;
	Thu, 24 Jul 2025 18:57:07 +0000 (UTC)
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
Subject: [PATCH 0/2] Arithmetic ops for Instant/Delta
Date: Thu, 24 Jul 2025 14:54:05 -0400
Message-ID: <20250724185700.557505-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

When rebasing RVKMS against my hrtimer additions, which themselves were
rebased against Fujita's recent work for introducing Instant/Delta, I
needed to reintroduce the ability to perform some of the arithmetic that
rvkms uses for vblank emulation - so, this commit introduces such
arithmetic.

Example usage:
  https://gitlab.freedesktop.org/lyudess/linux/-/blob/rvkms-slim/drivers/gpu/drm/rvkms/crtc.rs?ref_type=heads#L167

Lyude Paul (2):
  rust: time: Implement Add<Delta>/Sub<Delta> for Instant
  rust: time: Implement basic arithmetic operations for Delta

 rust/kernel/time.rs | 115 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 114 insertions(+), 1 deletion(-)


base-commit: dff64b072708ffef23c117fa1ee1ea59eb417807
-- 
2.50.0

