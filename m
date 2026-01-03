Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [178.154.239.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D0029DB6E;
	Sat,  3 Jan 2026 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767425796; cv=none; b=NrbKImxWj7bwm1Ua0ExsynKrrlp0aSogS/OMY6tKiSnWiPMf25yMwizTplb9Zhua0FPlBMccJdK80p+Up3/KQCoHDLeIUM/mZU1aMuD9ZGpN7GI7EHkQ6yijkpYC4xGprYceDC8xEe/Fcva1ZriVl6DPDBzcqXGuuHGzwR1+zos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767425796; c=relaxed/simple;
	bh=pIPbM2JoHK97PAIfWiXrLHFnud25dExbbNJRjxl3oZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RO2qj0zMSl63e6B/Kv2TWCN7V+je81qTTScPPPDaJ1b9vHEiHNGbae2Fb6nYRtLu0wEiaJDsDyOuzUgJT7NlFZPBMGUvjOPH2EHqw0Lj2h0IQd5u+z3RGgVOnfHYGVZ/TSl9TWoxvgko1m09e84TDNGi9RtAxbj+ZNRD2lh/zwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=mon22IwG; arc=none smtp.client-ip=178.154.239.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="mon22IwG"
Received: from mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2804:0:640:a3ea:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 1297FC0074;
	Sat, 03 Jan 2026 10:36:33 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id vZgUW4MHrmI0-7cEbCgSS;
	Sat, 03 Jan 2026 10:36:32 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1767425792;
	bh=33qM/U8DQYbp0BuJiAKK9JU4NB+HvAWHzGL2WIebHbo=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=mon22IwGRl0Fug6Gy8Rw2UNV8i/qhwNC8RFeu+ekqc/n6O1WFalJL6soiAr51A7eb
	 yyYx7ah7TE7ZlXAcVNtsAaoGLxEYpAz1jBpfRv3HX3YLQnid3kGjWeK9xfRb0RmwyE
	 w3lqSW+0Lst0ZHU5XSdEMSTFJ8f5UXBp3isZgsNk=
Authentication-Results: mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
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
Subject: [PATCH v10 7/7] =?UTF-8?q?MAINTAINERS:=20add=20Onur=20=C3=96zkan?= =?UTF-8?q?=20as=20WW=20MUTEX=20maintainer?=
Date: Sat,  3 Jan 2026 10:35:54 +0300
Message-ID: <20260103073554.34855-8-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260103073554.34855-1-work@onurozkan.dev>
References: <20260103073554.34855-1-work@onurozkan.dev>
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

