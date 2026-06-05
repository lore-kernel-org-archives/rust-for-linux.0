Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55B142B721;
	Fri,  5 Jun 2026 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655681; cv=none; b=P3Oqz9ovT2abfxC1yuHKPWuWRdGJxn+U+vMlRBv//UBEnyxVwGi3V9VYxkxQNB0C958sguTXJTM9VDhTEQIdr0TlrWW0JwExgJOLBV4+7k4diERuCxvurRr40nahNZQxNs2K1PYLvsGjPt4gIz7dyKR+2fQtkxPgTAGR8tZ2zYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655681; c=relaxed/simple;
	bh=P3H4bvDaNbcUvf4aTCEML/eCJnRBIR/vOv9WWmF1sn4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i2caR3LKKJ0GsUaB02hI6ymeyKPLN+hUH1Ms4YVbS8y+LPYevnBsiJzR7G5/+D5fu/ZQzWpt4YKc9ULES8tMVclzV2+N5kjF4qw/XmHU7YecGETRLfu4uRW5c73mzgrOgdfStLKkHSNtW+gGttKDnd7OYZPtCqmbY1xAdwaGgpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvGJa/uf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvGJa/uf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1A81F00899;
	Fri,  5 Jun 2026 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780655680;
	bh=NST7gRmZZfVHFgmkPYEmeNwfb5XeOUP3jSBT+FhU7LA=;
	h=From:Subject:Date:To:Cc;
	b=cvGJa/ufFqXBY6vq5amhcKIu5LOPT5oUd8zzFw5Rg1rqwQlAPMPT8ApUiiyP7ebbr
	 pww3rWJH4nGsHtKbI3we6z6r/D8djMPH0yAQmLZGq9Mk1Wy7x6xG6XLbJTYAfIXpEy
	 FeKWaz5ukrh+RQkhPpIOR0Yr7Nm+xBV09KaPP8raTy8Z4xPtVi/Mcwyh71hrvVp/hO
	 NmIX5uT45Q34h11ofGeWBmQR+HOOBfvFvQzjx2keCydxnRx/pH7JDlzQMVACJfPrmB
	 I1jY3qddsobhwvoNsS+ZeCcFycAuxspERb830Y3C1zFns9KXjy+/qFyjfQxNwQJDqU
	 27rhrxLaqMr1w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v4 0/2] (no cover subject)
Date: Fri, 05 Jun 2026 12:34:12 +0200
Message-Id: <20260605-page-volatile-io-v4-0-0e217d9bf11a@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACSmImoC/33NTQ6CMBAF4KuYrq3pP+DKexgXhbbQSChpSaMh3
 N2BjRqJmdV7k/lmRslGbxM6H2YUbfbJhwGCOB5Q0+mhtdgbyIgRpgjlBI8auhx6PfkelgET6Zy
 spCSF4QjOxmidf2zk9Qa582kK8bl9yHRt/2CZYpjKccNt6ZiSl7uNg+1PIbZo1TJ7C4yyHYGBo
 Llq6qowVDbsR+CfAt8ROAhGEVEWNRFGkC9hWZYXxzPFJTUBAAA=
X-Change-ID: 20260130-page-volatile-io-05ff595507d3
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Boqun Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2483; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=P3H4bvDaNbcUvf4aTCEML/eCJnRBIR/vOv9WWmF1sn4=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIqYmjpAF+ERZQcuSvF68y1p8um9kTxpFgh2+O
 /Yv/A4AIHKJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiKmJgAKCRD6UCkIqsW9
 0HPAD/91R3/BZFEWBZ++ERJCcH8ilwctEVhIYqSM9hvtEaBafttDHRpQ1Bj6DmttG1H8e6I1bQy
 tsjCdmhxz+QJ2kdgyPga02OSBXxwzW8hAg3XHDdfIXGkiUFJLyM20AHtED9a48NrSLg1i2kZHQB
 4ScmcNPiviCdBo9JmNz8Sz52ki4uEkdmfTdj0sex9GtXVukois7BT9Ks7irXUnVCWcoT9EyKZJm
 EYXxGkEMD6+qaVp4YUQzxzWLVlEcoXKNd8PXVBw2/y2OJVCiRbpt0jk7wLsoNTDFojOg0TSRrGL
 KNccfjy6ixxlar4uYqGl5LUlxBHoy7s1WU7lPa1Ein4Def3IlTUKdtb1Cvy/yobtZQMgNAZTf1E
 oGU3rDPZrEt3lPVBF9pYyg1+vO4hDAbCmGhpoXjJSzs2EvJ3JwRZQrlhFPtXoux6FgEFHIvW5Ip
 gBbbxd7zY/cTwX+GQ9gBbdckKEcTU1toGdoFPDvcjtn1TXxhBBF8RSq/XJSdEK493bt0ZDra+9w
 DDaAQByyoV+W+Jo/UOLXKvNHHK7uwJ9X38QsCN/rbFoEgRXlT0pNa++iWW+tnpCtwlqyTFvG54H
 P3MI+qYAh6tv6IbCxsuQLIZ0h65AB7uc6vuXg834BMRCNMxgpVcpxzA+Hwvyr3ekh7LCacVelmn
 z7ZdzC+3zHrfm0g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v4:
- Split `atomic_per_byte_memcpy` out into its own patch (Boqun).
- Expand `atomic_per_byte_memcpy` documentation to explain the
  concurrent-safe semantics and to note that the kernel's `memcpy()`
  uses byte-wise atomic load/store instructions (Boqun).
- Clarify the src/dst asymmetry in the documentation of
  `Page::{read,write}_bytewise_atomic` (Boqun).
- Use the "valid for atomic {reads,writes}" shorthand in the safety
  lists of the new methods and of `atomic_per_byte_memcpy` (Benno).
- Drop the redundant data-race bullets that v3 added on
  `Page::{read,write}_raw` (Miguel).
- Link to v3: https://msgid.link/20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org

Changes in v3:
- Update documentation adn safety requirements for `Page::{read,write}_bytewise_atomic`.
- Update safety comments in `Page::{read,write}_bytewise_atomic`.
- Call the correct copy function in `Page::{read,write}_bytewise_atomic`.
- Link to v2: https://msgid.link/20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org

Changes in v2:
- Rewrite patch with byte-wise atomic operations as foundation of operation.
- Update subject and commit message.
- Link to v1: https://lore.kernel.org/r/20260130-page-volatile-io-v1-1-19f3d3e8f265@kernel.org

To: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
Cc: linux-mm@kvack.org

---
Andreas Hindborg (2):
      rust: sync: atomic: add atomic_per_byte_memcpy
      rust: page: add byte-wise atomic memory copy methods

 rust/kernel/page.rs        | 70 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/sync/atomic.rs | 35 +++++++++++++++++++++++
 2 files changed, 105 insertions(+)
---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260130-page-volatile-io-05ff595507d3

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


