Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8D13845A1;
	Mon, 23 Mar 2026 23:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308467; cv=pass; b=o9RWzJvDqf3quoXq9sv+JuAkyToS04ZbdnGgWOcLNaE1483QuNpLkhFRg23D+8sWPBLjtFCZLtHPVSBDUFCC1nLUsxVe4xN0NhFN9wOBseecWmOJ54JoWJs2EL+nLXs46oETnKIUw/0C1PgG977+0+kjUwW2EqpduTCpySJYtqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308467; c=relaxed/simple;
	bh=NhmYjYSjJerqBMDe74vjZ1o8An9j2GmboBfhHUJArpc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nv236c0J7WUCGfKxX+Gdi98uEf9/j6eGToyuAw3Mmxoyk+1xcbVI0sngIPhSdyKJQkcM0rvq2mboXmS/fUPubQm2S8LkM8fNOeAs5QUiUVMuFWDTMeSLcRjruTjbws8Snh50vaSz4Qug5lEKs7HN0uFzg3zBxBgwjZw0FsLruJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=AK9DUsJb; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="AK9DUsJb"
ARC-Seal: i=1; a=rsa-sha256; t=1774308450; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h+dO8cWgKhEWwHUk+6Ypnh0HcW/icCMQf8cp1oYr813yB1jdtEj12X0aA4r4G+EM/wstm7ez01JSIsRv+nxVwH2kNtS+ufTHgKoJS3SCCUstCLd1LRgu6dr7sDDDwlIK6asnDrHRpN+JBxE2MIGSurOROaP2EQegFf4PVrRXvHU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774308450; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YrJBAP7z3Eve6M8Okky7j2Nvy/tTyRXC5sGNXnJ/Bzw=; 
	b=OaZ09Xz+oPCnLBV98T9SwdrskySKp/b4DsFSiB/ZvrTbhlM7iWWh7NfbTx0I+v6Mo6IY4QJ6rzXm/iQB7xIxvoLgG/+Ued46yxzIcH7kNnt7z7pg8GefFSmROUvAc7a+S4JC/l4OTuHvPVC0DeUF3AO/61acAz5zBbAzGx6ssY4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774308450;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=YrJBAP7z3Eve6M8Okky7j2Nvy/tTyRXC5sGNXnJ/Bzw=;
	b=AK9DUsJbZcCr6r7ix9NRZSjiGn503pgxSxzbZC0GHV+dpLZHIMGAmVyZUopzNpiM
	oCcWYiEcLhgEEdJfcpFrYX1GVZoU7ePUVTJG624Fs5m1+PtT1ih83SBh77QOuuJYa89
	vjX8+FZ3aStXRfLS6IgNmwxAeAnWvk9pl64hl2Rk=
Received: by mx.zohomail.com with SMTPS id 1774308448556785.1866483968992;
	Mon, 23 Mar 2026 16:27:28 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v3 0/4] rust: Add ARef support for work items
Date: Mon, 23 Mar 2026 20:26:58 -0300
Message-Id: <20260323-aref-workitem-v3-0-f59729b812aa@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ6CMBCF4auYrq2ZDlTBlfcwLtoylUagpiVVQ
 7i7hY0Jict/Ju+bWKTgKLLzbmKBkovODzmK/Y6ZVg134q7JzRDwCEJIrgJZ/vLh4UbqOVh5otL
 qShjF8uaZv+69etdb7tbF0YfPyiexXP9JSXDgdVUVBGBBQn0xvuuU9kEdjO/ZoiX8CQjlVsAsa
 DIoNQhsUG2FeZ6/1QpYBvAAAAA=
X-Change-ID: 20260115-aref-workitem-0f57e4fb81ca
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
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
X-ZohoMailClient: External

This series adds ARef<T> support for both regular and delayed work items.

- Patches 1 and 3 actually implement the support in workqueue.rs
- Patches 2 and 4 adds a corresponding implementation in drm::Device that
  dispatches the calls to the underlying T::Data.

This was tested on Tyr, and is actually needed in order to obtain a
&drm::Device when handling work items. This is then needed in order to
allocate GEM objects inside the work handler that processes the tiler OOM
(out of memory) events. The current series sets the stage so that the above
is possible in the future.

---
Changes in v3:
- Rebase on rust-drm
- Pick up tags
- Fix import style for drm/device.rs changes
- Link to v2: https://lore.kernel.org/r/20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com

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

 rust/kernel/drm/device.rs | 69 ++++++++++++++++++++++++++++++++--
 rust/kernel/workqueue.rs  | 96 ++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 156 insertions(+), 9 deletions(-)
---
base-commit: 55fd681cdd8599edc82013674cbf87c2f22d58f8
change-id: 20260115-aref-workitem-0f57e4fb81ca

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

