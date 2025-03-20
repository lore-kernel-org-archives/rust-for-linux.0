Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1401E47CA
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436548; cv=none; b=Mdbcgk6Ml8cC7DhbwN1AXQfSrXdtSnHb4aKJdg7NBXO/O/2Fx37EJcfMfa4axZKq2WIBVz4+cjobFoKHx+hFKxmQ4gTOQgFTrZk6G70pQp2706WdvuJOjiMSdr3DleP+n/jrwOELYzD8x8Bmgr28uaikb9kYtNgysnGvLKK7zOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436548; c=relaxed/simple;
	bh=vEpaWA68QW/xdk82Q0863rirqvUGKmQiDZcP3WFc19Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TwWexqwWOg++4HScO8fzW5JuOeFU9b6Q6bOCP4x49L38Ek344rul6CyZuA+pj0GWK7pF3I14A9i6jSu/R3+J10ozEpvXvfuuSPJsk40f2fzgh4sElJSjILvrkodZocdM0kk4A23aJmtikeijPkDYIH5zHhRUoKUZxDVxb2b1BGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=ZE8HQpQc; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="ZE8HQpQc"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6fda22908d9so2047657b3.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436546; x=1743041346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SLgULB2utXQCUaKC6ocj9H9XNoQumEhcqg5bohf8SE=;
        b=ZE8HQpQc0aRyaw2PZHQhBb1sKi+tzWRjx9Lg9CXzQRJ/b/boSFgeZFbms/bURJiulc
         cvwHu7g7UIluLSGF5LibnU9CpvvR7Y45lZyZ+3Rak06qg350HVhZi6QpdSsrZWLZrd28
         K51rR4opjwzQwAk6bqUjANNldSJLby9F5/8xJXgRFbFN76GHCLSyjh6f4RqTEWrJk7bs
         N3XHeixVQgogaoGIu3wfs6SzobzjRTnwgmyM0+35PVA/8NI8ixC95Em7nLwxhkq+zWzJ
         +VWI5GB9zNc9db1GT27ePW0KPeWwxps7Nuh+ffoIoNVR0iHJFCietPWH2ADuI4b3CLy+
         8QWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436546; x=1743041346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SLgULB2utXQCUaKC6ocj9H9XNoQumEhcqg5bohf8SE=;
        b=wD8RxAQzBd1R/mQME/YZqmqZnNoHQhbCr9mn8dCjjDpirpP5Bd9gfnKzWfN52Znp5d
         hkIwxjtm50DWbEVvLi4R4FHL3EIgmx5w0Ls8PTUrLQd9XCrHfRXUcny4KIM488MZL23d
         s4AcdmeE6yJrGqwTp3+MC+PKc1/xZGxUxzwoJYzVYh9n3sm4sY+CiqaX22IBNRZ2pA9c
         wmq902+fwATP3XaDfh0FppLrHmb7eG3tnOKQ8yQoAvHjYHpxBJzOlsn+m6919cIBaePL
         5Xmq7SRcEScdgA3UC+nWwy4MS7HE/F/vJibypyGaSM68rWFq+YtnpqcrYv8irdPGTaLK
         RP9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWA14mfCA/7NlzC1XqTriPiC7TdVWOvh2fvKvXawBK88+z8gzgRBHsPUEaQLsZ8URcbGwbU8oogCwXT4GEtig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgv2r68hXN8fiKWzT2OMZIqXXkQKH3BDHgiqjNPHEMXFbWgS7b
	bfnZ47iAxqcndJbMORzEhJrHDskRN3oqgaIZ4Y56mQabjcdK7rsZqZLbUiV427U=
X-Gm-Gg: ASbGnctgcD/11BjSUXBVEhKoxyLcp71jDwdMBUZ17DgDXqB/WJ7tACvmeqfBjCa5f2o
	gFE9gej6LI1LTjkNgWEOTZkFkAnXvmT1n+T6n860AAiW2pL6kmjBH/WMoDV5m6dl+sSQFvFtt1s
	JTkwHXROhJ7q9cndSoc0oDW0nGnNB5lhRS96AWU7yQSh1pZFPTdtn/SsBO8yyBn18heaIOssuJd
	tjDT26Etg+V3a1JgRtwtJJDkqSbP3JmZTBDH8OvkeHty47g+30Q4cP8S4RTqLd91/1UiEcVsOUj
	nngFHklFwxubLzxBBS2X8QH9WVsrreCSWTAhukHLzxOBKlRaMvZzxCd1kYMfLhhYG4sv8B6zBqe
	P2EvEneLjdc5c5kYlpt7oa4zI6/hNEQ==
X-Google-Smtp-Source: AGHT+IGxlIGpc01WyScw8Txp7o/tEVqqwrLLlhRzgrQzlCT/6WJlb/M0fwe2B7ib20G5lx/x8+EwKg==
X-Received: by 2002:a05:690c:fd2:b0:6fe:c803:b48e with SMTP id 00721157ae682-700ac5f14f9mr17203407b3.22.1742436545995;
        Wed, 19 Mar 2025 19:09:05 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:09:05 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Trevor Gross <tmgross@umich.edu>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/17] rust: net: phy: refactor to use `&raw [const|mut]`
Date: Wed, 19 Mar 2025 22:07:31 -0400
Message-ID: <20250320020740.1631171-13-contact@antoniohickey.com>
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

Replacing all occurrences of `addr_of_mut!(place)` with
`&raw mut place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw mut` is similar to `&mut`
making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/net/phy.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index a59469c785e3..757db052cc09 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -7,7 +7,7 @@
 //! C headers: [`include/linux/phy.h`](srctree/include/linux/phy.h).
 
 use crate::{error::*, prelude::*, types::Opaque};
-use core::{marker::PhantomData, ptr::addr_of_mut};
+use core::marker::PhantomData;
 
 pub mod reg;
 
@@ -285,7 +285,7 @@ impl AsRef<kernel::device::Device> for Device {
     fn as_ref(&self) -> &kernel::device::Device {
         let phydev = self.0.get();
         // SAFETY: The struct invariant ensures that `mdio.dev` is valid.
-        unsafe { kernel::device::Device::as_ref(addr_of_mut!((*phydev).mdio.dev)) }
+        unsafe { kernel::device::Device::as_ref(&raw mut (*phydev).mdio.dev) }
     }
 }
 

