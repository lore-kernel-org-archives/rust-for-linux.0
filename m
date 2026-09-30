Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAA84D9F72
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 12:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772545; cv=none; b=XL6MxwRry24zD2uoQqulPvF9CfA0ZuS5ZgKxrZZkfXFZmszwRyk4q7HtSyGAezw5xBoyL7El3L0hxrEyEb8e3xuYr7OjAqy/ZF9Y3SeIFo8D2Co7LFT7GDwLdfOWUNHchFBy5sG1zW7RnndzKrYhK7DD+zd4zeITjiPqNABuSjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772545; c=relaxed/simple;
	bh=FJCJ78xmhtGVgtD0VY4vXLRzPOnLFDj8Tk7B0+nxelQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Y/KCFWTOEEjpaB12GhVWXic7pPPoRq2Hm1L5LsXruv3PKGB+10jJEATKtMfUbzyO7yMhXF7YHHcLpiGnJHdT3vVOOCOVydUTVyzNidJKxCaFd6sO6gf7d69WWd3ikTB3uF5WLIE4YDhDo9OlZdcCBQeQN7Uvyoqkho8B59C4cVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L57QC4zt; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L57QC4zt"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c2dbb6da00aso365457866b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 05:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790772536; x=1791377336; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mt4jfo1X+Tq1Da4a3Y+n/0v/LLWT128QeB7gA9Kbmo8=;
        b=L57QC4ztbP6Oney2X7tjHKrMFiSjGxlUQrU3nC6fMjtonRCwdDT6y+yFAvW0vncsfp
         2LUhz/k/MjpM8qBPOmCA/a0y99IStIPN1z8nxkAbhYo60SdWLFcsV4IWQ+dYcwtcHC4c
         jzifgiCzuDva8STLgsSgsU49mIrVCFLHePCByNF9YUEtceEC38ka8cWl87VqcDJU5/7h
         vc77w3DAiXctGgwGxr6QrnJ4q569cuzR5QTmhaSFg8eJ1voNxo10VZIQhsRfRdTFG1f1
         ae4s161OLbXTa79E1kPlmaXSEC8OYhl9rG3gJ1OOZAYiXelmV4m1onN69ZQ78MZHWhtj
         1qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772536; x=1791377336;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mt4jfo1X+Tq1Da4a3Y+n/0v/LLWT128QeB7gA9Kbmo8=;
        b=WDtv2NNLB1SuwxB3+j55gREcGzbtOQWDrz79RGPYNOpq6zioWlZ42pbHRHhEqjH+RX
         hCNh78ActuakR3QkCqBTLWD+S4T1RxBWWrcgTITs0tzcTB4I7qfqqHO+u004FDleFulR
         6pcRDS7L4VgroVDpeciBST1WGGB9G29iiT7RMrbIRxMhbRRW8MMWhBOvvejRPZOiDF3+
         FN6A6GehUymAYYOPgr1jjcThgw/uQdYS2yl9S8Fq6j5kYcf2uIHrCuvFUjs5SMxQ34mq
         xLlO2K2kCHJ5+qBj6f6Pz6oaX6GDjq4BZQ1+3aJoA+EkP8pKNfa6Gn/vmxmBG+Tn1DN0
         WBhQ==
X-Forwarded-Encrypted: i=1; AKwUvByAqkUK/Te7JvtgALb0T/GQItjutc5Yk0+Pn+46jJTxe/qAraPnG2a0/rBDbPDIOqnnr6DG7nIH1pNPIdy3vQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m0OBdYXvFq2rIM9mpYeP0mFMKA32CytRl7QgAP7U0j2xPLW2CG
	cGORnutXsIBkuQ1nrB4LtytyDwaKKcfWQZRSk6VwGCdGg8oSXGO+37zcsWMOA7jChnivWdU3gvz
	m7FwIyoXyILge0342tA==
