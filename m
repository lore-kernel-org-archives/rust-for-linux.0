Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AFF2F4A05
	for <rust-for-linux@vger.kernel.org>; Sun, 24 May 2026 18:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779646440; cv=none; b=H9TMFvOwgvMCn/cj0DAr1IoTrvzrmycLqKak5ZNkwpTk/iq8S9iVoETIt0GH3bqjA0tTnEl3NUBRoCTsJrOfV4Wd3SNlp328nIZ9n7I0slz2WiRN9cDFTKHr7Y5tbike0Pg14ZR16oEDx11tDwP33bsrEKDzYIyVzVrKu9nRePA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779646440; c=relaxed/simple;
	bh=1ne2ZDqbJHJMuoQKGuFuMW3q7qazDc6jpKkmbQJ1Nn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lt/Isie832J7DvS7Fn8JsXW1PPLeh26EQh9nCGYT5RhRawPxQ0oRDl2+6DIoAYlS1892m75u6A8kuX2bF1R5/nZBs9wnrLL4mKF7DftyB1FWpxC1L9XZaQ0nyoRnJegySo8HQiBDdU2vMyA0SlWFjI0aHnmQtc6zu4R7+LEGINM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzqj2z9N; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzqj2z9N"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-57513733658so3021123e0c.3
        for <rust-for-linux@vger.kernel.org>; Sun, 24 May 2026 11:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779646435; x=1780251235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCZNusicn19fLUcxp9u9pDb/isJJXf6XPw/IwzCutRQ=;
        b=mzqj2z9NthJdZnWuuOyJZnxpBYOeEnV9tigTMzD4Op8rZ9GioqYmA6GIZ9LG4IAoiQ
         lXwAW1MD0gixsGh08z0wZzYpu1Amqp8+O2JAQci6S00OXqDGPqMYiy8j3tt22w3aLjeY
         DylVhmQArhGFWP61yvFMQuNNzXu+CDJbSB74NAmFv3ZXgu9f84NShy2W3FygpwHduXzO
         12XnUdj3YnD/gc8Seh4UZWAXhjjcYP4wL0hMYR+IWwXxta9U50czLm7Y3y61Ji4C1RYZ
         muWOX3zk3/L9VKwtvRzXceG5lij+nAGmz/YwrYFSPUMmVlkxCP6NAT4VLS84QOIX9M+K
         CRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779646435; x=1780251235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCZNusicn19fLUcxp9u9pDb/isJJXf6XPw/IwzCutRQ=;
        b=FFgnuvNwUxyDgXpeLW604U1KouJAl+SzIdprrR64/rLggLW9G1uWCd2nBEzJnjTfNA
         fgVDINjlC6gng1HcrYcsUkOW++tSuuClXPE2+/+rlhxtYdMbC+M6UCQhPZVeH4pW5xox
         BGKoYSazd8WCnLgey9o17g+R055fLe7nRLZd9thJZ+ekMo+c1Uut1EwvPU/+k81K4WXT
         kbraLoQURFQO2CjA6mSVS0iAUGLPN5oYYAR0cCmcjGjVms5GPrR/0tF0Jno4CkWJfarK
         XKIVTfdXiRvtZddtZxR11HEtDfXyG8r1wmzMEIDY9NRGiVXo5qH3kPkkQUAEo9EoeIor
         oLwg==
X-Forwarded-Encrypted: i=1; AFNElJ8fDff0gPWwHFbpqUMQl/xSn4Wje3tTxEZTS9FYHcGM0/MUwKSsETISGYdozVnpfDhl0aO30vDU/fdFx2iwsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5cX2qRnJnLVw2vhHNpZW0hdj9lWOV871zC7A2K6yRLgKoGzC4
	Cy7NzzZvS5I9s1hHju5AtVdyi4WHo6yV6nSu7yChGtTlTytULXe+o2A=
X-Gm-Gg: Acq92OFSQ/8fdJSSp0zDSWTTx0FQRtzMNQsAiUPwEO6Cz77RTS3b9mW+ECdXbN1jJvU
	9kEJXbjxAgrMKJo7p1k026/H4Vi/xC357BPUFrR8CiQ8vQv1QiOQeDxezXdEBjNobshlW6UXIWO
	omENFmTf+fqdcvUhRPPA2gIUMqQG0DxskMNacthELSbi9T6tN1y78ZaU3beQym202Qm+b6wWyQP
	LmWdZ7CZZSWXfTmRkikPhlwu5MHa98JWqx4garX/uM3QF7A42BBzDExd5GiBsH2rb+jnRYiecF9
	tgMY8fGkQjeadQ2PTxALTTuumBKa24GP0nBO27a7IyAkVohM2TVcagHcFzLdNnzLxas4of+F1Et
	Dz6ggjJ1Cg0z9XZcTfQk/rbS+q/Gr6rVtJTKVSAk8ara/PGHcwp1u8J8JuveertOSWlAFl/nphd
	wlogBhpMo3P1mAZUSS9SDcmUtpaFTw0tEbizd3v+8GreUSiLa+Jxw0xp7/wIjdS8HA3cl86iA=
X-Received: by 2002:a05:6122:d82:b0:575:3c93:fac with SMTP id 71dfb90a1353d-5865e1bf878mr5302568e0c.3.1779646433745;
        Sun, 24 May 2026 11:13:53 -0700 (PDT)
Received: from linux-dev ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f8f6cd40sm9836340e0c.16.2026.05.24.11.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 11:13:53 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] i2c: rust: fix I2cAdapter refcounts double increment
Date: Sun, 24 May 2026 15:11:50 -0300
Message-ID: <20260524181151.24988-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When `I2cAdapter::get` executes, it first calls
`bindings::i2c_get_adapter()` which increments the device and module
reference counts. It then takes a reference to the raw pointer and
converts it to an `ARef` via `.into()`.

The implementation of `From<&T> for ARef<T>` where `T: AlwaysRefCounted`
unconditionally calls `T::inc_ref()`. This leads to a second call to
`bindings::i2c_get_adapter()` inside `I2cAdapter::inc_ref()`.

Since the returned `ARef` will only release a single reference when
dropped via `dec_ref()`, this leaks one device and module reference count
on every call.

This fix was suggested by sashiko.dev.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/i2c.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 7b908f0c5a58..ca6476cf4399 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -405,7 +405,11 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
 
         // SAFETY: `adapter` is non-null and points to a live `i2c_adapter`.
         // `I2cAdapter` is #[repr(transparent)], so this cast is valid.
-        Ok(unsafe { (&*adapter.as_ptr().cast::<I2cAdapter<device::Normal>>()).into() })
+        Ok(unsafe {
+            ARef::from_raw(NonNull::new_unchecked(
+                adapter.as_ptr().cast::<I2cAdapter<device::Normal>>(),
+            ))
+        })
     }
 }
 
-- 
2.53.0

