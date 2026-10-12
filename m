Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2085F46D54C
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800879; cv=none; b=dOStoxNYQgh8f6qtNiRyOveePYO6CYl/KhND35osWDSfDNwLljdpBkcT7tbnUtVGV0orkk5k9ESlUXBJ3LQYw5GfiU2Xp/Cmdn1SrrA3kx5A2TWxmq1fD5d1uqHwlywSZlLx4upMAbmr/I9FdQRhBrATQba33L1PXFvPUlfBiZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800879; c=relaxed/simple;
	bh=y/jBYNgYflsViQ9gdKNqmapN/LpRGrcOvw2ts4lwqV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mfwrpmwOn+AQPNIcLZg4fS6Crg5ca27c9vhxpn5bBh47ENwynovQLhr8KUvNxBHqtX7h+6ag/LAj/D5L+aHykg9wWA83vPQCAlQbe36zPDVczggcQH61VCtNNWYFX7PoXL5R0cSnVqeOBd8yzaTK6p/mX4kDPZxTPhaGM+2Qrt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Yx9y2XJg; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Yx9y2XJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791800862; x=1792060062;
	bh=as3rWrkPwM/T5KQAUk9oOgiGN4KQ7F2XJtX0Gl4CHyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Yx9y2XJgqhSMTfPQ00Kw0g1WyS0DtyKQf1cMzU4ixGEHgQ7HJ6rDmgjhIorB1hjBM
	 a42wFv03o+fl/P98qJ4yayMBYOM4AswOn53YeAcJALP0EG5zMSBlmYPDxbbRCj/xey
	 BdlO4vUFCrfoVti8dDr86Nc61fOjYquaiprggNSryloxPlPEoVCYTk6OKh+m+WjX3q
	 LQgwp/md21nomK0kArc+Pnkt8zIx1JHQlaAJCTIcO0uk0gHPRvgBF5Ai7aKQEFn0nc
	 rI7nWXJCxXMo1xQfhhEwEq/dNu4DVBEcvhCqJGLFfD3dAiKFPMBz9JL/OIw8EdqaWG
	 AFmB/jZxKtE3A==
X-Pm-Submission-Id: 4j3DDq5BCMz2ScXJ
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	daniel.almeida@collabora.com,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 6/6] MAINTAINERS: add Onur Özkan as WW MUTEX maintainer
Date: Mon, 12 Oct 2026 13:26:33 +0300
Message-ID: <2b7b779f72f77590bbfae54ddbc7890bafcc4e8b.1791799752.git.work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1791799751.git.work@onurozkan.dev>
References: <cover.1791799751.git.work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add myself as a WW MUTEX maintainer to reflect ongoing work and future
maintenance of WW MUTEX.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 198bb740f7cc2..ff41d34f76f70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15265,6 +15265,7 @@ M:	Peter Zijlstra <peterz@infradead.org>
 M:	Ingo Molnar <mingo@redhat.com>
 M:	Will Deacon <will@kernel.org>
 M:	Boqun Feng <boqun@kernel.org> (LOCKDEP & RUST)
+M:	Onur Özkan <work@onurozkan.dev> (WW MUTEX)
 R:	Waiman Long <longman@redhat.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-- 
2.51.2

