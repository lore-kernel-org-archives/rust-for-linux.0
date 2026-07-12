Received: from mail-yx2-f0.google.com (mail-yx2-f0.google.com [74.125.224.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4AC266581
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 21:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783890550; cv=none; b=k7DG+bHhV995QBwv6y/Hj0Z4wGb5NvrBDcphRwp2/LvGLCMhVoeVDrkMb3mJ6pBGyl+IKE2HtcarPFsz/UtyD4NY2rT5Ad0Sq57UcHmRGoeld1CBRJeqFQ8HPXlxoVk3sh08LltvlBntuZYNypQekaMQeXCCXovq3SRTo+sRbvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783890550; c=relaxed/simple;
	bh=bFE/JWW9TAkcpUmzVOdNJc9U2Zqimvu4ws4jMJRFwcE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N82FMeng/jKRT+APIc3Pc/Z2L37bdfD2zFqDMIqLLd2HLsZEdwNNXryE9agssE7w5CHXzRWAEy6gD7gem3CzEZjJusMrv1z2HOU/aJA00psJoKTn/aggnQySkVJUCU3xw1c2sVGvGMbclakSsc7TeZzUTm6GQdH5UA+E4GIPBk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkNq13xK; arc=none smtp.client-ip=74.125.224.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkNq13xK"
Received: by mail-yx2-f0.google.com with SMTP id 956f58d0204a3-66282525fe1so1726543d50.1
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 14:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783890547; x=1784495347; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1kr4dGY6ek9n+czCQ3eQcMwxF8cQoVhvIzP5bcZmOvM=;
        b=pkNq13xKCyfvQ/MVNn3pflQJBIKqLDtrHk48ISzSaCgOhBug1ewZbfM1YDDw+OgEf2
         iWdlmXpBY9kmgn9YgFa2Gh4a6MnuwTcP7u9e5gmqEKkgb3cqsmUBRAcVARrtKW8VDb1I
         S1oMtGHezwwTH2Q9XdL7L4iaESlAt4DTW4hJ4Dzr56vZmcEHXvqPksk47CWzzsYkVJyv
         mxJK739cJQJzqSjRawbaxCHqWJ7jw+evTJCYFGcz8c/6L6XK+y9Nn9vW7TWhJ36cxMIM
         0EglwZYOcx9zBz0/GNZqr6IvQhmBpnZyGDC3wq+AuYlnR+ENDxODHTOQ6/0ovAJV5gij
         DruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783890547; x=1784495347;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1kr4dGY6ek9n+czCQ3eQcMwxF8cQoVhvIzP5bcZmOvM=;
        b=BqiOYz1LViPB9ye/dDJkTPPm7rxa3BqCdDGJ97W7ggb9CGacpWmgOA7xWs6cIUzoVt
         5/UQ8pSqEKnwuSFXCkLgXitTuG1Y4oC5GypYmt2SN6dyJfbb+Ck2Dr2jLGSoRNoObFIE
         /OPDCVX9jv+e6pNb3IfM7Y/U1kTjahtmMsimupwtgmge6MGB0HKzNTp9kul4xAwrDC3i
         5uDGMrHxu5DqrMCiS7GdK+2n3f53aX92sZ9mpdgYxQ8tAQkp2rVIKIAxNKTNNmCJkdDz
         405AFSYA48MHY7j3QU5fXAq2Be6CXLTEPOcOgt1992uuFTuwQYfPLeMfIiAjM3PRvzv6
         gMjA==
X-Forwarded-Encrypted: i=1; AHgh+RroZ4Wd7Y0kpv9N3R+LxA3JPwaPS7JyAmMIIET+F3IUtUrdyzEDcVwK/+Hv60wqo6jCmXMcqltGgq8FM2Sy0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YynIL2sRA1VJ3Xi8bTNpHRKcNJC55OpEhzyKi2v9XmSVyWEA6K4
	IyVoK1j0m4Hs4L5Ksh1EeXeBZqJB6n4VycdmpBsa4eMIfmJYHvzQ7k3S
X-Gm-Gg: AfdE7ckdoNTLj7yXwuSoUiLx+i8bYpMhjpwL1DjqwYojBMTQ18cI0I8yrsF/H2EKp5E
	i4Y0POC18L6ZDU5AUfdKMFI/xFv62nyKMzoX+i7kCdIradC6ifQdFWZe+H1aoUYPevznM5mDR2w
	zDKAJx56RH3v13jOJNhvKsyQwqQjkl4h8oVls5OI7QEGzGvFmH5AnmtHlYe1QLnalugGplqcJf0
	lj4ob/VtQmhq8PCH8ezKmCxIiu3cUlGgdH5DXZ3wlqmubU3TZ39zKO6r0yp8YAlBkstOEXnVvpm
	v4V9QeQ6WoeMiqBtGiUzP7yBaYPdaKWkcpu45Eq3pqtpa9OyfxD4P9cdxjF+pylJa2AWk6i2tEE
	r7qgDsHYNh7pMhIcN1RjsT7MNTXc07tImpyZ0s37sdL1qebGjzWG5+xUW++typQr8IpQ5laLs5h
	kYQm8sKZYKFZY9jHet95cmeV+USLxlQArNdMcPbUnU0jJ8h7csgCInEYaTbEHGfa44h4kWqA==
X-Received: by 2002:a05:690c:2605:b0:80c:ff94:e87c with SMTP id 00721157ae682-81e901090dfmr57952367b3.44.1783890547511;
        Sun, 12 Jul 2026 14:09:07 -0700 (PDT)
Received: from [127.0.0.2] (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be9834dsm99737387b3.9.2026.07.12.14.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:09:07 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <colin.braun.cl@gmail.com>
Subject: [RFC PATCH 0/4] rust: usb: add usb request block abstractions and
 a user
Date: Sun, 12 Jul 2026 16:07:57 -0500
Message-Id: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC0CVGoC/yXMQQqEMAyF4atI1hNou6jgVWQWbU01LnRIqgyId
 7fq8oP3/gOUhEmhaw4Q2ll5XSrsp4E0hWUk5KEanHHetNbhJhFD1CIhlbrF3aJxJvg2W59yhnr
 8CWX+P9H++1q3OFMqdwnO8wKgSIC2dgAAAA==
X-Change-ID: 20260712-urb-abstraction-v1-020a67f16cff
To: Miguel Ojeda <ojeda@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-media@vger.kernel.org, 
 Colin Braun <colin.braun.cl@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783890545; l=3122;
 i=colin.braun.cl@gmail.com; s=20260630; h=from:subject:message-id;
 bh=bFE/JWW9TAkcpUmzVOdNJc9U2Zqimvu4ws4jMJRFwcE=;
 b=aqEoR5ebo1/QQ/Rm6VEYTSCX5E60MN/CL5zIQdHKdjL54xZXUZCkk7TZT1E591D+0VJ8cl6aA
 LC57ADqqnGHBiP/zetpJB+loUSSDscTfQc7/Lt8/rY+IYrjLXZKWDHG
X-Developer-Key: i=colin.braun.cl@gmail.com; a=ed25519;
 pk=DJ5DDAbTXtW6OgSgetK6R1PUfhtCNSvSayX3Je17ZAY=

This series introduces initial abstractions to allow for the
implementation of USB drivers in Rust.

This is an RFC to demonstrate a rough idea on how the USB abstractions
needed to create drivers in Rust could be implemented.

The series is broken up into 4 parts:

1. USB chapter 9 standard descriptors and constants - Exposes the
   necessary structs and constants from include/uapi/linux/usb/ch9.h as
   a new ch9 submodule.

2. Interface and endpoint abstractions - Wraps the relevant C structs
   and functions defined in include/linux/usb.h, allowing drivers to
   safely query and configure interfaces and their endpoints.

3. USB Request Block (URB) abstractions - Creates a safe wrapper around
   the C `struct urb` to allow Rust drivers to communicate with devices.

4. An initial user of the new abstractions - A driver for the GV-USB2
   composite-usb video capture device.

Patch 3 is the bulk and core of this series. By their asynchronous
nature, creating a safe URB abstraction for drivers to use is tricky.
The goals of the URB abstraction are:

1. No `unsafe` needed in driver code. This means providing a way for a
   driver to safely access private data sent with the URB.
2. Drivers are forced to handle the URB status in their completion
   callback before accessing the URB data.
3. Dropping an URB ensures it is not in-flight and frees its resources.
4. The URB can be safely resubmitted from the completion callback.

The patch elaborates on how these goals are achieved in more detail.

Although the URB abstractions do not include immediate support for bulk
or interrupt URBs, I believe it creates a foundation conducive to
future, safe abstractions for them.

Patch 4 is first user of these USB abstractions. The initial
implementation is very much bare-bones, only exposing audio data via
debugfs. It is based on the in-tree STK1160 driver and an old,
out-of-tree driver written by Isaac Lozano [1].

[1] https://github.com/Isaac-Lozano/GV-USB2-Driver

Signed-off-by: Colin Braun <colin.braun.cl@gmail.com>
---
Colin Braun (4):
      rust: usb: add USB ch9 standard descriptors and constants
      rust: usb: add usb host interface and endpoint abstractions
      rust: usb: add urb abstraction with control and isochronous support
      media: add gv-usb2 audio capture driver

 drivers/media/usb/Kconfig            |   1 +
 drivers/media/usb/Makefile           |   1 +
 drivers/media/usb/gv-usb2/Kconfig    |   9 +
 drivers/media/usb/gv-usb2/Makefile   |   1 +
 drivers/media/usb/gv-usb2/driver.rs  | 361 ++++++++++++++
 drivers/media/usb/gv-usb2/gv_usb2.rs |  16 +
 drivers/media/usb/gv-usb2/regs.rs    |  25 +
 include/linux/usb.h                  |   4 +
 rust/kernel/usb.rs                   | 905 ++++++++++++++++++++++++++++++++++-
 rust/kernel/usb/ch9.rs               | 295 ++++++++++++
 10 files changed, 1613 insertions(+), 5 deletions(-)
---
base-commit: 30e873dd61b044092dbc657c7c67a5d19adfd933
change-id: 20260712-urb-abstraction-v1-020a67f16cff

Best regards,
--  
Colin Braun <colin.braun.cl@gmail.com>

