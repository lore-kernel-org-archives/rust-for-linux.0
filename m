Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D4527B4FA;
	Wed,  4 Feb 2026 20:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237662; cv=none; b=HwnwwaKoPuO+JMGtW0/lfRpeaYMv5onAhMngtW7UMfnjNoq2LvKpvZovGD5+/6k4nzoOKdJE0K8+yXIkNoJ6H8eXwkzLpWsvkklwx/2O6s02/fB3CFdaZIX7wCgohJNehC8rZHYr7RyB/Jtt1AM/ZwHYxTVV0kzqRJIsEcBwVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237662; c=relaxed/simple;
	bh=OlPhLcGYTAuBE6POmmJ8ZSa5o4np/3WB0V8zWL+WSnk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uFBYMhEdwGLTQxKbTI7BT81AOqkn90RxY8t6X9TrtFjFIv/AKW8H48Wqx1xdYRdZi2rs6VyWg9pbb3Yha6cXkZas5tOxZfvydx3d5h38fXLeXoDGt+W5kiHilOdPDnN0/J936JpjPRh9ywE7rvxvO1uDfQp2CQDewAhV5Munutg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T/Rf+ae3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T/Rf+ae3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770237660;
	bh=OlPhLcGYTAuBE6POmmJ8ZSa5o4np/3WB0V8zWL+WSnk=;
	h=From:Subject:Date:To:Cc:From;
	b=T/Rf+ae3/U36gyqFaQGv5IQAiyPX8dBuGVGT5tf4pF46io9ZADRWWKUoGrx7U4BbF
	 iL0yuBY3sq8eehE2fE41rBrTkoijFva+YUIt3yDtOay7/vnOOFl2n8z/9FQ/DLfIQ/
	 DMZ5cr/C6QsYlcDWyxdtI/m3JaMFrrZ04Lu0YG6WiOS5Y8vtktYoNXbVambNhgR2DG
	 Lrcqgi4Fwqff+AoY/6If5fXHv0Sh6NmcEa6l55MvrRVKprG/R7ZYVB0qzDFD0xufgk
	 FmvsYi7U3f+YFcZqfnJXWKQH0SxtqhvWutFsZOrcOHd3uySEk2GWCaM1/Mf6HQypWp
	 nFi7iSFdSIkvg==
Received: from [192.168.0.79] (unknown [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34E9D17E0E90;
	Wed,  4 Feb 2026 21:40:58 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v2 0/4] rust: Add ARef support for work items
Date: Wed, 04 Feb 2026 17:40:38 -0300
Message-Id: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMaug2kC/3WMQQ7CIBBFr9LMWsyAorQr72G6oDjYiW0x0FRNw
 93F7l2+//PeCokiU4KmWiHSwonDVEDtKnC9ne4k+FYYFKoTSqmFjeTFK8QHzzQK9PpMR98Z6Sw
 U51lefm+9a1u45zSH+Nnyi/yt/0qLFChqYw6E6FFjfXFhGGwXot27MEKbc/4CyfYExa4AAAA=
X-Change-ID: 20260115-aref-workitem-0f57e4fb81ca
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>
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

This is currently based on v6.19-rc8. I hope we can land all four commits
on a single tree, but otherwise let me know whether I should split the
workqueue.rs changes from the drm::Device ones and rebase accordingly.

---
Changes in v2:
- Rebased on v6.19-rc8
- Cc workqueue maintainers
- Patch 2 kept the old import style, since drm/device.rs is not yet
  converted.
- Link to v1: https://lore.kernel.org/r/20260115-aref-workitem-v1-0-9883e00f0509@collabora.com

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
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260115-aref-workitem-0f57e4fb81ca

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

