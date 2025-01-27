Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD061FCD12
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737974071; cv=none; b=J64l+RzbxlK7pMyF8uGYNbQ+0+ZxuRVrGBjH1Kpuw/8yBeWnO7HVFuxiJAIF4E6CBv8pEWPX9EItnMzNgVDWWwxs6GgtVlXAk4VS83kUIMUTah0dBFfsHt1PjSX52UidOMja4Yqg++dBah+E1Su1PRbyJ27ijyC984BEQS1OdF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737974071; c=relaxed/simple;
	bh=6LmjhGfsMYkh/JPlUyVo2tvxkQci+7eMMYTtJ6n8Vd4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rpiuWYZNiQQSq/ap/iw8rHKC6R/0gYY/BXp52HhEx2a0lld1U9ZhLbyWDPXCyV9z8hV8ZFIRnR8/pFiJqSugOhkoSgaf1meNbT2mJ02by5g3ag4kzs/WyiX6adGJttWr0XcOk2d56q1/6RMRHjt1yDnYTkrTaTqNVoTB7TlqM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=raFyKjyW; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="raFyKjyW"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4362552ce62so20641185e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 02:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737974068; x=1738578868; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XRzn2SZCYyK3M1JWCa38omHgy1jSYILnd3vTeuU6Q+Y=;
        b=raFyKjyWWTD0GTZ3TBy2Q7f/Txr7hVRBLYIj3ZUBR+7mmIKChipsDVu1CJKLqLJkAu
         Wv8Usirm1UALaF02AzCr5TS6zNnw/4OoC8KepAFomxSFleeoEFbpWPd7letI6f8IcRba
         WF2Kau2Nib984Emp8VNf3Pph5+nVd6nlASF3qrbU1pwtt+mEE0ffH/2WJBWzxqtTGdL5
         c5Xl08v9efxeBtWWJDig+r+Sw8YP2shNDEhk0qjxZK7s5r1SK31MIk26MgPbCo+Fmd0P
         kB3aI/jWIvdHhsYGV8MqKxbGSIgWVqGGqGPh77IVnvD2wrtWJ6BcvAcrdnbNvPf6KwmW
         tnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974068; x=1738578868;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRzn2SZCYyK3M1JWCa38omHgy1jSYILnd3vTeuU6Q+Y=;
        b=o5dAlszgHELPOWFhCfrfnZ2/2NEOtJDZgBTStySB28BvqD8b++8EYFL8oFGIj9NpwJ
         mY9jteOTN0OTbksEpEp7wab+i7/NkL5AY1KFhJhn6w40KOZQgKRK9iEEgTdnv9LAb915
         UMH/5C1Uj4kIRqs/DLSsvOZtBK/UVWr1EML5qi8KeTSIzwIt0P2IH4U2rz9amlYrUO+a
         ZBUPqEwxQbNeMCmFcwicghKSc50V4IqTO5VHgUw/4OVStFfJAX7jYFx+xNjXFCdmcSVB
         XhA8MJqd30CDdveyiTDS3bXmjLviqfhlDVIOGCY0GDGzrCHHvwlwI0FoDsycN5F4Vajv
         YNcw==
X-Forwarded-Encrypted: i=1; AJvYcCVx7P9K3qw6q2UPEVsa9wlRdU2Esh0CQKx845hpL54T3stjsixMB+H0CxYTM7ztTfAFlHR8PwyMtOcc3igipA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3jxnPqRTz1W41UxxTsgec6Oks+oV+5KaZWsceCHP/6J29lo2f
	fKxvgeTNY9TFiDZNJ8KD8tOBElyao+EDKMqzST0sEdCUVmIf9/PkVauCmH2HFy/Q9C7uY6CYqUn
	Mko3FOZyzGMnWtA==
X-Google-Smtp-Source: AGHT+IELEQVEP+Pb7bAeMdz811t8gdKeaB389dmZSRnfJ9olS19Br8X7u3+e3kH8kX+Vo+7Ia3Qz+Twpk5XIt8A=
X-Received: from wmej5.prod.google.com ([2002:a05:600c:42c5:b0:436:6fa7:621])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8719:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-43891437217mr325816675e9.25.1737974067953;
 Mon, 27 Jan 2025 02:34:27 -0800 (PST)
