Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCD63358A6;
	Mon, 26 Jan 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430130; cv=none; b=k8qvA2DpSOuSYMMYkW9xiXikL9lAd5lGp8SS+xU9L2mw7wiJDnsbkX51kPRLqICtdZE7Bi8eDHU/SHz8HfeFxLdgGHIKv6T+NBiLMkidEnI3bKrz0PmVKFezl6pGfxWvISG6A4jwQvieEwHY39ZOS3ItRSPMSZdS7rLGnf0CW/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430130; c=relaxed/simple;
	bh=2DfOT3UAARODVsJV5czZKsnnyvSjYk3Dn2jTSNBf8po=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N4l9ugji6KzpJCfY78o35Ss5qIILuYxLBNztS5q9/ySCfaWanrSWx3UTmoy4S5I9uSNCpoto1LsPgLFnPRtLMx+lThMVhh4yyEKR5y8J+KrOD0O1+pU/r9n63ci+F6oyKr+OhWRIV+puArdhLn6GkON5DapUaYfsg3Mt0mg83s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpRehMPS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpRehMPS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43833C116C6;
	Mon, 26 Jan 2026 12:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769430130;
	bh=2DfOT3UAARODVsJV5czZKsnnyvSjYk3Dn2jTSNBf8po=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HpRehMPS2AAEyNJt2d67GebFNypghWkg5M3sGmc43tuXtZ6a42xFJOLriweRJZnIM
	 MSIin1RU9vm+x50Wow4cQS14P4J/bEUIZndorPBtEdak1SCaWLE6EJOQEQJ7GdbBQN
	 pJvTn13rT0hSTEiQWN0neOGvTGatAcRhwZlxp3oUe9U3xJ83P5/WM/S4Xk4l1jXfWB
	 hwkGYsaLyYdDRRz7wQhyxhL5Ivz+3VRV4dw64tBt+0f69I4zvDDQnqnulOldJzdbhY
	 +uCVxf7nkVRdvYwZJ/AOcVmlVU22PrE4x+FxHQ56L6P0g2TAD9pTgfectpORN5iobf
	 fCl+Qexr7wNIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AD7CF65D4;
	Mon, 26 Jan 2026 12:22:10 +0000 (UTC)
From: SeungJong Ha via B4 Relay <devnull+engineer.jjhama.gmail.com@kernel.org>
Subject: [PATCH RFC 0/3] rust: tty: introduce TTY subsystem abstractions
 and rttyprintk
Date: Mon, 26 Jan 2026 12:22:07 +0000
Message-Id: <20260126-rust-tty-printk-driver-v1-0-28604e7e100e@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9cd2kC/x3MMQqAMAxA0atIZgO2QgdXwQO4ikNpowahSlpFE
 e9ucXzD/w9EEqYITfGA0MmRt5ChygLcYsNMyD4bdKVNpbRBOWLClG7chUNa0QufJOicd7bWpvZ
 GQY53oYmvfzxA37Uwvu8HyXEbOW0AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769430128; l=1424;
 i=engineer.jjhama@gmail.com; s=20260103; h=from:subject:message-id;
 bh=2DfOT3UAARODVsJV5czZKsnnyvSjYk3Dn2jTSNBf8po=;
 b=tVTYQ6aHhoTY4AOc9tNlItXqUo1rNgAXfMKxs2A+KpY7m2RRULw/EMmDxnuoXfCv1XIwK/tJW
 pkNj1auCv2PDnbN+k6E18znO+vwB4H8ZuY+CJqmKKyeGEtLA2JNNnxx
X-Developer-Key: i=engineer.jjhama@gmail.com; a=ed25519;
 pk=G5nmjm+RTiWBpyCvc5xjR1b3li/2zipLSMyz+T4fj5E=
X-Endpoint-Received: by B4 Relay for engineer.jjhama@gmail.com/20260103
 with auth_id=590
X-Original-From: SeungJong Ha <engineer.jjhama@gmail.com>
Reply-To: engineer.jjhama@gmail.com

Hello,

This RFC patch series introduces Rust abstractions for the
TTY subsystem and implements a sample driver, rttyprintk.

Currently, TTY abstractions are missing in the
Rust for Linux implementation. This series aims to fill that gap.

It consists of two main parts:
- Rust TTY abstractions
- The rttyprintk driver
rttyprintk serves as the first example of a Rust TTY driver.
I chose to port ttyprintk because its simplicity makes it and 
ideal candidate for validating the new abstractions and demonstrating
their usage.

Thank you!

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
SeungJong Ha (3):
      rust: bindings: add TTY subsystem headers
      rust: tty: add TTY subsystem abstractions
      char: rttyprintk: add Rust TTY printk driver

 drivers/char/Kconfig            |  13 ++
 drivers/char/Makefile           |   1 +
 drivers/char/rttyprintk.rs      | 180 +++++++++++++++
 rust/bindings/bindings_helper.h |   3 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/tty.rs              | 173 +++++++++++++++
 rust/kernel/tty/driver.rs       | 478 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/tty/port.rs         | 148 +++++++++++++
 8 files changed, 998 insertions(+)
---
base-commit: e741e19d7691c5e6f5c2bbff980d835dccb86054
change-id: 20260126-rust-tty-printk-driver-ccdca3263d61

Best regards,
-- 
SeungJong Ha <engineer.jjhama@gmail.com>


