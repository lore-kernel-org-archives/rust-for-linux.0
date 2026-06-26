Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEE61684BE
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 21:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782510265; cv=none; b=bYZDc6hDVkl5SwsPN/Buap+InzkO+lQT4dleci8ji1W2MhHmukVEcvp54so3zc5AWTZEav+ug9sWbqkr6N/3czXZkBt5UBEfR9nFnuQzfCzTJEwpWGUMO+va5WUoBYW0aeZP95n0k0XbZUlB7neGs9xBmbTTK79eeqG8gsM9TtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782510265; c=relaxed/simple;
	bh=gAB96cfT1IycU58GOBhvZ0xJjVQuojZ8XH82whF8zpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uTuqmtHs4bgO/nu02Ep+bf5AWp4GvI5FRodCchXP5Z7wl7kUwhZ0zMsQJ4YQvZgfNdKrP6gE/sx8k+P2lTNv8P8hBb/A2STxHlSvWxaRyKYnHxpukTqaByrLnEuq/ctN8rQ63GOW+WTgHGeVfN6M24empxogoZBN+DjJyZbWUKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HH4scS7H; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HH4scS7H"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3078e0dcd67so2432509eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 14:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782510263; x=1783115063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HYKtyKNxfrDbmxryHnfUDB/E5Eu6wwHMT69rmwfje3I=;
        b=HH4scS7HWacL8zYZ0yD7v65VySkBoSipGcqrOu3OLQSZkTsWma5gBLH0IUK+rW4zfv
         R6OX52KbWapgPKIih/3Sw9w8eqrndRKcLn2LPtjTJPX6YtGmR9rNz8FrR8aH4u8nNBU7
         ril26KxdOhAwgB3W43gauY6+oVbwbC9DcS0iym3xcqvBn9+E5oXBCZmuEgzkjGbohYnu
         g0lIvI/LxqJRTlI9ljdvosFVKER2Jaxopjg1HyMgK01LpLGKwV5mZzG3e5XnmHwd+OPr
         alVQT/o3xC59soeG+zIQO7wXDPFeeZIYm9Jyf3bRsxJtZJPKmL+T4OYlSuCzDPBqs+bR
         aLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782510263; x=1783115063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYKtyKNxfrDbmxryHnfUDB/E5Eu6wwHMT69rmwfje3I=;
        b=srzbzpxPaeSEMkTaV90PoRppiYtxAKP4kP5ffgcS80EaHXkUnv1IHJQxWuhunlGi4b
         xDx+V31LVFG7hmRajwEQPy3OwHdKt8CP2RwXLWiv5m2G1DmSn6xSYpkIIrjOSCunvVSF
         F3YIr4PT0FNu5ihuxXPUP/+tCW03lVHjEwx/rV13/l/TX8Rk5j3MlDgv0zRJ9pZpcm0f
         6SqGrzqUCuYvTAvMC6nxUoJSO6mha0DR1RTIkOot9dzZw2Hy9bOQ3hgMePwT3PSbDzKi
         6/TSzL1ODGvJ+Bt/0vuUGlD62i6DJjyEB6DfFVrT+aaleUKxZfXj+NVuzx9u9bxo0onY
         /8pQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpgxmi89+8vnc+85c5BCQUSNvuWWBPO4p578GfTrPQVB1OWMdRsRJKgOsGZwQXxM3HroOMOwUspmdHb08Kvyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKr8RHopNWyV46rJBDmVybAqM5hsOBcrfOrF92x/i5aGlVdybV
	DLojGigGojsNwGyWtjc388n6PB3FxI9aMmlGXd7hMzh6pPYS+HeRwqI=
X-Gm-Gg: AfdE7cmL9okuVLKD21wI4x8L26+Brrv0u7XSTA0FKLm8gZyxWNQ/bZ3U/k8xV1Y71M0
	7yfwd8VFd4MWhiGBQBTO8bD23Z84vp+B1BXEVTP9EuSVOwngemLR2mYy6xjceCRbiQihcrLK1UT
	OEytXguS9Xu3uGdmqPh+MHIVQCkyiMMWY01QwRRWENcYSD6C9dzA8fJjnRpZBU5sYjZ0wXwOoUi
	YbITN1u8e+8qkYpIgvod/dKwWsKgp8blh1IxzPEvyHM9ycn+4Twjli+sK1VnvxLwsyfuVhLfBS3
	KJMD90WOc9LCIrcZY1CIU1Gt/tv9H1vbZ6VMFihdN1sYvz+u1/fWBJCzOiOYCmW+/sOiI4BnUvi
	9MPNIgaZVYrAB1+2F7hITpb4aF9d+T9jD/hwMUXRi5xxKB7E5TbAIg8VlgFgAPmbAg2L8DGcbQd
	p1VsUV/sgEAfJlb5cwubKdcVnPyEbPgaE2ENdF6T77yGdBuNQlE/QFJmF2IcFmjm8nV1S41YUd8
	3I=
X-Received: by 2002:a05:7300:e801:b0:2f2:6dde:df54 with SMTP id 5a478bee46e88-30c84e0bb70mr7188051eec.33.1782510263309;
        Fri, 26 Jun 2026 14:44:23 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm20580189eec.18.2026.06.26.14.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 14:44:22 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] rust_binder: use pin_init::zeroed for file_operations initialization
Date: Fri, 26 Jun 2026 18:44:02 -0300
Message-ID: <20260626214404.852685-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All types in `bindings` implement `Zeroable` if they can. This enables
using `pin_init::zeroed()` for `file_operations` initialization instead
of relying on `unsafe { core::mem::MaybeUninit::zeroed().assume_init() }`.

This change improves readability and removes an unnecessary unsafe
block.

Link: https://github.com/Rust-for-Linux/linux/issues/1189
Suggested-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 drivers/android/binder/rust_binder_main.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index dc1941cd2407..7f07fb5e171b 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -314,8 +314,7 @@ unsafe impl<T> Sync for AssertSync<T> {}
 #[no_mangle]
 #[used]
 pub static rust_binder_fops: AssertSync<kernel::bindings::file_operations> = {
-    // SAFETY: All zeroes is safe for the `file_operations` type.
-    let zeroed_ops = unsafe { core::mem::MaybeUninit::zeroed().assume_init() };
+    let zeroed_ops = pin_init::zeroed();

     let ops = kernel::bindings::file_operations {
         owner: THIS_MODULE.as_ptr(),
--
2.47.3

