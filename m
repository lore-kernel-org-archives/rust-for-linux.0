Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1C531C58B
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 18:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757357572; cv=none; b=G6c2JvV1PcklpyTwL6kpLhZjctAUEcBV8Q9SHeSa/VnD/sV2iErUilwNYHiceLAVlol7pEBaplsXDv6J95Y8uCNuU4ZiM0P1KP8t/aN/D+KVrSXGq9uaE4Qh3Uz5dmFg5O5iWTgcYxLR5LTEZNgrvhItBrH8Z8VHPR1PWF/dhaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757357572; c=relaxed/simple;
	bh=m1ecs/SKmseVTzGSsYHUVChphJvT8mYdE+bFV4gTuEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o2zvMhpzetNwYugyUO1cAj4Z/WSrFUG8e9beh6tk+2L7EgJT2bd+r2ySQkJz6F7C75EW7jz+fSmns4x8xTqfWJUty+AaZ7ZIg6ZIotpBdQWwYLTm6VBIwnJahAlp3NkhQMRaENfXwbT1ELU+No8rIPyJFFP/nGfUPoP9Nnd/9SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I//zXPIK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I//zXPIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757357570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P/hLdH3M63boRfhp9VsdmP91lydrwcfx7/FSoo2D22s=;
	b=I//zXPIKSId5IZkcuY0t+4/ELUu7F4/6PtZZJ4165G3naHNhmtD5xV3g7jha7GMiXgieH3
	2HgaTrQjG5/0bwtmKLBHS1sUGV2nkXdV4LPIqPfIn3AdQUE41g7ioPdbKT7fJEEOCmDtFR
	ZlmHlVEYr0AzHF6VsWYCqt76DmOohAc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-U38uczxXPayT7Vgz3iEFkQ-1; Mon,
 08 Sep 2025 14:52:47 -0400
X-MC-Unique: U38uczxXPayT7Vgz3iEFkQ-1
X-Mimecast-MFC-AGG-ID: U38uczxXPayT7Vgz3iEFkQ_1757357565
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EB312195609F;
	Mon,  8 Sep 2025 18:52:44 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.41])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 951551800446;
	Mon,  8 Sep 2025 18:52:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 0/3] rust/drm: Misc. gem bindings cleanup
Date: Mon,  8 Sep 2025 14:46:35 -0400
Message-ID: <20250908185239.135849-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

This is the first few patches that were originally part of the series to
introduce gem shmem bindings for rust into the Linux kernel, which can
be found here:

https://lkml.org/lkml/2025/8/29/1533

These patches don't have any dependencies besides needing to be applied
on top of drm-rust-next.

Lyude Paul (3):
  rust: drm: gem: Simplify use of generics
  rust: drm: gem: Add DriverFile type alias
  rust: drm: gem: Drop Object::SIZE

 drivers/gpu/drm/nova/gem.rs |  8 ++--
 rust/kernel/drm/driver.rs   |  3 ++
 rust/kernel/drm/gem/mod.rs  | 93 ++++++++++++++++---------------------
 3 files changed, 47 insertions(+), 57 deletions(-)


base-commit: e2580413a83680f679904ad2f2c1aa6969876469
-- 
2.51.0

