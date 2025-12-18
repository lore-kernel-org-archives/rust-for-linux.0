Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C8E2BF00B
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046326; cv=none; b=LYQUe+bCULb4LQysy/cu9xVyqu3hhVaaLacXB+1+lYMoomfqUPk1G1195JD4YZMCqD6I8HKRHzG2Vhx31uKxJqb7cvYs/NdMdPSHjk8+6sgmtscIv0lUpptJU1Ia4lSNfX+R7PmYs158wZc1kXsqPKR7EEnIQbUThgqin0BPNWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046326; c=relaxed/simple;
	bh=RJrCy3R1hIWGYLaFa5d5l6rqMcY9kO1BE61HfC9u17U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=T/WT8KK3wgGXW9s/lFBv2pNnt534ixIMSpG6hV6CvEjlhi8WtlanbMTtdwZF7fzHkpw20nfc42SpQwwIX5KiF+XbkaUCLFsGsL5eFCnSIv2VQpmNud1Eqd4nI6MYT0Gd4S9mpygeGLgTksn67yqCb+Euyt4ROnbmC81jZMwJWuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IQw7b1zW; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IQw7b1zW"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b801b94fedcso40270566b.2
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 00:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766046323; x=1766651123; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SChrhpNzuINgZNKHPLkX+6QyLWwujH8XT0+8rod3yWE=;
        b=IQw7b1zWNZ67yCgwl8Ik94N9tp0Lf1jItLC+wPPLlKos8eWsJOhQZ5N+o8uikLsg3z
         0yzI/soGrucJbNB/PGwew/fCiBGA89n2Jc0AY/UkDas7Ek+2u7pR+dcLuFqYe1Ss9lJT
         cxz62JpJIZ16nIIpzwNjrwENYCjlY4v/8WdiQR1VrMbpFHkSj6/umFkCsBJfncUd3tZ1
         HYO8boI3f1p92MqvKXgpHrpt4hmHEi0b1C5Tee0TahvA6TGJFFkD9QPwT66DeyyjMXyA
         JKXoen4eHfybPXLkIgwI72wr0QBi86kqHq6eTGNTq/0xjlU+NAJO8Ksb3T55ho/Bp0T+
         7OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766046323; x=1766651123;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SChrhpNzuINgZNKHPLkX+6QyLWwujH8XT0+8rod3yWE=;
        b=EyszYhn47eHcxJppLkR7CPRMmuTw7F1+KvI2nMG5UguCuTHezYPtaYZ2VeJQxkddOi
         gKJol/YTqG3ku6q1fbG3YZi14WzL+kyzMR4yi3reXL7DYumyGhfrS6O23oBzRJaJHawX
         f4UZhEkaJI+s0P5WJ4BqlN9Mlg99DGjocoEx4qjjGJdc52IQt6zOabdCnI7dcet+tuvq
         soD7xQyMYS5OGxkjJidnFvo/46SfHn1Imu9sZq8svpWGitm1F3a2CQcmGFUq6Qmrri94
         UIY/V1dsEFmS0qS8OABMy7EIJp5yzCkVToPZoAPtoQjb53jHkc3qD+WkMTkVPRo3YbWl
         pL8w==
X-Forwarded-Encrypted: i=1; AJvYcCWV372BwORx9dEtypbWMZDQ/CH/UcNl/WwEKI93C/nndb7eiK8jEVIl9WoFT1n1Coka2rzgw1qEb0BZKepFNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymUCzjoAHr4KF03y9tbotnoZSQDIN+w5uHf/bzRRjtSpErvBYI
	zFliMsGac4w3gfHav9WWnzsint4GHinu+Gg8PNK4LdfBViD7v6Il85YbnVgVp2jTR3gs8uUDJ7+
	2p53U0F8iLuVPMeSJeA==
