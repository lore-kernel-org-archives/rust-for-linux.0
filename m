Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4052B318BA8;
	Tue,  7 Apr 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559979; cv=none; b=n45Y6Kcn8qL0JVzeYYOqXIbzgjAHw/4mii8fDqdFaycC6+Jvo/WEpy4EF5yFLPFfMtA/IumW7tTgAYGEuGNCKAxGMFDt44lYibtYyDm3BJEZapNZEp7Iy+znwbEa42FSeo4caghds1/rXG9AsdKvGv3uvx7cTkv6CGNubDmt/Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559979; c=relaxed/simple;
	bh=mtf5v7TFwenX0XNygU0q4otTiwYjFo7KahqbiGO0EkQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mva4LOs4g3MVkXq9vMkshRB6v+XaTuNifPZW0+8W9PF3iqdo0bvoTippRIc+CZUh4QsQZsiRq4rDRiAEKZunKf++jlqJ5NxyA93Yv0yselWN2eI7GSrumnXnES5XvXegRvcEnQAHZDDWPrFCP3TztWScERVNkVil+/lzPQm4zVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUr8jv2r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUr8jv2r"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F994C116C6;
	Tue,  7 Apr 2026 11:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775559979;
	bh=mtf5v7TFwenX0XNygU0q4otTiwYjFo7KahqbiGO0EkQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WUr8jv2rxQlpw2S8pNxExI070aeiexcdETgK0qlZ6hXX2TYvT/MqYJlnGlOhNI+fO
	 gmwpP8HmFLXHbo7jJ2DMCu6kQtj8tFncwCgK1BClwFTqKcZ7CVT2Jf2bn8PRf+BzYy
	 q7/7wSQwYWiMp+aoGKB8W17rtD/34viP6r/u2spwr+AhsaeLoC8PssIWxROLXjO67s
	 J/gSrPsuEQZmzIqIS7opAF3VnVrVc6wsMqXHtHjLGGAF7Zkfx8wu1Zv68vmf4ZXyKD
	 7VdSfkF8X9vgurapUgDqitdR6Ueojt2UNv33A4IUKonsbhpDkRXics4yYxaIsRYsdp
	 gJwJL9kurOsnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031B5EDB7F3;
	Tue,  7 Apr 2026 11:06:19 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Subject: [PATCH 0/3] rust: workqueue: add safe cancellation and status
 methods
Date: Tue, 07 Apr 2026 16:36:13 +0530
Message-Id: <20260407-workqueue-v5-sent-v1-0-d0d635289ca0@multicorewareinc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACXl1GkC/x3MTQqAIBBA4avErBvQyP6uEi3CphoCLS0LpLsnL
 b/FexE8OSYPXRbBUWDP1iTIPAO9jmYh5CkZClFUohQ13tZtx0UXYVDoyZw4Nq2alNS6nBWkbnc
 08/M/++F9P2qp+VFjAAAA
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775559976; l=1990;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=mtf5v7TFwenX0XNygU0q4otTiwYjFo7KahqbiGO0EkQ=;
 b=yOiTw2eKbysNuw1mli8ooNDrozGF4dFmBmSOo29+5fOcC0pFNVks2Ur6r5PVhFMfJGtiNe2Bc
 4PA2NgOrXClADu8VLQ8z3ohwhb7nhySsUsiDbmoVpmsJScuoTlMo71h
X-Developer-Key: i=aakash.bollineni@multicorewareinc.com; a=ed25519;
 pk=r3Gonl+2k+8RozN9U/XwfICQdnRlAcLeeAfsExmurdE=
X-Endpoint-Received: by B4 Relay for
 aakash.bollineni@multicorewareinc.com/20260402 with auth_id=711
X-Original-From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Reply-To: aakash.bollineni@multicorewareinc.com

PLEASE IGNORE v4. This version (v5) corrects a critical KUnit build error 
and formatting regressions that were present in the previous submission.

Changes in v5:
- Fixed missing arc_count helper in rust/kernel/workqueue.rs that caused KUnit
  build failures.
- Fixed formatting in samples/rust/rust_workqueue_test.rs via rustfmt.

Changes in v4:
- Fixed Reported-by/Closes tags and metadata for robot tracking.
- Improved commit structure to separate API changes from tests.

Aakash Bollineni (3):
  rust: helpers: add workqueue helpers
  rust: workqueue: add safe cancellation and status methods
  rust: workqueue: add KUnit and sample stress tests

To: Miguel Ojeda <ojeda@kernel.org>
To: Alex Gaynor <alex.gaynor@gmail.com>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
To: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn.roy.baron@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
To: Andreas Hindborg <a.hindborg@samsung.com>
To: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
---
Aakash Bollineni (3):
      rust: helpers: add workqueue helpers
      rust: workqueue: add safe cancellation and status methods
      rust: workqueue: add KUnit and sample stress tests

 rust/helpers/workqueue.c            |  32 +++
 rust/kernel/workqueue.rs            | 473 +++++++++++++++++++++++++++++++++---
 samples/rust/Kconfig                |  10 +
 samples/rust/Makefile               |   2 +
 samples/rust/rust_workqueue_test.rs | 191 +++++++++++++++
 5 files changed, 673 insertions(+), 35 deletions(-)
---
base-commit: bf074eb6891be799174ff42e0051492681fdc045
change-id: 20260407-workqueue-v5-sent-a895d51cc4f5

Best regards,
-- 
Aakash Bollineni <aakash.bollineni@multicorewareinc.com>


