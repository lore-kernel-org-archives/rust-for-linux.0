Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7F5211474
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 01:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940551; cv=none; b=bYJfSKvyNKaYbHhve02TJKyCqk0b4Znbs9L9B7+LkFQ/Vpb0Q0bP/cNnphcThSzIibViQ1zZRPjNl72KPKglQddiXUxmiq/+7Qcw3gSAcsDj3+DHVKUgWN/8V9ViIx8vhggag4d0pIvVhqbkzKYQPP8PIgEFOsRWSNOj4ux7+cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940551; c=relaxed/simple;
	bh=rOW1RwC5UHmQ7UKODOM1ogomu8IEggHtksSWry6t9GU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQwAnMjfWgqKqoLxZWyjXzhWQTXAWFQKX5AAuLmEmp2GjkZNq2Szyh90C7Javfj7FVmdBwe4/HAf6DYXOL/hh43/CDvQSPmzBg0A/zQnp85yXFbFLgox+Fn+S4hlVS05x+iaxPs5Py7XqWwz3kq1NVsBpMEEA672t63eBx+IGSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=FucNCc8f; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="FucNCc8f"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70576d2faa1so12196777b3.3
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 18:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940549; x=1745545349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iSJCb3uqQGBFBpo+xzudBn2hvy1gDWxYIfh6IK0HAI=;
        b=FucNCc8fYETPkWOCB3I85YGn0njlaV7dEIhuUDIXOzcgBJhLKAcVSEWE3vJHcALbia
         7Hok4SlfH9vHShnnjrtJz8BAbSFdpzeO1W2Wbbv7UYM8ycK05jDfLxES5jrwZMSxc8md
         QouJ2g3DeO19ZWnvb/9UiLRi8RzrKB+ilmabBYqlPQWS53i6SAAKYTVAA70jX6Iw08yp
         Ovv8wCMR/jDQvxvdQSMoNxHx5zH/+9GpBQijjuJiaqcpgOscZV7kWgy4onBY8VmuHHl6
         niKyidMj3VDhsHzrUk/2lIzAaMrsBic2edk0fYOIlNRp/svxaYPrtVFbP7hwbRUpIb/O
         Ub1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940549; x=1745545349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iSJCb3uqQGBFBpo+xzudBn2hvy1gDWxYIfh6IK0HAI=;
        b=DVlJXZTPRmqxR+BAAo3OtS2+86lYOFEMosEMncYDrrQvSddHOangaBnV6J0+n0xIug
         ytfNpQOD9jUkGhLhp78pZcuwXEuXM/ncPGUKnlvx3sTAAaEwvao1i0tcBBk5kegbK+BS
         g3OirP0BvQZsP+gOOZNYnJtEnl0ffrs5kiBRUzzHFUpTH5DX8lO7BBYk9XFJMrK0cONi
         5uX4DyzJs50WgnjLfeB2fE+BfFOxS6fNGBLgwh80LipO6FGFSiIuv3q3mASdE4fibe0S
         pyeChBCyzZ+eTZLUhs/wOBfjDOzShMnpWIVY5LxIGFrxGkB6vtwPW6ZosTGI8R8LAcVL
         aF+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUweJW4cz26oeftvsFPsPLB8UlzxZ/GIVrBf0i0//8+bttdYPciU1Il9l+1fk3Fu3qhylWtG+BV/qo9fp/E0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC6JET2g9wr/gUYrAhRK2UviB6mpx4UGLY1X0YDlC83Uo+XqQC
	ySs50MLu98AXOSMot2dxI2C3jgJlwNQxmn490JS7c4ByFjHSdMmkTcu7zxxgDz0=
X-Gm-Gg: ASbGncvIU3Rd9lq8nhAglj0kdf9x8w29zMZRxRKT6/Qta3zgWE1C5ZTs/oTGyN8+jz0
	m35fIc+WtqXLoV2LOa58VCAz+7k8+WS9K4BIVRigCGUHZzMn3nbrqd/TntdkXQJlWwgW6SWtjUq
	5K2l/C1Oj57Z0D8JlZzlvRk2+cAHYeub/7Cdix2hJgFz8zUPTm4FKRTZBjiVWCAjARAAf4pusva
	AX5ypHLOwiDO2wtNKLmCe0AbHYueUylxyIkya8C5c+MLA3msAul2xnSd3Zq1IuRCqvZbvSpyOZY
	pq5plDosBB08eFjE8h+LNgwVJs2Z+/fP/bHgqgRL2SrebYyd/KbzFm2IwZjdVmy7KHliXZmaVLk
	DHAZcbWuQGCjib4r9dB2iqGm50glxLlwzwb7q
X-Google-Smtp-Source: AGHT+IFmO8E0eAAldhUU8G3XlJp5JfFC/QaZWRxorj5hPt+AQzy684xlOEx47D7rkBQOVE84JmeuFQ==
X-Received: by 2002:a05:690c:9a8a:b0:6fb:8461:e828 with SMTP id 00721157ae682-706ccddb140mr16306967b3.30.1744940549449;
        Thu, 17 Apr 2025 18:42:29 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:29 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 10/18] rust: sync: arc: refactor to use `&raw const`
Date: Thu, 17 Apr 2025 21:41:31 -0400
Message-ID: <20250418014143.888022-11-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` with
`&raw const place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const` is similar to `&` making
it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/sync/arc.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 8484c814609a..fea85e5342a0 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -263,7 +263,7 @@ pub fn into_raw(self) -> *const T {
         let ptr = self.ptr.as_ptr();
         core::mem::forget(self);
         // SAFETY: The pointer is valid.
-        unsafe { core::ptr::addr_of!((*ptr).data) }
+        unsafe { &raw const (*ptr).data }
     }
 
     /// Return a raw pointer to the data in this arc.
@@ -272,7 +272,7 @@ pub fn as_ptr(this: &Self) -> *const T {
 
         // SAFETY: As `ptr` points to a valid allocation of type `ArcInner`,
         // field projection to `data`is within bounds of the allocation.
-        unsafe { core::ptr::addr_of!((*ptr).data) }
+        unsafe { &raw const (*ptr).data }
     }
 
     /// Recreates an [`Arc`] instance previously deconstructed via [`Arc::into_raw`].
-- 
2.48.1

