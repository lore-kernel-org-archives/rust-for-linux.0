Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B76335098
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 13:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771509161; cv=none; b=o91UFItUNrTR6VgrL2APHgROrbKg9muEk9rm5Pgbtflqq3Si7m7aWDAUSJkPqSzS9B/YdZ4yS1iumuoQ179sBy2eJ1ZFjSTQDSZ1MQS+BWQcks+GU4/PoCgT+Z1DNJalaP8EYLdlsR8pyAZw5W4Ie2lF8gor3lJ3TJMCDD6LqJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771509161; c=relaxed/simple;
	bh=EPV6eGHOv7LRjRVX0AUrYTvK/gVsZB8Kil/3XXwbSxw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=t7/u8efc1VQF/0g2Ee/NrILo5J+SaOwrwm+MslElT6sUS0xzlUa7D/nBLSXdNp1qe232F7gosLq/Dy3Mxl1m1YOs3SwNgX7Zk83iHUhD8rnyAqYwCQLBXr4oP6yqLYUzgit5aS4NyLDzRvn1XSt5ngM9+gfmt911gS/x//4YvbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W/oJnFlJ; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W/oJnFlJ"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43635708e98so607933f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 05:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771509157; x=1772113957; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tiMwY4zAfBhAe+is8mkbLnRs118reLy6/O8LxJgI7qc=;
        b=W/oJnFlJikkGaNmfYETqWmPCdDRv8CPX4YjM29SpBwqug5n7+T1jkhcBhPd3IMmrSL
         +RIIIJ1jUL8h0vvWpduQwrhtHsUhDtia7AbdM6zac/6BqM1ZwtC6gV34jYV+or68D3uP
         2TQkLBerqRlpuW19dwoP8bJa38mSGa5ClWoZqKBpD0jOmgkRKrHWvtKhTXKmaaWzI4Dl
         D06JDdjxViQUcfpPn+VubOACf1FHgqROl/Z/HRmAXHGLmamhFKwTJz1ilA/wRA4f4eEq
         C+FlyO8QW8y0Dt9AZiVy4D1LpFClW8YBtCYf87jU2X4i5f4pf5PSF8Xm+VVrvrBNsJTY
         Qqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771509157; x=1772113957;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tiMwY4zAfBhAe+is8mkbLnRs118reLy6/O8LxJgI7qc=;
        b=Gqqog9b+Q0ET37KpyIFftab3SpqWBLfGisBg+ZsI3wTMlYGYXrrjrYgZuWNCSjSZj5
         0MVfNYH3pR+EYslpxw/TudfYObZGV3z0fDA8hZk5TaK8HU4V9TCoHm98NSPJxC6RxUJS
         Orq4k3D/CxbPzjcu8jF93XGOyCWeHsYD3+/7EpWT1rN9CnJqxp0IAPd8yZ9Cd5ZyPF7j
         wI8f8GNzCLdDWF3EcWw4F4pxr0faEz+BGIua7JvxuIsciemC+RqRoxKDb7tgQoHUWbgD
         94IGQLBHB7uHUyzHHsULUYwz+OWs6iir1tztFtbMtMfKkZ+NUYk3OA4HYkvcpe3pLk1H
         TdTw==
X-Gm-Message-State: AOJu0YykmcCZUDmq93dpRiHo+qaoU76Q4mdBlkNCYpw9G0zyiC/4FMhk
	xu9PGb9F9Coa5gsDZirfgxLShVJssGWJ2K6OdBoZ79LNUj+TlbZ6vzu7SG8VRRNZXQdgZ5R+OQt
	PUT2Pdy80rdZ0qmHT/w==
X-Received: from wrm15.prod.google.com ([2002:a05:6000:26cf:b0:437:67bc:3c13])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d83:0:b0:436:3707:2bf0 with SMTP id ffacd0b85a97d-4379db98594mr31204229f8f.35.1771509157283;
 Thu, 19 Feb 2026 05:52:37 -0800 (PST)
Date: Thu, 19 Feb 2026 13:52:33 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKEVl2kC/x3MQQqDMBBG4avIrDsQI5WkV5EuZPzVQYlloqUg3
 t3Q5bd476QMU2R6VScZvpp1SwX1oyKZ+zSBdSgm73zrfB1Z1i2Dx4FlhiwshxnSzjGgAZ4xBNd TiT+GUX//cfe+rhtDjbgwaAAAAA==
X-Change-Id: 20260219-close-fd-check-current-98e3ee59880a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=664; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=EPV6eGHOv7LRjRVX0AUrYTvK/gVsZB8Kil/3XXwbSxw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBplxWjPuKE7BTsQ+rSkDjV/MYZfxursVmzl228d
 +HgeSGnVBuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZcVowAKCRAEWL7uWMY5
 RlYpD/0SugF5FmvVjKAVEfnLVKWqOaH1mllL/ziJDjCKvxwD8zY2J3L+s7XOWOxbEXs/l/zLx+/
 TCFzEE05Xqze7ZJHXncsVme45ILy03UJhjVqWWeaJttm8P/L+MWp44RLRjptjyVHDmN8mDIsF6W
 XoJpStoS1SPpw/Zrr8MwA2Sz6SodicZGfGWy8cZaOSVCKnLCixUKScrnNXxJItVQZVUoLHcnS9D
 qQK0hpHKF1hgNOPSzLcmwkERghGSbqDRF98QAgJKnw7KWqzlLHBrT4ki80AdLeCJ8ywvOuvvwOE
 l/rwdZewe9L1QZEI3jfR9fmH6GJWr+Rfvad72I4CKI00gg1pM0hSMBz+heqGNOtrXp6EFMYiH11
 l1EE8wbvzyJHgJeoWrIZxqvwaf1QzgatLS+ySd4CVHGJpdlO5ZQ0voJDbjYtv0d1RUuVzRGe/g5
 BzsYvDGF7/dTiHPkLqOdA+8SgvTt8nZDJEZzXaGdCrQEpRxOZkIUGVn4j6zmIvzY9OL8L3swBya
 gITyUTJfCAmhsLySyWXAygxWDmyl6NKgKigAO2UUR8gRvYbhPksyNHYAAZ/YrBaB9g68qKIn04G
 RhkGbOCR8WbbDL4uYDuV8pEkWAhkl88JATLrILDPmvIuryW23wwDn7OLxwXPZWMsa8DtPOdEFSF ppznoy8zz5akEyA==
X-Mailer: b4 0.14.2
Message-ID: <20260219-close-fd-check-current-v1-0-fcab8d8469f5@google.com>
Subject: [PATCH 0/3] rust_binder: check current before closing fds
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="utf-8"

Please see the last patch in this series for details.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (3):
      rust: sync: implement == operator for ARef
      rust: task: implement == operator for Task
      rust_binder: check current before closing fds

 drivers/android/binder/allocation.rs |  4 ++++
 rust/kernel/sync/aref.rs             | 23 +++++++++++++++++++++++
 rust/kernel/task.rs                  |  8 ++++++++
 3 files changed, 35 insertions(+)
---
base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
change-id: 20260219-close-fd-check-current-98e3ee59880a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

