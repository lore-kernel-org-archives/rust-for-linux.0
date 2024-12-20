Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F770198A38;
	Fri, 20 Dec 2024 06:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675953; cv=none; b=IitQ11po1HnMN1TQWGtnmZ8oyX1iorwGvDzTMz6RxPjJgwDK4+O8Y91+PzJkP4z3IMBKWM+oFIHcQvdJI01OABv67U9SILZrsCV+EHQwmO7Q6fyEFizEt9/YY+D1Tabn4GlGjbAH3hnnyZkpV8+kOZfkRxK7B+OZwrx9+bBf7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675953; c=relaxed/simple;
	bh=zQDsRS4eicvhtDsCcDuN+UQqJnJ5oyism1nA8W9MH1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExIA4kgniEwVOfw9xLG3STDuDkhbtsuXuBPvCG7+vNTXRsLXX5wdkcz3JJ1l7H2TltUES+RCjgxx0Cur0X2HVLhh4hfGdaqA1Cqqn6g+ylX0CXP+ZpkyQPULNU7IMpXtk06lVWrMbkDtauxGGZtNZrMV02POj8506GhE+sShfxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzkN59gF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzkN59gF"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216401de828so14233435ad.3;
        Thu, 19 Dec 2024 22:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734675951; x=1735280751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QJwAA6QuSdF/zmkHmP94PoJFukiDsF6sYoxVsAielE=;
        b=lzkN59gFRYg61ga5WsSfuz8ridtqBExZHMjEl0uAK7VCo0sMV96F0Rdk/9hxmTqNcn
         4bQkq+7OFmy7OOiS6aJs7BEm6byc/e/r2p400Osgd2kP7Emc3Au7YqlEgsElj7n0NZCR
         1dtMvjdxT2iOHoeAuSKzSu+sznW7G6FVgjt69Tsum7iIoIPXsUSuaS9DLFW28w9/d1K0
         n5yx0SgmsNE/ywKJtZ94JxXKeSU+DUirqN7HxCaXd+3ja+yKTdV81gaqfk82tVIgrXrv
         3DEOeJAGWNhZiIcFdTklAaOXFViKxIm7jHRJfE4HwrLUB89o1m/1cVsXgUADVvYDCobx
         Zwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734675951; x=1735280751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QJwAA6QuSdF/zmkHmP94PoJFukiDsF6sYoxVsAielE=;
        b=blJPnLCrEZ9l1qm8HC6f2uFF1A7ma1vVq7WSruyWfoXzMvoZtFFHsm0Ayu/QO6pWrW
         3Kxhoz0itCLN3vhylXgBUkcy78oturtm/MafbqaxP9YFxoGUedPuqIquhDRTSmU0xJN6
         qkCrGLG/7UJ9I+MoEpDba6iAsDpXSilhUEEd05MTU4gVRKo+HCpJn+dqnJV6ZesXfqGX
         IMIKIJ/lYU8fr/yeAYT8H42L8lYeZOoD1ipxlh2mv5bTT2higxP+9LRSauVVQIn3yBD7
         dC09rjvG7Envgf647UJJyd+85bEY3sOI2vu4hN+7vMniucNEny5pYFsoW6SJVSBq00jA
         DLjA==
X-Forwarded-Encrypted: i=1; AJvYcCXWFKbQRPSEOPJQLiF9u/nmVK7c64qM1tPW0s107mnvznc7B/B4Tgvh4tBh8Z3B+qY39CU86iS6j0MEIIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWXRM7EJApm2HtccNpJ6OdUFFvrAeFMePdtsMTclWvy67iyDyj
	XhEVXHJNtJIgahztkUPcGc3WjrXX01hWJDCeYRDr80vQUoNWR3eZ
X-Gm-Gg: ASbGncsr6qmoXjE1N7ygUCLpQZhqmuVkiClQOiv+Qae5R12gP4EZqxfWQzOtpsLrtJH
	HHwMDg3kArwf/iSKeOZuXcOAEQAS2ZDFygr5xbYxKTw4zhyfxVlBHl9iDP5zlhnMsbQ6j13pQP9
	SEJ+bJa23VyazkdH8c0+9FSX0XDGqyZY3XJBRu083S7s2jEO+X6b2OAPRvMv8JceAgqJMyO8P+T
	K/dEr12ufIVzWfoUwM/ypHnUk9dkesAkBLfGNQsarPxH1Y34FxmYWQADnUY5Qm4ghs=
X-Google-Smtp-Source: AGHT+IG8ZGQ8U8f9YtHnrKSRjO35/q62ilnWiRk4/HfMDSpH5wtXBdRKwsydv727YMsArOAhEQzAhA==
X-Received: by 2002:a17:902:f685:b0:216:311e:b1ce with SMTP id d9443c01a7336-219e6ebca65mr22947965ad.32.1734675951443;
        Thu, 19 Dec 2024 22:25:51 -0800 (PST)
Received: from lordgoatius.hsd1.or.comcast.net ([2601:1c1:8502:a6c0::b10a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca007f3sm22001755ad.228.2024.12.19.22.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:25:51 -0800 (PST)
From: Jimmy Ostler <jtostler1@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Filipe Xavier <felipe_life@live.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Daniel Sedlak <daniel@sedlak.dev>,
	Alex Mantel <alexmantel93@mailbox.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jimmy Ostler <jtostler1@gmail.com>
Subject: [PATCH v4 1/3] rust: error: Change `LayoutError` to internal
Date: Thu, 19 Dec 2024 22:25:31 -0800
Message-ID: <fe58a02189e8804a9eabdd01cb1927d4c491d79c.1734674670.git.jtostler1@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734674670.git.jtostler1@gmail.com>
References: <cover.1734674670.git.jtostler1@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the imports in `rust/kernel/error.rs` to import the internal
version of `LayoutError` instead. This results in the existing
`From<LayoutError> for Error` implementation implmenting for the new
internal type instead of for `core::alloc::LayoutError`.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Jimmy Ostler <jtostler1@gmail.com>
---
 rust/kernel/error.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 914e8dec1abd..f6ecf09cb65f 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -4,9 +4,10 @@
 //!
 //! C header: [`include/uapi/asm-generic/errno-base.h`](srctree/include/uapi/asm-generic/errno-base.h)
 
-use crate::{alloc::AllocError, str::CStr};
-
-use core::alloc::LayoutError;
+use crate::{
+    alloc::{layout::LayoutError, AllocError},
+    str::CStr,
+};
 
 use core::fmt;
 use core::num::NonZeroI32;
-- 
2.47.1

