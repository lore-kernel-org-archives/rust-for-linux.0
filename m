Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273D9B665
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Feb 2026 22:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770590850; cv=none; b=pcijPFJ/I/sNR/nS3hrNVicgDOgoOC5W0Ad5aIGl+c/TXaMKzwZeSNMnkl8kdNsZivMbbhwpCOKtqjmb3R7LpFY38dFOWugSpu6wrJDxY3SvfO9frwnUeLnEyzr4LV+HIMaWUbEUjtkMLIvN6io1hBTdfwy5Z5tbYPF5F1f91RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770590850; c=relaxed/simple;
	bh=PE+c8LbKDoxJzDtz7FEZybeykq321uAm/5EOiBC6Fvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NPQk0pHaY4FpRSmySgnncSY2egoP6D5C9XGMNbxWTk+YcArs5S02TuXp0wGtMFCfXodXjK5Yc9kTn7VULV/FSrwB/+1s4EzSg+3IfVDkshwgWq+1j5uhVfOSgIgrjmvM8aXqPwmM93UFotnp2MIC7ZX35BWfs3gLnq3nk5yniCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXgB0d7H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXgB0d7H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735FDC4CEF7;
	Sun,  8 Feb 2026 22:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770590849;
	bh=PE+c8LbKDoxJzDtz7FEZybeykq321uAm/5EOiBC6Fvk=;
	h=From:To:Cc:Subject:Date:From;
	b=tXgB0d7HpEObeqvUqBdtFgxWRIIqx3ROVKgkLn12LNhulCg13MBBqQxV4d2kF5KYZ
	 E1SbsRmHPeKF9MrqsHNHkVntr3Eqaerr+l6R4yucg4kxcEVBWvMs1nOd0EKExiOErq
	 xWubbmZyyqUOVBXtX8GxKvmK6cisoaZR3c4nZYySdQEWHz8epgvDL7ss24Izdj267/
	 2oWdQbRU5b3TLz8BmHt3Op1tEIAIWWJnvVZsT08sLlWEL7K9rjJYCW5L37kWILSWwC
	 Xxf0oO5D2qItqJtoY8FYzOF7prFAD6jGptqcpAJZZYvbR4CYS4nHfjd8Qu9GWMgSeI
	 501qmfhAoLa/g==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 0/2] Support `likely`, `unlikely` and `cold_path`
Date: Sun,  8 Feb 2026 23:46:57 +0100
Message-ID: <20260208224659.18406-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust 1.95.0 stabilized the `cold_path` feature, which means that it is
a good time to add the support for this pervasive feature in C.

The functions should work as expected for all Rust >= 1.84.0, which
includes our future bumped Rust minimum version. For older versions,
they are a no-op.

Miguel Ojeda (2):
  rust: prelude: use the "kernel vertical" imports style
  rust: std_vendor: add `{likely,unlikely,cold_path}()`

 init/Kconfig              |   6 ++
 rust/kernel/lib.rs        |   9 +++
 rust/kernel/prelude.rs    | 119 ++++++++++++++++++++++++-------
 rust/kernel/std_vendor.rs | 144 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 252 insertions(+), 26 deletions(-)

--
2.53.0
