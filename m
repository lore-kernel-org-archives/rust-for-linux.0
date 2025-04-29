Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0A29E069
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917384; cv=none; b=qgiLUvxESCpP4zrAIV0CiEw9rkoYN8XurobRAYC4asjJTaq2mJv7l1W97vmuPPOmzFtFe9rzlPYCUzAQsWjGdT5q2pIl7vtu2R1nVN98TLxWNEU9wuAieaoj8FO9Ehv9YJ9hH1XAzTHAO1zYbQDdd4zMsJJxaq75GF1Ui2d6Iag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917384; c=relaxed/simple;
	bh=6dDQdHoWys4jvlnRlSaPjlbjbNaUQ7EdwgPIpGTuWoQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QZVYqXvDFbZYGZ+DjrcX7WcGtIchxYjyZFGWruywoLPTf9mmtd26RpGILUl3GmrAV/w1h5jnKqx0lzq2LBV/LwRYK1XGvPhbmPLsuh7eVAAAayanhEZPF1WIvhV8Xa5ZJQqdh9SiBbKJMzonjFNun2DE9daZ1rYxdzYUJdNX6Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zhv+lE0q; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zhv+lE0q"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso28811375e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 02:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745917380; x=1746522180; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMIrxa+bzzGfc2aH+47H0//4QoWYsC3XdDwsFlrFppY=;
        b=Zhv+lE0qJMq/cz1biUjnGOtswCBn/v+DtwVJ5NLgsMZ5856HyCkMu4nj4qqeMoI/Gw
         4n5bRiTbhxqgqOSIfQZqxNm2bIrW2VeQRdQppM29UqkwWDaYzLJ50o5Wk81AxWKISJw9
         87DNptIpb7HM4meuZ4NiAvI/ZW/LI2yA4YG3gNKA1YbXn+Gcb56di46R429hYIFusY2N
         gAl0RoDoQ4BrHvmRUBWY8wcixZmQ56FH8HR0XEancn6pK++xLSRfzirx5yt3xBSZHdk9
         N3WZMJ3aa8NnNR3CQZs1zb3CloyBDX1UOAzhMyRXKw9yGcbmn4bJBQMsdnGuhCHAF197
         bjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917380; x=1746522180;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YMIrxa+bzzGfc2aH+47H0//4QoWYsC3XdDwsFlrFppY=;
        b=VlR6erwJi2NxKzp5q2zleppMSbcU0+lEEDtewGYqbR2tzt76kZ6JmZ14N0IXjpjGku
         Z+H1zPx9mJu2vHC5WCSn2HnNGxBZIo8ZOHTHUj3hRUNbnS6wmlGBjta/L9o/sq+zmnkd
         w37kpAIeXhwnK63W3Jw9n6p30V2Uh4oIXmdkCrypXZr2g+gK5ZYkBL+QRg+95NTFNHHA
         p+D4Qq/Wanu2XC/9zKBIllogOs8vrti85WZqzGQbNElDwBQx9AJ+G3CYMYt0GjFQ43Mi
         gsyGnw+nelt//9OxKZVY8+yxAHQnk2zepabWUX01/GlajWkSk30sdP3qBAg3sdl+UAb4
         q0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCV41Z7sT6zuiNfBMJZmzykx8mlVDXHm814xZKpgnqJ0bS19UX8g8tfmQ1b0KFcnNMwF1hUy4Zn+7QIn5MygDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8RSAUxmSd7kLBQbNUBsKq/DqPwU0ddKC7krRYGoLqZnT5nsPE
	amHZrfM2b3nrAdnkZMzojB6kwi3pCkK95SVhKuIQHKX032TA0TrQTKloRHe9sr50mBNz1T60gGv
	zsqQ/Ajz24R5o/A==
