Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [178.154.239.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3522F9D85;
	Fri,  2 Jan 2026 17:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767376511; cv=none; b=rJGs9DcaSTRdVjIqBFkGABWZdNJZvqvMMKhQ+wTe1VswGSg5nV1sUbe5kAkGDRs0jzAWLUYMXPKeNJ0kQTz8yJHkU5ndJysIwXCADbiwMk/eSPUUGBlWK1mOAS7z+Q4KrkCxETgpKA9LsNc17yAv09JCKThzLRYUpjsJnuz+DW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767376511; c=relaxed/simple;
	bh=pIPbM2JoHK97PAIfWiXrLHFnud25dExbbNJRjxl3oZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mj9XNtMl3FYpXb3EEY/yBl4aPVLFK92LO1TlJWY9gD5Cy6Luj8eqdUASAdjYyCa70nk6Thlfljv5AIu1aeU7qAoxvdjoIsMRo+KmBVxp1TuATczlBb6gXdBew6xNCEIcvgk2XQaUr0dO9xqCXxgmDY/jDbjl94hAgkG/FQq1yWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=OFVPhIbs; arc=none smtp.client-ip=178.154.239.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="OFVPhIbs"
Received: from mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:582e:0:640:200:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 75986C0065;
	Fri, 02 Jan 2026 20:55:06 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id prp9aJGHE8c0-cs6Lh4nw;
	Fri, 02 Jan 2026 20:55:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1767376506;
	bh=33qM/U8DQYbp0BuJiAKK9JU4NB+HvAWHzGL2WIebHbo=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=OFVPhIbswmDd1txzkU9wfPHAcBHDH56BqHuR9d65O9/IIpAOFzbtquFZj4eSTqH16
	 6TNIvNdDBiXC6ItVEUaydDv35AmNGDkpd1Gnr9BIvuXeDxsYA/2rrTGm6IaRFy0Ab1
	 eF3LRp9+8qq11k44gsDKAp7kU/1j+m+70QzIy85Y=
Authentication-Results: mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: lossin@kernel.org,
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
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v9 7/7] =?UTF-8?q?MAINTAINERS:=20add=20Onur=20=C3=96zkan?= =?UTF-8?q?=20as=20WW=20MUTEX=20maintainer?=
Date: Fri,  2 Jan 2026 20:53:02 +0300
Message-ID: <20260102175302.194435-8-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260102175302.194435-1-work@onurozkan.dev>
References: <20260102175302.194435-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add myself as a WW MUTEX maintainer to reflect ongoing
work and future maintenance of WW MUTEX.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d245b7b38b21..10eeeaf0ccb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14711,6 +14711,7 @@ M:	Peter Zijlstra <peterz@infradead.org>
 M:	Ingo Molnar <mingo@redhat.com>
 M:	Will Deacon <will@kernel.org>
 M:	Boqun Feng <boqun.feng@gmail.com> (LOCKDEP & RUST)
+M:	Onur Özkan <work@onurozkan.dev> (WW MUTEX)
 R:	Waiman Long <longman@redhat.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-- 
2.51.2

