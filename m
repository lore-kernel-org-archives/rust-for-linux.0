Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FED188CC9;
	Fri, 16 Jan 2026 00:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768523766; cv=none; b=n4/cax/zXRHB5Od8AzKXKOi2rl2Hzxqsc8IvRVm4tRG6X8TbFTg3OO8H3GB5am0KgXRv7JO3C9ydVzAZ0bx5EU+6buFC5tXcqHAzSci+nei/m49aFozFAAqzNsKHAtoEJ+Wer9Ht7QRd4Hfk7h8444sXvHT5U3ptHXNPZgTzZ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768523766; c=relaxed/simple;
	bh=E+ekq3M7DK/UcfRaVUQRzGbW3dunWhCit0SKY6nqEyg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iqs2qsLLv1cEHMnjeYnLuYWCK44BVExtD8DxHAwWrlYUlYrLLVsmMQAivM4i5kxyC7W5NPrHR7uw8+RcoJpg/Kjn5xScUvTr8I9mBLmRbmhSXqA8hIS+WIpEr/V1Xv2Qg31RygHL/AepSRxysSqwNvhlv180PPTF2SP/tP45Dzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bHfqrQdE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bHfqrQdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768523763;
	bh=E+ekq3M7DK/UcfRaVUQRzGbW3dunWhCit0SKY6nqEyg=;
	h=From:Subject:Date:To:Cc:From;
	b=bHfqrQdE1WGwOpXNIvHjOQcJEDLG4ohndq2hePP/J2IIck8iITLyjz1e88tu6a+Ig
	 sZFiajmLam3kyXSa8DuZQUzShB70oiNeVRaV20cGLb6aVCdprZYWNK802knnB6rM2b
	 NPxr3EQGdnYKJUUkx8ze8QUrovSxOsvgnKebQp0DufRTJ3TgYJeW0YGiOeJFU6T6Z/
	 jZ1VJ85hSNjOgNLMG0fPy/0dSQ0refrO52Ijx+Nw9B1BplOldE+f6l8QU9Dz5viAVS
	 z9Kh3Rr7HaAtSlrQzLeQIkxMo9XPNifMOBZXRME+8DDtthZg9/v+TenLcTq9UgdRUe
	 O6YnQjhF1JZUQ==
Received: from [192.168.0.79] (unknown [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB3D117E12FE;
	Fri, 16 Jan 2026 01:36:00 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 0/4] rust: Add ARef support for work items
Date: Thu, 15 Jan 2026 21:35:56 -0300
Message-Id: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOyHaWkC/x2MQQqAIBAAvyJ7TlDJir4SHczWWiINjQqkvycdh
 2EmQ8JImKBnGSJelCj4ArJiYFfjF+Q0FwYlVCOk1NxEdPwOcaMTdy6cbrF2UyetgdIcxdLz/4b
 xfT/hWnKiXwAAAA==
X-Change-ID: 20260115-aref-workitem-0f57e4fb81ca
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.3

This series adds ARef<T> support for both regular and delayed work items. 

- Patches 1 and 3 actually implement the support in workqueue.rs
- Patches 2 and 4 adds a corresponding implementation in drm::Device that
  dispatches the calls to the underlying T::Data.

This was tested on Tyr, and is actually needed in order to obtain a
&drm::Device when handling work items. This is then needed in order to
allocate GEM objects inside the work handler that processes the tiler OOM
(out of memory) events. The current series sets the stage so that the above
is possible in the future.

This is currently based on v6.19-rc5. I hope we can land all four commits
on a single tree, but otherwise let me know whether I should split the
workqueue.rs changes from the drm::Device ones and rebase accordingly.

---
Daniel Almeida (4):
      rust: workqueue: add support for ARef<T>
      rust: drm: dispatch work items to the private data
      rust: workqueue: add delayed work support for ARef<T>
      rust: drm: dispatch delayed work items to the private data

 rust/kernel/drm/device.rs | 66 ++++++++++++++++++++++++++++++--
 rust/kernel/workqueue.rs  | 96 ++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 152 insertions(+), 10 deletions(-)
---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260115-aref-workitem-0f57e4fb81ca

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

