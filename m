Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com [203.205.221.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759B1279DB3;
	Thu, 11 Dec 2025 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765466252; cv=none; b=ArZAGQY3Krzt3YMAhkgBlqQ6B/IPuARE/Ktns4whSRpuPGBG50SCAyIegOmWs0yA3WWV2j8L31GNh+o0hn+MgXj77Nm2jpflMW5Q/GKzNbR2Qk06ZSqUtQY3Dff14PBnKODrBjFjW4TDfOTPU0cta8jpzY6ott8pvKLKaIoHWu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765466252; c=relaxed/simple;
	bh=5ISGUoa1ZPUrnIAKUwl6LTjkKCc/6wxpMgxvzzlj+bA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=kJIMHs030RpDS4RfzgrME3SWEOqtJItUeSqvI+772W6otas15Eup9BCRiLPNbZxT1GH3eqTZuRvZaStckroj/GxvrUT/GmJaxFOos0ZYX4mA34qpODrgmGEsZOQV+cvUTEzk8bPy0HP7gdFC7xMYtcRrhUOxNh/rwoRcvjx/0yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=AkH7hqid; arc=none smtp.client-ip=203.205.221.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="AkH7hqid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1765466248; bh=HnSHvb437zKc56G4UVxxzj747HQC4kps1vB5b6KLHtg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AkH7hqid9f8zsxzFnZ3sAFmvZUoC9Ljo2C6SPYrRXvVxNLPC/KwvXcc3kTJy53vS1
	 y/EQLJZTnznxmfVUkrto/OKoliXn9PPwcrhbGKIYaG+wiQ7uOnOw1Azw4rp6HcTnFF
	 56ufwwxdwNr5xn/csnfpuBpuO4hm/ol5jZVPXRYA=
Received: from xh6010.. ([202.120.234.37])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 45AB5CC2; Thu, 11 Dec 2025 23:17:26 +0800
X-QQ-mid: xmsmtpt1765466246tilsoi8jv
Message-ID: <tencent_CBD5D231FBF347232CC155D26A045A3BCF06@qq.com>
X-QQ-XMAILINFO: Mna2+20dcVhjTEfPAZJQNWiLUl9HBk3sBcbrkkdQ/K4WXydK+0rbDYqSMZAMwa
	 Hm7td7ONYhTOzWsbOc8u7Yu3dl53w8P9EmlAn8vNBce+nHtny5nlImUU7Kxprk1DJw03JmJMIrBD
	 cUdb4EfRN/RRzpEXNTm4WEusKPCVGEhKcqD4/Sx3fdF4EXtfNsYmhl2hYsalJXcCzb5Y0T6z+gjk
	 bRK334MFwk6ngkedMzkqXuYFA8lilREbJkiZBkWUBgWSF9usRcZu9LeyeYdnRxJOwLppj1Q27+cL
	 rVLqL6gKRFwNxakq1+msT9DUtf/mCSAAgGWqL5TKMrBnINXlWthoazXByUo1PEoTLdCNQvujc+8c
	 pgnq8698xHGpbsJk65BntLRb8ofVDSrGbl26y9nkchS+u/4cViv2szt6DRFSlMNI2VYnNIo5GEck
	 IRj3uMEIBJ0/HCrSW4mIyPHAkfF3hq2sVSVGT0w1Rex/Y2m9pbZ4IteW7NizQiheh879+DENKbYA
	 3qcs5svwM2TCRyC7ipmsnKhc0ueON9aAlkKE2KTFPT+BJm9Flyk6O9R8eoHQkrJnlPzb9rGfygZQ
	 PHau5xNU1S51JRyqA7Z8AhJVqzpM8afXste50MerzHG51k3WTZnM59HENg4jI+o2IVDq7Q9XGBHT
	 HRYMAhyekToFo0RgUOZ0cmacF+cFYdTzLvIQAxTt4KqSUsCyVEnDnxdm0dtNgKIc1f7HuWYXltir
	 einP8aKmdbeNAOJX+r0udtVQS+hPHB2z5HccXKg3K5gE6yZEb+6P5BGEjmyIpQDNha+4vnKxSPv5
	 HxwksG5+AIjCQ301/VIzAw1oXw4w8O6XAiQuWF2NoVOSHksfXJ+4qbG7dJggyNVMtMPKGNVDH+Kc
	 1WOYZhxhlf/dAmWLvw/jNxvVsgbcvaveSZfiLs+psnVFAHteIzuNnV6oQEbtmnoGXtXXH4MeCUKu
	 5LVSVAv/gyM5c17XmkXOtnDzS1ik4fFm5fvLUID/Jlx0gZnVcw6zQmVQ4zLqSqHMO+AOjG1vi1/7
	 jqm0CsqIenAS1CtDXKWi1Lo09a4FLKD0/0qYj0yeI2SqzRCuebgz1j2vm9Py3/KXpV8xtsrpT32R
	 LErwbH/ZXyi0AkShtwK9K/DjbHbg==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: yilin <1479826151@qq.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yilin <1479826151@qq.com>
Subject: [PATCH 1/3] rust: device_id: replace possible incorrect word in safety document
Date: Thu, 11 Dec 2025 23:17:24 +0800
X-OQ-MSGID: <20251211151724.2894154-1-1479826151@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211151553.2893838-1-1479826151@qq.com>
References: <20251211151553.2893838-1-1479826151@qq.com>
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

Signed-off-by: yilin <1479826151@qq.com>
---
 rust/kernel/device_id.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index 62c42da12..8e9721446 100644
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

