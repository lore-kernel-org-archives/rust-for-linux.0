Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C9927450;
	Sun, 19 Jan 2025 22:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324699; cv=none; b=B4GwHos0zzVijFq/7UCeu4um9T03tWRZqZxqNHRdbhVySPmj/cVQYy56NEADNz/CbxDKhdkPggm3+NOmP5A1/kr0f6IvGJgwrFq7eI3OwfkM/sbrbyIbVgwpD+mZMZUkL3pUQizw5ewcnZYOexmf8QzMB3sAoeyPami9T34lcBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324699; c=relaxed/simple;
	bh=pvu5R3DEvRpsH68p7p6YbbyWCLwlHzpTj17U/YOcddY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Uaaq2y46vA1eYK4uJelNJqq0tioKgLeCrXm+Ti5DO7n3rpABnorx/HsWLofZfLrrXNuZzyV51mCxFP0/Q2YX5kE8eEvLrrGOE2nYybbYOXU+b6ptnD/XS1QAVZAG3bsrKbttQq0wRYQGSmFh3Tr04P6zPXHYa+3bAlt5EFCtsWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0B+mxQ5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0B+mxQ5"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaee0b309adso584405866b.3;
        Sun, 19 Jan 2025 14:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324696; x=1737929496; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SSE28zYEQv0LTOnsDYvfaf5eNpSxRsKhcwyN/fw3chM=;
        b=m0B+mxQ5PeMZWBjG0A3fUKcr3UioEbYDlaOL4jAJrBLL2dlM6APqI585ZGSVqhD6RM
         rfeSgihCZ/EQ+fMIxUiJcUGb3dhIGK3bu6dIz1YX6eKmxQi7ecRVnpDOUWJ6ouebzfcr
         xDJzh3D/Sxt1wDwcULGXUQWTivq9YkVaawWR++9UVF9CSqccCdI+hx4XLnRhyr2kxE4T
         w7On1bkIXN0+Jw+nxWGQbvtr39irL1kvlBHCREch1m6McG5Y5L9ucGAIM28HQdN3ZTb2
         tT1c2ah9Rb0lSwuRzBGZ8/4h83fSisLek4NmJDajgvTvjSMA/33u0XhIWGLS22XKJmtw
         Tk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324696; x=1737929496;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSE28zYEQv0LTOnsDYvfaf5eNpSxRsKhcwyN/fw3chM=;
        b=Yp9JTC5gs1CnTWiu5LHUnwyKHeh6bIWa5onXZc8kzHUwgH4BqQwh7u6a7cW78IdxU/
         6RcXfyfnzkvhGTt806+eTHgVm1k/18JGUcUwl5O4OoKLDK1D0v3dlMsFMIvBincZ6Iiz
         vGGSVeVaCjjoqOUMHXA390j/x4ocDtgD/f+17P2jAP8HUPSbTe3RjULZQHV6ePvSUicI
         rVGqeCTxMRsA1WViwYBIYmSFOb4nAE2jnGUjcaCJceTUZZeIZLcGdCMLCzm7PvnlVnkq
         LmJOh/xET+nKd6SNyGQ72gsKb89STauHP5S7H1rh9WZ/yJzOeXd5/ob06J2Hwdmrum+G
         ARlw==
X-Forwarded-Encrypted: i=1; AJvYcCVYS03KtSQHuw4euR0q8vvi6WAEVAOBMY/rrammHPYQe/7zjunSKLJ4fJM/sv6xsECF7Gel7WaVQDAy/7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZW1uXyHes1eQP2JAgWRr2pULlM3+dp5fjAyWkZjODgmfEtHoJ
	KUlfBq0K5j+m4yoVftmKlXI2iwAnVT8YwXc9y/PBbiK9n8lUG32d
X-Gm-Gg: ASbGncvjy8YccA4XRFgsagPhHyBftbJmdH7LRPijPU6v51NSEO82qPyhI7Ah88hgPUF
	4d6kyTElUr8W5vMb8FKqhLsPgJvQ6dU19OgqSk17+Zfr9CR2fx00lECY04G1Iw/hTyulUahJwm6
	z63yyjyjVKiVnYTqHhsIJqUd2ZcWuwl/DIutCimPV/WdjWUloHdSzg4phKFfR2jN+1CbO2alEc2
	xfov4KYmDoeGNZlJRh/OtyZ3rKWl/l8A1s0XqhGjJopxdMMBp9tB3Om+Q==
X-Google-Smtp-Source: AGHT+IFQIB+Qxk7mtFfAwkruLOI0w6hoMXW4UZCjLy8swmuUWjjjqJNuGFvNegU5ZdyqlQ+iprLa/g==
X-Received: by 2002:a17:907:d0f:b0:aa6:a9fe:46dd with SMTP id a640c23a62f3a-ab38b3aff9fmr1136595666b.38.1737324695866;
        Sun, 19 Jan 2025 14:11:35 -0800 (PST)
Received: from [10.0.1.56] ([2001:871:22a:8634::1ad1])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab384c5c3e1sm537196366b.7.2025.01.19.14.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:11:35 -0800 (PST)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [PATCH 0/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
Date: Sun, 19 Jan 2025 23:11:12 +0100
Message-Id: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIB4jWcC/x2NQQrCQAwAv1JydqFZKqx+RaSkm7TNwSrJKkLp3
 w0e5zAzO7iYisO128Hko67PLQBPHdSVtkWScjDkPp97xEuahmRvb+NDvXIIVUaTRb0ZtXCZGiV
 C5FK4TrkMEKWXyazf/+V2P44fh6y663UAAAA=
X-Change-ID: 20250119-b4-rust_miscdevice_registrationdata-a11d88dcb284
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737324695; l=1566;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=pvu5R3DEvRpsH68p7p6YbbyWCLwlHzpTj17U/YOcddY=;
 b=abtFLwRvCVhTj8OJ2smQvxWh+CihIzJtHl/B3ziSvi8dImhXNkRKLyr8d1xTw1xDZrBhXzuuy
 v14LEApWAveDFWHBmg8aVJNMHFoJlTLyy59WR9tS7s/XngjnizJc7/u
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

This set is based on Greg's driver-core-next tree.

Currently there is no good way to pass arbitrary data from the driver to
a miscdevice or to share data between individual handles to a miscdevice in rust.

This series adds additional (generic) data to the MiscDeviceRegistration
for this purpose.

The first patch add the Aliased type.

The second patch implements the changes and fixes the build of the sample.

The third patch changes the rust_misc_device sample to use this to 
share the same data between multiple handles to the miscdevice.

Some discussion on Zulip about the motivation and approach
(Thanks a lot to everyone helping me out with this):
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Passing.20a.20DevRes.20to.20a.20miscdev/near/494553814

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
Christian Schrefl (3):
      rust: add Aliased type
      rust: miscdevice: Add additional data to MiscDeviceRegistration
      rust: miscdevice: adjust the rust_misc_device sample to use RegistrationData.

 rust/kernel/miscdevice.rs        | 37 ++++++++++++++++++++++++++++++-------
 rust/kernel/types.rs             | 40 ++++++++++++++++++++++++++++++++++++++++
 samples/rust/rust_misc_device.rs | 22 ++++++++++++----------
 3 files changed, 82 insertions(+), 17 deletions(-)
---
base-commit: 01b3cb620815fc3feb90ee117d9445a5b608a9f7
change-id: 20250119-b4-rust_miscdevice_registrationdata-a11d88dcb284

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

