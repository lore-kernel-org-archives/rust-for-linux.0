Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FAF259C80;
	Fri, 26 Dec 2025 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766765335; cv=none; b=cgA4uSaoD169OSxqUAbVmp92cefyA4Y5CgJ5waSiFNNnJn8cJFkM8XzBwZyHk4YcEOecKTwBwAe+BoyNPMvRpKM6KVCny8tSeUvtfL548Mux8sJZUEn79F5Kdjo5dtHa07EpsSHszRPgltSRHlNJNuHHVl4p/aHeGU+jlC9RWGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766765335; c=relaxed/simple;
	bh=UfuG2Ig9h8EQ17s1JhzfGF9EZS/bfRlj5bzoLzQxlng=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=crlJ2jWTZE1/wCD+i5BRx8OxJa+IuHSWpw/1Ywv0RSd15/d8SB//jzA4evDfe7X4jNbnIDiKuAWg0Xg97b/AwnxXev1y0uDX4MbAecEAGC9P4KiZbsvwe9YmywyEjU4KK/jlad4dwVsl5xegdJ5Ke+NjvcHgBMTKieQh/y/B6uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=oYjCuGl/; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="oYjCuGl/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1766765329; bh=gPFqo8KWiXv2OUZl0ia6bDHIOq72XHRC2s7AHhTWGTE=;
	h=From:To:Cc:Subject:Date;
	b=oYjCuGl/s4FOvPYw2fQWXwfoVYQLbq+I88FUORqYE3EFAbn+/rK5fRFUXaoZfhngA
	 vROHXTLstq8XODY4soJ464x1UlBvtvm/k7uYdM6vHKHBCSA657IsqxYa57EjgnG3oH
	 BEPcWXnkyVY7+nG13QhoC5+67VbVGlHztnkFABOg=
Received: from xh6010.. ([202.120.234.37])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 22FB2C72; Sat, 27 Dec 2025 00:08:47 +0800
X-QQ-mid: xmsmtpt1766765327t45ckjhxo
Message-ID: <tencent_9F74630DC16B92484463BBC055DEB1F17306@qq.com>
X-QQ-XMAILINFO: Oayzr6Bt9/qsla3Ws/HEzCIhZ3BHnxSB63ZL7hqYqVpYklASGSXax74Mit8mk/
	 ++vZUocCcFWm5C5ps/f3Qwpc49L73Eo/WshVbggVcb/wF8JIFOBMlu1jjN/79IHMH+2gp1/GfcO5
	 +usabMDoHvMC6bPgKcGSI8Tb2zjXNdoLSAxULPg8UrxaO04K9mv5zl2EEr4E5SKUnxOxpI6fEBQu
	 O/tWyCE64VLYDEd2MF4lM84uH0X84rz/TWglLfQhCdQHlVcwOSfFnBZzbeII1kjBfTuX98Uc0m0S
	 nAb+OQ+CBPTS6nwmU5NILjd/swSSsmcVAatOWC3LV2k/PqZPljipHkP3cWHkJqi8oBGHZZk0nIlG
	 xOYsMKTjTJyh/CuDviH4YYYotRZMAEFD6lUFZRc32iro88HaqT5suNRSM3J50VUSRhqEkkqRCvvm
	 +VATLEd2jjQclN3toinViY/5YRenfoFRxjxY7sUJII01W2pP40T0SGBRxpocH9KKXWpdMlqRkOBk
	 FLOXF6VjX9TCmW88EVeeIMjIS3zrXFDlxDVX/w2WXgLfhoJUgdBy7CFb6ShxO7EO0iwY2JUyLOUq
	 o0+zkewTBReuL1gwQqA3ht825SCea5HR8RYTDFATxtAHzUShsxCsLoLMSHp+vB4SvZXAdNQfOgKk
	 oW7ODNli4K5IjLiLu2mJOi7f3A0IlPYwaWim39jfB83ZlHRsej70xEH0+IBGost9c+USv4/a0Sn3
	 NgD6XwT2GAlSZuD++j3OLtbm4Csaudm3vkeBnxDWhyGZ8a5P6egRrNhO0Kk6RAznAw4SWDcnSDA8
	 sr7Z1daycnY9pJul0hPQ019PHq6qbWJKyMqCFNTWOIKNzThQoqsJcvLDlgMUVxRFcq0rW+osUV0R
	 enycJrQTYA1mKbEKfIPoXvTBqRRb+p2cCCv7yiMU/uaVZoTtCIIpJM4YD8/GvqiwZZOWde1jO6or
	 rqVnImCK0oqlE/6ZFEiM79V3jspz5H+3Zjzhsf8Jx8OJAgPjQjxHbaEPyHr8B02QZrRdMjpyZb6N
	 UKOn8Y6nkqlQ+bpxIyc1ebQehgLP3/LlLJUQeIIwwsxv50jzZ8dFGXET7frPEjjpNTjwybNxR+r2
	 GsM6i4Hi4wr0l0mW0=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Yilin Chen <1479826151@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH] rust: device_id: replace possible incorrect word in safety documentation
Date: Sat, 27 Dec 2025 00:08:24 +0800
X-OQ-MSGID: <20251226160824.1635183-1-1479826151@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The safety documentation incorrectly refers to `RawDeviceId` when
transmuting to `RawType`. This fixes the documentation to correctly
indicate that implementers must ensure layout compatibility with
`RawType`, not `RawDeviceId`.

Signed-off-by: Yilin <1479826151@qq.com>
---
 rust/kernel/device_id.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index 62c42da12e9d..8e9721446014 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -15,7 +15,7 @@
 /// # Safety
 ///
 /// Implementers must ensure that `Self` is layout-compatible with [`RawDeviceId::RawType`];
-/// i.e. it's safe to transmute to `RawDeviceId`.
+/// i.e. it's safe to transmute to `RawType`.
 ///
 /// This requirement is needed so `IdArray::new` can convert `Self` to `RawType` when building
 /// the ID table.
-- 
2.34.1

