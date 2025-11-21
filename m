Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97766221F03
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763719596; cv=none; b=qBP4kCQ9TXRBvVPAppEk4Te79c/6ttWQIBaNYVFUGl9Vs8q4zbbYkm5WShNcsO/U6fP45cDqTFRi6pyoZMAuCgaJEp9kGQJDEPd37BkprwP8Hu6B28yZVrWua3Q3SWkuJZSYELsZI5s/DHCdJN00beBlGsV9pwhfz8UT6awteIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763719596; c=relaxed/simple;
	bh=N8NK+9HzgVBmvKM8uZ/abWRgUxkWOSAMizMqPlEBD7o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lQlLpjloCeZj7wmiKXQaqM1uCfs8EyP2LsWpgy83w6Sz81KjYtSt9UjYoghL0ij3qNVYgW7W7Rw3f0PWKuY8eHrS24ZdZ/Fg0BQieymJ1+PPrUQNeaoD3F2X1MZcqVeLINYDZtNz3CD0bPCB5zj4hEK4Jqc66WXADcsUza6sypw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0pywe889; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0pywe889"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b2f79759bso2098772f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 02:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763719592; x=1764324392; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cl2MKw8tab6Mtz1FgEqrovn666OZWtYzaeQDzUi1X/I=;
        b=0pywe889Ya2zp1F8g+eCjc2/KqLVoblGNobWfRrQb1vmwCw7MlzSK3KKLAEGK4gG0f
         Odhg0Mk6jU0cjvygkEGB9/lEKAQ/K8IOrDBIkF2tZFFqRz0Y1yAV770yCr852mi/FGGA
         jU++q9HPw1AUxbLeGIGUPKw8Hnd6te1dUtF/1A2/KXkm5IYg7pGlCDHpb8AykXmyXstm
         BTUpxQh6AYzI3R4V/ZLVuDZAZffMbjlPS0BCxIL7/phd7XJVaGvxo6em5+s3mUUx8huF
         Cev7Fgl8KlepqGNvIfo1R/e2aU9ej+j4b+YReJXaFDz/Cdn0EmrM6fnsfzyVIuzSWUpa
         ChaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763719592; x=1764324392;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cl2MKw8tab6Mtz1FgEqrovn666OZWtYzaeQDzUi1X/I=;
        b=fs3IAoW5pZBqy7q1NgFlMpAyzJLVv2dPbEp0NTA0Qk0AWBCgdTXmydbpgACAhF/ZYS
         G5tcy5jZ0dfL88GoislG1OfTsVLJEUjj1nQe2whjFzQIfjeE7DliKQMpSkpNa+5yf48e
         /ExK2ULRxYO9Mz/98TGIx/TrnFOsNXUaFAKXHd+7b02+XQp7AsbKusMYSUps4DmeFecV
         Tsn/yS+fWmwzVILKibSW8m6NawDi4IIMw4ROhmOXoxzyrSW+GQaZvm8pf+UUGJBvhZky
         1mTZem0yUCTqp6bA5uMbknw84rkMIahRX98uJco0vILat8OsgIIZEHurakUoR8TlwXf+
         UHMw==
X-Forwarded-Encrypted: i=1; AJvYcCVY71cqb2eJK07i5X4RP7I5EOQTEQEDTroV0XxqVLlT0uPX0+i9RJhho+a4M4Y/2D8K3uj3MMhLvIRCixgo1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4JupLbKZPKBtIPKLZl5EmPFzXXXN2X0PUOKWVYJp8TyvP746V
	iFrNmaftc4RYsqkMoypCKHpDf1B/1bfAp8uE5TEtplz/5sV86S3cQKQonBoPzMYa+Yb0oEBMzsM
	vlBeOL8ykoPRianAFcg==
X-Google-Smtp-Source: AGHT+IFRCpnui5X/hdHVF+GN9/3IwNDrRnkzekQdAdU4QEDBAj7wm7oIR1v0hrBczQVblLlGTSnUTYy18xsQNyg=
X-Received: from wroe1.prod.google.com ([2002:adf:ef01:0:b0:42b:b28a:6748])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f44:0:b0:429:d350:802d with SMTP id ffacd0b85a97d-42cc1d34848mr1592512f8f.45.1763719592117;
 Fri, 21 Nov 2025 02:06:32 -0800 (PST)
Date: Fri, 21 Nov 2025 10:06:30 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <aSA5pshsJ7TeJIbu@google.com>
Subject: [PULL] DRM Rust changes for v6.19 (2nd)
From: Alice Ryhl <aliceryhl@google.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dim-tools@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

Hi Dave and Sima,

Please pull the following DRM Rust changes. This PR fixes a warning and
broken link in the Rust documentation build when building with rustc
prior to 1.80.0.

The commit has been in linux-next for one round.

- Alice

The following changes since commit f0ded972d37150f9f889de75c9eecc5cb0730013:

  Merge tag 'drm-rust-next-2025-11-18' of https://gitlab.freedesktop.org/drm/rust/kernel into drm-next (2025-11-20 10:44:50 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-next-2025-11-21

for you to fetch changes up to 57dc2ea0b7bdb828c5d966d9135c28fe854933a4:

  rust: slice: fix broken intra-doc links (2025-11-20 10:13:35 +0000)

----------------------------------------------------------------
Core Changes:

- Fix warning in documentation builds on older rustc versions.

----------------------------------------------------------------
Miguel Ojeda (1):
      rust: slice: fix broken intra-doc links

 rust/kernel/slice.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
