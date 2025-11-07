Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE218E1F
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 20:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762547215; cv=none; b=bL6s8e+rT2w3N5dLOvopW3i0jzlscTHVKJ8QnYVDYZw0wTX2Rhf4B+EiIw0pyw+xAVAdXF2ORTo0HYzNxnDhqZgiWrprPiYaxx9LXaMMTFlWFAEoa4ilo73HavSAxokX7LGeh1LaXSV3hG8kAZMWFo8JlNsmhGaMKOPKwJQ1ZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762547215; c=relaxed/simple;
	bh=ZKaUUYdPx3BMbOo/LEvyBO/FJ3OZMyPaglyZDKlfN1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EQ4YkORdoak4N796ljxSswnof4l3AXK7URQlih4yhBfDepR8u1HvdJgjf7kOWHP9UgFYSdUtqtzS9N+XBPi+rsDXaf68BJhYez6nmSFhUY8DQwNoMCpRK/AWLS41EerPJ4bn3GMKZ2RgGUVEh7likNWc4IOQfjv9n3kSAjmOxK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZpA26PBt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZpA26PBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762547211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uwpys1qbVqIQiEcWuPi5tSAuqTvExDHlhAreYZVUYmI=;
	b=ZpA26PBtLGEsjaf28YcmNqV4BLHqTjDMewmBjrM4ZXhehxpq4BlyB4vUGBdyb6/yxFoS2N
	2BJJJxCVN9XpOwmni9SsbB07tuHVUesUJvt9IuNihyITSnYfCULutlOFQEmvewM89dG/kG
	np6ojEchenic78z+tazPmpd1OUpob+c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-502-2c9BFE75Nh-WEcNxIjv4Xw-1; Fri,
 07 Nov 2025 15:26:46 -0500
X-MC-Unique: 2c9BFE75Nh-WEcNxIjv4Xw-1
X-Mimecast-MFC-AGG-ID: 2c9BFE75Nh-WEcNxIjv4Xw_1762547204
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 98ABB180048E;
	Fri,  7 Nov 2025 20:26:43 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.81.9])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 799D118002AC;
	Fri,  7 Nov 2025 20:26:39 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>
Subject: [PATCH] rust/drm/gem: Fix missing header in `Object` rustdoc
Date: Fri,  7 Nov 2025 15:25:56 -0500
Message-ID: <20251107202603.465932-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Invariants should be prefixed with a # to turn it into a header.

There are no functional changes in this patch.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index eb5f3feac8907..a7f682e95c018 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -164,7 +164,7 @@ impl<T: IntoGEMObject> BaseObject for T {}
 
 /// A base GEM object.
 ///
-/// Invariants
+/// # Invariants
 ///
 /// - `self.obj` is a valid instance of a `struct drm_gem_object`.
 #[repr(C)]

base-commit: ade19c5060dfa39b84a9475a4a6b05e2a8a2b3ac
-- 
2.51.1

