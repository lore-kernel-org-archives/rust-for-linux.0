Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58B339A805;
	Mon, 23 Mar 2026 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282019; cv=none; b=bEpH40nkb4yLx7Z4YuPjMzUmodPNd+OcJ0D9ZuCjedWO1wWPqTnfDxKulQHHbr6mXqX8IwUjUGmOLNg/8h4D9TobpJ6LCu4RkU4Z0xY62OLz1iXEKOlkGOfFg1Qml1bg+x57ZnE5phNkPxboMa65JDA2jzN5yt4Jq8mZBf7i9iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282019; c=relaxed/simple;
	bh=+jr04irQXVnGagORR+fdB31RUU5mVaWeOk4G07XzQww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o8JB82lf9jCGctSTjhOn5l2LxGHZA+uViEoTeHj8JQao4ZskmMXDh7cNuqZa9uImi8tJbw5pJcJJDkbtFPJn3JF8aC7Cosr+5WnYtMyzNUv5hb5gubZDd4W3K/5JIuWCXMXWYWo1hO3Occgikx3kg6nvru2L9NzzITAMnc0bd5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lhf98C4I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lhf98C4I"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D2BEC2BC9E;
	Mon, 23 Mar 2026 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774282018;
	bh=+jr04irQXVnGagORR+fdB31RUU5mVaWeOk4G07XzQww=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Lhf98C4Ix04wQfPYGo1R+/TV5mdlkhlcsKkWVWSdg/tZYiR8Gh4/JFQ4to3sOePWe
	 7KH3r8eHjegQHPYovqx05XDtffXM62ROx0zoXRoxPO/yrdMDY44PfwPe/QwuzweUUO
	 1L2rOQHJJA3BaCd4DgY/18Ue8PWDfqQzp/xvC3hyp6vPIfhKLZTZ4wwpNiSd8DOMPC
	 Y+8ecWtsB3hraAbFtqVPXlB9RsHpPA7dhvAUV6uqatnoOGUiIX0mzcYeZFqaHGqgtc
	 Bq5h93rpog4k6cYtnfFwGaptPnPWU3seMdS34b8trjbCXckSiDdsDqDyOCG5yrW2JQ
	 LP5ht+WkcER1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7280DF483C4;
	Mon, 23 Mar 2026 16:06:58 +0000 (UTC)
From: Igor Korotin via B4 Relay <devnull+igor.korotin.linux.gmail.com@kernel.org>
Date: Mon, 23 Mar 2026 16:06:55 +0000
Subject: [PATCH] MAINTAINERS: Update Rust I2C Subsystem entries
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-update-rust-i2c-maintainers-v1-1-0744ce44f846@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB5lwWkC/x3MQQqDQAxA0atI1g3YjHbAq5QughM1i46SjFIQ7
 97BxV+8zT/BxVQchuYEk0Nd11zxfDQwLpxnQU3VQC292kAB9y1xEbTdCyqN+GXNpSbmSIn7yN0
 Ue4lQD5vJpL/7/v5c1x83NwjHbQAAAA==
X-Change-ID: 20260323-update-rust-i2c-maintainers-2da57a4f75e7
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Igor Korotin <igor.korotin.linux@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774282017; l=1022;
 i=igor.korotin.linux@gmail.com; s=20260125; h=from:subject:message-id;
 bh=zQS73+5EdEVUJZ0XO99JSJWsy7CEqxEYjO2sGkn7GjE=;
 b=+taKkTNdyAwhDG25FXbsIrnfPWPHM9J75EPx0e31becbEMSebkdNCGNdeHKNih+rIsEBX1rbv
 HNjPjEE38bkAnf5QTQzowJp+g7VUxkldqB9H7JeX3Z4/xCDLo5OyhQG
X-Developer-Key: i=igor.korotin.linux@gmail.com; a=ed25519;
 pk=SjZ//wxnynZgJJgTqANyU10A7hdQQdDXLvXIr+zWroE=
X-Endpoint-Received: by B4 Relay for igor.korotin.linux@gmail.com/20260125
 with auth_id=615
X-Original-From: Igor Korotin <igor.korotin.linux@gmail.com>
Reply-To: igor.korotin.linux@gmail.com

From: Igor Korotin <igor.korotin.linux@gmail.com>

- Change Igor Korotin's e-mail address
- Add git tree entry

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77fdfcb55f06..302ddd2d8ec6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12021,11 +12021,12 @@ F:	include/uapi/linux/i2c-*.h
 F:	include/uapi/linux/i2c.h
 
 I2C SUBSYSTEM [RUST]
-M:	Igor Korotin <igor.korotin.linux@gmail.com>
+M:	Igor Korotin <igor.korotin@linux.dev>
 R:	Danilo Krummrich <dakr@kernel.org>
 R:	Daniel Almeida <daniel.almeida@collabora.com>
 L:	rust-for-linux@vger.kernel.org
 S:	Maintained
+T:	git https://github.com/ipv6forever/linux.git rust-i2c-next
 F:	rust/kernel/i2c.rs
 F:	samples/rust/rust_driver_i2c.rs
 F:	samples/rust/rust_i2c_client.rs

---
base-commit: bf074eb6891be799174ff42e0051492681fdc045
change-id: 20260323-update-rust-i2c-maintainers-2da57a4f75e7

Best regards,
-- 
Igor Korotin <igor.korotin.linux@gmail.com>


