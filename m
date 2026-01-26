Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800BA33509F;
	Mon, 26 Jan 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430130; cv=none; b=uogwayWod1X4oAALOh0zyIgqunEfPkqskrBonQtJSskP6VMfM6sPPmkjG4zOlKNktP0Xuc3CQskbejXZR5QWTwc1+Q2mPPvDKgsUCVnNqikXjnp/bqlM+/K0AxsltLs/d9TjeWgXTD6na9nbZYkIdDf+wU99cxonkGQV9+A3rIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430130; c=relaxed/simple;
	bh=02sh3oTX0lvFzCHlAVRuBifMzJIUIAG9N3Y9jPZ7QJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5n2VOp2fY2ht7N8QRhMwFgxFxUpUssiwewFUz5InNq1Nz8gAuVj/iJPSMPSH094a8EAY9KfqVkBM/yjmyt1a36gvwCOjcvxIzCG+yQKJdXIpzf9B4+toIbFxlNtUuznDHC5kH/uwXbtn9wXgl6R2s+PxOY7M3cyZ5UcNmN9K1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rub2O9us; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rub2O9us"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F6BAC19425;
	Mon, 26 Jan 2026 12:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769430130;
	bh=02sh3oTX0lvFzCHlAVRuBifMzJIUIAG9N3Y9jPZ7QJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rub2O9usyZ8dOhClJyyls478YbdhZVXG+nqd2BSNoXrc0ri8O9nza+n9MMqQ7HzMv
	 LOxtIBR56dSRfo+7pX1cwqGZVpA6M25ML8iQfEAcNiHXno8gvBY4TlHJIO71Jcp8sh
	 wH3h8HYH5dv4yjWkXv7S2mydYydpKpeR1P1H5jEpTjMyQT38bVMaMQJB6zGobntsqW
	 atH1YzoSIsNyICAzSxOrIz+gwM7DHXJh5HYXm/kRmmFidY44+BhOPrS3C9oTHXs1Ps
	 PacKS57ZXdcdZBRLrAvTTvjEKogSLGnWk7OJqChVnYMYmcs6qvx1YGThU7+mTdsrWd
	 MMqD1OutZd6ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409AFCF65DB;
	Mon, 26 Jan 2026 12:22:10 +0000 (UTC)
From: SeungJong Ha via B4 Relay <devnull+engineer.jjhama.gmail.com@kernel.org>
Date: Mon, 26 Jan 2026 12:22:08 +0000
Subject: [PATCH RFC 1/3] rust: bindings: add TTY subsystem headers
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-rust-tty-printk-driver-v1-1-28604e7e100e@gmail.com>
References: <20260126-rust-tty-printk-driver-v1-0-28604e7e100e@gmail.com>
In-Reply-To: <20260126-rust-tty-printk-driver-v1-0-28604e7e100e@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769430128; l=837;
 i=engineer.jjhama@gmail.com; s=20260103; h=from:subject:message-id;
 bh=0vsfQQeWd++TfCsHXwKaK0gI8PJ/Xoa6JfQ9dg4v4UA=;
 b=Fy5475B4L9nOFeWUdI7UbNWWUKSEoKi0rb8FZIOg8/+VcC6R7PMXlB6lEd0lU4tXJ8tXtXEzr
 zCGJ67IKU46AR7F9h4/Xo6gH557CrdzWZSCDFwLWadrygVxhTLW6jp9
X-Developer-Key: i=engineer.jjhama@gmail.com; a=ed25519;
 pk=G5nmjm+RTiWBpyCvc5xjR1b3li/2zipLSMyz+T4fj5E=
X-Endpoint-Received: by B4 Relay for engineer.jjhama@gmail.com/20260103
 with auth_id=590
X-Original-From: SeungJong Ha <engineer.jjhama@gmail.com>
Reply-To: engineer.jjhama@gmail.com

From: SeungJong Ha <engineer.jjhama@gmail.com>

Add bindings for the TTY subsystem by including the following headers:
- linux/tty.h
- linux/tty_driver.h
- linux/tty_port.h

These bindings are needed for the upcoming Rust TTY driver abstractions.

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 rust/bindings/bindings_helper.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b42..dc326eb84955 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -81,6 +81,9 @@
 #include <linux/security.h>
 #include <linux/slab.h>
 #include <linux/task_work.h>
+#include <linux/tty.h>
+#include <linux/tty_driver.h>
+#include <linux/tty_port.h>
 #include <linux/tracepoint.h>
 #include <linux/usb.h>
 #include <linux/wait.h>

-- 
2.43.0


