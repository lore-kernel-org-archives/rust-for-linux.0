Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795350346;
	b=kfunKNm++1Qz4AvU9xJFJqfKzeiKdVk0MjLegtYm5UeNn1lHOeGjEecuHNkFuDiWP9VR
	 TTJ20s0XmZVJED1tbRT9KCPre2xY8KyHwF5YyQzVJqJCjkRI77tIzUBEh06vT3dAxZhs/
	 6a9vvRV+WTxiU7roAq13BL/XU1EEYcmop5G8c82twc41/DLUi7NZ9FvRBC8tHq+jLfEne
	 I/GS6E8v6XlvJT8Q+skpFuh5tNG9/Yl3/LRcfPWR/mpVCXomK+P9z7QfbZUDqoTcPfhwr
	 jx1XlKSlim75BMEhlqp0cLfYx0YBmtl7jKIlHNLXU+nkZ+tksj88Xg6nTVoB6sxnCcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350346;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pJB7tJzn9xEnQukbyKifEkc3rdZ7N4F140lGpT0ocOk=;
	b=QiRNPV1cs4aH+qBHkRJSOGnnge0mRN7ItFO7MQrRDZ8d4KRP1lqmsLdZfk4BHkZaWdxW
	 2tVeIDeT1b/HMl0re7EsGnNBB0I0v0pYbf+LySeND2RvH7gXeh0pj6QJnnFn7PqnQXUxZ
	 8wixUbvoZbnDeIq+7g5TQKPr4F+KnYLhMD6HPXOdezrSzD88nfgx+btyx5Up+FWuThKBC
	 c1LDc1J3Rq1gBBcs0HATcmjf7OMymVaOguSa8Gh28sZ936EAVckeO8Sr3f68UVTkDGakh
	 LyBdeqB3XtJVktXjnrWP6Zc7IcU+uxTpgggA4gSaqNYzwm6Mhybk62ELhdNxrgwjy+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=llE4Xxag;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B5B606A320;
	Sun, 22 Nov 2026 12:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=llE4Xxag
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8671F000C0;
	Sun, 22 Nov 2026 12:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795350346;
	bh=pJB7tJzn9xEnQukbyKifEkc3rdZ7N4F140lGpT0ocOk=;
	h=From:To:Cc:Subject:Date;
	b=llE4XxagBGO2ugmhGTd2lKhOpZP5l2mhEPIpeDG3Fs4msmQGj5yxp6e63lAEPVnxD
	 zbJGunB5YwBvR6HSu1Y7P8VzhD/xLto1Ko1DTKxBWDp4c1bgopxDpCu0ORPBef2jmp
	 6jX68sYGy/nvn2RAgPFhaQ5HqRwl7NmAfE+0cK49WdUGieiSUNE30WXv3GFNEo9Pj7
	 NlZPgNei20sZ26li2YRJTTVYp/kAr1GJFVZtQl78ijuitKo1SZUG07MjgcTG+/GcXs
	 8RT3Z6yjoWfXbaS1kWRFLaaEk0YvCAAFpm14cFsYRyHMj78+TGPmeEO03XDOHjKQKw
	 A+OZK78YRcXDg==
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
Subject: [GIT PULL] Rust fixes for 7.4 (4th)
Date: Sun, 22 Nov 2026 13:25:25 +0100
Message-ID: <20261122122525.71959-1-ojeda@kernel.org>
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

They have been in linux-next for two rounds or more.

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:

  Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.4-4

for you to fetch changes up to 73bdf8773de4af2c2b7f49370191ae6d5aeddea5:

  kbuild: rust: disable function merging unconditionally (2026-11-19 11:28:42 +0100)

----------------------------------------------------------------
Rust fixes for v7.4 (4th)

Toolchain and infrastructure:

 - Disable function merging in all cases to fix broken MODVERSIONS
   information with gendwarfksyms, wrong backtraces and possibly issues
   with pahole/BTF due to lost debug information.

 - x86: emit the expected 'cs' prefix for RETPOLINE builds by passing
   the '-Zindirect-branch-cs-prefix' flag we added to 'rustc', which
   fixes boot failures (with 'spectre_v2=retpoline,lfence') and code
   corruption (with paranoid FineIBT).

 - Fix objtool warnings for the upcoming Rust 1.101.0 (expected
   2026-12-24) by adding more 'noreturn' functions.

'kernel' crate:

 - 'str' module: fix soundness issue in 'Formatter::new()' by tying the
   returned formatter to the lifetime of its backing buffer.

 - 'iov' module: fix soundness issue in 'copy_from_iter_raw()' by tying
   the returned slice to the lifetime of the output buffer.

   I suggested upstream Rust to introduce a lint for this case of the
   lifetime elision rule, to avoid repeating this sort of mistake.

----------------------------------------------------------------
Alice Ryhl (1):
      kbuild: rust: disable function merging unconditionally

Marwan Mohamed Zein (1):
      rust: iov: fix return lifetime of `copy_from_iter_raw()`

Miguel Ojeda (2):
      objtool/rust: add more `noreturn` Rust functions for Rust 1.101.0
      x86/rust: use `-Zindirect-branch-cs-prefix` for RETPOLINE builds

Peder Bergan (1):
      rust: str: tie Formatter to its backing buffer

 Makefile              | 4 ++--
 arch/x86/Makefile     | 1 +
 rust/Makefile         | 2 +-
 rust/kernel/iov.rs    | 2 +-
 rust/kernel/str.rs    | 4 ++--
 tools/objtool/check.c | 4 ++++
 6 files changed, 11 insertions(+), 6 deletions(-)
