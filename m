Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2032F49F6;
	Sat,  9 May 2026 17:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778346295; cv=none; b=WDgLjWIUw9XTyzgmsrEWWb4pZk4MrpR7jL68jRPpCJSyp7ftlP8Dz48G4keG3zOBVvVOCWBgq4VE/OdNmPtHTjZ2BJRddw1sLmUxArIsMmnsmcoVi/BVP30GbgpfHi8na+9tg58Prg97T7g6tn1jj5GCyVW6sCjtPMc6SnTUOSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778346295; c=relaxed/simple;
	bh=Fp1ATIIeCTaZHBJgxIo+7SHy27dt3xWnNv7bHekIz9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sVG5dpfc0LAaFlVcCT3otJwDQofs2tZXFLavQJ9nt6cC5XYlWNyGnGJV3KpV+Q8PTVtyr9MCPjQfg6fdgFSzfVa+OVjH92qvZlFZE1AV0d6zuOQSdPKA6T0vpXEdny8s3JDVATzVfY8dn9QMElKYM9NHDUZ8sUcUzU6CR+bXHGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDBe1mda; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDBe1mda"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8F0C2BCB2;
	Sat,  9 May 2026 17:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778346295;
	bh=Fp1ATIIeCTaZHBJgxIo+7SHy27dt3xWnNv7bHekIz9M=;
	h=From:To:Cc:Subject:Date:From;
	b=MDBe1mdaZPaP3mXf1Z3WZeW3nTGLZDhnDypAQf+nNnskyxIZ5TlWYke6qV1T4kTGO
	 PaREaXTpLY3IIBygZgq3kZNSkYClDOVVhflH1MZ5wKvNglKNEHZxvAClZ9NojbD0e0
	 Bg3QigzU8u7bawgJaXlczcg4nLEHI1vT/vWGch7o5BiPrioQUnWrkgPiUyDlUZvuHa
	 Y6kuarGCPMlFCpMpo5wQsTtrIEKH3zMSuKn4W1nBJ46VOSPoc+jt2+QIMYibwSZws+
	 ZbAN+1aNJ4ucGpgTuJwaZBXE3Tu3QPy5V2HI77349yD2GRJf9NAajq05EAOvwe586M
	 soTE2eLWEJoIg==
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
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 7.1
Date: Sat,  9 May 2026 19:04:12 +0200
Message-ID: <20260509170412.45089-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

They have been in linux-next this full week.

No conflicts expected.

I will likely send another fixes PR later in the cycle.

Thanks!

Cheers,
Miguel

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.1

for you to fetch changes up to 2adc8664018c1cc595c7c0c98474a33c7fe32a85:

  rust: allow `clippy::collapsible_if` globally (2026-04-30 23:21:31 +0200)

----------------------------------------------------------------
Rust fixes for v7.1

Toolchain and infrastructure:

 - Add 'bindgen' target to make UML 32-bit builds work with GCC.

 - Disable two Clippy warnings ('collapsible_{if,match}').

'pin-init' crate:

 - Fix unsoundness issue that created &'static references.

----------------------------------------------------------------
David Gow (1):
      rust: arch: um: Fix building 32-bit UML with GCC

Gary Guo (2):
      rust: pin-init: internal: move alignment check to `make_field_check`
      rust: pin-init: fix incorrect accessor reference lifetime

Miguel Ojeda (2):
      rust: allow `clippy::collapsible_match` globally
      rust: allow `clippy::collapsible_if` globally

 Makefile                                    |   2 +
 drivers/android/binder/range_alloc/array.rs |   1 -
 rust/Makefile                               |   2 +
 rust/pin-init/internal/src/init.rs          | 184 +++++++++++++---------------
 rust/pin-init/src/__internal.rs             |  28 +++--
 5 files changed, 107 insertions(+), 110 deletions(-)
