Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914123537CD
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788684380; cv=none; b=XFpdLLa3D9+q0HK1ZoYY3Va+xs6R5k01c3W74lVWcHtaX3JoEfEq/tQCnJUawQwsVx5Gijaczp+VvCKYBAZN48UPk72B5x6bAXY4l609zwtBNtnp9FgDAX05mKTuJnixIh2H/DBm4SPWfhW23dSXBWbZ1DU5RY+bXhoq3K2aJ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788684380; c=relaxed/simple;
	bh=IdlUNGokVn7UUx2Hf4dkFaFQZxZHWUcsZhhOiubKWGQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=synx6lUUjOQk3CPpdHBSQbAl1g41w5joJh2KrghioLw1IL6lrqBTpHWFbl0nkOznFpHCp2r1d1MrHh3Df35ZNJhoygicq+0DLswIDGZd8eStITrx4wLueedccuesfJKx9lalawAGyjLCoMsNmCXBbqYu4N1a7BPQFeKARornv/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdV1mNen; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdV1mNen"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1866283a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 06 Sep 2026 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788684379; x=1789289179; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9nIbS0NJ71vyvrSJ2KtRLrKXbssxt03ighnJw6FO84w=;
        b=TdV1mNenUSdYXO4tAb07Crmnl0luqdSwP8ICEDVxCPjvq8hzK+TXs3NjCGo5v3dqAA
         yRy7JRNnA2birEcHtkUSGWThS7Z6CniGos2zfFNMbo0r51q57Vpzab+HPNqlbLiMaGqU
         /R3BFuDlqTSIl/LkiN+mAUi9M4XTe93SVsaueAzuSk0OQz5/D1v9/yg6JY8pxbv2atdi
         8PQL637w1/55LGHGilThpQ8NmsaLtF3KA8sMCkcQ+IFC5GFSw/+l1giwPA1K3AMFoKJW
         e4AH8owQ4skapFPn2pU7vpJKWV59Xsp4Pdgu4Rj8lyYAvni3wUeCelJMS4lPKSPZSrOh
         RZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788684379; x=1789289179;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9nIbS0NJ71vyvrSJ2KtRLrKXbssxt03ighnJw6FO84w=;
        b=fyxjXsnarFciDV0xqMpE6jgeX6DgsYKzRKtHZx1aDh0SAiu6CoCgsgs+H1TDpF8l2I
         gg4L9qxPHHuXCCVA4aomUce50L7Eo1m4OwIqzFF77PDad/PHCQMBpi8M22y28b4Nspic
         sJZSBxgP6pzsvZ1P5TkLy8AltpWHy/D5mvZTagnYdjAsiLOUaggnJwxEbhPUIAIn1OQU
         4KC91x2yFyD1Fc5h4J0XcqgjObCSxQy9hpeGcH1SHjbhZBot+8Rk3eJpj5Nls8b8YCMo
         uLGg1O3Aml8pvg5FxbAG6Jof78/23alRs/E4+JJ3ZSBLERlrMIPJE0KiXZm5IEzCGVOC
         3xDg==
X-Forwarded-Encrypted: i=1; AKwUvBwI0VsjQyFA3/9hECjXJZsdluIMhR4qqiCh95YJNJyUYbR6aNkkiV3SgoGfLYyc6h42supo/V3mHs9G5jHPuw==@vger.kernel.org
X-Gm-Message-State: AFuF++nuT0ohl6A2Vs4LTHhPqsZ5bfe6UTd+291LIsv80V/gLlOEcdIZ
	tQ3fYN9P1RiEb7n+8u6b4tns8HbomQ3Y3era90W10FfWpiDjUF/UDXwd
X-Gm-Gg: AYBFou3/3RXaBwsbpDyD7jOsGEte+geDlATZIyGQprZQyJD6Yh4dYQU2U4spHeD/9g4
	j+wjjKE10IxLStNVrJrnnl3VRITSX+L/3+6RF7ifc1QAfgXG3I5az0KPDLrDAINZ+1oZb+3eJPI
	11/KLSr1cmzD82UKRdKCcXdeDAjpCHxrywJz47apNeW+wL2uip1RrSZCNE/RHZm494YCCBJabrV
	ybpKDT4BcVgeJrSez/QegUh1xk89R3z7Epw8PXTBsxS5jACTaZUnSze3ZvmndqfunawOmV7RBNy
	zikjOu4a378/I9wWun0x2SanL3HShlVyNa9vWwySStQAhapW2y15cHFnt1xaRd0L7RM3ZmW3RRy
	2zzOqcuJslUBVX4ZEZKN2wgOrQhNhSLa+LLyK6JP3EUduvWu3aaBcQCOrvI6GGYGVmopL5+paz2
	yOolDNLVUUdALxP3YEcng6VlEBzbe9dOx5cvrgSBLiDZ9OQ/+3tUUyxFg5vHypwnlEZczMkdXQb
	X0lPxc1
X-Received: by 2002:a17:90b:2c87:b0:398:990e:1587 with SMTP id 98e67ed59e1d1-39b26191cf2mr25113978a91.9.1788684378775;
        Sun, 06 Sep 2026 01:46:18 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm20589811a91.9.2026.09.06.01.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:46:18 -0700 (PDT)
From: Kohei Ito <koheiito.dev@gmail.com>
Subject: [PATCH 0/3] rust: Add basic GPIO consumer abstractions
Date: Sun, 06 Sep 2026 17:45:48 +0900
Message-Id: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD0onWoC/yXMQQqDMBBA0avIrDuQCrXGq5QuTDKxU2giM0YE8
 e6N7fIt/t9BSZgUhmYHoZWVc6q4XhrwrzFNhByqoTVtZ6y54RgCStEFp5kz+py0fEiwv1sb+84
 5FwPUeBaKvP3Gj+ffWtyb/HLe4Di+sg+QnnoAAAA=
X-Change-ID: 20260905-add-rust-gpio-consumer-8799f86bbbfd
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Kohei Ito <koheiito.dev@gmail.com>
X-Mailer: b4 0.15.2

This series introduces basic GPIO consumer abstractions for Rust.

- Patch 1 adds the top-level GPIO module with minimal common
  definitions.
- Patch 2 adds the initial GPIO consumer (gpio_desc) abstraction.
- Patch 3 adds a sample driver to demonstrate the use of the Rust GPIO
  APIs.

Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
---
Kohei Ito (3):
      rust: gpio: add GPIO module with common definitions
      rust: gpio: Add basic consumer abstractions
      sample: rust: Add GPIO consumer sample driver

 rust/bindings/bindings_helper.h    |   2 +
 rust/kernel/gpio.rs                | 154 +++++++++++++
 rust/kernel/gpio/consumer.rs       | 437 +++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs                 |   2 +
 samples/rust/Kconfig               |  11 +
 samples/rust/Makefile              |   1 +
 samples/rust/rust_gpio_consumer.rs | 156 +++++++++++++
 7 files changed, 763 insertions(+)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260905-add-rust-gpio-consumer-8799f86bbbfd

Best regards,
--  
Kohei Ito <koheiito.dev@gmail.com>

