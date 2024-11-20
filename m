Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165DD1C1F11
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 22:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732141680; cv=none; b=JiM8WVnjrtz3P8svfwbcdryI6YaonbcA00jwiMHa/aN9Hb5WNvhWkwlXwOCWZOGHpRiUe69T0p7TxoH+1a81TFuJnaB/eBha2jLAQSQcqZx9BGxzKEs/+haci754uzMCN2ZHJuK1JvPPn73bw5z5oai+ld46Q9zrVfF/dVZwSSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732141680; c=relaxed/simple;
	bh=No3jVm3u6iyFpb+a4hL3QfWBxHqnazENh1ZSee1n1EY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ehvq3wolGQbwg0iOWMuKtsaVzzixbUzXIQ9S7hAcjl2gsC/qWV0J5jJYMTkkp+aCL4HRlfBHorOAiX+WqUcDtuaDTio54sjsjP0qGN4MwDbqVKHM4xsnH2SjQMN1ZutqPEq+AL0fmmoagOrkUqGaeqDBIoCSsNWs2TvnFfi0ci8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ciksk1pK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ciksk1pK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732141677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AVhCvS8SDSeDPdSF6lihwFqqhnBx9WhgdEqDOLX4ANI=;
	b=Ciksk1pK+2wALHCaopM2JzNKtzb4uce5423UGP/h7X36uD3PmXx1JrI8zuuECpsTq7/msX
	fQaTa/zP1SlPaDGON/bxxSAc6cQ1ifWC/OuH3QRDb2hi+gnIa0CORw0H2maU2ksoyb9yQJ
	PbY3b4mL7vCJWR15jifhnGIcANm8fUo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-353-veWi5WvEMg6JUESbfve1xg-1; Wed,
 20 Nov 2024 17:27:50 -0500
X-MC-Unique: veWi5WvEMg6JUESbfve1xg-1
X-Mimecast-MFC-AGG-ID: veWi5WvEMg6JUESbfve1xg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 12E3A1956064;
	Wed, 20 Nov 2024 22:27:49 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.12])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5E8CD1956086;
	Wed, 20 Nov 2024 22:27:46 +0000 (UTC)
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
Subject: [PATCH 0/2] rust: sync: Add Guard related type-aliases
Date: Wed, 20 Nov 2024 17:26:27 -0500
Message-ID: <20241120222742.2490495-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

This is something I originally meant to do when adding Lock::from_raw
and exposing Guard::new - introduce type aliases for the various types
of Guard that we can run into.

Lyude Paul (2):
  rust: sync: Add MutexGuard type alias
  rust: sync: Add SpinLockGuard type alias

 rust/kernel/sync.rs               | 4 ++--
 rust/kernel/sync/lock/mutex.rs    | 8 ++++++++
 rust/kernel/sync/lock/spinlock.rs | 8 ++++++++
 3 files changed, 18 insertions(+), 2 deletions(-)


base-commit: b2603f8ac8217bc59f5c7f248ac248423b9b99cb
prerequisite-patch-id: 8c65a39abe47832d0c98c9c266b4b9348fb3526a
prerequisite-patch-id: 211faf8533feec77907b0a1b9b2f788e72c5ac58
-- 
2.47.0

