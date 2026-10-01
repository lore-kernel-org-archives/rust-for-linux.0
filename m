Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B131C4AA1EC
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843135; cv=none; b=GCQLDdfQHHemX7u1nROjUf9uCjPZp8uRH8bb+3OMEIX60RyKA4Cho8ZdlY5JwQvW2eUjwsDgOghpOK6ECjInx2/15wYr56q4jAR6WNB7iJJm+yl01lOjoeDS05jqzK8M7ZxRotW6MdIi/u+FLdzd13KVNWUJDp7t5MGP3kgnOic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843135; c=relaxed/simple;
	bh=0uLI8EmIGM/UJgmRdEtfvKPUhmuidVaWSbs8VGXNz2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OLnmO8BTCmmcSTHjDiQUfm1kozz+B7ZL9UEGmVQy5mH7TizExLDl3L0Zv3JiSHLGZBzt3js9ilKbTey30Fg1rnqqkIM+1ZGYn8FQiYjho0wSxmQdfbRPCfkoDyKszwSciJpBs6rAqScWJmahpJq4TY0wzCVlyuaaCA4iQ2DE8gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdtEl9sL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdtEl9sL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1661F00899;
	Thu,  1 Oct 2026 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843130;
	bh=d8QXmPMqSKUhI514+vwdjjfY01Ew+xPLjLxtCyks4po=;
	h=From:To:Cc:Subject:Date;
	b=NdtEl9sL5uYlgroWuzBH/OyQOXEVA+bkGOeoKgCqQyFB6K/GIGHJOmpsW5Ee2Qnhg
	 j8vGJozdA/8h9Yg/LlrsFNanf3vyGBMUKmZctI65mqAuUza2Y8G9Syz5g5Hu5ntFP0
	 YIgMi053NrUrjZI/GGHJPUOEwtdvqBnE4hP/WV7vFn8SI2ujrw+wQsv0f2rqSlD17X
	 VjCttwQF7B9oFPThHsp1J+fyX4IlrPBsbU2qdzb5KRrDTd3ZN6D8Pigz1Cj3X7moa0
	 qpYYfXSzamIcKZCGQy/0yWzyPBWGn5+vzdkU5jOL9TiLnaMcHPor6oo0rO4nIgsLLI
	 qg1IxJzBl6u+Q==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id B52E0F40066;
	Thu,  1 Oct 2026 04:25:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 01 Oct 2026 04:25:28 -0400
X-ME-Sender: <xms:-Bi-aupAxUWPhuAIXw3K7DANsB4ZkOo-5Yhg1Xt6zZBUp2-SGH3LmQ>
    <xme:-Bi-anD0OzgR0sw3rEL_CCvMve_jlg-w2DreXulGyqLa2xK2j3lWjh7H3BmX0u0Yj
    LtS5DYuTIWXsjKcPnAtXVfUT-AZ4z8CV2L2XPHzLLE-M4Qdo4xgu9E>
X-ME-Received: <xmr:-Bi-apVTKvMGWQrK1NwyD-KgJtOrEpG5LQKh8pFs7M712KMpQlTZTC3DzdTQ>
X-ME-Proxy-Cause: dmFkZTELlOCfK7cYSybgukLAwBq81kMJ4O7GrC2emNs0oFQXAp15HE54ocsYmFYnKcd7x+
    8Iy3eRPstdEZq17oX8nb+YowE7qethTLh4O3lWbuPiCCThplW7DL9U3TMs4ygec3d7JzJB
    JhZqgIJ5qnaiy8A5JqV6tQGfLbkJ8ZBDhD2KYFiUBE7hb7rAWqlVAZ5K8wN8jteBc6IOzo
    mA9qnsu9nQlb4ddpBAEP7wqRzBdQ5B/10E7Nd4YgGII3p4LrStvyE/ckLo+icWhPAAV/yw
    FesjnGxw8qzHnE08EfRdcNleizzEBBaoZSz3OLW6aQzWMgRs7nCGIIzN3Vg6XhP5ADW6aS
    s/TD5MV6Nb3MpqE6yvK7ITTVVZIj0lb24ncTqvuJ6U+YR+dh9rTBhf5LLkvvqBLVWG3hQS
    6JGRJ0Ml1cRbegtNkyoAc68dcAI7Sg1hGypt7zJxWVedReCy32Cr+jNppqSt2Me2ncHEol
    On9MTOOQ/2v1ktmq0Y55UtAgfe9vD8iQ/W20QxyJUYTSI255LVwag6ms27N1uT3eDomDWZ
    apyyHlQcp7TzAJT2BZ9FlayXe+kJYAImywmP0yizk+Lu7t9mTOtCdPXoMQ1ZBuqdWUzycp
    acnGruVRYSQYatPy7hfLgRL6YdEO0f+esb1MxIl/VjfbONeRL3uXCFyc6vJA
X-ME-Proxy: <xmx:-Bi-apCY4O67jICj7fxPe2TTNd4qfuD2nTfOxGPydOOQdgv110ElGw>
    <xmx:-Bi-amdanZd5BG3nQkJX72nnXrAZiG4k1U6vKoTAsLDS_GzeAzCgdA>
    <xmx:-Bi-agp71skYuhiU8e7MMs36RdBDidDoYn4SyxGpYcGi9F9bMI8uXw>
    <xmx:-Bi-anTP-BzKfhudBNHqLNpcX4e5l2brs8Ac1jciyK6nreMW3QiMmw>
    <xmx:-Bi-agVc1A0eiG9-hAnp-_qtMothMAGpMrCP-L3aTanDrzAOMu-j-zGA>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 04:25:28 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/5] Improvements and fixes on SpinLockIrq patch series
Date: Thu,  1 Oct 2026 10:25:14 +0200
Message-ID: <20261001082519.16195-1-boqun@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter,

I realized that v1 [1] was left on the list so I just want to respin it.
Just to refresh the memory, v1 was requested [2] as separate patches for
changes between v4 and v5 in the main series. I also include the
refcount_interrupt kunit test Kconfig change in this version as well.
Based on v7.3-rc5.

Please take a look. Thanks!

[1]: https://lore.kernel.org/rust-for-linux/20260811041714.27679-1-boqun@kernel.org/
[2]: https://lore.kernel.org/rust-for-linux/20260810085255.GE1642880@noisy.programming.kicks-ass.net/

Regards,
Boqun

Boqun Feng (4):
  irq: Add {over,under}flow detection for
    local_interrupt_{enable,disable}
  selftests/bpf: Use the new NMI_BITS definition
  irq: Explain better on NMI_MASK overflow condition
  irq: Add max local_interrupt_disable() nesting level kunit test case

Kuan-Wei Chiu (1):
  irq: Make refcount_interrupt kunit test selectable

 include/linux/hardirq.h                       |  2 +-
 include/linux/interrupt_rc.h                  | 13 +++++++++++
 kernel/irq/Kconfig                            | 12 ++++++++++
 kernel/irq/Makefile                           |  2 +-
 kernel/irq/refcount_interrupt_test.c          | 22 +++++++++++++++++++
 .../testing/selftests/bpf/bpf_experimental.h  |  2 +-
 6 files changed, 50 insertions(+), 3 deletions(-)

-- 
2.51.0

