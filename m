Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607873C0A19
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 20:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828875; cv=none; b=aDrnvUIaD650PPCgvDpIy0p3kR/WmTtyVRXM6dLv3L2k9/5A3o7sF+/kXbzIUTZoiuF1gxfz2QVsR6YPfk7uD4vhKN5u7SAEhIsVwzc9Lik8EnhMwrSBqfIBhUlut5b6MnnH9i1lyAN8jRdDuHa1r4i/D+/q75SDNAs/ChOjHzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828875; c=relaxed/simple;
	bh=Xp2+NCnvk/9tFotbp/RBNLE6Fubo25zBLKHSx5MLsvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FtfCu2lMBkHytxbsSxHcHgYO7/b2riG5mJna4eJOtcdWJN25KzJjZKecXzAti3vKe15kDkHNkgO+2D4168+1FucR5IzWmREAaQAdKeijs2OopwOA7lMheIXqgRn3Jja8+GZ01E1u4qomrv9PsqlKQnOurpdU4b2zi7xVuje/gtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HZUaxNct; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HZUaxNct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779828873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dS/ZL01Q5UiuDS3rO1Ng20MqodzQcdZW0zFHe5xf9VU=;
	b=HZUaxNct2vv/Nmg6W9YoufO0cYYXkILe3HNNW3cXXXzxSVv0EraYOVuB0s0TCQ63AVdnGa
	XBYfBcAD9VujUXuyYdW0cHbV3gYUnTjhj5+7qDlpVmWl0+oke1tF0emBZsHqfmSoVoGXrr
	LUEt5f99zfih7X+vuRLp+jFT8Ro6HZA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-3Vb_iM1QOv6AXI0eKHKezQ-1; Tue,
 26 May 2026 16:54:27 -0400
X-MC-Unique: 3Vb_iM1QOv6AXI0eKHKezQ-1
X-Mimecast-MFC-AGG-ID: 3Vb_iM1QOv6AXI0eKHKezQ_1779828865
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3980D19560A6;
	Tue, 26 May 2026 20:54:25 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E526D1681;
	Tue, 26 May 2026 20:54:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Cc: "Gary Guo" <gary@garyguo.net>,
	"Ingo Molnar" <mingo@redhat.com>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	"Tamir Duberstein" <tamird@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"Shankari Anand" <shankari.ak0208@gmail.com>,
	"Viresh Kumar" <viresh.kumar@linaro.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH 0/2] rust: sync: Introduce LazyInit
Date: Tue, 26 May 2026 16:41:32 -0400
Message-ID: <20260526205419.1055109-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: H1q7E40pzRgFwZkT4fnoWl6LJjwoG7kzaynJJ8AcQ2U_1779828865
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
 rust/kernel/sync/lazy_init.rs | 354 ++++++++++++++++++++++++++++++++++
 rust/kernel/sync/lock.rs      |  11 ++
 3 files changed, 367 insertions(+)
 create mode 100644 rust/kernel/sync/lazy_init.rs

-- 
2.54.0

