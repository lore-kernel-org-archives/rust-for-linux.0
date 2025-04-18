Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22CA202984
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 01:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940548; cv=none; b=tTcFd+5gkvdNltiRz9mpakliVq7CG/QReCEjlGZFCqNibu7jjcacqu217lFNwxr5MdYyBKFoZAB8RQdCkDN1clh5SwWSJ2cXkz6mxjfqwMNGhRY8UTErJlsaI4lGWnT/lj2B5RVyqN9dXowbLY6S6/GIvvQ8OyMJSUkHdLXyGFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940548; c=relaxed/simple;
	bh=OjAsY8Aeq5Ueru5ZAiLzHF/EyHc73z1XNs7APpOHEWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2hhaAH22neGvlOjXbBYNB+kZIuWiT3A28JNVyU1miCXS/yst2ssY7h0tw6sJOkznlqhks+eKdxynkqJhESEtUXvsaAavTsC3B0LPSaQJD/7Zl8VRfMXNEp3YyqDn5z1Hq4AXspUAAgVhz3cs51lEzeRGx59zoqje+NMiwxs2Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=lNSpkuJR; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="lNSpkuJR"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-707561e5fdcso1200347b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 18:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940545; x=1745545345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACdKqDtHD6BESg+aNrA5JEShMOuHrL3BKvU+zPowCQg=;
        b=lNSpkuJRc6Z1epKiGSFMcxIF8xXhS/B+f7Dys0qh7GDvBwCQGsJjhZt4hEBWq8DM0a
         sXMtpLSbG3mZOSk+MCA3kImFHJH1DFosBiqnY8F+T49Ba4gmTDRZKfmg2bk0FQy/rbYL
         4NOjEdlPGklM0oANxSRewrDs1PyXlmC58ZPg2ypkDmFSIrxlhCNOF4a3Hf6K27tjqOIB
         YqvHl+i3zvtNYbrMof3RGMRC9Wo1fIAY541CKWh3j1C6F2W8cMbaSaK7SWvdZpgOwi/E
         s4jLvUmtNr2EuhIu+1raKQVZ1Pu5Y+e0sXdZAx/OQjGsFWYP7/nQVNlnWV7DzuU96iIR
         IZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940545; x=1745545345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACdKqDtHD6BESg+aNrA5JEShMOuHrL3BKvU+zPowCQg=;
        b=Yt1XNKc0Qusy3yGt+dU2p4epn0fti3BdxCXx+CTwfkqcGO4caMDzdos3M7XmxZuSPg
         BpJ2H7okBOlQhc7ST91Rz2xp0gz99Dyv24KJhxpHGbwKNu2DmBp3R5nZfvKMLjdNDrOo
         De2ThaVXS504qh2BCY+bZU+UjwchKT7rUgoNjK67nnARFG7P3qcPN5dfX6mdfkwkY9sI
         6UNCTZ93nz0hxbe6KOj5IyxXpztDUXcCPSMfF1UDFzbdNlCwCd4uPMGuR7dRyeejxFQZ
         8In0OeB5aISHMwIVpDsFJ7UN74a6cQ6Szq434y6mBJ8ELrA1SRzkThSG8ZwU70cvMdkh
         w4Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWWSJPznH1Pf4WoqkaTrHcTMzb9Iqz7LHzbhp8BZHGwPdGlOTSAtTDjbKJmLgLoW6xwDue441lZdKp1rHgK8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyBfimlbaqKqZH1LwRA4CN0qbUv7apElgxHzQa2VRzQ0vMCP76
	mxXAfZTA2ibYFialNROndk6GpY4gVzFEV1rjgFW6levLkLXhak7THMEimNIOEhc=
X-Gm-Gg: ASbGncuEgVV0eo0Qt26jZw9rDVQn+wI5Q2HjF7cq/KTUNoJXw/exMj+Qim8C0vmR9AL
	kXTLZjoKLdb84HhTI+pOfNZij2U1eLr4KVVDtDTYGiG052GKpR9t08Pq8Er0KS+v8Os8iDp4bM/
	dgKWYZVn0OMu2MiTNZy/0ACROz08V7Ahka+r6OKrXrJuxxyfpLWTFwm/NcgB5EuSQZpHGcyaOpL
	RFA2ujh/Gpl8nkKAQ8S7/6AgSaFq4kqGqZzDvFoAFHQVVYtYwvSoYABr3zRSf1xb5mquSQyzvYR
	Nh4TLo/TerTZB5/mtfUpj4RQJKTxqtHnUmNFWyaPDc8Wi/HqcX4Q/LxRY7QHlStcFRvAqhhQ3KN
	HBEdjPTcL7qBmJ3CdqEb8GCRdnqayx29vbkAw
X-Google-Smtp-Source: AGHT+IFFnPj29gWWWt5rHJCynoVqA+g7Bu3K+6B674boBRW55BGIQRBULHvKIBq0w4As+NszEYgvdg==
X-Received: by 2002:a05:690c:3609:b0:6fd:3ff9:ad96 with SMTP id 00721157ae682-706ce084512mr16517447b3.37.1744940545611;
        Thu, 17 Apr 2025 18:42:25 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:25 -0700 (PDT)
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
Subject: [PATCH v6 09/18] rust: net: phy: refactor to use `&raw mut`
Date: Thu, 17 Apr 2025 21:41:30 -0400
Message-ID: <20250418014143.888022-10-contact@antoniohickey.com>
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
 
-- 
2.48.1

