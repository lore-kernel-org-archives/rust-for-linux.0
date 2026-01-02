Received: from forward201a.mail.yandex.net (forward201a.mail.yandex.net [178.154.239.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462F25A357;
	Fri,  2 Jan 2026 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767376977; cv=none; b=fX6nnsazFgdn9RUCUJ7jiL474TgsW4E1fEofMgylqdoTJin8E5GVHcDmTvq2oB6vFVxRZ2wTmCBoTuQo/8frlP6l4/mr1HaOGlDxaY3xU0AFyZOejOTbter8f/wFr48tET7P80mm64DhGIYH07cU3I0UPbEugMI620jDsalh55c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767376977; c=relaxed/simple;
	bh=vfNKBcpbZfVUaG2HIOhR81QGP7isefAqWuFwxVyXrK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eD/iU2NxrgdC48YEEjjWcdc3MkuzeLBZcwKEYvYohOYJBm55N7CkUc94sVQuGcnnoUJGNRmuNNIF6LodWNuG/PkrMAgM+JZcdeKZXU09V9+czSnPHQOggZ11zr1LmZEBjbYkYoaygGV54TBRX57NqIpDHRtE0kvcUJiHthfPwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=XCN8SekX; arc=none smtp.client-ip=178.154.239.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="XCN8SekX"
Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d103])
	by forward201a.mail.yandex.net (Yandex) with ESMTPS id C2B9883E5A;
	Fri, 02 Jan 2026 20:55:04 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:582e:0:640:200:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id A2A08808B2;
	Fri, 02 Jan 2026 20:54:56 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id prp9aJGHE8c0-54Bf4Wdk;
	Fri, 02 Jan 2026 20:54:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1767376496;
	bh=a50rz/ne4O3HC3C6Yio58qwQfeOtFy6yA7MhwTMu8KY=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=XCN8SekXqs32/n93KnjRKwGxjngkqnJskjolZP2dl7ESwmBXf0rM62c0IXhsHktKn
	 ni9sCKpUZomnHMjA8fLCs3Yp648addK0laMRoSZ5mje11SdFHy7lBqRlVf4k2fmliG
	 jm5DPkANOZBRaIj/j7wf9Zut6YOJjPlRR0YO+m9E=
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
Subject: [PATCH v9 3/7] rust: error: add EDEADLK
Date: Fri,  2 Jan 2026 20:52:58 +0300
Message-ID: <20260102175302.194435-4-work@onurozkan.dev>
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

This is needed for the ww_mutex implementation so
we can handle EDEADLK on lock attempts.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 258b12afdcba..c2b95db23abc 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -66,6 +66,7 @@ macro_rules! declare_err {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(EDEADLK, "Resource deadlock avoided.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
     declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
-- 
2.51.2

