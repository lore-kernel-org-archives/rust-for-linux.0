Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B2B2DAFBF
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 22:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757369229; cv=none; b=DIcdcq7MjFsjs913DT3uDDFWBHrzdKRGLjl5Ypnc4dKsD/219KTSW6n3qLlfxJ/4Ohn9T3ZQSH1ImH7/VkoM6lX4/8RAnexH2ADBYEQULuitZWjo9bYQdLVrRo9IyM6sflxXPzeQ/gxVitmoJN7voB96j6QsyfyaRuR2I5MWjOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757369229; c=relaxed/simple;
	bh=p/Ims0Ypd3d/7zo9k2sG0p3wrCwhThGPL1JeFbGHwn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oFcvGpyePz4+OIyfmNApSurjxZn2/K4stPxXBfQ2JXkI2Z4IK3OSsoR798UpNyKRvdd1tAEEhjVfJNJ9r0Ng+i4ztLKby3rQ1SAPSnZicEA4+Pxd29FoPjfzBFFR0U8cOVx8eGx1qAe9P5nZkyySxVaFb2OMK2ME+hb2oItiCqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AjbZr2qO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AjbZr2qO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757369226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JkoTyeNf/GPBdyB+JgS1FXgnD5G8Br7KbPR2/Egwx+w=;
	b=AjbZr2qOdWvp/Jvtsq2EI6EGJD5U6iomxNjv22XW1X5FTcYKdzzkQGaYQ5bee4RCgWcLRk
	MqMaqjLHg/IsfcdHvxnQ80cbYRdnMbrxTv8i8CtIjKntrp7HAnS8Sq3AyA0MlAryj+7zlF
	FL3m8H1pTOxfyW/OrW3lrTzRR+lJKZs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-Mvf5fWX7O8KXB7tTI2FKdQ-1; Mon,
 08 Sep 2025 18:07:05 -0400
X-MC-Unique: Mvf5fWX7O8KXB7tTI2FKdQ-1
X-Mimecast-MFC-AGG-ID: Mvf5fWX7O8KXB7tTI2FKdQ_1757369223
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C8702195608C;
	Mon,  8 Sep 2025 22:07:02 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.41])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 80E871800452;
	Mon,  8 Sep 2025 22:06:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/2] rust/drm: Remove blanket AlwaysRefCounted impl for gem
Date: Mon,  8 Sep 2025 18:04:43 -0400
Message-ID: <20250908220657.165715-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

This patch series simply drops an blanket implementation of
AlwaysRefCounted for gem objects, which would cause issues if any other
additional blanket implementations of AlwaysRefCounted were present
within the same rust crate. While we're at it, we also introduce a macro
in lieu of being able to use a blanket implementation.

Lyude Paul (2):
  Partially revert "rust: drm: gem: Implement AlwaysRefCounted for all
    gem objects automatically"
  rust/drm: Add gem::impl_aref_for_gem_obj!

 rust/kernel/drm/gem/mod.rs | 59 +++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 20 deletions(-)


base-commit: 6b35936f058d0cb9171c7be1424b62017b874913
-- 
2.51.0

