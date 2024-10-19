Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E951DE4CE
	for <rust-for-linux@vger.kernel.org>; Sat, 19 Oct 2024 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327276; cv=none; b=L+izHBM0y6pLlBSqATyw4cmaQNliFIQ0hLtSHnpaPpiKZWatXlgIFuWDxXwohxXfr4AkMzA0o+uTORXfAzcSRRLUngONPTisAHH0PZGfO/xaeM4PJPGycK6ROjBjt9/WFxBS8Pio3yzxJEOmtcEP3mruhDW3cgOGaMkeI+fp1VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327276; c=relaxed/simple;
	bh=6WkRiTW6hxrOkXkyZUPVV9ShUISdUKz0rcrZcsQkaX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TXFfqL5dI04okcO2gRjmp/hmdn0Y/p8E2M9Op2sZPknFemV854uKXwoDdUvhZhdo26Zx7XHOF9p042gGKw40XiCxg9j7nrREQ3mBxYgvjtcJT5oDV4fhYB6eI86sKFpHJuPH/hCmk7XCoqARVHrmE11Hvw6mpwmNKWI0PBEoJwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de; spf=pass smtp.mailfrom=wiredspace.de; dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b=Vy+O6DGU; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b="Vy+O6DGU"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
	s=key1; t=1729327271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bbAs0TRfliKVT6GU9TEAPy0g/6tMD6uUNyQ5bBgcgz4=;
	b=Vy+O6DGU3TETIO1c+DK7b3WRhznZrucfviXFE9izV77hP7ZEQYbf3TTLkcEVCd6F3DGPGc
	mfr7VPWpXMJPVaTqQeEyE5nwUrMsz6dYL8KdA4DhibIf7rxcb06qYG0KXLZ38SV3cICsGr
	lVTz2nWa99Ao/ogvJqsQNk7VE9YZSH4=
From: =?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Jocelyn Falempe <jfalempe@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>
Subject: [PATCH v2 0/7] Cleanup Clippy issues in drm_panic_qr.rs
Date: Sat, 19 Oct 2024 10:22:45 +0200
Message-ID: <20241019084048.22336-1-witcher@wiredspace.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The file drivers/gpu/drm/drm_panic_qr.rs has some lints that Clippy
complains about. This series cleans them up by either allowing what is
written or conforming to what Clippy expects where it makes sense.

All explicitly allowed lints are marked with `#[expect(...)]`.

v1 -> v2:
- Add "Fixes" trailers and rename "Closes" to "Link" trailers as
  the patches all fix part of the issue.
- Replace `#[allow(...)]` with `#[expect(...)]`. Support for `expect` is
  already in rust-next, which is where this series will be merged into.

Thomas Böhler (7):
  drm/panic: avoid reimplementing Iterator::find
  drm/panic: remove unnecessary borrow in alignment_pattern
  drm/panic: prefer eliding lifetimes
  drm/panic: remove redundant field when assigning value
  drm/panic: correctly indent continuation of line in list item
  drm/panic: allow verbose boolean for clarity
  drm/panic: allow verbose version check

 drivers/gpu/drm/drm_panic_qr.rs | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

-- 
2.46.2

