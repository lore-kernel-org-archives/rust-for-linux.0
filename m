Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7C62110;
	Sun, 28 Dec 2025 16:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766940808; cv=none; b=IvJf+fwp2sx/vZTsEeayVMMjIA2yFSEKH5gFd0i+krCsje7zrMXOG+AppQae0ymfajbIbGbTYuSMIBfLYLZPISRWhtMRW+fbpgiOlAKcS9Ei/lZ6WZVvckpjW1h0gh3/U2K7cMH09VABAW+kk+aV8i4+hIrk8FQBOf19lRUlCzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766940808; c=relaxed/simple;
	bh=NQLKbGjap5kDaPl4iGrFHcBzJcH8kc3456vxV1mmaQI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=OuYD2xvirJ52P8kg7GbQ98Zk9/I1B0hINchQ7npNG3SaMOERENxqmJMWQP8OSizs6utgciXebbdk18Zm/yBY+q0LOgUkP6CJsnWRlzzkegYXvRsAzgKid/g0j7i0F5YmIXWx0itvCalT1Mo8GFcoNkOAkyiy5X/uUD9CuAw/wq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=xTb9oeup; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="xTb9oeup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1766940795; bh=ydEyAoo73Yed1TaVwEK9CdpJGutoz2h3selxiQTD1dk=;
	h=From:To:Cc:Subject:Date;
	b=xTb9oeupoHn6ADdhpCfpMP4bloOHvUVBUuLVyMOO+4kWuVMP2zCefYwhDiuY6pydX
	 FrwwfaSLQ0XI/K5caEXpdIlIRYoJmcQw3F6qcOrwN1JSykoCdisesHldLkQ9hsuros
	 ydaD5pO34Ou+9ah0+PeEK4Er7gdeu/lekkAftDxs=
Received: from xh6010.. ([202.120.234.37])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id D4E18CE0; Mon, 29 Dec 2025 00:53:14 +0800
X-QQ-mid: xmsmtpt1766940794tjfdejg5c
Message-ID: <tencent_5195C0324923A2B67DEF8AE4B8E139BCB105@qq.com>
X-QQ-XMAILINFO: N4Zryz/ZOxrhhgB3c98Kcfr1XpQVAdTKM+yvYtV1WlfVIH7Dqdkz09xl1JcLe6
	 MNYdJvd6YjAjFnxjKaNd9tZ2LUDfScXNLMU4VAYz866cVNS+thDAWkXq45zbWvpxYFWyHVhMACRh
	 No9O9H2Z9eC14GBbtNCqxyAggd9jJEDsHw3e3W+rqIJIJkStgE0vc4DbQlck0qkoiXjSKX1ru9/x
	 tUv4yvUGd5NSF4jqlbSlUqmyF4rxh5ZvDhGaLcATyuXaWP39/9Rl7bvRHwhpXc2vC6fj241lfiLF
	 JUSlZR0eH4Sxhpwt1mHjdV5lcaSCvUDDs7tHsmhkLJi2mqjjaOG1Fb73BVA7Gzm6z0cP3nYvuazZ
	 lfUU5Lk/VXik0TNu/vZOjRlboTD3PG46kTzxCeATkBHDcXZ+GYx7EcMW0WYR027yimoUnFyitD/o
	 zooNVPmxuPzfiiYQlRT1J/Jo87hJzrzEoH/N0U6Cw7L9aHI3fm+7vXD+U2eniN2FK8yDsRwDVUny
	 h7dSB3A7KgonUyoTohPst22KW/tKjHhCVr9wxpgSVhj0tTvNutRH9K+1r/3iqg37n5U5QGy1Bc0y
	 JWE1h6iY4WOZKIzJujn4eWxAzVwNkpwYxkws0ILCFYYmWY0YASuVMgPVXKPcpNezbkPOg740OySz
	 9zYB8lFia8DR+GkGi+XilTJ96GiLsv09TS7fizhNGgq5f/Q8X/kWFo9QQLkKJ2LiR6lhKOuxzZsw
	 vjBGnNCYaVeSU9EnxKABau2mom3px7gjtKbOIoBjQHsGOq1dlz9QK21DYckRQ5oxApknk8cigw35
	 h7rDI20dbE8cwT9SxJivsJ4jeKFSDQj48b5PZlo8HKJB64UgHcZce40cLHRzP19oRTvLHRKAo0f2
	 xLICq2503zJX+otPsJw1I99RiGBSyLczNR1dJvubipRyFsDq/1RNweUjz/R97CXVQNKt1Vr+8AJY
	 DSzyGldTHddLTDX6SG7ftH5nBVKrSQfWDrjGCiFb0xXNzjGJ1Gesprz9WTGwDEgaciTgE+CPst1U
	 0ySBqR2wk3DwWUXWTZ5QoKW3Ikr/y2UCSLTr2IoCOICV+YJ/w78JMyW0oxsqbv7BdKM1Jilg==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Yilin Chen <1479826151@qq.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH v2] rust: dma: remove incorrect safety documentation
Date: Mon, 29 Dec 2025 00:52:34 +0800
X-OQ-MSGID: <20251228165234.1974262-1-1479826151@qq.com>
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

Signed-off-by: Yilin Chen <1479826151@qq.com>
---
Changes in v2:
- Use real name in signed-off-by line (Kari Argillander)
- Link to v1: https://lore.kernel.org/rust-for-linux/tencent_7183098292B42248DA2FAE7C8EA39E3B1A09@qq.com/
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

