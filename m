Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB81127732;
	Mon, 25 May 2026 01:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779672649; cv=none; b=o2LsgCsK15QSzErSAPPJeBW7mfB9dEJXyedgyIj8fvEpY8qR9iOpDsRUEFUBvw8tnM9wowtVNq6ba74syFQJcJPdClg4cd6nkYGsgi0c7dCa+LqqDMCR0n4FvaGYOtoVkr4mUVGTL+9B9I7kbwYITcow5BmIBBwnbVDVxDgkUrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779672649; c=relaxed/simple;
	bh=4y1rOVgFzCRjZKstBu+O5VOt9Mf1Eh1r8Sx6jovFU/I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From; b=V56Vz8u1rDilLl64fJi5pVRbnaP8/pzWK7gEpA7GEhhMOzJqFLRl+glR747L0f/5NnzqROzhMBj45muunLBqJh7aYbJyeLheqWqUio7oVAmafC6ou5CF8ykxvoui+xALPQDLMoJDRv9IE+id4HL6MDgDpnBkG/LyzNl/0dOrHjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YD0gCOkR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YD0gCOkR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D162D1F000E9;
	Mon, 25 May 2026 01:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779672647;
	bh=8ojOj7FUE1Kqv+QMpBhhmDURJegX2WEcDZ5fFbIKk8I=;
	h=Date:Subject:Cc:To:From;
	b=YD0gCOkRi7RIUVpEi3hG+P7n2Y28Jl9dEUPlzt2QHCZ6xIKu8mS9XVngKD8Pa09m4
	 /Uf4+VNBekFgx88SV6eB3ERkcxtIAqavSBDxN+oh8SbUK8VZGeCjQrRQUFLds8rszv
	 Qq+8y+a0k2+mK498NQOc9xLN9BR4YOVI+vcjg2+Gh6SGNsVIMVTYNp8UsqYSC6Ny4D
	 +Binyy/mCZ1++3u5jUMhCdHChV5h0zP8pwHno5IODPRQU+Y8PWLA1i/PY3VD880w8A
	 DA8ckQPi6V2BontS688PKzX35emsbtWAyTEi+SRJ9XUR5Ez4KVq6Y5ukwRGEpA0aW0
	 G6jSk7uOD/BSA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 03:30:43 +0200
Message-Id: <DIRDATPB3JH2.1DPMQ081MNQI6@kernel.org>
Subject: [GIT PULL] Alloc changes for 7.2-rc1
Cc: "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau
 Rezki" <urezki@gmail.com>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2

Hi Miguel,

There's one trivial import conflict with a patch that I took through the
driver-core tree.

Thanks,
Danilo

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/Rust-for-Linux/linux.git tags/alloc-7.2-rc1

for you to fetch changes up to ec51531fb8efda9b75316111c040dd756f815b0c:

  rust: alloc: cleanup doctest imports to "kernel vertical" style (2026-05-=
20 17:34:17 +0200)

----------------------------------------------------------------
Alloc changes for 7.2-rc1

- Fix the Vec::reserve() doc test to properly account for the existing
  vector length in the capacity assertion

- Fix an incorrect operator in the Vec::extend_with() SAFETY comment;
  add a doc test demonstrating basic usage and the zero-length case

- Cleanup all imports in the alloc module and its doctests to use the
  "kernel vertical" import style

----------------------------------------------------------------
Danilo Krummrich (2):
      rust: alloc: cleanup imports and use "kernel vertical" style
      rust: alloc: cleanup doctest imports to "kernel vertical" style

Hsiu Che Yu (3):
      rust: alloc: fix assert in `Vec::reserve` doc test
      rust: alloc: add doc test for `Vec::extend_with`
      rust: alloc: fix `Vec::extend_with` SAFETY comment

 rust/kernel/alloc.rs                |  8 ++++++--
 rust/kernel/alloc/allocator.rs      | 34 ++++++++++++++++++++++++---------=
-
 rust/kernel/alloc/allocator/iter.rs |  8 ++++++--
 rust/kernel/alloc/kbox.rs           | 76 +++++++++++++++++++++++++++++++++=
+++++++++++++++++++------------------------
 rust/kernel/alloc/kvec.rs           | 81 +++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++------------------
 rust/kernel/alloc/kvec/errors.rs    |  6 ++++--
 rust/kernel/alloc/layout.rs         | 10 ++++++++--
 7 files changed, 163 insertions(+), 60 deletions(-)
