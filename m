Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40EB21CA02
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 09:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763889933; cv=none; b=VcCbYydFDqouz8c2S6AhPspAZ58aLnmEGv29rt3DCPCt8uCRUGMpgbLaJQoW/207lyNXOuJfgd949B31L6+qFRlUWbZ4N1fEu4w0f7wHJ7eqKDz/RAHVoruznNKCP25ZLcbKl9wrVARYBBX7NYCB1qw05bILLEKjk4JzEgVUyck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763889933; c=relaxed/simple;
	bh=nEqPnpenHeMQyt4BL5b+1nS5H2Z7JAz6A5D7rnZ2cp8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G9CaigBs/ap7OHCxDvIfN9U2xqHc4HHDpXlIG3py1XFvSy9yB4hA1fLeSCn7BNuNTaXXCN/33C/JIBJjwtB8VhUq+FbS1Az6+bAGBtd0BDQwBDswd7NfS+AA37NlO/ardN7y62LeuV2aK7mMC3hvHBkz0kMkgj72n0Y+N7EAX+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1uMvzGw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1uMvzGw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2980d9b7df5so41998655ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 01:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763889931; x=1764494731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=977npvamVvdSn8Hrj6nV2vV28cG+wMk/irqNnaoU/Xw=;
        b=E1uMvzGwjfY9YUY80WZCRybsk4ehNF2NHpzuza03qbgc2GwiWivPL0cReYqRCno3XT
         I6mANquK1yNeeAAjruffs1bPKW9BpBh/TedixwIyNxLtOQILKT4jSN3dFjD5YR+w8dP9
         jD4EIFU7nPFTQOp66uceJAfuq932KGlQl+nM/G4ZpVWOsJEIzW6d08Gk4qE+T0RE8YO6
         Xam6aGoyRMAl81Os4tMAaqLbC23l9U3ASCLhWtk4YrOR5Hqp4EIl8CbdLNmCac0hFc8Z
         FZy/iBhDU5Fw9as3PdtDHUwkPO53BobfVxRGhf1zMwKwMDtxw0WSxhOCPgTVIAHeY//z
         9Etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763889931; x=1764494731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=977npvamVvdSn8Hrj6nV2vV28cG+wMk/irqNnaoU/Xw=;
        b=XRr6EnwZuqN1xxyXZNJF0/G67xKT8aP/yh+In5HmFR3xc1CxP3ecS52OKrNsuJqQwU
         nkiyqCVo5LhdShxCHZGS6dp/c5O18ETEBePolPI3oPh0yAJgnULPr9RgTT2+zqMJsyNe
         sknBwG1DqG7AF42GeEbn4P8j9K6sJDcml5HLGi15HSkXi+2mqUATd8MQrXC2Xlr9cj7v
         UZkenkhf9lFLnWX9mHvoLpXQvVUbaaU0SUqdV526i8F6OzXHr05rLO7gIJfJNSmZ8FHp
         1q8xgk/MlYXoN0DNdg8FP4pthHRyT9JcOYDFmNsnCjGRDq2q8F4uEFWdlNlau0zbbXrh
         uVDg==
X-Forwarded-Encrypted: i=1; AJvYcCVdUNpKGPefxUDjVrEqRQHVETHWzg31jLzL1HPWGp4hQRcSEEoUc/1upEEgD/TdIntfFwDlAufMIUucieO6dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTqLaontfdUisPQ70WZ3tCNgSlozYVcPCV33iYXGG0VCMQrqLO
	n8+r+j1ib1Ex5Raptz0EoP+G1D3G3ihtEsFV47RY2LrHwHGqNltb/p0a9KOfDBU0
