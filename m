Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EE6333730
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 23:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772493732; cv=none; b=BwKoKLC7ZuRApy5bxkWoMM5u1DKcRKjQzc2F/5rAa/ykirxBnczj+QJZ0g9a70sfVvAy/m1OdDfbiE53NFvizSxnWoV2ZNQ62RrNvTbJwTrb0mn3jzxRIZL+sJEQciUAj+bI5jL5v5ZT0EdPHwwZ9BAeg1Sc1FppxePsNnzZS4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772493732; c=relaxed/simple;
	bh=DMKWDyfmxFJTZ5wbrB6Vp3GNUSLfuc3rItvv6iVEf94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R8kFTgGFWlmc7eGJm0mSQvAytC+1/Ul6kV441rMIXlvctzYmeBcMKI8GfxqWDwe2eHO2E2V7bE9ODw9InkH2N3e/o7WiVYQZwdBJWi/siiXCSzpSK9aAtB2m6wfSafuxoBGy3XnWSvtVMmHALvp8zna3rWbdvNXkod6BnJ3e+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F3LWDgXK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F3LWDgXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772493728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uqGAylHIK+miAW6n/LTmgmwnBuFL7JhecEJhGCKggrU=;
	b=F3LWDgXKQydehaHhOjpMxjbMgtM2iC5VOxEuAMnfYV2JHGLfSvuHU+wELyhLBxEKmoCjdT
	arjQCksxJ/cOyLbXjKpKBHJNILlZjCDUJI8ykDJWd0IMBK/AKs66QD25dT+fs1cONljZJU
	xZ1NWzMRcJ7TNrcrvsoy8Ry7EdnnyuY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-Vvk9ZemINDmEtjmcCyfJcQ-1; Mon,
 02 Mar 2026 18:22:04 -0500
X-MC-Unique: Vvk9ZemINDmEtjmcCyfJcQ-1
X-Mimecast-MFC-AGG-ID: Vvk9ZemINDmEtjmcCyfJcQ_1772493722
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 70A811956046;
	Mon,  2 Mar 2026 23:22:02 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.90.7])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A90B61800296;
	Mon,  2 Mar 2026 23:21:58 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v19 0/5] SpinLockIrq for rust
Date: Mon,  2 Mar 2026 18:16:43 -0500
Message-ID: <20260302232154.861916-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: tLUMNQMp766NCy-fRJAzH0pDt21MhmSxgbqIZtyXF3Q_1772493722
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the latest patch series for adding rust bindings for controlling
local processor interrupts, adding support for spinlocks in rust that
are acquired with local processor interrupts disabled, and implementing
local interrupt controls through refcounting in the kernel.

The previous version of this patch series can be found here:

  https://lore.kernel.org/all/20260205204709.528234-1-lyude@redhat.com/

This patch series applies on top of boqun's rust-sync branch:

  https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/?h=rust-sync

Now that we've gotten the C-side of these changes in, this patch series
is now exclusively concerned with the rust side of these changes. For
more information on how we came to the design for the C side of the API,
see the explanation in the previous version of the patch series.

Boqun Feng (1):
  rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers

Lyude Paul (4):
  rust: Introduce interrupt module
  rust: sync: use super::* in spinlock.rs
  rust: sync: Add SpinLockIrq
  rust: sync: Introduce SpinLockIrq::lock_with() and friends

FULL CHANGELOG FOR EACH PATCH AVAILABLE IN THE PATCH UNDER THE CUT LINE

 rust/helpers/helpers.c            |   1 +
 rust/helpers/interrupt.c          |  18 ++
 rust/helpers/spinlock.c           |  15 ++
 rust/helpers/sync.c               |   5 +
 rust/kernel/interrupt.rs          |  89 ++++++++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/sync.rs               |   9 +-
 rust/kernel/sync/lock/global.rs   |   3 +
 rust/kernel/sync/lock/spinlock.rs | 331 +++++++++++++++++++++++++++++-
 9 files changed, 466 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/interrupt.c
 create mode 100644 rust/kernel/interrupt.rs


base-commit: 4a653dbaf6f3a8c950a72e4b78e93576e1916381
-- 
2.53.0

