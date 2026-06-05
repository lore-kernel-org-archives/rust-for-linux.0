Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575DC4DA552;
	Fri,  5 Jun 2026 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663776; cv=none; b=JipdnUoIBZSLZnc4dOf1noDLGigXfw2NjgLBl0qtvTU6n5yXn+NErqqTJ2i+UGyXNhGxlTj/j7lBu+IM1rj385P52Hhwr9gPwFsbyoa+MjkUSqd6uwS9sM+adlJJUUxOtu2h2/dHMPMD+t+ec6oMhqw4aed3Ex1MNFownGM6BzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663776; c=relaxed/simple;
	bh=p9uJWucfNKJgIkL5qVSUlbNGwi9u5AIxwCQJDK4aSMs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ssss8syemUiVGPLB9Y2NxlzdnHpIRmSD+X7AaW3QbFKZO6W95lpvMaDQ+Q0O8suI2GBkBEq7VtSsKiBU7TbTlIpWew7ZYsPmy2zq0GrnxhQMUu4SQXZuTrUSZHkv8ojZ+zmwDa/65cZS7zaTgpdxW2kN17VjuITWWs+aQ4HaOZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LU0JWvzU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LU0JWvzU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69D61F00898;
	Fri,  5 Jun 2026 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780663775;
	bh=HDtMLF8guH4ne88IjSb6K49/Xx+Louz/o/nOF0oGjaU=;
	h=From:Subject:Date:To:Cc;
	b=LU0JWvzUQfXqvTgu9Gidfm/Q8P40MuVCsx+Z4PJm8xb3w+3YeKSANL5PVhk4CASDs
	 5r5LnUo6KMuHkZvCzyPLIRNBo4ak01UFKd7/r5ws8Dy+HO4a5hcam03ua5u7d/dKPz
	 0c46XfTee1PBXFc+4ON02DrqjXuq3ku7cYDNBB5KjubnklieJ6zWWNeJBUoZShl4pT
	 WpGoubM6JtGAirxu5t058eaVcT6NOWq+Ad/SUma7bdD+bH5jk1wHeLjVVasmpdIblb
	 MPtHdVMcgsj7SFDc6PDhUiMOGpmXOe0D4nN4tmOswx1qKa49w1Z/8HIYP7elI3Fva0
	 saqi+wm/UX8VQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v2 0/2] rust: pages that cannot be racy
Date: Fri, 05 Jun 2026 14:49:13 +0200
Message-Id: <20260605-page-additions-v2-0-03f04c8fdbbf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMnFImoC/3WOQW6DMBBFr4JmnUG2A7hmlXtEWRh7nIyaQGKD1
 Qpx97pk002X72vm/b9CosiUoK9WiJQ58TQWUIcK3M2OV0L2hUEJ1QklW3zaklnveS6XCQd37ET
 TkQnBQ3l6Rgr8tQvPlzdHei3FO79DGGwidNPjwXNfZV1LjE7B375SL1QrjqLFZeTXQlikqExwv
 tNtMGT6LDX86m+c5il+7/Oz3P3/Lc0SBTYfSmsjrBlcc/qkONK9nuIVLtu2/QDGna/SDAEAAA=
 =
