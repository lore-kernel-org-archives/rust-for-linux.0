Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8422734F48C;
	Wed, 28 Jan 2026 18:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624989; cv=none; b=tmqrHRiXTcSPqfhQH0nDYU1IDkedLNqlNZuSa6Nw4hjmGW0sizi3Z8AZ7ynXZCCsEwTl4+cajcnuF1GJ4E3AimcbC2QWgFwuNTmbC7/fKWWl19RPXWGOxu40egXgWk0ULfHvMnALqf05yJomRFgadu+AI4Xg28G0qroyS5V2UYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624989; c=relaxed/simple;
	bh=hOQdWEmiHCdfiuGONd25P8+hljLJRQ/iilyzawtcVbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jOfRv4m+0zyy6nXQVaKn9pm2VBpy+FC+klJH00o5EIUDC1k/KRoXE8LoNbn0B+m9UDZgfD+J3n2kxJeHNtAuJGvInmDelZEXn14ddr5XI1fTwvuDpio4UhqW/weFlLWvyW499YntfY86nmds6vbTMCcdv8QQm2lGnC2g5oWmHl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id BB6F4F43B19; Wed, 28 Jan 2026 19:29:37 +0100 (CET)
From: Link Mauve <linkmauve@linkmauve.fr>
To: rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] Add Rust abstractions for nvmem-provider
Date: Wed, 28 Jan 2026 19:29:19 +0100
Message-ID: <20260128182925.13225-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, this is my first foray in Rust in the kernel!  I’m fairly used to
both Rust and the kernel, but not yet to both at the same time.

I wanted to try something simple before jumping to more advanced stuff
like DRM or V4L2 drivers, so I set on rewriting one of my old Wii
drivers in Rust.  So far I have only tested that the nvmem abstraction
and the driver compile, but haven’t tested it on an actual Wii, hence
the RFC.

I made sure there was no unsafe anywhere in the driver, and tried to
keep it to as few places as possible in the nvmem abstraction.  I still
have issues with the mutability of the NvmemProvider::Priv type, so for
now I’ve made it a simple reference but I believe this won’t work in the
long run (or even in the short run).  I’ll take any idea for how to fix
that.

So, comments welcome! :)

Link Mauve (3):
  nvmem: Document enum nvmem_type and its variants
  rust: nvmem: Add an abstraction for nvmem providers
  nvmem: Replace the Wii and Wii U OTP driver with a Rust one

 drivers/nvmem/Makefile          |   2 +-
 drivers/nvmem/nintendo-otp.c    | 122 -------------------------
 drivers/nvmem/nintendo_otp.rs   | 137 ++++++++++++++++++++++++++++
 include/linux/nvmem-provider.h  |   8 ++
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/nvmem.rs            | 155 ++++++++++++++++++++++++++++++++
 7 files changed, 304 insertions(+), 123 deletions(-)
 delete mode 100644 drivers/nvmem/nintendo-otp.c
 create mode 100644 drivers/nvmem/nintendo_otp.rs
 create mode 100644 rust/kernel/nvmem.rs

-- 
2.52.0

