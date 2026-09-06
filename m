Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B918930D411;
	Sun,  6 Sep 2026 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788680464; cv=none; b=Iz7E7Uq4s/xXkhvLTONlAzDPz8VRiKBeI9pOw0FAb3lXj2gsyjj6NCk0eCt6EUt8aObjt/Su83tW3IuGKNHQmb/I8eAcj+huHgMRhXAeGutQAHt+/a7qbjNxGlVVdm+32qk05V5Oq3X05aBMgZ6Fsg15sylDQw5Mr5H92+aDqTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788680464; c=relaxed/simple;
	bh=1kXz5wOBXL0GP3+XmuMSSMzE03Du7ycyU7THVSvL2WE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TMRvCh+8tsnO7qkzs7hWJPdCSB1zsEjTa06WbKP+/47rfCAcr01d0x7czaoziZ56gneDLDxsFizmHqaGjw5tjxCpFXjkXuovgpUHsi7Qm5RPW0WHeEJKpADW1o372tpUXfRRx4r68yonuUEFAI3CUXBf/LGfYxg9BGRegZ7zjFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qtzuijcC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qtzuijcC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C442C2BCB8;
	Sun,  6 Sep 2026 07:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788680464;
	bh=1kXz5wOBXL0GP3+XmuMSSMzE03Du7ycyU7THVSvL2WE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=qtzuijcCrc4vH887GqNpTTCQ/zIaP3GSYMWasYPUDSAel3Se/bDhCU4ZqWTPaQGm0
	 uY/5Hg2RttBJNllUGsmxroW9MGUNyEVuj+ZUb1a/mzUdLldRSsjmuOt8lbAmvwEj3k
	 DxSo7yV8qIobGe0sKt5SBUFr5X4zrJeNelE+T92rsMOt4JMWGeFV8vScu5nVJZwOCK
	 Bh1dPE5znXKsgqy5kJmu7x9LYNZngi78VLy3PizNcv5CsG+5GLw3HnCJmwJyzRPqMi
	 a1vidaoWYAvhiBNSYoaObsKxNmqItPbr6hoH2XctHk2afc0PKXK2xQOogNjdiGFc+E
	 siwwRAJA6eYSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17899C79F9E;
	Sun,  6 Sep 2026 07:41:04 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Sun, 06 Sep 2026 09:40:53 +0200
Subject: [PATCH] rust: num: document why Integer is sealed
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-docs-rust-num-integer-sealing-safety-v1-1-78057391302c@younes.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw7CMAxEr1JljUUIqFCugli4qZsagYvsFIGq3
 p1+lm8082Z0Rspk7lqMTunDxr3McNgVLnYoiYCbmV3wofSVL6Hpo4EOlkGGF7BkSqRghE+WBIY
 t5R8c0VOoyjNWp4ubVW+llr/rze2+sQ31g2Je3EujRiOoFSV2S9QrJ5b9+rMtp+kPvosgoKwAA
 AA=
X-Change-ID: 20260906-docs-rust-num-integer-sealing-safety-3a0e2967a948
To: Alexandre Courbot <acourbot@nvidia.com>, 
 Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Younes Akhouayri <git@younes.io>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788680463; l=1364;
 i=git@younes.io; s=20260712; h=from:subject:message-id;
 bh=toyc2RIIIaJbEQPl2zcDj4AAt9VV1aOmVSKrcNUyvD0=;
 b=NgZNpApSLlAtQzmYTKRmaZGWYOb9/B1JL8s1nbgvApDS4vo2LedCRd6bYosnD3J/hCiO18diG
 Dbdja9+/wYwC+64T/Fa3/SUF/A94QovyNcHgfRwkiCEGsbD2ozxkZpW
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=1DRfzPrQ04RQHHgGK28t+vjIAPv5oISPiAdLMU6J5dE=
X-Endpoint-Received: by B4 Relay for git@younes.io/20260712 with
 auth_id=866
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io

From: Younes Akhouayri <git@younes.io>

Bounded relies on Integer::BITS and Integer::Signedness accurately
describing the implementing type to justify unchecked operations.
The reason external implementations are prohibited is currently recorded
only in the commit history.

Document this safety requirement on Integer itself.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/all/CANiq72m8kycbfQ1teyne-OtB5d5TsUcX_WW0FCkWB3Ayyg-qWw@mail.gmail.com/
Signed-off-by: Younes Akhouayri <git@younes.io>
---
 rust/kernel/num.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
index de589792a77a..1d06395d3a63 100644
--- a/rust/kernel/num.rs
+++ b/rust/kernel/num.rs
@@ -20,6 +20,11 @@ pub trait Sealed {}
 }
 
 /// Describes core properties of integer types.
+///
+/// This trait is sealed because [`Bounded`] relies on [`Integer::BITS`] and
+/// [`Integer::Signedness`] accurately describing the implementing type to
+/// justify unchecked operations. An incorrect implementation could therefore
+/// make safe [`Bounded`] operations cause undefined behavior.
 pub trait Integer:
     private::Sealed
     + Sized

---
base-commit: c6709d5e14072d0e3d02f291daee46a199e5dad3
change-id: 20260906-docs-rust-num-integer-sealing-safety-3a0e2967a948

Best regards,
--  
Younes Akhouayri <git@younes.io>


