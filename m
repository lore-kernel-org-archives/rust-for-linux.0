Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [178.154.239.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B776229D29F;
	Sat,  3 Jan 2026 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767425786; cv=none; b=Fe86yuFzfTcIkbNqFgnEBi8d8Uj8r99YSbs8zQTncZBLlpCyeuqe8vDuzaacsCuePWrdV9ddkojbG1noIK0rDBPELB/iAeoU0acMfFKDIJ/fCUyhwtkZu+dBz8wBuWDaXGEEzWp2W8y+86h52dPTKDEV991mwwJ/O0YhWGbqqCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767425786; c=relaxed/simple;
	bh=qXjRkcxm+9EvnQPA4+yVQL50NucDkMq7zY7pZGqIs8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aRU6M7I4qznhZxwhsa3phKxQAx6BI6xHISIEKf6FnYWdbfygfIL0URISudZP5/rMH/jCBgEovbKnxwArsrL8AMFQtAQwzUxZDQRsTV7Y/MkcG4EByNmF0Qnm5sTECdQgdNnW9l5AJ35UDX4HtBvBurtoqFpnH/szAOhP9D6Gr2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=TFox1ZhV; arc=none smtp.client-ip=178.154.239.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="TFox1ZhV"
Received: from mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2804:0:640:a3ea:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id 9064080853;
	Sat, 03 Jan 2026 10:36:22 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id vZgUW4MHrmI0-N0WnwMNf;
	Sat, 03 Jan 2026 10:36:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1767425781;
	bh=i8a/KVzGmceKOPxGQ/aGbLXS4sRodqATlokSJ81gkQo=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=TFox1ZhVmXSfXL/rayny1i+JJoM8fgswJlDKoF5xdoa/nWhXwzSJEzqqKeXb1btQo
	 h2t8NHTplAt7iMRqC4Cs2vYb4zwd5CN7ARGE5lmUUk7b1rMN2+Jq4MYEgvfIfh2ETD
	 WnDc6pXs+nlBJpL7ZANF9vDqlQ/wJHZM07oA2Yws=
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
Subject: [PATCH v10 3/7] rust: error: add EDEADLK
Date: Sat,  3 Jan 2026 10:35:50 +0300
Message-ID: <20260103073554.34855-4-work@onurozkan.dev>
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

This is needed for the ww_mutex implementation so
we can handle EDEADLK on lock attempts.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

