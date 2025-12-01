Received: from forward201a.mail.yandex.net (forward201a.mail.yandex.net [178.154.239.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C7C13DDAA;
	Mon,  1 Dec 2025 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764584992; cv=none; b=XVzBCcpr9ZvZf3OgOwqeuVGw1ANlkB154LJwiKcCzEJkOYm4rjhMhmQQBpsKH8e9BUi+WUHCXZlce8G5xFwQOSd2ztECvpBx4bDWE5l3CyTn+FEuMTJZ0UDrhSdUP459gc2hiidMJ9mOYWO5Ov3TmgA72pTjxRPBRACdoqyf63U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764584992; c=relaxed/simple;
	bh=8qpHjS58yRnMjonBxk24D7YNjaxNwLJ18ZG97fwDO+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j1jNIq+TznByoSWg1JsCkjFgE9vN/z3+pLWTQdU2HqPbCu3Pv8avD3idB3GjG69kOMx2eDt+9TFDinXoPXM91cxYtr2PTjgvcGODNauqG3RedQrBjg+36yYyfFqAU2XdrN1fJCMKC6lx/BLq2zEsCKEke5AYgwXR6CrqZ08kAdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Kq38vr1E; arc=none smtp.client-ip=178.154.239.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Kq38vr1E"
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d102])
	by forward201a.mail.yandex.net (Yandex) with ESMTPS id E988A819B2;
	Mon, 01 Dec 2025 13:29:24 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8a9a:0:640:e327:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id DD92EC00B2;
	Mon, 01 Dec 2025 13:29:16 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id wSfJU4kLMiE0-2pzrFUMt;
	Mon, 01 Dec 2025 13:29:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764584956;
	bh=yFK6lRt2ssfqukpmgrenlQa2EpfYl8xx6d3OUJKDPLc=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=Kq38vr1EMq3EORz6JgOfA1wQ7ipNRK1F8Xd2YKF/Uo6NKFOIUN/2EuqKu8d7cH72L
	 mevL1gl4rDQkfNroJcgosaV1ugsvl73YGtNmZ/T6SOHVApH7hZvP6/oK9Y5ivrHKiz
	 Yd2w6op6iJyXuBUMgZjT9spTXEnfUzRBo1yjEstE=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
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
Subject: [PATCH v8 3/6] rust: error: add EDEADLK
Date: Mon,  1 Dec 2025 13:28:52 +0300
Message-ID: <20251201102855.4413-4-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251201102855.4413-1-work@onurozkan.dev>
References: <20251201102855.4413-1-work@onurozkan.dev>
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
index 1c0e0e241daa..9bf1072cfe19 100644
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

