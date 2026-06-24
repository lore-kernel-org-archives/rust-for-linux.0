Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01F43CAA38;
	Wed, 24 Jun 2026 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312458; cv=none; b=naDzbaC03tC2KuO8abRNhLjojO4iHkQPRbr/EGb+G+OK+p7M8+ZeB9JHUFi0qWHlrcI6KSELB4BAFpVQu5qBU9onXOyLZqq8rDgtzcQfUNuZG79zF4ejTXvQMrSj4bwtp8RrfHcJeeUp/wTsE4oJZxRiuLc7PZEIaVciTmYZTMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312458; c=relaxed/simple;
	bh=HJ83tHQM6Vat4zk6Ng/99jMee9mhfcf5GJAJqLOwuhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P7XbMIcCEcwZ14dh6uI4bju9m/go5+2WqmevDskb1rSln5iKumJQ6g+mtBXepOPRZE9leXIsZMAqkd4ke80izC0R7pBRiH69ya3/l5TV+0dHIaHFr66SIyJ9popU2wGggywY9iaeNEBAhF0rCvJ3+2U6xODxgIVaZpBHFxTShwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKC6y+Fq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKC6y+Fq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746B71F000E9;
	Wed, 24 Jun 2026 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782312456;
	bh=CuJT24i1XOj/n9t6IZP3TIM+JJraZUQPkGFMg4oK0zI=;
	h=From:To:Cc:Subject:Date;
	b=lKC6y+FqihoFCjMGf1ofUFI8VPZLVu8UoSc0SKvRVFUbgKnLYscxk1QV279F9/tvG
	 fOXfSDStT8ruEQq/fukuVCs2b3IJoPII2PKKCHoOjKFokI9aTBUJkMDiP/5f8cTlf9
	 v3KX/w0XMbTYRrCpNhp/5FQhkwZ6FKpYYeOz9FWkdAhZDZyfB2vjijpLn0yIKgrRBk
	 ErXtIVFMUYexk25yyB2wXyHZZzuN6TSDTBOwyDavNZHaPzuDHCoT/LgppR4N0K4bPn
	 +tp/6v+qvMy9knI/nHFRmSNcxIhSI9TwSg/2B0qemgbA9D8lWaB489i0m9B1ArQss4
	 uW8BpuXiae1Ww==
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
Subject: [GIT PULL] Rust for v7.2 (addendum)
Date: Wed, 24 Jun 2026 16:47:13 +0200
Message-ID: <20260624144713.585327-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

This is the "second, tiny PR later in the merge window with a small
patch to simplify cross-tree development for the next cycle" that I
mentioned in the normal Rust PR.

The commit has been in linux-next for a week.

No conflicts expected.

Please pull -- thanks!

Cheers,
Miguel

The following changes since commit 6b5a2b7d9bc156e505f09e698d85d6a1547c1206:

  Merge tag 'trace-tools-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace (2026-06-16 17:50:34 +0530)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.2-2

for you to fetch changes up to 43a393185e33e573a374c1d4f7ddf6481484ef8d:

  rust: prelude: add `zerocopy{,_derive}::IntoBytes` (2026-06-17 00:32:42 +0200)

----------------------------------------------------------------
Rust changes for v7.2 (addendum)

'kernel' crate:

 - 'prelude' module: add 'zerocopy{,_derive}::IntoBytes'.

   This will simplify using 'zerocopy' in several trees next cycle.

----------------------------------------------------------------
Gary Guo (1):
      rust: prelude: add `zerocopy{,_derive}::IntoBytes`

 rust/kernel/prelude.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
