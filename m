Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336471D63DC
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 23:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732057926; cv=none; b=g4cXcnqIMKFACh5pX2phbPZNh/G+mM6YmmArkEIMfcGQ4CuomAmujphxYKgLtSWCdqW5+DImdX6vQ0+kp2+bMMzhbZI/VMz1HhIPfK5GKJfHlLOAE+nMCXN72P9eQ8LbGQtJxBdwWPh8lJIfwNE5xgmKcaxXnFWMkXarCXRF/8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732057926; c=relaxed/simple;
	bh=gPr2XVwTvpeMGoGKKjy1o51c1OdPhbUKPI0zWGhZTCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0PSOkf+frT4UGgQCPxvLHJzy8vTO2W3iCmYTMPVw7QaHXQj9efd7Kzwz6FTnUaVGjuaEKyOUjIniXfU4XhjGgLu14Ht+nqDFcAMblGTC5N7sH/1K/NnbaWq4E77WE3ZazC7hdUslb72Gi+R6ciFZBJpJzWTCQSuAFV0J3tNvCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fKce88l6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fKce88l6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732057924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=we497OO4sE4VwaggdPe1vay+83PO5OaOAYCik3HBUv8=;
	b=fKce88l6ko19zWZ4z3owVcW42cmdi9v24+DKl4/pLALnR+IhW52pdBOI4HHz1NBoiIl1C5
	8UNfhTpzUBelFedTF4gdQ3h/jhHxsRFkvhG3KYkJIUlm+gI03LYwUTBb8kNLnlgmfXqmxF
	21SsDy16AV2sEtDXO8Lv48HnNDHQc44=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-103-Ctp0QUDxNAaeQxlaH8BMmA-1; Tue,
 19 Nov 2024 18:12:02 -0500
X-MC-Unique: Ctp0QUDxNAaeQxlaH8BMmA-1
X-Mimecast-MFC-AGG-ID: Ctp0QUDxNAaeQxlaH8BMmA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B5721956088;
	Tue, 19 Nov 2024 23:11:58 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.23])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 27ED130000DF;
	Tue, 19 Nov 2024 23:11:56 +0000 (UTC)
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
	Trevor Gross <tmgross@umich.edu>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Filipe Xavier <felipe_life@live.com>
Subject: [PATCH v4 2/2] rust: sync: Make Guard::new() public
Date: Tue, 19 Nov 2024 18:11:04 -0500
Message-ID: <20241119231146.2298971-3-lyude@redhat.com>
In-Reply-To: <20241119231146.2298971-1-lyude@redhat.com>
References: <20241119231146.2298971-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Since we added a Lock::from_raw() function previously, it makes sense to
also introduce an interface for creating a Guard from a reference to a Lock
for instances where we've derived the Lock from a raw pointer and know that
the lock is already acquired, something we do in the KMS API.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/lock.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index ea65f84b76f8e..139f17f2ec86b 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -229,7 +229,7 @@ impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
     /// # Safety
     ///
     /// The caller must ensure that it owns the lock.
-    pub(crate) unsafe fn new(lock: &'a Lock<T, B>, state: B::GuardState) -> Self {
+    pub unsafe fn new(lock: &'a Lock<T, B>, state: B::GuardState) -> Self {
         Self {
             lock,
             state,
-- 
2.47.0

