Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085AD2D190C;
	Fri, 14 Nov 2025 22:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763157995; cv=none; b=tbhQaODv5sTtvbbczjcUDEwHdFsaGGxcFa8J0tvIeb9goeNrzB9nODhxo+Lk5ow42oBej1ne8qGZZnVdT9gw6HSb10fsBjSWwW22e97VBLYeCqjwJxxKWGv6iU3meQD3vKJCTql7FgvDQPIRqTwWNLKFkULW/5r0Bt8JJFotOuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763157995; c=relaxed/simple;
	bh=tdWE3PfiItoZ0byjeyGpawmZ8YiU4Uy2fv+ZMIRH5do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uTjJfsY7mu15Wlbhy8o4N3yfowQZu+ZelqtqSSx9DioDd1Q03fVUz2eKNAjzPnLF8cgOMOE6vvF3nWa37/4NdMvpwsci5108hAEUXkglvvzISSXEagnAcwbjt+uI4Er6ledJcNiZw0GAcTunjk9tMXLpoDJ303jtniY5nTlGw5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXa5my+f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXa5my+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2271C19424;
	Fri, 14 Nov 2025 22:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763157994;
	bh=tdWE3PfiItoZ0byjeyGpawmZ8YiU4Uy2fv+ZMIRH5do=;
	h=From:To:Cc:Subject:Date:From;
	b=SXa5my+fRVbAvGwHnp09sgmue9Lfx3FLmIytbO2DoJZUkH4HHNld/Hcf3jr+Z1LnS
	 zwSoemb+Oo1wgnghHVh0E+UWIe7gf9E9VD93GyjHP/Qq3N6sfJz+DmEYX0tcsCGsUV
	 FnVzczLwKwS2sMaUWw7FycWd5Cz4jul+5vV4IgQXV3EbNJRzHnIWlSh5B4Fnt2B0UL
	 hru1l+YDaZv5SAaCNXUV4TQvOrRgp4QgJX6kf0GK8vW10CVLdQfuTji3IpxalqEEeZ
	 zlIQkc2Hqf61kkHDwL7Y9AsQqgz8GRXZaa9qr0tNdeulCNvQyV/4BPFFCcb8vbXA9g
	 jp0xpLc42j6Hg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 6.18 (2nd)
Date: Fri, 14 Nov 2025 23:05:55 +0100
Message-ID: <20251114220555.402620-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull this fix for Rust.

It has been three rounds in linux-next.

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.18-2

for you to fetch changes up to fdf302e6bea1822a9144a0cc2e8e17527e746162:

  gendwarfksyms: Skip files with no exports (2025-11-11 20:37:11 +0100)

----------------------------------------------------------------
Rust fixes for v6.18 (2nd)

Toolchain and infrastructure:

  - Fix a Rust 1.91.0 build issue due to 'bindings.o' not containing
    DWARF debug information anymore by teaching gendwarfksyms to skip
    object files without exports.

----------------------------------------------------------------
Sami Tolvanen (1):
      gendwarfksyms: Skip files with no exports

 scripts/gendwarfksyms/gendwarfksyms.c | 3 ++-
 scripts/gendwarfksyms/gendwarfksyms.h | 2 +-
 scripts/gendwarfksyms/symbols.c       | 4 +++-
 3 files changed, 6 insertions(+), 3 deletions(-)
