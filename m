Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9583C5464D;
	Fri, 26 Dec 2025 16:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766765444; cv=none; b=hvOa7G7HygauEYLZP81uci4vf0MsDQDK2tzI+DzkLoh5o7VMqX/S9kTdYADq8OA+Dstxaq4E3drfqGqqbtmE9JEqZ/yxC6xEsygJ9ke/LqDXi4nMzys0Uoa7MuMcamLau+nrVF7H38YqtpHJGugI0hmlCTtE7nGmNyc/hFmJzBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766765444; c=relaxed/simple;
	bh=npVADthl43s8nFfJiLP/573n5rQCJXK8CQ4e7XYY7ZQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=gaST4cxrVAJe0CRbh4oshwTdI1WUdlr8quPFjnjhwB7NlcmQCvr/UA8BA4SwH+xALxMhEPmOZhNBzWETQDZWEFTsYJ+1GVt86awXLcYSA77/LzXAZ/cJU43/qP6Kr0zuYMhhq1SexRmOL8TjwWiWZhh6X8yw2s8/EdsnTfxlaNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=MgVpPxOr; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="MgVpPxOr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1766765439; bh=Qjz0v1XIpBCptFDzRlnN/MSpEILFppOzfS9Xb6eODr0=;
	h=From:To:Cc:Subject:Date;
	b=MgVpPxOrsnYduPB5+kUXaugZYSi8bAtRWHWnZHQHj5J4qEBpLJfeqpDFBlsRXGWQT
	 +ZpH+b3fWT2VBNt7uDFLE2EL2Z4WDhzYHHNZp6XV71VA9J8iZm8VQKTVQV6h7mHDAy
	 RarPNP0LD4q+rkNWcIITa1kGeaGhwq9X7z1/hj5M=
Received: from xh6010.. ([202.120.234.37])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 2A63EC8A; Sat, 27 Dec 2025 00:10:38 +0800
X-QQ-mid: xmsmtpt1766765438twsakx3i9
Message-ID: <tencent_7183098292B42248DA2FAE7C8EA39E3B1A09@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5dGRU9c4pcusVbUbUz827diBQv258xL9ZNc0w3475WNdqj5W/EC
	 aJQQ8JxSiihd8pSvJrX56oOJ/XwpqkMRi/Ng2D0hthT3MT9tztv/fo9Rikvc0UwyGAbpzO6+IhkL
	 hkYorcCWLc4vcuobuWQaKZfOhd0a65DpvagQzTWC9+ihQq1UqWPQyC43DrA+Mj5KxxdQFl7RCLRs
	 vYFzsN2gkOzS4IROcx9+wtXF3+lh1fysrlXgR3h5ayMDYYYoRR/ZjxuZ4XfnOGTL0OM1MC6VP0Kc
	 Te4XQa4yQSsFOJ9bRAJlYAIM0F0enLUZCkAe7OqrMrSkEtbMxziZyRiAbWIZqonVpqNOYcYfEkio
	 bJCfbFIjdyctY6raSzaV+tJgljteDR71ZjPN3J2sxZ4KZTr3SDribhWL1mZS71mPjOWunYPhzqtW
	 cGLwv2Aqv3eeJLBVuB0/oMoZBamGouxurnbG3uLN0Nwtak5wFFXZeGOGge7vP6jqKsT41xeM8x3m
	 tu9gmcB4dIEPN08dSyyqsqU0+nLMpnyESJh6KDxQzjk+WtjQCSnmtPH6G+i2TF/prmTLrPnbztzC
	 iZUADWVct4c9dXNzB04Dn7Xnow/6E2wvIJscV/2A6BKh2YSt2k330JYNCb/gdDQrww2nx1eZprNK
	 Gz+JkbCVdr7zuVaOvofBvAVvW2bo6O1ncYt1id6/tEPJu4ZsKQphpd5n/8b5mpvBXSuIR+L57UCR
	 miu4p6D0yXTx4O/BCHIzHNmt0XuGskIID6Z+vY8O4B0LFNxRGKq4772aDkYvUSMhEOZwY9CFQ2Rb
	 h7ntE3jQqupz25il94cvMpGRV1Ze7bfEzunbWYoouoTvGejaNWzM0oWPdxZpWFEa7iSd1i8z4zeD
	 wSegPjk9TyOFGCjQgJuXAR4bh776k42KK2KhDLhG1z1f1ZBlNj7r1TuAeJgNbeyHqLIOouLmgL5+
	 gbMGaEDnyLI4Y9SLfw0w4hwVu/pvh9tW1YhygeLNTqpcsOf3EBmSZSPxTQKa+JkX1Ipg6mo5PHW+
	 9YFYsbQPy8WjHxgRluPkTZyUzyxGhXX/+bcBC1kA2F/VkEcnIV8/7pT0ayUe68kfxvJtdma4pns1
	 Vzl7O3
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Yilin Chen <1479826151@qq.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH] rust: dma: remove incorrect safety documentation
Date: Sat, 27 Dec 2025 00:10:27 +0800
X-OQ-MSGID: <20251226161027.1635891-1-1479826151@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes a safety requirement that incorrectly states callers must
ensure the device does not access memory while the returned slice
is live, as this method doesn't return a slice.

Signed-off-by: Yilin <1479826151@qq.com>
---
 rust/kernel/dma.rs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 84d3c67269e8..2ac107d8f7b7 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -532,8 +532,6 @@ pub unsafe fn as_slice_mut(&mut self, offset: usize, count: usize) -> Result<&mu
     ///
     /// # Safety
     ///
-    /// * Callers must ensure that the device does not read/write to/from memory while the returned
-    ///   slice is live.
     /// * Callers must ensure that this call does not race with a read or write to the same region
     ///   that overlaps with this write.
     ///
-- 
2.34.1

