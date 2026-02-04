Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D42DF59;
	Wed,  4 Feb 2026 04:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770177912; cv=none; b=eyPIZO7pXNP90/KxllSusp66lX7cd5WZxxRScW560F6ujp0IQWyZuHetKZDjMrE2+IZQB+/oOizo1yRV5ML6vfroCF4AH2jOkjudmJV4hpTbjRQCgVovOBgPx+ZRPV5uVVxOmb9+AWejk/ZCGcafLEVXO1yxJ39LiK2Z41x/Y38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770177912; c=relaxed/simple;
	bh=EpLjaOcbANienieR9N3HwkiHmow2vTCp6Rmwyf+IOkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G8dvPHIsJIiopgwDFWBGPpGRUGjB9/pxlToohQmaNVGe18f0MtSywvu9TjlmkkWHk4LKzMfpMZIf4gVXKAVANp3kWVQYMrd//rUZTXNRNYlEOvOynLIVCaILmyevl6EMRcNixViKGtFcmtn7wJ0HPa13GTyPtiCz7w0vhNzJn+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 85448F43B32; Wed, 04 Feb 2026 05:05:07 +0100 (CET)
From: Link Mauve <linkmauve@linkmauve.fr>
To: rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	officialTechflashYT@gmail.com,
	Ash Logan <ash@heyquark.com>,
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v2 0/4] Add Rust abstractions for nvmem-provider
Date: Wed,  4 Feb 2026 05:04:57 +0100
Message-ID: <20260204040505.8447-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.53.0
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
drivers in Rust.

I made sure there was no unsafe anywhere in the driver, and tried to
keep it to as few places as possible in the nvmem abstraction.

I’ve tested it on a Wii, using a downstream branch[1], plus the PowerPC
support patch[2], plus a terrible patch to make libcore not use integer
division on u64 or u128[3].  I’ve tested that the data I get out of this
driver result to the same data as the previous C driver.

Thanks for your time!

[1] https://github.com/Wii-Linux/wii-linux-ngx/commits/wii-mainline
[2] https://lore.kernel.org/rust-for-linux/20260204030507.8203-1-linkmauve@linkmauve.fr/T/
[3] https://linkmauve.fr/files/0001-XXX-Unimplement-core-fmt-on-u64-u128-and-Duration.patch

Changes since v1:
- Add Rust helpers to read and write as big endian.
- Set CONFIG_RUST=y in the Wii defconfig.
- Drop the patch to document nvmem-provider.h, this can go in a latter
  series.

In the nvmem abstractions:
- Replace as pointer casts with .cast(), .cast_const() and .cast_mut().
- Replace NvmemConfig::set_*() with NvmemConfig::with_*() to allow the
  builder pattern.
- Expose devm_nvmem_register() on Device instead of in NvmemConfig,
  making it both more correct and more evident coming from C.
- Make it set priv, reg_read and reg_write, as those are managed by the
  abstraction.

In the nintendo-otp driver:
- Add missing RUST depends
- Remove unnecessary reference to pdev in the driver.
- Simplify the loop using while let instead of break.
- Remove unnecessary Drop impl.
- Adapt to the NvmemConfig changes.
- Use c"" instead of c_str!().
- Correctly read and write as big endian.
- Keep a pinned reference to the iomem, otherwise the driver will crash
  trying to access unmapped memory.

Link Mauve (4):
  rust: io: Add big-endian read and write functions
  rust: nvmem: Add an abstraction for nvmem providers
  nvmem: Replace the Wii and Wii U OTP driver with a Rust one
  powerpc: wii_defconfig: Enable Rust

 arch/powerpc/configs/wii_defconfig |   1 +
 drivers/nvmem/Kconfig              |   1 +
 drivers/nvmem/Makefile             |   2 +-
 drivers/nvmem/nintendo-otp.c       | 122 ---------------------
 drivers/nvmem/nintendo_otp.rs      | 127 ++++++++++++++++++++++
 rust/bindings/bindings_helper.h    |   1 +
 rust/helpers/io.c                  |  34 ++++++
 rust/kernel/io.rs                  |  18 ++++
 rust/kernel/lib.rs                 |   2 +
 rust/kernel/nvmem.rs               | 163 +++++++++++++++++++++++++++++
 10 files changed, 348 insertions(+), 123 deletions(-)
 delete mode 100644 drivers/nvmem/nintendo-otp.c
 create mode 100644 drivers/nvmem/nintendo_otp.rs
 create mode 100644 rust/kernel/nvmem.rs

-- 
2.52.0