X-Gm-Gg: ASbGncu06Gh0WsAg0ckEgw8JpFHJ3JxxpUDbcUIYPU+MNuV5+6kjiC2lrFOnVgzZJUx
	Yy78PB4zT9sTFu4KS4bMg7gEzeKl6kbeHOB3sex0j5n1i22HBkuG66li22FmaIi9NzLvSkb0OiA
	IwVOPlGRmen7MPCwoiuPslQXs7BHc5RhDrFKfjsX1EXhBgMEhErudsiUCzH/V4C4c4LBFO7jGSU
	tZ7me9MOWIYhwrIixQnKj0sdTLUdYq2YUrGxav4bHGOYX+1K/X2YypUIZsA9SuOetUTeOkzP/ZX
	pVIN5nNDvNO5v/2pF2tIBNMMKzTPNi3Pj/R+bkYcLKjf9PE1mZlCYHqcp9+LUGC1MeJMiEk35yx
	NFyIeysSJQhOIoqe12USzlCJRYUDES0TRcMdnVCZDMl9sPw0ltn2VDP50ytneirw5pvzdPyjB3C
	bQmHZxFcPt51vwUi9AO10y3drwIQ==
X-Google-Smtp-Source: AGHT+IH0c6lqi1+YOT+atVR2GQVjdlkn5EPFXDoVAJCKagGeZwAimktqjcIQnMFOvKx8Iio/IO02PA==
X-Received: by 2002:a17:902:c946:b0:297:c0f0:42d7 with SMTP id d9443c01a7336-29b6bf5f050mr110076125ad.41.1763889930982;
        Sun, 23 Nov 2025 01:25:30 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 01:25:30 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH 00/10] rust: refactor ARef and AlwaysRefCounted imports
Date: Sun, 23 Nov 2025 14:54:28 +0530
Message-Id: <20251123092438.182251-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the import sites of `ARef` and
`AlwaysRefCounted` in the Rust kernel code to use `sync::aref` instead
of the previous `types` module.

The refactor to `sync::aref` from `types::` was introduced in the commit: 
commit 07dad44aa9a9 
("rust: kernel: move ARef and AlwaysRefCounted to sync::aref")
link [1]

The goal of this series is to complete the migration of these
types to `sync`, as discussed with Miguel Ojeda [2].
The last commit in this series removes the temporary re-exports
from `types.rs` that were originally added to avoid breaking the
build during the transition.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=07dad44aa9a93b16af19e8609a10b241c352b440
[2]: https://lore.kernel.org/lkml/CANiq72=hSTpAj7w8bvcwoJkivxD_FPKnx9jD6iNvhsENnnXBzg@mail.gmail.com/

Shankari Anand (10):
  drivers: android: binder: Update ARef imports from sync::aref
  drivers: gpu: Update ARef imports from sync::aref
  rust: device: Update ARef and AlwaysRefCounted imports from sync::aref
  rust: drm: Update AlwaysRefCounted imports to use sync::aref
  rust: kernel: Update ARef and AlwaysRefCounted imports to use
    sync::aref
  rust: kernel: Update ARef and AlwaysRefCounted imports to use
    sync::aref
  rust: kernel: Update ARef imports to use sync::aref
  rust: kernel: Update AlwaysRefCounted imports to use sync::aref
  samples: rust: Update ARef imports to use sync::aref
  rust: kernel: remove temporary re-exports of ARef and AlwaysRefCounted

 drivers/android/binder/process.rs      |  2 +-
 drivers/android/binder/thread.rs       |  3 +--
 drivers/gpu/drm/tyr/driver.rs          |  2 +-
 drivers/gpu/nova-core/gsp/sequencer.rs |  2 +-
 drivers/gpu/nova-core/vbios.rs         |  2 +-
 rust/kernel/device.rs                  |  4 ++--
 rust/kernel/device/property.rs         |  5 +++--
 rust/kernel/drm/gem/mod.rs             |  2 +-
 rust/kernel/i2c.rs                     | 10 ++++------
 rust/kernel/pwm.rs                     |  3 ++-
 rust/kernel/scatterlist.rs             |  3 ++-
 rust/kernel/types.rs                   |  2 --
 rust/kernel/usb.rs                     |  3 ++-
 samples/rust/rust_debugfs.rs           |  2 +-
 14 files changed, 22 insertions(+), 23 deletions(-)


base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
-- 
2.34.1

