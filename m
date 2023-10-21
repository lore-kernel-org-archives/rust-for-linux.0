Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA273D291
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Oct 2023 18:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Smf8TAyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74927C433C7;
	Sat, 21 Oct 2023 18:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697912009;
	bh=gzjUjx2WGvm2QpBdpcflVOOF+V0AaHW/vxI6GqWUntI=;
	h=From:To:Cc:Subject:Date:From;
	b=Smf8TAyxjlqJdoUn1ElF6enMEajnSOa+bkEiiO8kQOlWwF7MbLRMXH5zsyEyAWpmu
	 EBiJMilevSYrwJVmkm0RANt2Aa4kbz2Oaws+njlUJncJ4N8du+ymC1853DC+c53aaH
	 3/xJQk5jQzjxozIu417+eqsgTizPn05i7zA6uv8AyQbKW4yrtYU6aguyPZetWJfRhB
	 KYpJ/aHXuS3Eo4v7Gu0LtSDHlEsP6R47f25oDhbNoN9tCpovk5A94aryzJ50l6EUGJ
	 0673gb1Ggx9pXFr/9n2RtZR8xehyQvZMM7moNR+HDGmowN3TXEdT1Hz/idInnsEcxv
	 BuatpBjipVbgg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 6.6
Date: Sat, 21 Oct 2023 20:12:59 +0200
Message-ID: <20231021181259.10931-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

The last three commits have been only a single round in linux-next, so
perhaps they should stay a few more days there, but I decided to send it
already since they are simple and do not touch anything critical.

No conflicts expected. No changes to the C side.

Cheers,
Miguel

The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

  Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

  https://github.com/Rust-for-Linux/linux.git tags/rust-fixes-6.6

for you to fetch changes up to cfd96726e61136e68a168813cedc4084f626208b:

  rust: docs: fix logo replacement (2023-10-19 16:40:00 +0200)

----------------------------------------------------------------
Rust fixes for 6.6

 - GCC build: fix bindgen build error with '-fstrict-flex-arrays'.

 - Error module: fix the description for 'ECHILD' and fix Markdown
   style nit.

 - Code docs: fix logo replacement.

 - Docs: update docs output path.

 - Kbuild: remove old docs output path in 'cleandocs' target.

----------------------------------------------------------------
Andrea Righi (1):
      rust: fix bindgen build error with fstrict-flex-arrays

Manmohan Shukla (1):
      rust: error: Markdown style nit

Miguel Ojeda (3):
      docs: rust: update Rust docs output path
      kbuild: remove old Rust docs output path
      rust: docs: fix logo replacement

Wedson Almeida Filho (1):
      rust: error: fix the description for `ECHILD`

 Documentation/rust/general-information.rst |  2 +-
 Makefile                                   |  2 +-
 rust/Makefile                              | 16 ++++++++--------
 rust/kernel/error.rs                       |  4 ++--
 4 files changed, 12 insertions(+), 12 deletions(-)
