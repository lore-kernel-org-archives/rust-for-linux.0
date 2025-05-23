Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E64E2F3E
	for <rust-for-linux@vger.kernel.org>; Fri, 23 May 2025 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748004886; cv=none; b=I67CxpamngEz6OqaxmClUDQ8upUEbfd1UBs4n6KN/PVfbqa5IHZafxCrc0Jj/FZCtt27Cpr5HZs+Jdzh12nXu1yqCITneVNv0wGJ1tzESP5VP1+VIzrD1NZPVjlVE5OOwI2hF9KamcYUDEJjVSCQuzy1xBTS38WfHzCdXb2exjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748004886; c=relaxed/simple;
	bh=bAIQqeSTUN19QFPAIGTa1gJPr5B3TENLyH+wYOmDbv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpkpjPbRFwRMh6Mnj6psRjDqpRpiQehWACA95Oi2yG96eM9t0BKm7Kr3JHvQEaCwRAlJs98yZmVl/SUPhTN2iI45XTSwEQzkv8XGaTDw2bdONoNu2qmUGGx7OLmwhYpWbfL81CqjJehBAkJonk8eVQTDgWgXjNemg/O5RvQ9uak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2gy75XD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2gy75XD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CD7C4CEEA;
	Fri, 23 May 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748004885;
	bh=bAIQqeSTUN19QFPAIGTa1gJPr5B3TENLyH+wYOmDbv8=;
	h=From:To:Cc:Subject:Date:From;
	b=Q2gy75XD7+Ed13LJYKUjNV44q+2oxL/ZHxjjFllg0kC3oGUCUlncWy7JPpdjHWujB
	 2AadKRRNwljBy+TtcO+J5UxVAmv6+JrXMuP1TKF8sh+8WOvtc7DK+AJbgd4u+oV0fY
	 IPYWhUrZdhe7YcXs5/sIURFL5ZewsU24bU1fZTSTbIVskK/nMZjCBMqbuT2lkoFVpf
	 0CkV5AN9VqtqI/520WRMlPGtyPb99rnfbUKyZAy4S21DZ2CfCJ034C4ndgb9OmJJRw
	 hSHGe7qex88L+FivLG2zy2snTvKInPka5gZIwfzroe1w8ofNwSk/ym/jhVHUzvOQ5E
	 3T35QGI3Jm0ZQ==
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
Subject: [PATCH 0/3] pin-init sync: test & CI fixes
Date: Fri, 23 May 2025 14:54:10 +0200
Message-ID: <20250523125424.192843-1-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several smaller problems I found in the CI related to enabled features &
tests.

Upstream PR: https://github.com/Rust-for-Linux/pin-init/pull/50

Benno Lossin (3):
  rust: pin-init: examples, tests: add conditional compilation in order
    to compile under any feature combination
  rust: pin-init: examples: pthread_mutex: disable the main test for
    miri
  rust: pin-init: feature-gate the `stack_init_reuse` test on the `std`
    feature

 rust/pin-init/examples/big_struct_in_place.rs | 26 ++---
 rust/pin-init/examples/linked_list.rs         | 10 +-
 rust/pin-init/examples/mutex.rs               | 97 +++++++++++--------
 rust/pin-init/examples/pthread_mutex.rs       |  5 +-
 rust/pin-init/examples/static_init.rs         | 75 +++++++-------
 rust/pin-init/src/__internal.rs               |  1 +
 6 files changed, 123 insertions(+), 91 deletions(-)


base-commit: ae8b3a83fb9de394f609035041cd7a668fda2ab3
-- 
2.49.0

