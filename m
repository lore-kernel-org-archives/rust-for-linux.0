Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE7E2E06EF
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707622; cv=none; b=n1hSMH+JNdvjTDi/4WBpTzGlkG+jTB1ohLnTDzNOBeb2p4eQoXVN/9zncWQp+hdQzMie8Rkr4TalXb7N2A1BiC0IbF98bGmOpHOmbbaIsCJQHLo/RrxrJ9E9BX1peISn3M0xetodH9FbD/vw3JcfjR07XTWJ3MJp4HDPP81RsIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707622; c=relaxed/simple;
	bh=HGIY1t5Zkx8xQFjHV7Bbd9+yywBodIMXWQqM7VIG8NE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d0Bob2lZDQym6FnZFMrTA/fqzG38vUqSjZFsJf/vc6nrrLMHSwY836eGxLY7hn0rnExWziXd+jyIIKoOd+EM5dqOtMp+PtZfkIfY26cCu87qnnECGeAaSoRs5t0T226PGZp/MKyAk9y4C+/kxJ66VbarQwn/jUUqDLUmq6ccrK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=mmiGVl+l; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="mmiGVl+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781707611; x=1781966811;
	bh=cMCuN0OXNgR9XsITtfvFODpXbqR7EYzPzANbC8a39M0=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mmiGVl+lPe75P4IdIsQ9D9u/IMRYlFuOo3U432qZEV8X01r0YJe+cn+j2MrDUUKTt
	 6UI12I8/TFSPD9SXUAp7azP2zI+WxPAUvPvinbJSLH3RXvRzmh+Yus8+lzypEGqorB
	 /F6+d4szPdCuBVR2KoTvDEQOX2C6sdqrnZI18V/f6wREBnlbVOVl5zya41SmxHww55
	 9lCuAgDnvd0Y3tgCor9ol8eTd97WRe5PpO10Hcfw2/IUSkYfa/1uSLzRk9NWFv/JsT
	 V0lIdJJ9GTvwG+kzVL+mDeN98bFcma2U7IsX/7kltEwWIYgXQwZgOCNMxk+HI6RnYe
	 SBu8I1PqL7Xjg==
X-Pm-Submission-Id: 4ggRWr1Lhgz2ScmK
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@kernel.org,
	daniel.almeida@collabora.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 0/1] rust: workqueue: add ScopedQueue for lifetime bound items
Date: Wed, 17 Jun 2026 17:45:54 +0300
Message-ID: <20260617144645.253444-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes since v1:
  - Removed *with_lt namings.
  - Detailed safety comment inside ScopedQueue::enqueue.
  - Added Suggested-by tag.

v1: https://lore.kernel.org/all/20260615115626.871457-1-work@onurozkan.dev

Onur Özkan (1):
  rust: workqueue: add ScopedQueue for lifetime bound items

 rust/kernel/workqueue/mod.rs          |   3 +
 rust/kernel/workqueue/scoped_queue.rs | 187 ++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)
 create mode 100644 rust/kernel/workqueue/scoped_queue.rs

-- 
2.51.2

