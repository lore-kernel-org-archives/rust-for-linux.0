Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6940D3F54C9
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 13:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702261; cv=none; b=aCvcCH5xZoGxuT7BOVPnoFK779DJNkZO6ntQMF66DArWtKKd69/UONDKBcxwSlbsKKWMH4BtSEEgVWIqvYYaT4k+3ZPulk/Cah41Jt4izbXI6nE1DEhLUspwlilWxd5jSLbcvFd5cWvvFnOUUBPGse7J4Nk6D/3mUL5M77icCX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702261; c=relaxed/simple;
	bh=X9qYWu1PTSD71Eb5cHfpVewCVvQjD8kQUs5N0tq3F3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fCLAPUBFB4TL7Ret+HQuJnYnKHlsCRiz2q3t94V4LYMkKjO3+ItoR+ZsUO5BMnx37wzjWWLNT5lbjmvX+OZup2KqJnGMBfF3z+poowx4syD/PnPgqF8xn60gU+lxjNPCEn3Ng+l6bwOzPzHqFkw/pfj2Y/6Sf2EZDfjNQN1Aw8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=CIPCxsVj; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="CIPCxsVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781702256; x=1781961456;
	bh=Yt61RhUvgXsFSZtRTrpMAekYbcMzlFAFa8nUCEn5RVg=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CIPCxsVjwcNhSTyMpGSstlsscosZKX2dtvoR19h0jjGBU4S6byqoWp78kULJC+PAH
	 rDTTgoOWpGSO8OXsHJVrSbn2HsmX4Xf1eryEjtd+uEA15DcdZCoW1dZgX0N+9JKP6t
	 A6GUU3aLWzydBsaElGHAXgGSmaFOHXV6f1OdcpXShIHvgEhSyfd64RfDqHp1KrdV0l
	 dAgVQuMvnRScQZ7uvDWKdWMWhwPHzK02ULXLDfPHvo0Xvd+xb7rqj926DOimAS0QA4
	 ALMxPGxOBCXzVPXiR/8ieS9wLGHDiTAoNi9SFDu8BS978xkjQdXkh68v5XbEq7rCoW
	 7zUbJErJnff1Q==
X-Pm-Submission-Id: 4ggPXr5KB3z2ScqT
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
Subject: [PATCH v3 0/1] rust: workqueue: add cancel_sync support
Date: Wed, 17 Jun 2026 16:17:19 +0300
Message-ID: <20260617131731.145337-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes since v2:

- Renamed SupportsCancelling as SupportsCancel.
- Improved from_raw_work doc-comment.
- Removed addr_of_mut! usage.

Changes since v1:
	- Created SupportsCancelling trait for from_raw_work function.
	- Removed from_raw_work from WorkItemPointer.

v1: https://lore.kernel.org/all/20260510082211.207450-1-work@onurozkan.dev
v2: https://lore.kernel.org/all/20260612194633.350011-1-work@onurozkan.dev

Onur Özkan (1):
  rust: workqueue: add cancel_sync support

 rust/kernel/workqueue.rs | 113 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

-- 
2.51.2

