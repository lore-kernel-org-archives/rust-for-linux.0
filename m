Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296886;
	b=QYgIuByj0S6V1UTdmKrhqopYaOIAf9LswHKxIXoAjE/kOpGQp51SxYEwe9UcPpITRyTx
	 0FEwRQlZhGC/TwJyvUyvWIDHOAF32clkr754gN2XFLpklqhW1/s8sXNICrhGMun68moWp
	 iR/RNw/VOdIcluM+SDdYbLw5L5rmVIRQYwCGqKGYnFJOHBYwFnc9MJ5iQPDd38PUF1VJl
	 bArhjoiWp2qXm6u2eajl+9n0Fj3fmyNk9GdWKvBfeihMr/QxnSKTJkPCFJe9a+/B10amy
	 BkemxNcwlbuhcJ5U601LDUWOKz3zzT8avhJKRrWnOOqEq+T+dB7gXS8PlneMVBj3pGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296886;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A/g9z/XctHfO8WXiglIzsuOpbKuFQLfAJ8l3zMGOhsw=;
	b=K3UUdTcmvdUIJqXnpFYQuFQN/qGkDFWHVbMZiJZ3h00UausBxJD2N+u9dVvVxlOKT9AY
	 ze4kt6keKrBOuDmEAHcMSGLvxVfHwy0znRQrauESHz6r7mRxQgqzdifwHB7hsNKf8JzZ5
	 XPYtmLuJ3khWSoSYdTarRUKtYmKA/cZXW90OPe1llBM8mYrdnW/xCeEBZ69uXXZHPNMxe
	 A0AtlftKFqjK7Zwcia09XCgFp9d+BwihQZwXtW6isIbKA66tG1cLjRvS/Rr9LHnJcgH0j
	 iGbOzwmRZ1fRKDNbQ/C9QIwoMgWAggy6RH/yUbWORN9DGX+PplydxLWKbdCFG0Wd8DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JMjplqzE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E738B606A31F;
	Thu, 29 Oct 2026 18:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JMjplqzE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237C71F01824;
	Thu, 29 Oct 2026 18:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793296885;
	bh=A/g9z/XctHfO8WXiglIzsuOpbKuFQLfAJ8l3zMGOhsw=;
	h=From:To:Cc:Subject:Date;
	b=JMjplqzEBVMowXa2Z1I6OH6Gr7jUmYEq1rbScgrTo+q60p4ccpczt/SGDc+SpYcOW
	 LhiWwwp0nUWyya/fQqI6pNI+lxejjrqQ2FXDzzW5q62L9Hfsubut//skks0mvLG6yd
	 A57nhnQ9mzkThBBSNLtegdUeUG01SocE2ubaOTka9HH4tltmJ/85PsA6t/8TY0JMHY
	 xd0thaTidSLz+JZfi/YnjpwJKwJ/PCoYTbkCeV3XqoYcFdq64inmLdY/2fbomBJubT
	 SDxn7JmnukZNlwnoXmY+StZ9McK6lB+7axIlA700s3haH2VCLno4jw3HOQn0s3NP8p
	 UTGqfKdLz7IVQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 7.4
Date: Thu, 29 Oct 2026 19:01:16 +0100
Message-ID: <20261029180116.49074-1-ojeda@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

They have been in linux-next for a week.

There is a trivial conflict -- the resolution in linux-next is good.

Thanks!

Cheers,
Miguel

The following changes since commit c03c1a14507dfaf8b856c2608f9ac216021fc222:

  Linux 7.3 (2026-10-18 13:14:58 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.4

for you to fetch changes up to 7d109178cd644268326cd31702ed46c7ac8bb300:

  rust: dma: declare cfi_encoding for dma_data_direction (2026-10-22 15:36:01 +0200)

----------------------------------------------------------------
Rust fixes for v7.4

Toolchain and infrastructure:

 - Fix 'objtool' warnings for the upcoming Rust 1.101.0 (expected
   2026-12-24) by adding one more 'noreturn' function.

'kernel' crate:

 - Fix KCFI failures on every call from C to Rust IRQ handlers and
   'hrtimer' callbacks by giving the C enum bindings the correct
   'cfi_encoding'. Also prevent the same issue for DMA callbacks
   taking 'dma_data_direction'.

 - 'workqueue' module: fix a runtime warning when queueing work on the
   deprecated 'system_wq' by switching to 'system_{percpu,dfl}_wq'.

----------------------------------------------------------------
Danilo Krummrich (1):
      rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq

Miguel Ojeda (1):
      objtool/rust: add one more `noreturn` Rust function for Rust 1.101.0

Sami Tolvanen (3):
      rust: irq: declare cfi_encoding for irqreturn
      rust: hrtimer: declare cfi_encoding for hrtimer_restart
      rust: dma: declare cfi_encoding for dma_data_direction

 Documentation/rust/testing.rst                    |  2 +-
 Documentation/translations/zh_CN/rust/testing.rst |  2 +-
 drivers/android/binder/process.rs                 |  4 +-
 rust/bindgen_parameters                           |  6 +++
 rust/kernel/dma.rs                                | 21 ++++-----
 rust/kernel/irq/request.rs                        | 28 +++++++-----
 rust/kernel/sync/completion.rs                    |  2 +-
 rust/kernel/sync/lock/spinlock.rs                 |  2 +-
 rust/kernel/time/hrtimer.rs                       |  6 +--
 rust/kernel/workqueue.rs                          | 52 ++++++++++++-----------
 tools/objtool/check.c                             |  1 +
 11 files changed, 71 insertions(+), 55 deletions(-)