X-Received: from ejbvl21.prod.google.com ([2002:a17:907:30d5:b0:c2e:27b8:8564])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7296:b0:c2a:f2bb:326d with SMTP id a640c23a62f3a-c2e23ca71e0mr92233066b.9.1790772536018;
 Wed, 30 Sep 2026 05:48:56 -0700 (PDT)
Date: Wed, 30 Sep 2026 12:48:41 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACkFvWoC/x2MQQqAIBAAvxJ7bsFMKvtKdLBcayEs1ogg+nvSc
 WBmHkgkTAn64gGhixPvMUNVFjCvLi6E7DODVrpRtlY4cfQkeIqLyc1n1nHbF7TGdjaYdqqMhhw fQoHvfzyM7/sBFQ1dWmgAAAA=
X-Change-Id: 20260930-binder-transaction-log-94989f47b142
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=FJCJ78xmhtGVgtD0VY4vXLRzPOnLFDj8Tk7B0+nxelQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqvQUx1UkjVlqIAzLTm4KjQrBy5suuQ32eNQ1yG
 Vlan/y0eUaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCar0FMQAKCRAEWL7uWMY5
 RlIJEAChyXcuNzYJCn/kcxnNLEec1MYXo2yOVQRngYn2aiujnkW9j0SIryMXMV2kb28fGhTGKon
 X5iSUqgzjsB5VXeyNhY1V3x4NEO7iWtghEhOa+0W93HAVL41L1RsbRJr5G4t3kg+Fo9MN/i7qhU
 aC7HJe3LgeHKjHBiVNAjnWa9MPKt0E6G2zzfa/b3MjrdcPKBDOGepxcmhookSlzTNO1vEBPwXZl
 dp3I/YowAQm052XU/ngQ4HFtVrVzpWAInRaW81Id5JGkS1CvmcMSUeE8p9dDn5V2i/Oh8Mo9tnU
 DcwJsee2qWexPh4VMWIn/f/rTUsSomPErSsfdLytc+2ornBTMYmyYNSD99Rx3Qir4tDzK6kPEmE
 RUji0lDAj0QNCDH1jLY844uZCWbYlGc/dtXhxmT59k8qDukBUvvLuGSf+ivClz8RWCmsiO1GBcA
 eq851O6/KAhFzb7kpHja6tKEEmREdhm86uhdC5IAW+amYWcuy5GZnTpaZxfz1OpS8PJwUOS2Lgh
 sKUkNTvcww398F6/h1o5oEGPtF2Yss8HfXsddBtVJvQ6cECWWbOkCxl/poVDHg55cAmjm75BeRk
 +zLH5aOzUHFVAqFiIk9yG3r6qVvjXtHcQIwaUco/Oz0buJXtKNpp7twubyuksnWxioGECqrWqjU 28UE3loojMH7pTQ==
X-Mailer: b4 0.14.3
Message-ID: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
Subject: [PATCH 0/3] rust_binder: error line numbers and failed_transaction_log
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When diagnosing Binder issues, it's useful to know what the most recent
failed transactionas are, so include a transaction log with this content
matching the C Binder transaction log.

While we're at it, improve the line number information emitted by Rust
Binder using #[track_caller].

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (3):
      rust_binder: start debug_id at 1
      rust_binder: track caller location in BinderError
      rust_binder: add transaction_log and failed_transaction_log

 drivers/android/binder/context.rs             |   8 +-
 drivers/android/binder/error.rs               |  39 ++++++
 drivers/android/binder/process.rs             |   5 +-
 drivers/android/binder/rust_binder_internal.h |   1 +
 drivers/android/binder/rust_binder_main.rs    |  26 +++-
 drivers/android/binder/rust_binderfs.c        |  19 +++
 drivers/android/binder/thread.rs              |  12 +-
 drivers/android/binder/transaction.rs         | 193 +++++++++++++++++++++++++-
 8 files changed, 293 insertions(+), 10 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-binder-transaction-log-94989f47b142

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

