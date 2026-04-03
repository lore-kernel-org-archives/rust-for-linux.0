Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCE8346A1E;
	Fri,  3 Apr 2026 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214427; cv=none; b=RkxeZ0OFdxieXMdhJJBZlDALpw/UGLa5kapF0QHK0PreJq/f5FLX2zqywv1k2b5nwcmoplRbPsnJgiyb+0ifYV4Yt1FY1sMmdM1rMPHH00dNf3p8TfSB7/JveQp0pBFnSvU8QbGF5Ciyoc1seev8h9T/U70gInePWHgxlKYOtL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214427; c=relaxed/simple;
	bh=kGjTkENdy7q+OeO2qD7i5AO0Twg8psQ5VZ2hFy8EUUg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NVI1a2rrH4c0A7cvVBqbcRLfWOdjVv6lR9loDBqjq1AzGgOXe754YyV/7jtMp1lsiAM4SWtReCXrwtzhiZdzYiMmPYGcyciMa50tvKXdFNIlXd9VX6ck/G17Lu5xRH6SsxHBTq2YsdgV8W/GF5Zy6buDrtybAZgufO/DivwoWbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIGJ3O6T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIGJ3O6T"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A50AC4CEF7;
	Fri,  3 Apr 2026 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775214427;
	bh=kGjTkENdy7q+OeO2qD7i5AO0Twg8psQ5VZ2hFy8EUUg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=vIGJ3O6TfpNos9sBXEyde4JZZYmkRm9ET00c+pHXCs6b/8PFKNglcLGq2LBsU658b
	 aB/7skniJLFs+gu/hevnledsHcDexX5wL/T64fJq8E1XuaNLPe9SxmUeKQr8Kjhbn2
	 QExwMafw6CkVucR4nTGwCyzQJjMNMRSWqKugh1VkBJ6kiNIZo/7E539bMdUSeqtY6j
	 /v5RAJnYcFYzQd1Nx9VEeqt617701X03Ax3bJhl1wpze5mMFfnWwqnUuEEGzpiPSkb
	 izxvNkdk4D7Lu3AsVKQWOyIbJBSNiV2HBljGjBpU7URYHmhY1oUthZMt6liTz3sNNE
	 inYoRE5vWetvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C85E7E36D;
	Fri,  3 Apr 2026 11:07:07 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Subject: [PATCH v3 0/3] rust: workqueue: add safe cancellation and status
 methods
Date: Fri, 03 Apr 2026 16:37:04 +0530
Message-Id: <20260403-workqueue-v3-final-v3-0-6ffc3950d804@multicorewareinc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFifz2kC/x3MQQqAIBBA0avIrBsQDYOuEi2sxhoKLcUKorsnL
 d/i/wcSRaYErXgg0smJgy/QlYBxsX4m5KkYlFRG1lLjFeJ6ZMqEp0bH3m7obC3NRG4wzQgl3CM
 5vv9p17/vB5qje3ZkAAAA
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aakash Bollineni <aakash.bollineni@multicorewareinc.com>, 
 work@onurozkan.dev
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775214425; l=1788;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=kGjTkENdy7q+OeO2qD7i5AO0Twg8psQ5VZ2hFy8EUUg=;
 b=U5o+s463TSUeUoNOKa0O5zwWQ2idkBezsyuWRy8QsLH0Q3o+9/EzOTx0cz5V8XbIKIF+HUeP8
 dIDCJZbkekYCujYdEGLXPTP6jrE5lZOKJfRkgqR2b+FaIQGUBA8edlp
X-Developer-Key: i=aakash.bollineni@multicorewareinc.com; a=ed25519;
 pk=r3Gonl+2k+8RozN9U/XwfICQdnRlAcLeeAfsExmurdE=
X-Endpoint-Received: by B4 Relay for
 aakash.bollineni@multicorewareinc.com/20260402 with auth_id=711
X-Original-From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Reply-To: aakash.bollineni@multicorewareinc.com

This is the third version of the patch series for modernizing the Linux
kernel Rust workqueue infrastructure.

Changes since v2:
- Fixed a critical initialization bug in the DelayedWork C-helper where
  the timer function was not correctly registered, causing KUnit crashes.
- Consolidated Arc refcount inspection into a shared `arc_count` helper
  in `rust/kernel/workqueue.rs` (gated by CONFIG_KUNIT).
- Updated internal KUnit tests and sample module to use the shared helper.
- Split the sample test's `TestItem` into `TestWorkItem` and
  `TestDelayedWorkItem` for clearer trait dispatch and safety.
- Integrated the sample stress test into the kernel build system via
  the SAMPLES_RUST Kconfig.
- Improved documentation and safety comments based on feedback from 
  Onur and Miguel Ojeda.

Aakash Bollineni (3):
  rust: helpers: add workqueue helpers
  rust: workqueue: add safe cancellation and status methods
  rust: workqueue: add KUnit and sample stress tests

Signed-off-by: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
---
Aakash Bollineni (3):
      rust: helpers: add workqueue helpers
      rust: workqueue: add safe cancellation and status methods
      rust: workqueue: add KUnit and sample stress tests

 rust/helpers/workqueue.c            |  32 +++
 rust/kernel/workqueue.rs            | 473 +++++++++++++++++++++++++++++++++---
 samples/rust/Kconfig                |  10 +
 samples/rust/Makefile               |   2 +
 samples/rust/rust_workqueue_test.rs | 186 ++++++++++++++
 5 files changed, 668 insertions(+), 35 deletions(-)
---
base-commit: bf074eb6891be799174ff42e0051492681fdc045
change-id: 20260403-workqueue-v3-final-fa406defb67c

Best regards,
-- 
Aakash Bollineni <aakash.bollineni@multicorewareinc.com>


