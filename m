Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CB03E5A2F;
	Tue,  7 Jul 2026 16:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440642; cv=none; b=JfgtL3f+9ZybgxipCKpFOxvHqd2ZoKDD4+CZLWdGzCc3qM0e0DLphyBTw1W8VgibcDmMOSV50dwmB1O16vuqybILoDenjG4bEakveTvtA/SmC5fQm4YMJiGYuD8KVCv0UIMIpp+C5S36LRfRDoNzD6UYv0BR/gzpOXZ3qJZVwck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440642; c=relaxed/simple;
	bh=5ULyXo2BLYESOkF+g1kG1ayciOMp9A3cMXz1M/Hlbmw=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=TNTU8hKu01Imak8Gq2ByqE3XKCqTfl/A+oSgXQVnTJk50u3wT28nR6Vjt7Dxr7mji6bwqgTjwdG/e+5FGmnUNwS8tGSyQG8/D3L0KOKoMY/9CoNzqlGuzm/waYwKQyYNkSJPWyE8/PqSERorolgN7oc6MLnoL3JjbJigoJ84iNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=VCwhMD6N; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="VCwhMD6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783440634; bh=QGyStNkn6JD1c6ZIfYB21UdgUp3/buB+8TAH8pTNFig=;
	h=From:To:Cc:Subject:Date;
	b=VCwhMD6Nizpk36fagc7DnmvqighWsvnpPfeLisgQcgv4JHq7rVZcSx6rjc4hATJwN
	 Jcv4rc7lp8zXGdCrI4FxgCi+GuTIWbrH0gbc9wbA8fRaSJuymlLUEuQXwwepQfqUGt
	 GY1ki5BSLMnkF9fDq8gPIoRmff8DqCRmossmCgws=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 2A086835; Wed, 08 Jul 2026 00:10:32 +0800
X-QQ-mid: xmsmtpt1783440632t7zxgd9g3
Message-ID: <tencent_8CD671E0F35223030143524D045F3BCAD506@qq.com>
X-QQ-XMAILINFO: MBHEkxMsYPCY0/+pTdctLIgnL9XIYmK4vZDhxZJ1kryRR4SR8AJ8z5+sn2CGCb
	 o+Ni5PSS2saXMfqpR+EcandzKRIz8r6qShXuR1KpbQjol7Iz4BvSVv/qme3jUMr1yt4v9exJO4Mo
	 AlR0YTbhX04sYdkKp/C4nfEm42LMVi0HL++BqubdImbE0HYxrWuI9lBs0I6ttej09Q2PtNC1Y1Cy
	 zLG9knvWwjy9gIMvfTP4UvTXxnY9UzcWiJO4zaXw9GwfCkpG+G/vzaAvfRPWqWrJoX8KEYJxhVI0
	 cSKBiB3Lljp5+XrmOQn4iDNHCWF/ZYEsmPj1r619ZCm4yOvRrhP7rat9Rae9SlcyRngv6W3d73WE
	 NfoRgZrKBKDdB4vANgnHXxIhKpfnKMRphSoBwWzZrOZms9f7RE2BYaW1s9Prg1iGuvUuwq0Bi5A/
	 tjwUhf90v3e/O2ljeKBKMrYNLTSQRVEckKUau8vYiSrsKUNFH5Rf1sObmSkywqoM8b9i4muyfhHl
	 FMJVZ7VLr2cHEdHGrhjTM1oDiNDX53WhXfy/N3hFVjCXA7qO3AdRjWP3Igf5tB/dNHwfXZHVSZi6
	 iR0sSlu6ZViMiKnfJNtY6KEcREAjRYmTmjki3s99ctm4FkUfP7KDYX39AZyA4ry7YsYR21U5v5bT
	 vnasHehHzzdizYCCHv3jF/QywZElpxJZKr+6KDFZcBES1b2zgFcg1VjECI5vYiDQxGtKFrToZjTS
	 Xg2wPLGWqCnqRfeDHe/EWm3wPrfJbhOP0lEw/iiXGiXLyhALv4Zt2seBOWFIxpub+eyJOPKjGLzE
	 Dghb4FMOhumzYGAiPmodo8mydE1hixPI/qhUlxDj8CKkQq1CRxCRRe2gMJZvlU5sCJbkMOt6rO24
	 eXx9lJNnf86F0xIgWImx2n5/+jpLkhz30fC2ixbyK/nZg9BE89yZGxz078HkpCwpsZT9hQvjnFtd
	 7G8EfGNuUn3kRz3R+nx9PKIxVLqDfZdRTOhB2I7sJSMIbbH2Rx7KG1qR5IPA0fcV9sAluG61kNhO
	 fA3eQXyY3G2MPACoUYfMAX6C1fYsCPAkHiYqi0O5r/0QABdTwJ8pPkTfJSfrDt3NwxWlI1CNOAPB
	 Lm7KQmCTff13YFjOLAZqz+QMtbKpdByrSC6/yAWrZpdFkyxHE=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Yilin Chen <1479826151@qq.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH] rust: miscdevice: fix write_iter safety docs
Date: Tue,  7 Jul 2026 16:10:30 +0000
X-OQ-MSGID: <20260707161030.2802692-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The write_iter callback consumes data from the supplied iov_iter and
wraps it as an IovIterSource.

Its Safety docs required a valid iov_iter for writing, but the
implementation and the IovIterSource contract require one that is valid
for reading. Update the docs to match that direction.

Assisted-by: Codex:GPT-5
Signed-off-by: Yilin Chen <1479826151@qq.com>
---
 rust/kernel/miscdevice.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 83ce50def..3abef1b85 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -289,7 +289,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
     /// # Safety
     ///
     /// `kiocb` must be correspond to a valid file that is associated with a
-    /// `MiscDeviceRegistration<T>`. `iter` must be a valid `struct iov_iter` for writing.
+    /// `MiscDeviceRegistration<T>`. `iter` must be a valid `struct iov_iter` for reading.
     unsafe extern "C" fn write_iter(
         kiocb: *mut bindings::kiocb,
         iter: *mut bindings::iov_iter,
-- 
2.25.1

