Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD9F382291
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 17:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780075926; cv=none; b=SgqHmNoYdQ+GMPIYcaJvAD2tAuCW2FMJnVjTyuI8bEz7CRaInRTJ+3TGMbp6RxWvV+Qw+7LCtQc4arS5iYswCSNF7TbetiUmTa+p+Co6CNBKNpKCqXz6t4dTxDmYPpXN28DWgyKXivmMsNkB7yqNSfn/YaBZGrQ0Vlz1ER8Q2W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780075926; c=relaxed/simple;
	bh=4ascWv024QgcC6IIJp+HFw9zJp1YUZCmnnf6TYBt4fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q2mzrhUNjwn7Bqg9d4gWDUuhnv3gImJScw8Q79dZSxvGU0lOvtJYbZiHoDJLAlq58OpwuPSQ7/wPv9JKerH4TtYTVbG2cGlRaZeMWm5qa1BbY/kdnMGWC3FNMIsIbnVDJ5qarSeTwwxmw6uOXtBxPRT0SL3W3x8Ob50/ACn10RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OUr4bqCz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OUr4bqCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780075924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TCbzlCqjTBRG2TfsDWMEQYTU39QbHkvS+53/vDLXzes=;
	b=OUr4bqCzTsbTx1dSYbat16GwU2N5O4BngcQIwVAjXhOXM04HwdYjqxGrNElnqXZCrvzx0u
	DO+xYEoH+LvuRWHiI4RsdvNy8jg0MyCJr/Nt71PEXxlW1QAFXcYuiy2k95a+vbAoygFiJz
	OoRMOhhP1SUz8lmyB5w2IPLp7BNQ2rc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-288-zB3bBx82Og2lTujoFF8v1w-1; Fri,
 29 May 2026 13:31:59 -0400
X-MC-Unique: zB3bBx82Og2lTujoFF8v1w-1
X-Mimecast-MFC-AGG-ID: zB3bBx82Og2lTujoFF8v1w_1780075916
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AA2218002E3;
	Fri, 29 May 2026 17:31:56 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.101])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 50C6E30001BB;
	Fri, 29 May 2026 17:31:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: "Gary Guo" <gary@garyguo.net>,
	"Ingo Molnar" <mingo@redhat.com>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Tamir Duberstein" <tamird@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v2 0/2] rust: sync: Introduce LazyInit
Date: Fri, 29 May 2026 13:30:40 -0400
Message-ID: <20260529173137.303717-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: gTnbhrU7SQDh6lpmoEwns6X0yziZzj0Yzi9LI3hT1Vc_1780075916
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While trying to write up some SGTable bindings for the GEM shmem
helpers, I discovered that SetOnce is actually quite difficult to make
use of in a number of situations.

For one: there is (upstream) currently no way to use it with fallible
initializers. Even with some of the work being done to add support for
this from Gary Guo and Alvin Sun:

  https://lore.kernel.org/rust-for-linux/20260326-b4-tyr-debugfs-v1-1-074badd18716@linux.dev/

We're still left with the issue that if two callers race on trying to
call init(), there's no actual way for either of them to block until the
thread they raced with is done initializing the contents of the
container.

LazyInit is my proposed solution to this issue. It provides a container
which protects the initialization of its contents, without protecting
access to its contents (implying of course, that its contents have to
provide their own thread synchronization).

Lyude Paul (2):
  rust: sync: lock: Add Lock::get_mut_pinned()
  rust: sync: Introduce LazyInit

 rust/kernel/sync.rs           |   2 +
 rust/kernel/sync/lazy_init.rs | 352 ++++++++++++++++++++++++++++++++++
 rust/kernel/sync/lock.rs      |  11 ++
 3 files changed, 365 insertions(+)
 create mode 100644 rust/kernel/sync/lazy_init.rs


base-commit: 0e42ec83d46ab8877d38d37493328ed7d1a24de8
-- 
2.54.0

