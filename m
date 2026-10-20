Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510310;
	b=GyUd6xpOlCvEzXGH30T+AKI1BzDbUvKlIUzErYwt8RalRuCcdYB4CKVsP07YgoLvIKh7
	 7k82jHlwwfGGeAqXKVXSMK3QxuaXXEOtDD/6F/z4QTA0EWuipAfMMbfJb3pxCRu/ukaMe
	 Er1omaH+rXN6qh6iDwlB/l0Dp16vCaPRzEj3VcoLjL9REYWShuzJ0GC0VgPHFBDwkTzHm
	 LL5mi/3uuBnBkx7W+o9Wh9aEzVkEB5OAjdc4CDPTAtkQ3HfnX/QZLZORqOQbK14WvfSKo
	 EGR6Ae8AFn3wakNq0oYc5uOg63bWVMzpbgqucGdz+DuBIGvyVVlYmigOUIDnWhzAEGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510310;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=as3rWrkPwM/T5KQAUk9oOgiGN4KQ7F2XJtX0Gl4CHyc=;
	b=V52/crRMUFVc0YR2SBTPtS0mlaOzGsVu+KB5qp/Hd81oWA+ixUmkwt63UmGa8uTS38eG
	 fryIvhvD2W5GOdJaLzFKv+5/hdi71oHR+WSS9VGLayBuSb0reodJgPgG2j7PWVL3meulE
	 pjJjB/y0BlTVG+IMW9jw0ZZhWB+4uxGgyXsdJXxEhWTh0hXO9lRgmvnijuVtW4taDYrXg
	 nIkQxFRJE0VaKafbOLPWEZ2p7PxPEt5LQCPn/dGh+lqhe9B2ehFJ4509N1xT8v0LfER0i
	 TNmR0cpK3Dpnax0wLZq1RxQIVzzIHjm7IXvLTmTXnpj71tN1Cc7FvZMOGABmnPCij3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=mP+Bv9jU;
	arc=none smtp.remote-ip=185.70.43.172
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D1F60A4ACB
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 15:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D1F60A4ACB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=mP+Bv9jU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1792510307; x=1792769507;
	bh=as3rWrkPwM/T5KQAUk9oOgiGN4KQ7F2XJtX0Gl4CHyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mP+Bv9jUUAKCANawxi8T33xgnMSA0XL1AI2LtlxLXYTy0nJcltTUBiqtyDGnI9iWY
	 UDXJBmWzoTmK89r5emyC+jP/SVQlvOshoLiWS2F0yHDaf6HEui2NNh5BwMQv303UFl
	 khN2qKiGnEpa67qkl1ymNpfuSwE/Pb1RZAKzKzX2/Ve1uQUNeTa1SZFZ3Hc1oukEZf
	 IqfGgzR6EIw+/6l2ezrL1a0iCU3ievwjhKhxjB6CSz0JB7VH62weXqXQVUl7UIeA4t
	 ZpgSJOnS/DqizXaKeU7/xt1Aqzvc05OFSj0iRT0pbMq3uLfIxYN9ZRrNX5L7o+Farl
	 GiQBJ5Gh6+rHw==
X-Pm-Submission-Id: 4j8Gc04BKyz2ScPL
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
Subject: [PATCH v13 7/7] MAINTAINERS: add Onur Özkan as WW MUTEX maintainer
Date: Tue, 20 Oct 2026 18:29:43 +0300
Message-ID: <20261020153112.299745-8-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20261020153112.299745-1-work@onurozkan.dev>
References: <20261020153112.299745-1-work@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
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

