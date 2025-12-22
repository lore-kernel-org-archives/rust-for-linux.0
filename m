Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D635541C62;
	Mon, 22 Dec 2025 12:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405683; cv=none; b=ZuPTjtZWHfIDmyJIDIIl05FxerMPDa1NGI2g2artvzqRqr0YL5wwpqQHafQWc0UBhkTO0rRL9ATs9OkKUzJHattZBs0HGhdXJRF6lppsgpkk/rv9tDjBZ130Qa3FrFYd8blPRSa96K4DnAoUqb1EG6pzKGYeZqh+diZP4ovBSBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405683; c=relaxed/simple;
	bh=4vauoI3uYCLC2OiOqwH5lYWb+cisdMVFEXcQ4EouPx0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uysZdKMadzKzmqlzR1lWBnrEvzZOl+iP5NqPlDoESc2zyb0rtoiMs6AEZw3oVzfQojJyi2bN5778rn9s1XMNd0Oc1/bAq3fI9HXUaU0aqkZUtQMEfcaDyFFVHlP2GE/4JhmuecsRBmr3CDVM0qBEqOSHSn7vYm2uDnm3MrWxKpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+j2oAYj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+j2oAYj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFBDC4CEF1;
	Mon, 22 Dec 2025 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766405683;
	bh=4vauoI3uYCLC2OiOqwH5lYWb+cisdMVFEXcQ4EouPx0=;
	h=From:Subject:Date:To:Cc:From;
	b=k+j2oAYj0mMSUX/g9cj46Hti+hGwuV42SxpynxZd0SuR92kKh7xc+EvJ4TaNpq0wA
	 xETehAAqbqYxGDJpQjl3RJTVKUr6cGihUEej1uzY0b35ZaUUv6r2XmNsSofohZoKyJ
	 5hAWWLBTeddu6ffe92kATIbrv8vRarv6HFvDmp+K7o2YEqUPsi+3uWFoYMzhyVwurr
	 sAQtaQT+ACePj6YRZdwbJs1u2Gxq0VPEl1+0Qbh8Ye7wWTNESKs4ZW3zPqPAQAKTMD
	 ojqJdC2oSsdSySO+dUFPa5jVhfC2LY0m8UPcvhwcS1qIksnMEPXoUNQkX5ye9LRGmR
	 C4vZNo8YGz1gg==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH 0/2] rust: i2c: replace `kernel::c_str!` with C-Strings
Date: Mon, 22 Dec 2025 13:14:31 +0100
Message-Id: <20251222-cstr-i2c-v1-0-df1c258d4615@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3eTikiLdTKNk3bTkVCNTi9Qk81TTFCWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQCY/5LlbAAAAA==
X-Change-ID: 20251222-cstr-i2c-fce258eb7e5d
To: Igor Korotin <igor.korotin.linux@gmail.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766405679; l=686;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=4vauoI3uYCLC2OiOqwH5lYWb+cisdMVFEXcQ4EouPx0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCKK3U0RHhcYeF7g7uxLFN/XON1/SmabXO+Lqiui23CLT38WEwDdJOBP1Y7yq3xwHYQvTucpsK0
 Aw7+eG2GXMws=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (2):
      rust: i2c: replace `kernel::c_str!` with C-Strings
      samples: rust: i2c: replace `kernel::c_str!` with C-Strings

 rust/kernel/i2c.rs              | 8 ++++----
 samples/rust/rust_driver_i2c.rs | 7 +++----
 samples/rust/rust_i2c_client.rs | 7 +++----
 3 files changed, 10 insertions(+), 12 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cstr-i2c-fce258eb7e5d

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

