Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2029614039D
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 20:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421554; cv=none; b=qioQHJJFwbTvnKsiaiPN2X/ciQYMQY4RAyHrWk759q2N0XooaBnfi3FFX5PUiEYu3qa3wWLj+pWgj4YqFWwEMyvPXWNBXeTnSLDHV6+mNit41hZtzGyMDl4yGfTd9EwSc628hn8OFTCpX7jJTh2AenFsBA2tZyjEop5GUtHpCcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421554; c=relaxed/simple;
	bh=buY3Y0PXz9swddSdvsSpHjKAM7W5PkIKVyxjeP9ajlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O6JQY17QhgqrJm9QIZdHGpER7ZNhiU6eXf53a1NepdQ2MOuOos2QgtMfrWufbO3tlEoa+AA3iShNpFHxx8fO8hHLXi8txrX1uGIAk3Z6/NX0A4DBtQ4rCUJ6jMF4kUUTXYptpXotoRuX7VfFSyFWFiWaT0ywhKBcwY0bDxbdxWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eYwc5f9I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eYwc5f9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714421551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/RVkey3AXMVOLhbuQElRmtfyOstNWZxdHhTfBGUgPz8=;
	b=eYwc5f9Ii9NDi7KJGqjvs4j1ZXInfZD2ufMVUJHz87lg8ur8SyZxwsEAj1m+Fh6MBm2hgd
	4hMsVlOyaKWzR84b2+DTTBY4QNVkB7qzv+g8CLHVRiiD5k0VqiJXUmieuNiVtj/ywSBKoU
	5vknu93eRf6SRDjogu/j7VpQd4ctD1Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-Z-cHR5tfPFacq3MB0ri8tA-1; Mon, 29 Apr 2024 16:12:29 -0400
X-MC-Unique: Z-cHR5tfPFacq3MB0ri8tA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-41aa1bbddadso19541755e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 13:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421548; x=1715026348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RVkey3AXMVOLhbuQElRmtfyOstNWZxdHhTfBGUgPz8=;
        b=Ba156FkmaYa9h9Bst541PbjRNCug/gPb+w3zZRiqnjiaETBY1duYSotyPSAk4CKDPz
         Nhn+wiaO+Oj0Y14DWhQ3mi4+T3JkBLuvltNqANo5tlWU+fnuhJe9uFstjCe9eTLMCKja
         PWBTD+zZKAwEc9LB6gpOykAS3wsRajnoj7sqqKV9Zl+lLhGMFZpoVDqZuj3K9fZNbYzb
         mH4LX1mdcN/v8VhvMDSYqugYlymNpNzRtBqXTK0GqEfnzUpVMs7SVhU3S2AuBDz3GHjG
         RCloPTRQYviZBFHyJJY8ZvCwpvl6w8wOxFam/cBiwALOajPZzs+hyPMG2oODMCOvpykP
         gI5g==
X-Gm-Message-State: AOJu0YwGz3l65lDQrY3V//7y71yue0C1byQj4oe9fsUTKveEy7XyHgXi
	Si0h/5OUENSDWs/2Z1MachJBIPVW9MMY6aXKDJu7ASdfWIvMmEB9Sf57hQyrxpsoGBm2DS4hAZ+
	JR04hHvmMGnBMMDkhDO4cVjptj4QcTTsxTXqimilwflKO2Nlp/L+nC5owlVhVsOT0
X-Received: by 2002:a05:600c:1e16:b0:41b:f788:9c0b with SMTP id ay22-20020a05600c1e1600b0041bf7889c0bmr6119854wmb.14.1714421548323;
        Mon, 29 Apr 2024 13:12:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW+YelMB5x+8QJBlbTLZf7PWJ55wNtN2xmq9oPbJEmoait8B+cBOstlEvVfA5YqZTMlqxh3w==
X-Received: by 2002:a05:600c:1e16:b0:41b:f788:9c0b with SMTP id ay22-20020a05600c1e1600b0041bf7889c0bmr6119834wmb.14.1714421547882;
        Mon, 29 Apr 2024 13:12:27 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d48c5000000b0034afaa9ca47sm22141262wrs.1.2024.04.29.13.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:12:27 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	ajanulgu@redhat.com,
	zhiw@nvidia.com,
	acurrid@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH WIP 0/8] Draft: Alternative allocator support
Date: Mon, 29 Apr 2024 22:11:50 +0200
Message-ID: <20240429201202.3490-1-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

DISCLAIMER: This patch series does not raise a claim for inclusion in the kernel
(yet) and, instead, serves as a baseline for further discussion.

Hi,

This patch series re-enables the allocator_api and implements an extension trait
AllocatorWithFlags expanding the Allocator trait to allow for arbitrary
allocator implementations.

It expands Box<T, A> and Vec<T, A> by adding the BoxExtAlloc<T, A> and
VecExtAlloc<T, A> traits analogous to the existing BoxExt<T> and VecExt<T>
traits and, as an example, implements the VmAllocator (vmalloc).

This patch series is tested (I tested the VecExtAlloc<T, A> parts using my
firmware abstractions) and it seems to work quite well. However, since it's just
a draft there are no proper commit messages, no documentation and no safety
comments.

Also, I'm pretty sure there are some parts of BoxExtAlloc<T, A> and
VecExtAlloc<T, A> that, somehow, can be generalized with the existing BoxExt<T>
and VecExt<T> implementations.

Please let me know what you think.

- Danilo

Danilo Krummrich (8):
  rust: alloc: re-enable allocator_api
  rust: alloc: use AllocError from core::alloc
  rust: alloc: implement AllocatorWithFlags trait
  rust: alloc: separate krealloc_aligned()
  rust: alloc: implement AllocatorWithFlags for KernelAllocator
  rust: alloc: implement BoxExtAlloc
  rust: alloc: implement VecExtAlloc
  rust: alloc: implement vmalloc allocator

 rust/kernel/alloc.rs           |  25 ++++++--
 rust/kernel/alloc/allocator.rs | 103 ++++++++++++++++++++++++++++++---
 rust/kernel/alloc/box_ext.rs   |  41 ++++++++++++-
 rust/kernel/alloc/vec_ext.rs   |  86 ++++++++++++++++++++++++++-
 rust/kernel/error.rs           |   3 +-
 rust/kernel/init.rs            |   3 +-
 rust/kernel/lib.rs             |   1 +
 rust/kernel/str.rs             |   3 +-
 rust/kernel/sync/arc.rs        |   4 +-
 rust/kernel/workqueue.rs       |   3 +-
 10 files changed, 251 insertions(+), 21 deletions(-)


base-commit: 2c1092853f163762ef0aabc551a630ef233e1be3
-- 
2.44.0

