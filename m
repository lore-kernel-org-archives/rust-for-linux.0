Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630D142A165
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744047; cv=none; b=XVvUeo42lZyzFNRJ23D3H7HyxmaeE/vLAk1eo1WJ/Z9AofHlLiFM77U8cfTlu2+Amf4kAhrgB5rT57PnYraPZlQZ+dBv7lyibu4bVBuu5raZfKjTgqhxBPuvJm39IUuKFojm5hcr3N+IhND9rIcyTCQremT1FQXLhGnQv97jZ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744047; c=relaxed/simple;
	bh=SUGcDVCudlgO0Xi8ocAuYXeqyJha8pyw+no98uG4eEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PE03jJF+UBlmzpZWZ+EbVy+FHLsY+bweU9QC40P3wK9rFvkN0GQR0T3m+k5uWg17OA9W2lhIU5YgTAb6BPrvyZPhMbi1cSwx249dg+OCTT5QOxxrLkwARIF2RqYCY5YiK76DrLdKMCZ/fkYTfIV0GJfnDbEYBovfVOLXmhIv1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=muaNmLz4; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="muaNmLz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791744043; x=1792003243;
	bh=x/XVDmTBAAiRGQYjLOByA3iIyn8E0GzrCMMHVNyOktc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=muaNmLz4JepVj/CJ1CATcty0hDnbrud73GB8qUbo+Fna35WKv3PiALSKNwB9oEJpK
	 UCyjd+j4YSsV5eEKzq+x8F5TjZJx9OQ8TEpdoPmwWJueuxgPWREuOjvIBVVtdn3G2o
	 pMZauRPguW6/OkwJEnwkcL8q96e69bQHzzbGsaxOwi8TyRxFojmXfQPOJxVSesacFJ
	 p3c6UKGmfeZjsibirMdKRhPp8MhnDSFP1hs+kq5q+zv337D3NF26vV3WSjB4rg1KRo
	 ozYKxwbZz3OgKwgDISz/DT5OlbgI91o6cO1ZKKuiPu7W06jdqRboRrXRzmJ0RWnsqF
	 zgNR0ae6H89hg==
X-Pm-Submission-Id: 4j2qD82ldfz2ScPk
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
Subject: [PATCH v11 6/6] =?UTF-8?q?MAINTAINERS:=20add=20Onur=20=C3=96zkan?= =?UTF-8?q?=20as=20WW=20MUTEX=20maintainer?=
Date: Sun, 11 Oct 2026 21:39:24 +0300
Message-ID: <8f0e93bd1781ef0806659e0416fddfe148602a81.1791743500.git.work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1791743500.git.work@onurozkan.dev>
References: <cover.1791743500.git.work@onurozkan.dev>
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
index 198bb740f7cc..ff41d34f76f7 100644
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

