Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DEE21C175;
	Thu, 11 Dec 2025 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765466275; cv=none; b=NRLAtGmrrWjsmjLXBYQ1M1623FjO6ekcRX9tW8kapfOeWVwd63CwXlXTnU2q/WnilSfDiDAz5ZIX5OYjTBoi4OzXpuiAmH44hAH6upD4zxzfz4E37LU5Zomphayx7+Dw9HuZwNkANwZ1//JnS3x33uAb9qfskU509jdGtDRiMcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765466275; c=relaxed/simple;
	bh=OPKdaJng0svvBZhKbuTRnBRDbEgbGubCgS4sr35H27w=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=UeDC8yLy/QSnwweHVzAKe8a+Dr1D0dxqV0hHXzPbUKIcUkobcQavi2NNA15DCbk013l69TK97aac7QlS+UDHSwPITZRb6UCuS8WBeQjp2z1UpHU7sqdv6O0cmTf/vdp58RbPxUJ9ov23dmug1oMFmFpSfR45Ym6rNdEW3wK55CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=QD/CDf5w; arc=none smtp.client-ip=203.205.221.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="QD/CDf5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1765466271; bh=Fte2RX/QcfZzKrkaFqsYv8nLDW96G3U1zKwE3fKSbyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QD/CDf5wqk2LJuiGzajLeK7q32IEPI55SeZTaOp1F3lbsyK3Zx0JCiKhdYdm9zDAy
	 Q5M1DBJ0iHR9zlFQvyUWF1wTFj4/P1oZOwuoP571dTDvdLEezckRgG1yGgKChlGBjr
	 9h4On9KUVA57ixO311NXl7jqOpvJqTQK0FxO+m8Y=
Received: from xh6010.. ([202.120.234.37])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id 471B42C8; Thu, 11 Dec 2025 23:17:49 +0800
X-QQ-mid: xmsmtpt1765466269t8nuwjyfc
Message-ID: <tencent_DFB9918EA024C929E2BF3DE6EAF938EFB905@qq.com>
X-QQ-XMAILINFO: NUYPVyrd/y6PqOnXHwmOpfFZD80NfzE7bMuPetqzRJDpuE39SkHypLzGNiqxBv
	 MuKuSleXA/QXCWAYdS+hyCWK7YRZbN7xn2vEpW7rO8n1ia9I4O0UyefKhAO5Ae1EQyMNnDoC6qDo
	 ZpuuQuCoFAszSnGTNCOzcohUtUUhRMBF5s4G+qi1wkeSbVpdtdycdfa24hu0QyUpuUNYEgLngDzY
	 D/hIWqd5XSeAPAbEPlmZR3PpVHG+HKmkKg7O1JOn1ybOeY+g1Id5E5UnKd2Xh0VGJ/Ly1fZLMJK2
	 23TKp/t1W8SnmTsv8E6IPschZLR12JeaRL6AnXIxZYeQFE+w0YuztYy8+j6mlDjM2+Bjk5QP9Cmd
	 SmgsuBHXd7PV4L6QfQdZqt9SQrN4TbH39k1fb8ugh6ES2bC13+YkRWQb2kvNym2BROHYlcU650r+
	 R8Wg3TqIRszpnkAr19gFJajAM3w7PKq9zvwHOKTsGJq51oXUcMtwkDmeUwJijg7K3k7INhfaUMrK
	 4cV1xuJDPfxa6+lNhWzZV/ibHozPSx0sy4nFnXePcxaYcI5N68mk4KaS0O3k3421ZxyxJpOOf6KB
	 pRkfqJEQRVxunph0pAtsFZNyA5pLGs3baYXz1Kgp70IBLMwqbeSorY8a5J1AQKilngDFEU7jKMNL
	 BXF6yTKcE7XXUKokn3BRfjUQLBQw/TNyrWuSXlUfAknyQISP7i9ew/dJ7Ttly09vnvsF3dTrzkGI
	 7psmQw1hWYe8kqz/RHW6i5SFl4m8BkmTjbuDkJh6BwAaYBGowjQDqPxnzJFJ889GygX6lGjT/4Xs
	 nDgvfbKNXvdJX31LVP0Akka9FyheAL3XoknUohIcgvaa5nt80VPjh2byKfik6RyFqMpYVLQAA+j0
	 pAV73UaPhsn84h1eAGfp+5oon/1iAK3V8DqnmVaxXOdtIVUfFeqM3c8ATay1aD2LoUNZIYuayIGJ
	 z2rm4Q++XltyFfD4kh7nJVLix++J3eBk3Uj+N2tC2STAtIG27CXUNewCW92kdd72W7uqK6mqKEd0
	 m3fI2nr8KsRB9weF/ba76hz7DYkyf3BR7xriKDu30mBT89DF2Y5pY2UROS/VzLnmzxsIfOhEBi6/
	 0WqyWl6vrEor8rRu1UwAXukA0Bwg==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: yilin <1479826151@qq.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yilin <1479826151@qq.com>
Subject: [PATCH 2/3] rust: dma: remove incorrect safety documentation
Date: Thu, 11 Dec 2025 23:17:48 +0800
X-OQ-MSGID: <20251211151748.2894290-1-1479826151@qq.com>
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

Removes a safety requirement that incorrectly states callers must
ensure the device does not access memory while the returned slice
is live, as this method doesn't return a slice.

Signed-off-by: yilin <1479826151@qq.com>
---
 rust/kernel/dma.rs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 84d3c6726..2ac107d8f 100644
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

