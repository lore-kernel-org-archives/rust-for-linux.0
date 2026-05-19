Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C4725D527
	for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 05:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779168921; cv=none; b=F7drBkX8EVLecT3Ye9o2d1q0RnlvV7RuOlUrlsdtf0A4oTwcWSaZ2h4NG/rslG5/gl+mwDAucKi3tR1qOCVcLYrd0CF6hpjzYFQ9s1dqk6rW4dCdQrESGUXTyxbKq6QR6tHVEl+v9bdnMfTWxyG6zy635wn/rXRaW4329gqeKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779168921; c=relaxed/simple;
	bh=Kt1pKARna8/xQ3HmoQXhRxx24kWWvngd4wSdwQk6i9I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OgMLR94xg1hKGzZZyOxVktHAsRU34e/fq32vIAfdBwaTWJozPXE1Pw3dt4dlLxemaP/iu7IaGBPK6SD3ijBnlKwG02/pstVr7syd93tYYOKrpN+smlWdZKmwUqD53gJz4CooMOAZ0OCQSvQdNHoUsQ3zv4vdI8LYYaZB5boLDSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kSr8NDT+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kSr8NDT+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3B71C2BCB3;
	Tue, 19 May 2026 05:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1779168920; bh=Kt1pKARna8/xQ3HmoQXhRxx24kWWvngd4wSdwQk6i9I=;
	h=From:Subject:Date:To:Cc:From;
	b=kSr8NDT+HyulOLRMAvWoMaHavUS4FMFwNI5DdAyxyfgW7492kE2C7sVWa7xqbY3K7
	 8NzoE04WmI86r3WiEMHCQqT199ijkM8zLyhimmDrGhskfkkObezjqCvTx1aTG3h8RR
	 B96sinfouhH6MP19WYCFRgopUE9fxmfHqQK0igHE=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F2ECD4F54;
	Tue, 19 May 2026 05:35:20 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Subject: [PATCH 0/2] rust: use vertical import style in miscdevice
Date: Tue, 19 May 2026 13:34:40 +0800
Message-Id: <20260519-miscdev-use-format-v1-0-11d526ba0edc@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHD2C2oC/x3MSQqAMAxA0atI1gaM4ngVcVFr1CwcaFSE0rtbX
 L7F/x6UnbBCl3hw/IjKsUdQmoBdzb4wyhQNeZZXWUktbqJ24gdvZZwPt5kLWzPW3BQjWSKI4el
 4lvef9kMIH50rfo9kAAAA
X-Change-ID: 20260519-miscdev-use-format-9ab7e83b1c11
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779168918; l=679;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=Kt1pKARna8/xQ3HmoQXhRxx24kWWvngd4wSdwQk6i9I=;
 b=71h/KZZhVWHxosEJ/I2y58Dbo70gw8FqY2e6wU5kTNxYIUaS+GkBfItvwUOhLHBCUr+fn5Cg7
 gYG+1DOcyvYApGLaHyO7O3ggtGI1EnHTjW/jV327TrlrMv89tgYo+cp
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Reformat `use` imports to vertical style for readability and to reduce
merge conflicts when imports are added or removed.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
Alvin Sun (2):
      rust: miscdevice: use vertical import style
      samples: rust_misc_device: use vertical import style

 rust/kernel/miscdevice.rs        | 34 ++++++++++++++++++++++++++++------
 samples/rust/rust_misc_device.rs | 34 ++++++++++++++++++++++++++++------
 2 files changed, 56 insertions(+), 12 deletions(-)
---
base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
change-id: 20260519-miscdev-use-format-9ab7e83b1c11

Best regards,
-- 
Alvin Sun <alvin.sun@linux.dev>