Date: Mon, 27 Jan 2025 10:33:57 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABVhl2cC/2XMy27DIBCF4VeJWJeKGcDGXfU9oi64jB2k1lTgO
 o0iv3tI1EhJWZ4jff+ZFcqRCnvbnVmmNZaY5jr0y475g50n4jHUzVCgAgEd9z+5pMwdLUeimYN
 WjoLRA2HPKvrONMbfW3D/UfchliXl062/wvX9S6H+n1qBAxdmANmDspb0+5TS9EmvPn2xa2vFu
 9cCEBqPXHBwqHyQfd+Babx89Nh4Wb21dnTB2BFUaLx69LLxqnrvRNcNJrhB+Se/bdsFaJzpNW0 BAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=6LmjhGfsMYkh/JPlUyVo2tvxkQci+7eMMYTtJ6n8Vd4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnl2EXtxGwuck2XeaHMk0R79jv9xymHK5SmoVu1
 I1WZl+F0ueJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ5dhFwAKCRAEWL7uWMY5
 RpiyD/45Pe3QO6q/5xO5T6iPjXCn7EluqWk3nGo81oRPCcuBfzweQWkfS37ZzGvg0XmS848bNc8
 IxL/QJymLJIgy4Z15DCb0jFxA54NRJZeajDn7PcI/J3reYpT3j3pMjewPGmQV/P7Imd12C+emqS
 8GdBuG9ig1M+xROQzcs7JQTWcsGW1lvtr1yGUIcYu2Bw4Pg+C5B8rvwemB6uhrnSKuBQETUXg/k
 CzNdeNjkgm8sDkFKvPedLB34YzfXHDnHaWBrVtdRZlBSPtk+cca9jFV73Ie9gBaaiTY9zjeNwse
 x4q1Jzc7YT1VjtWyywXu0TgbF5O+uu/luGhTBSoQRPJXbtVHmT5ZFXNKsOS2lqxMrlnU3Ayqvza
 vZAHacOgHFrcLAUzGfXc11iLc1yNE5+sQ/ybbjuq1IUaRH9tG9cgLK4O7XJWCjBEqAKKUSOTnZZ
 GmhXC7aIPt3ur6qRtJ47gaLSaVHj14YE17dczJZLTQi+f3AHzkl8QguKuh1wTvHV8gJ6Pa9en2P
 /od8OhK/UPGOavtAGYXp0zpabHqE2uXxfBM1qPM8LnX3d3FhV9MlTDNbxEY0Jx82nd2yi6vBMiQ
 y2Hxm0nPfPH10Yz8Q67msh2Cbp9MwRbZp0/7H1GBcJDmsqy4HTC8N1R+OtTYiV/0krqw6oMlkWw 7EBNEJJAokJzLuA==
X-Mailer: b4 0.13.0
Message-ID: <20250127-cursor-between-v5-0-f7c388c23642@google.com>
Subject: [PATCH v5 0/2] Make the Rust linked list cursor point between elements
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Please see the commit message of the last patch for more details and
motivation.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v5:
- Fix list / list2 in example.
- Add remove_last function to example.
- Link to v4: https://lore.kernel.org/r/20250123-cursor-between-v4-0-cb06698db94c@google.com

Changes in v4:
- Actually call the example functions.
- Link to v3: https://lore.kernel.org/r/20250122-cursor-between-v3-0-aaafbd8af14d@google.com

Changes in v3:
- Fix `CursorPeek::deref` to use `self.ptr`.
- Reword comment on `ArcBorrow` in `impl Deref for CursorPeek`.
- Link to v2: https://lore.kernel.org/r/20250121-cursor-between-v2-0-1b24cd377618@google.com

Changes in v2:
- Extract insert_inner refactor to separate patch.
- Make move_next/move_prev not wrap around.
- Add some examples.
- Link to v1: https://lore.kernel.org/r/20241025-cursor-between-v1-1-08913714aae5@google.com

---
Alice Ryhl (2):
      rust: list: extract common code for insertion
      rust: list: make the cursor point between elements

 rust/kernel/list.rs | 455 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 362 insertions(+), 93 deletions(-)
---
base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
change-id: 20241016-cursor-between-154bed859e27

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

