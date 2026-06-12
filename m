Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE6E32ED4E
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 19:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293612; cv=none; b=qlAtWlnyG3yq+5yf5MgsPB6+Ski1M1Z6wme57I02+VJ9d9TLzixCVXZFfqiLUXo4wwjGO4tDpJklKjfA6RqgyyFDhw+IGpKnaIT/ATd3BWFASIWHm+0xU1+1rVZqu8jA8vHtk8CgL0j9Hz6MlEXuUHHU7W6nvImnrc78K9ZNrqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293612; c=relaxed/simple;
	bh=jTXah5NtgD4yKwoczBhx9ODMTZIMNCjttyn6n1H+9EA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WPR+Uz79RzAJvgjr0M7DRz6tsMlK+fACSMW6ogETGeYmGV04+1abihZ9+423KipHMGKdnLGAhRSeYZxqvZS3o29wFkAL45AwK7d5idkcnDQi5Wo59m0G3d+nocpR8FcvwrMUt3SviWDAEJAt9NTLxXiNKg5g4pZOr8USt9IP+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=iTOsGUp/; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="iTOsGUp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781293601; x=1781552801;
	bh=Lm3Eb4XxHdBOwXiFYoMrxufsurAFwb8OxwEIYGKjisw=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=iTOsGUp/S0sk7zwoLjxjoKXDWNsYCQMXx4Pd4HNgUIKDQXmfmlOlQLZEgfXXt5P7O
	 QRjYzM4BI9gAjA07wLq1nOvXIo6Y5TVyjuK2Tj8E6Ro1lbmfBGhmL4iTheqaQlzvxK
	 Jk/M/xHFyyFmHrBZkhpuucwtPwb2ZgrD9tj8ubNm1RGNrEkvEgxrOkMM/fgEHz+Vkk
	 Pnv1HoHJwQjoY84zKLwqgKtJOp4AiQmwNW39wkzexRs0PhwLh4lCsudMu+1ki3fRv/
	 meZiHr2d7G9eF0F2VlVNq5wdyzAzqbxLVziYowYEl7XdPaMRuXu8eLolVmoYjpAFil
	 SxKXlzLmlBwhw==
X-Pm-Submission-Id: 4gcVQ52hjNz1DDLM
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@kernel.org,
	daniel.almeida@collabora.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 0/1] rust: workqueue: add cancel_sync support
Date: Fri, 12 Jun 2026 22:45:41 +0300
Message-ID: <20260612194633.350011-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes since v1:
	- Created SupportsCancelling trait for from_raw_work function.
	- Removed from_raw_work from WorkItemPointer.

v1: https://lore.kernel.org/all/20260510082211.207450-1-work@onurozkan.dev

Onur Özkan (1):
  rust: workqueue: add cancel_sync support

 rust/kernel/workqueue.rs | 116 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

-- 
2.51.2

