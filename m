Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED28335B123;
	Thu, 22 Jan 2026 17:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103056; cv=none; b=j+UwhyQvLAhAAZghQOs3aZ04t0DeJIizQ1KBxl6+mmloskoH/j7wnbvZ11K7QWMJ8FxBIBJB4iMPr+heAnWfrHC/bxBrQo1C1L2Kc5n8BCO56BwSd5RKYMR8mVq1MWKRlF+j4grdu6eWagWEHNHF4+dEuwI70O9gBNMySi69Ydc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103056; c=relaxed/simple;
	bh=Y+34roqT3Z0b7xhuQjHnHcgo26mSAiu+0rnLkvc8bHE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pt43fvkdBrQHfR279XKHZW+YnsTfkYOotWF3lpKZv5PXMxUPnF6kQ2KFZCgxiaykOQR+wsyNnVpQ5LsLCz0U4cwVm0XJgZohnSyPzUXG2q6d/r7+4cNQAH+M4tE/o9sv42YdYQfv/FvOPAv+g82oWpdbZfPYd//9BQ8yXoQ60i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7K6Z8oR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7K6Z8oR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C361C116C6;
	Thu, 22 Jan 2026 17:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769103054;
	bh=Y+34roqT3Z0b7xhuQjHnHcgo26mSAiu+0rnLkvc8bHE=;
	h=From:Subject:Date:To:Cc:From;
	b=E7K6Z8oR9bRIzzSc7iNrZA2WbALke8fcqq2+oedmphN5lRImiDHGoisghA3S5zj60
	 NkhEV1s52Qt5wo+yq5L0+hhDKTbrAche/2R6O0HKt0fV0IKAt7b/LzPjoBiEmCWsEt
	 wnKDPpIUuAbZqSOT9ap4B4v5y5/rrQOH5AQWO/8gVtyK0GhPAa9/qeVKlIFhtVAXUv
	 3J1xNIyJk2M+dr06OTQJZlPcdFUxeLwfPioVjYfZ4EaIW2IdDP8TEBzjAsPtOdDhzu
	 DoiKwJitTGckzZkFYBzSG98AZQPpJKBBJhX5utSOoQfO5I0wMFbaC7cz9Hjdo8Bfqg
	 1rvU4L4NXxeMg==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH 0/4] scripts: generate_rust_analyzer.py: tidy and add type
 hints
Date: Thu, 22 Jan 2026 12:30:44 -0500
Message-Id: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IQSJ6leIi6thOkVRmomjFu
 zfa5Vv8f4CSMCk02QFCKyt/QkKRZ9C/fHgS8pAM1lhnCmtRFo3og5/2LwnGfSbFsTbd4CvnqrK
 GVM5CI2/39dH+rUv3pj5eKzjPH3dgjp53AAAA
X-Change-ID: 20260122-rust-analyzer-types-f90bda766749
To: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Fiona Behrens <me@kloenk.dev>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1769103052; l=1134;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=Y+34roqT3Z0b7xhuQjHnHcgo26mSAiu+0rnLkvc8bHE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMfsSx/ahkNb424RjpN72XUlb729Qgm5UUArhH+pHelyGEOsocJYOTS6ZIOC3i++eeSuoIwjDzZ
 1VNnGcRBXNQg=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This series adds type annotations to generate_rust_analyzer.py. It is a
subset of an earlier series[0] with formatting-only and drive-by patches
removed (I sent some of these as separate single-patch series).

The final commit leverages type hints to tidy the implementation. It
could be done separately from this series, but serves as a nice
demonstration.

Link: https://lore.kernel.org/all/20250424-rust-analyzer-host-v6-0-40e67fe5c38a@gmail.com/ [0]

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Tamir Duberstein (4):
      scripts: generate_rust_analyzer.py: extract `{build,register}_crate`
      scripts: generate_rust_analyzer.py: drop `"is_proc_macro": false`
      scripts: generate_rust_analyzer.py: add type hints
      scripts: generate_rust_analyzer.py: identify crates explicitly

 scripts/generate_rust_analyzer.py | 256 ++++++++++++++++++++++++++++----------
 1 file changed, 191 insertions(+), 65 deletions(-)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260122-rust-analyzer-types-f90bda766749

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