X-Google-Smtp-Source: AGHT+IHZHgwkdKYhyKx00Xotc0ef1WOrWEHLKolZi0Ha05ra9w6JqvTuqEHROU4DnQQqb5xWG243OCmlzVaETms=
X-Received: from wmbe5.prod.google.com ([2002:a05:600c:5905:b0:43c:ef1f:48d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4509:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-440ab77d021mr94109665e9.5.1745917380783;
 Tue, 29 Apr 2025 02:03:00 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:02:23 +0000
In-Reply-To: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2442; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=6dDQdHoWys4jvlnRlSaPjlbjbNaUQ7EdwgPIpGTuWoQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoEJW9Hd0FBIirTtTg3dCpLiBlHXMgI3HgvvA44
 xhoQUuuKRWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBCVvQAKCRAEWL7uWMY5
 RockD/47bJ4yfhwzZwfpNWSWHktdnujCpkP0h4Bv4IENfnqg1Warlu9Z4ghwBA/iIBTwYJlAyI+
 d/TrVUW0t8GlniaiSe6NAgFSIMHvtO2WQNcJ6hDOypUTVZGGAVzd1byKYqxrscWn+rc5KbMVpvx
 9sq1Iw7b6PIA5BT1EseR5u+s2xtiI8NmFZibhXu0U9HtOtwUd023M5D94KggGL67bbYK4wIucXI
 2v9uIlXkbE+TePSVm7+B3jlUkdSb2SmGbubkoOBfhC8DQlVXW4QgQVArpYHA87qnZPXZzHqUXQq
 xACyUCOBrf8cZcPFNyc4T+1hWVJRma984P/0776ov1fd3JfHXWVmQrDHbUu6PoTNJZtKpudrRWy
 SjKUCm3YiNoupWU6G7iAVOA7fNEyXqhGcyyhL56/PQfPDs26CyLJal4C+lWBfL6IhasTthDyWGp
 fIfVUZM6H1Q4Zdq2zXvvTsib/YeF0UNSNdJ880lH1KZXEmo55EypbS66TeVbYoW4nY7ar6j0klb
 0ga+vrQXI1hhgYHuF3p2Fp1uQKSeqXXcAGmluVvHaOkSDqCF5LOC77cQCF/+trgrdHxo0wPKNLO
 Lfhw7sENF7P0ipvY898iRnycZP/YaCOIdwZm2UVekZQvjrr+WHnKVUvU3t0ZzAwD7ZR24owhs/d DumSlkeY3zaMEMg==
X-Mailer: b4 0.14.2
Message-ID: <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com>
Subject: [PATCH v2 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This patch adds a more convenient method for reading C strings from
userspace. Logic is added to NUL-terminate the buffer when necessary so
that a &CStr can be returned.

Note that we treat attempts to read past `self.length` as a fault, so
this returns EFAULT if that limit is exceeded before `buf.len()` is
reached.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/uaccess.rs | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index acb703f074a30e60d42a222dd26aed80d8bdb76a..7cec1b62bd8b816f523c8be12cb29905740789fc 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -293,6 +293,41 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> R
         unsafe { buf.set_len(buf.len() + len) };
         Ok(())
     }
+
+    /// Read a NUL-terminated string from userspace and append it to `dst`.
+    ///
+    /// Fails with [`EFAULT`] if the read happens on a bad address.
+    pub fn strcpy_into_buf<'buf>(&mut self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
+        if buf.is_empty() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: The types are compatible and `strncpy_from_user` doesn't write uninitialized
+        // bytes to `buf`.
+        let mut dst = unsafe { &mut *(buf as *mut [u8] as *mut [MaybeUninit<u8>]) };
+
+        // We never read more than `self.length` bytes.
+        if dst.len() > self.length {
+            dst = &mut dst[..self.length];
+        }
+
+        let mut len = raw_strncpy_from_user(self.ptr, dst)?;
+        if len < dst.len() {
+            // Add one to include the NUL-terminator.
+            len += 1;
+        } else if len < buf.len() {
+            // We hit the `self.length` limit before `buf.len()`.
+            return Err(EFAULT);
+        } else {
+            // SAFETY: Due to the check at the beginning, the buffer is not empty.
+            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
+        }
+        self.skip(len)?;
+
+        // SAFETY: `raw_strncpy_from_user` guarantees that this range of bytes represents a
+        // NUL-terminated string with the only NUL byte being at the end.
+        Ok(unsafe { CStr::from_bytes_with_nul_unchecked(&buf[..len]) })
+    }
 }
 
 /// A writer for [`UserSlice`].

-- 
2.49.0.901.g37484f566f-goog