X-Change-ID: 20260215-page-additions-bc36046e9ffd
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3079; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=p9uJWucfNKJgIkL5qVSUlbNGwi9u5AIxwCQJDK4aSMs=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIsXNN3kQ4knaub6xUG+ElnSKxnSKJo6LdsZ83
 ikZ3bcDN5KJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLFzQAKCRD6UCkIqsW9
 0ERFEACsFIAwTdYH0V3Ocmb2DOYetCkTMJ8jHliFnGTeTkRTr57x7fBztphSykWMZLHhWfdCZEt
 OT1EKcdxLbiPojOrqoZCtBMcBq8KWb0cfnttdDLEZJQEHtmHh90zhEBpR24tcf9YHq6nEaCWdMp
 +n8e+WrDonNPrrQubPfijdDywMZOe1tPIwW+lcGCKyHTXLvmYEBqQopaZg+m19adOR01nal5CIk
 gOfQFeragzEYlIbC2uK149tm4h+UpFQAdGMnIv5Qs0IrKdvp7uqhX39N+C/3i8PRSYUt+uA59+Q
 0lrR59JXv8iJAaOVbmTUTX4frko7J9TadybLK2ss4JykGGOEgCpJVYUL1UE/PxDERFL4+8tr689
 hNV8YxiHPFBhcaXkcK/YJ9wP2G6yHGUdPCKQfr1dFwqk1YWbsI9n/ea3o42J5aeag/hO8Y2tWKP
 yNpaaOWZLvtzlrRQk2F+zp+fl0eSvqVJT1FuAoeZ8KrGX7UytvfExfDB1f3YbH8hlTGBdeinQni
 RD747Ta++MfKmXiCTts8su3wZai4H/37wFLOZNm0GAEvgOvrkANT4jTg0Sy9U7FSCo0OJtlnMuB
 VChUb5aPMao3QwTI7nau0jSxA3BupIZzGt0YI1HS/GTW7UlZGNJxHyA6uUstO1CxF/o6UHO5coa
 w5eF6U6S9BhyIGA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Some drivers might want to use pages for data storage in the same way
one would use an array of u8. The current page cannot be used for this
purpose, as it provides no guarantees for how it is accessed.

This series adds a newtype around `Page` with an additional invariant
that the data of the page does not incur races. This makes it possible
to treat the page as a regular array and even obtain a slice into the
page.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Reimplement `Page::alloc_page()` in terms of `SafePage::alloc_page()`
  to drop the duplicated raw allocation helper (Alice).
- Reword the `SafePage` invariant to spell out the standard Rust
  aliasing rules that apply to its data (Alice, Miguel).
- Replace the `# Arguments` list in `copy_to_page` with a prose
  description, matching the prevailing style of the kernel crate
  (Miguel).
- Expand the `copy_to_page` doctest to populate the source page,
  assert that the copy succeeds and produced the expected bytes, and
  demonstrate the out-of-bounds error path (Miguel).
- Reword the SAFETY justification in `copy_to_page` from "no other
  writes" to "no writes" on the source side, since this call only
  reads from `src` (Miguel).
- Rebase on v7.1-rc2.
- Link to v1: https://msgid.link/20260215-page-additions-v1-0-4827790a9bc4@kernel.org

To: Alice Ryhl <aliceryhl@google.com>
To: Lorenzo Stoakes <ljs@kernel.org>
To: "Liam R. Howlett" <liam@infradead.org>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Andreas Hindborg (2):
      rust: page: add `SafePage` for race-free page access
      rust: page: add method to copy data between safe pages

 rust/kernel/page.rs | 121 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 110 insertions(+), 11 deletions(-)
---
base-commit: 9e0898f1c0f134c6bad146ca8578f73c3e40ac0a
change-id: 20260215-page-additions-bc36046e9ffd
prerequisite-change-id: 20250305-unique-ref-29fcd675f9e9:v17
prerequisite-patch-id: 6c6a7fdd56627293ec3bba61c495f16a0858700c
prerequisite-patch-id: c1958590235ee32d6ddb31ea168105bd9cf248f2
prerequisite-patch-id: c5a4b231dc8adf37e93ebdce308dacbe6a244bf3
prerequisite-patch-id: 541dba7938ba874f8d17fee05a36b1cd9fa2c4d7
prerequisite-patch-id: 3668fd640e4c411bae0c8ea9d986c3fa5d3c9e82
prerequisite-patch-id: da1274864841e267697be9529a50531126c64872
prerequisite-patch-id: c1463b6578e94b56d2bad41f6e614b5286fb1db3
prerequisite-patch-id: a31185fe1abbf553377d6d695c5d206eebc84358
prerequisite-patch-id: 4f392b5736e55a354ec3022644389f89b52fda42
prerequisite-patch-id: b6388ff0ebdd54610010d72a5398842a3c668bbf

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


