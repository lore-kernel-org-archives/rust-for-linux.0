Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213F135337E
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Sep 2025 13:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757079249; cv=none; b=IZHrfMEVjUQNoXAoGRw7PHVfs4hDIZd0RHxKp0GlIBA0VWOq6n7jrbZLnoqW6035FgU84A3Fvoec2dsqiFWVpOxAyvKS+S7ROBuTei2lb6JYMlJvQPWbe2C5lgqklXPW1YXEA9EOc6KFOU0/Ioe/iLE8KSx16MOZD+JwIKrg6PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757079249; c=relaxed/simple;
	bh=ocrtdopBzGalgz4efBZGbJAZ1F2YJxeK4B44kGhwOEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqVGFQ5hIYl6Q9RfsBE4G22EuHt/AIdA0o9YbRyPZWif3LZfhjiXPk1+54YeSMXAWOmfGDRhX/I9YtutGAW10CyuSqGNgDaoMnZiL8xkAhIoZIx+34kQNugkL0EajI4PN/M8WT11gr9r4V/VRkbxPk54BRvE+7BakCFQHD+pgR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1wyuS32; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1wyuS32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775CDC4CEF5;
	Fri,  5 Sep 2025 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757079248;
	bh=ocrtdopBzGalgz4efBZGbJAZ1F2YJxeK4B44kGhwOEs=;
	h=From:To:Cc:Subject:Date:From;
	b=M1wyuS32t8/h4ya5Z8l4/3zo1qEfXAG5OSjkfbLkkW1emVvEuxw5uFd1GV1Bvm/13
	 3gTVVvZdCslHUkLdmjkmAFAPnlPCUamMYxR4WtnrpGt6zeJJkzkex+WrbHiBGoLC73
	 /JsYUZCuy5b/qRkYTTKOH+ZOwcT9R0ZAnernPrpQL5j9HierlAJ2TrYQUWgjE995rA
	 bCOuXXt3hgrh/TGyqAcOoWRr3HKgk7JnqIigPVGg3fl1wvEOfJWccAL39crdQrGnM9
	 6UUKmv1YzIO0GA1kqVHevTGL8SLW0s1KptdLDdH4oCYKh1pDut8qNxET2X3TqLuNbX
	 OwRyWaORIPi0Q==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH 0/2] pin-init sync v6.18
Date: Fri,  5 Sep 2025 15:33:57 +0200
Message-ID: <20250905133401.3312707-1-lossin@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some very small changes coming from CI fixes & a readme update. These
changes are already merged upstream & originate from these pull
requests:

* https://github.com/Rust-for-Linux/pin-init/pull/79
* https://github.com/Rust-for-Linux/pin-init/pull/80
* https://github.com/Rust-for-Linux/pin-init/pull/81
* https://github.com/Rust-for-Linux/pin-init/pull/82

Note that 80 & 82 only changed CI, test & cargo files that aren't
included in the kernel tree.

Benno Lossin (2):
  rust: pin-init: examples: error: use `Error` in `fn main()`
  rust: pin-init: README: add information banner on the rename to
    `pin-init`

 rust/pin-init/README.md         | 12 ++++++++++++
 rust/pin-init/examples/error.rs |  4 +++-
 2 files changed, 15 insertions(+), 1 deletion(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.50.1

