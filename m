Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448FC1E25FA
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436492; cv=none; b=kFQVe7zRR17iS+ZnIvfFWJL/cpAnRHVipf/nGkFJpnO2cNCDhM8YBCqecIh4rVQ5lFmvLE4PkblJ3lTiHzNPyA0pGGLZfwJMMpXeUaLb1yxJO5r83e1YOml5jxSKiMA1QZpkY6U+4/YtX6yIMp5xFTOT7awnEVhR2aPHQbXHbLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436492; c=relaxed/simple;
	bh=ah5CkFIufoEB+BMpraIZ5rL3Qiv6ikZJrMLUSXWac1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPutmfJ6ruYcYuQAvXWhsseYNLuMRsgy+KUFlGf+78/vcg5DZTXhWb4jqTuxv/j+kyCgI+isbJstWBTuCr9AthQhFCSzljCRIuJ+HcaHLS0rDCwOjfAyk3HoIq/+RvH69deJQFIdAfHTWqlsQHiPa+kSU0F02WgPJMq43ia2FuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=LA8+8Zl6; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="LA8+8Zl6"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ff37565154so2483267b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436490; x=1743041290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9m30hK/WpmHc3oOKJEstrimV4bd9HKKE6GgYF61+TWU=;
        b=LA8+8Zl6K6GCKEi6w61XnP4NBDsT0mTergnkJoKiTwKqZ5xQKuFB2MEBMOc3Cv1wEa
         zTbQ4EgmFz1nWSYxiAcNHodGk0oyEUSHaTTLr9bk3ZCqJaTNo8LQ+oiN20gaBQwk9Wx8
         g4kEoPL6Gck05L7AHfwoyewPsa8cejUxR0Jb/BaoMriwsA3I/olt0LQVcQEb+EVjGi6E
         PrBJauekebJNa4TiiEXcQP6gsPEXsBT5aHFG7TQdL1BkaBERwEaOlhQLWqTWl2C2EmUG
         ymCc+a0BWvyAU9XDdbaKRHgE1woJkh8b43DWjaod2bEPh02uumemlUTir8U//q5YdYDM
         5Lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436490; x=1743041290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9m30hK/WpmHc3oOKJEstrimV4bd9HKKE6GgYF61+TWU=;
        b=ooMKFMDxuJ+Ic1FjMNNZyokdgGG2IlLKR0/e4ZwgMzOui8IupNRT1TH6281zA1/MXL
         n72nTN8VPG9bfjAfxlAE4PV3YdJ3eOcXdVjeBx/k7mEidRrYNu+5iZMdRgtGu7nC2xLX
         +p1Avu/3O4xOf6xKfSZytcaWZeAC0KaftipdDsH6FyADXPdTjOlcJQH/WZgQKmRpKsV6
         tSxpooJMvxONZR0O0Nd5u3tPAwRsnhFkOSRl5/VP3InNnHaG88xWtE5T/BJmYx7AWKIF
         2gzSKndZkWuYYD1cd2DtUzNe9yAocbnQJOReudTPQlavT5SNfeLbtwB49xx4qz44KfzS
         TCOA==
X-Forwarded-Encrypted: i=1; AJvYcCW+guy7dueqhIropptlWqEWvpFU3DeVDlL4RKFRU6/LUzffhij8Tjb6DEKcmn7R6zTb2lQ28HMXax1rH1suZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJUa0+S1TLnuZ3XvNzWiMkHqNCyH8c78yVkk8cnzlvmoSe/fGJ
	VInfcMmi7DECM8yICbox7PrwtYjC0oT/Kf7MhUn3pj9HfH7sSVOtiUyQzalvDgU=
X-Gm-Gg: ASbGnctPSjcpO8ooOAmugYrmLbQ1S0Z6qJf2ysXlbGgBt43thdFEAfgRjy7CEdY19SN
	kPBIEbvksXWbWtaCzxhS1ef32orwvSdqsBXu2Ok5e4Ft+dzMNxc7z6Myzwo5/SJtdQGFlBHPGaK
	OuiLCF7fM89pZxiq1EcLsP9UVTk1ro82z8fyh3rv/JKI3yf9SsS3jF6aq02ghuMbCqwy58OzAmg
	XSATpsFg6bW5qCwXPulq7NCKjUvKs/4+FYF//By5jHln+SWSBKSwjPzfxdhVSv6ckUKeIY0ZYuk
	T8gD2hyaZp1tlWZRB4reZbhESxkm5w1gjWRIuDNC33qAwwiMnGBCB31Ji038dGI7LEfmUEuUsAK
	+18tPuQ2PuhzdbVs6eZKMPL61QduR3Q==
X-Google-Smtp-Source: AGHT+IEg4JwxOP7K3Nu29ZjFLF8R2BzHBsPXgJIubBIhclHdAN12cQy7377cZeX+JtynbbEJweeJjQ==
X-Received: by 2002:a05:690c:6ac7:b0:6fe:c803:b471 with SMTP id 00721157ae682-7009bf8152amr80373857b3.16.1742436490153;
        Wed, 19 Mar 2025 19:08:10 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:08:09 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/17] rust: faux: refactor to use `&raw [const|mut]`
Date: Wed, 19 Mar 2025 22:07:24 -0400
Message-ID: <20250320020740.1631171-6-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of_mut!(place)`
with `&raw mut place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw mut` is similar to `&mut`
making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/faux.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 5acc0c02d451..11e56fcbb6ed 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -7,7 +7,7 @@
 //! C header: [`include/linux/device/faux.h`]
 
 use crate::{bindings, device, error::code::*, prelude::*};
-use core::ptr::{addr_of_mut, null, null_mut, NonNull};
+use core::ptr::{null, null_mut, NonNull};
 
 /// The registration of a faux device.
 ///
@@ -45,7 +45,7 @@ impl AsRef<device::Device> for Registration {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
         // a valid initialized `device`.
-        unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).dev)) }
+        unsafe { device::Device::as_ref(&raw mut (*self.as_raw()).dev) }
     }
 }
 
