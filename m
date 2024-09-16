Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B5913E41D
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726524514; cv=none; b=eZmwR32CFWWiHozKSrDuGGe33w/2USra1E7TI2AUSs9ORqNGAtGWSnvpZsPMv8aOH4d52fRCk+ElN3HCuMcEnO6DL9XTvsqjesk1fJsGi/gzpzlXnedp/jdU65LNZPUHjNeblL8XK5h6t9C1uQGL9V511aOfz2UtTAeT+2JwBIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726524514; c=relaxed/simple;
	bh=jIk6JDhGrzbfso5hiK1W/HYLxyAcArm2o+kPc9FaZxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oqWNi5dnolnNfMaDtSkL/jhBi+7tPUI4ihTeMlgE62nv14QqskwuYhAxRjGQSXvEE2rNQ5xBbOAvYAkbYzoSRD+MOcsAefhmx/n19FFSm4g9KiSGj+mlxIyr4BIXoD7L7uXQEHg1fFbAwJzG+VXgx5iSIzHk05JgSZ6Jxk+PzVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iwfwHL7/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iwfwHL7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726524511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xKD5TpxRq2Xi5Y/fuxovAwJrOONXHn7sCTllfhO0AlE=;
	b=iwfwHL7/wka9mt/MEIRoXT9f86XACv/ozal+bpVxTfm8lX1EJMoHsot8cbYXxoshIppT39
	U6nHvviB4lzkNncbwDlw74cfbYmiTs7SRQMkPyU1977Mc2Zo7IHWma2n1eeclmgqqX5DLf
	5eH10kir5Mqh+M09+E4vxYp0R/O/EbU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-215-Z16nLSUQNvSehYzcsATVzQ-1; Mon,
 16 Sep 2024 18:08:30 -0400
X-MC-Unique: Z16nLSUQNvSehYzcsATVzQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F6421955F41;
	Mon, 16 Sep 2024 22:08:28 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.33.131])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2924C19560AA;
	Mon, 16 Sep 2024 22:08:22 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@redhat.com>,
	airlied@redhat.com,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH 0/1] rust: sync: Add Lock::from_raw for ZST data types
Date: Mon, 16 Sep 2024 18:05:45 -0400
Message-ID: <20240916220818.567277-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

This patch just adds a ::from_raw method to the kernel's Lock type,
which can be used for locks where the data type is a ZST.

The current example usecase for this is rvkms, specifically
rust/kernel/drm/device.rs (kernel::drm::device::Device::event_lock())

https://gitlab.freedesktop.org/lyudess/linux/-/tree/rvkms-example-09162024

Lyude Paul (1):
  rust: sync: Add Lock::from_raw() for ZST data types

 rust/kernel/sync/lock.rs | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)


base-commit: a2f11547052001bd448ccec81dd1e68409078fbb
-- 
2.46.0