X-Google-Smtp-Source: AGHT+IE9eCctE7RR68CaTKtRR3HDU5gE/6x3tOVna9gYYAcDwPvgsWc8hYA753O5/P3nmtXhJEexRuhxieMdycw=
X-Received: from ejblu3.prod.google.com ([2002:a17:906:fac3:b0:b73:70da:98f9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:94c3:b0:b7c:e320:5228 with SMTP id a640c23a62f3a-b7d2362659fmr2097650166b.22.1766046322711;
 Thu, 18 Dec 2025 00:25:22 -0800 (PST)
Date: Thu, 18 Dec 2025 08:25:13 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGi6Q2kC/3WMQQ6CMBAAv0L27JpugdR48h+EA9AtbKItaZVoS
 P9u5e5xJpnZIXEUTnCtdoi8SZLgC+hTBdMy+JlRbGHQSrekyeDLr+LRhYhDZIe1nZTj2tl2VFC itUh5H8OuL7xIeob4Of4b/ezf1UZIeGkM0WgaY5W+zSHMdz5P4QF9zvkL4O7NTq0AAAA=
X-Change-Id: 20251217-unpin-for-aref-3dc0fe3fd5b0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=RJrCy3R1hIWGYLaFa5d5l6rqMcY9kO1BE61HfC9u17U=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpQ7ptZeN6AWeuSAJxHde5zn89BxQWwhw7jhQXr
 HvSnBeDlAqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUO6bQAKCRAEWL7uWMY5
 RmlYD/9mKB1zDdONJl0luEDXU5ynhtDpLSYct2WYnZ9pU5j4fxT2wAOKF+bPlP4MTby8a7uJniY
 YHJDn429WeL+QlII/PTTJCIVoI5ihjxHxGf8shlZLXC71VAvRpUh0+MoUhOAnDr0QBCgQ0T2ZnP
 xLEQWW4tFkkwtLL3BsrIx9ODzqLwB08+UDi7pjM+o/rs/5o9Gwij2RVSNwcOoJ4B8DzCh3lSQR1
 P6MtSPlYmDTTxjJfDQLCgszON94sigfk9TFf4Y48Ka/xhjDgIBNJAR/pN4nJv8tHmGT0oFbOr2W
 ZL9GnMAIVAYY+uXAsIc665z8z0nmt1EKG8T/jYrJ4YuE8imUvXzUZVrQ3q+59oj/PhImDPOeY+y
 T/vS9Ps1ktoPlUmtJO4OHSDILPWUG8XP/eQCzYu0LLGemqW9d1tExK0DwY6banyE4dse/uTfy99
 x7U8tB1bs4Y3VKLT7clbbF3244se48xmcAgyv3bzcwWsN4smUmaXXeGO4yEQD6qpcuMFLpyxcPi
 kF5OFRD7oyIo2ag3qQg6e+JRJdAj/NV2GRGwzovzfz0UzHxxgF3Z9NohgBJqo/RpAKRkPOX8Gl/
 Cu5hIO4r5MAq5QknjVrvPlMnzKprfJON24CUWj7Bi/nkD2M/dOHp84WmutKe5+pszDRQFQM2WS3 BVOEg66YjsAUdfA==
X-Mailer: b4 0.14.2
Message-ID: <20251218-unpin-for-aref-v2-1-30d77129cbc6@google.com>
Subject: [PATCH v2] rust: sync: implement Unpin for ARef
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The default implementation of Unpin for ARef<T> is conditional on T
being Unpin due to its PhantomData<T> field. However, this is overly
strict as pointers to T are legal to move even if T itself cannot move.

Since commit 66f1ea83d9f8 ("rust: lock: Add a Pin<&mut T> accessor")
this causes build failures when combined with a Mutex that contains an
field ARef<T>, because almost any type that ARef is used with is !Unpin.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Add T: AlwaysRefCounted bound.
- Link to v1: https://lore.kernel.org/r/20251217-unpin-for-aref-v1-1-84711b747d02@google.com
---
 rust/kernel/sync/aref.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index 0d24a0432015d09509a255df0a4f114171ae9fb0..a297477f23a3960928302709f6aeb322fd4d1bd0 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -83,6 +83,9 @@ unsafe impl<T: AlwaysRefCounted + Sync + Send> Send for ARef<T> {}
 // example, when the reference count reaches zero and `T` is dropped.
 unsafe impl<T: AlwaysRefCounted + Sync + Send> Sync for ARef<T> {}
 
+// Even if T is pinned, pointers to T can still move.
+impl<T: AlwaysRefCounted> Unpin for ARef<T> {}
+
 impl<T: AlwaysRefCounted> ARef<T> {
     /// Creates a new instance of [`ARef`].
     ///

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251217-unpin-for-aref-3dc0fe3fd5b0

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

