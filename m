Received: from forward200d.mail.yandex.net (forward200d.mail.yandex.net [178.154.239.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728A2314D1B;
	Sat, 17 Jan 2026 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768643813; cv=none; b=LzhneYNtVnhO47ukIg2r7dmrGX5eQ7x3m6OjM0bKJA341tdS3vbhfC6NWcU166+2EWbkFlbObHCQJdQVllAoLC5jI21fbWVf0g0rK8u+2Gev2Um8Ydw0kgsf5OHpJXCEHpokF5iKefhhMw/RSFMXhfMKcqjvAyI2FOAg2CdHXvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768643813; c=relaxed/simple;
	bh=G6WmxzqVZcFjnwHFsjcZ1J1q0B5GuRLceJ4qAiG1q5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nOaT5C1hi/qwy5Fskf+S592qFdldL62yiJs8TUojPNrJEqnVhp6UOgPEsCPOvwwygjy25sF08Iw60spiuhDe/Y2R7ptCitmg2wwa34egN9snh6SnWwcTOWNMhoEbCnZPbiB9ZZWj2C/sKN70vZSjnHYZcvV0lS2kQVQbHfa1Zpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=W3gSae/0; arc=none smtp.client-ip=178.154.239.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="W3gSae/0"
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d102])
	by forward200d.mail.yandex.net (Yandex) with ESMTPS id AEE398400F;
	Sat, 17 Jan 2026 12:49:47 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:2a21:0:640:9c41:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id B1795C0014;
	Sat, 17 Jan 2026 12:49:39 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id JmTKwMLHCW20-dpycKIeN;
	Sat, 17 Jan 2026 12:49:38 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1768643378;
	bh=c7iadIs93OYYD6Rt+Vfk0y+/R9hKXo5IWTr4y/AL+MY=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=W3gSae/0ge7dnw6fa++i9j/iQpNZQ1CSqo1UQ/hPXdhy6k3D1ygqq3B6Cn2ioxSpK
	 RLE8MMdQJYJnt2VfpszSjEls/6O2yZYpKaoG13WvvdxC+Z9QVwKMngqrTSGIA6HpMk
	 ciMyvbttAB/dMQIqPwzVowZJVG6fCybPqRDhURXw=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 1/1] rust: simplify `Adapter::id_info`
Date: Sat, 17 Jan 2026 12:47:10 +0300
Message-ID: <20260117094710.24301-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260117094710.24301-1-work@onurozkan.dev>
References: <20260117094710.24301-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

id_info() checks ACPI first and falls back to OF.

This replaces the unnecessarily verbose approach with a
simple or_else() chain and drops temporary variables.

No functional change intended.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/driver.rs | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index 649d06468f41..6cef792d54e4 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -307,16 +307,6 @@ fn of_id_info(dev: &device::Device) -> Option<&'static Self::IdInfo> {
     /// If this returns `None`, it means that there is no match in any of the ID tables directly
     /// associated with a [`device::Device`].
     fn id_info(dev: &device::Device) -> Option<&'static Self::IdInfo> {
-        let id = Self::acpi_id_info(dev);
-        if id.is_some() {
-            return id;
-        }
-
-        let id = Self::of_id_info(dev);
-        if id.is_some() {
-            return id;
-        }
-
-        None
+        Self::acpi_id_info(dev).or_else(|| Self::of_id_info(dev))
     }
 }
-- 
2.51.2

