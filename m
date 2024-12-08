Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5927D1586FE
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 20:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733691024; cv=none; b=NfzTdI3Jn1tad2IPpqqMMjarYt5qJNDu0OHCMFizCXkQDSfqwugcEzBOjgJ5YsuDnDsLA+hSGHWGaLzgjpyz8nvoaNMNzooRvra5YMy28U09djUWpMgCHci7hfAURC2GOMdVTh/LOCnxJlBW3IdibE8Ee4wlhQZfFw0sNETUhPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733691024; c=relaxed/simple;
	bh=+TQZRSSVKhMpauU2fZaRG5OGPCfKvL0ERn4X+X83ils=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kne21yqP0E4u5Cd6IW+XwOei7PVVvKUKdCflQ5sD55VAH8UiuH32lS/PBBIRRvQRAt2B+Hld4iqwmeCwcfLt6CWpX7/LqYt/GrUO6td7Axz7KlTpM6BssvPC7zJ5s3Z1mzew7xzKAlTkgwFXvFM2M60d1Fa5VlFKmeBYkjisKRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNDIYvKe; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNDIYvKe"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-215a7e487bfso30393815ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 12:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733691022; x=1734295822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkD+FMt/cRWdIAgCEDxyVz5HUntKZt/jMtSlunJtxCQ=;
        b=ZNDIYvKeTDg/klqwojnPYpRRdGGNfXAJiMao3jftZxFbcwAoyoniD9IbKzglRdmJl/
         u2I0mvgPsg4cKCi2lv1RubB0BK026BCcr3MJLs2OVBqZnmauxigJEZ1G0ECfs363GvQh
         2ASxaZwAJCbOdv4tUEY1wTEi+hu9RcXLXXMpSUYEsF5CFwoP6cayGzNjVX3DTrlm4YeE
         FcYqXcybDGOa8Sz5Cg+IMyDeKCJMZa41GdabnaTM428MuUsEYvvWnwnCgg3F9zQwFneG
         NwHstwmJfxuVPj2Tov4f1fv6wfVI4HdF9CcgQ0g13AniF4tInoXbkid4gUuLKPivSgF1
         7P8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733691022; x=1734295822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkD+FMt/cRWdIAgCEDxyVz5HUntKZt/jMtSlunJtxCQ=;
        b=W9u2TGTWu9tQZHBzag9/T8no7D1tqRdRCflnVUVghcWc+oA38GoWEVvyIfBwKaVapE
         Pr7+3uXFgYF5W3h492Njlt8wfoTM1zFNB96j1XUv+YMy9hysICDgM3dyB9PtRkDi1dRc
         Gvh8UC6aRuTJ8+81C2lcjpbkcekfTDrjcPXCKZziwSUH9gDCAhmKOzwkX4REdxmvrnhO
         OnmjuDhoBFAAQGHYD5FRN2RPe8T9jggL+jMng3Hhx7G2YvpAkVBKH7sylOoHPJ/SiDL3
         u8OxXcL38rpCAzEuyeHzlaWiX3EY8qQHL3OYPo2RO0ZCkPA+/1US7JbeJnvAM83OC67I
         2QWw==
X-Forwarded-Encrypted: i=1; AJvYcCV7DOGB+nQBzzYnvdqxnGIp0rSs7aFFGl0Cmq+ED/utNfPUzs049ZJtZNubucDTh3DovzqdUlMpgzEmpaDF0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Jhv9dZq9jtbG/bMsVezbpaz4BDpOiwvQ/6OxM7M2GpsoN+2o
	5Iqf1tVswjttPdBMOc+jzknBq5qsnr9TrISbpAyl4w08+Lx5vPoM
X-Gm-Gg: ASbGncvaRKxuybpjCzZqe49MAHdKnQV179fW8I58xv9koD+5suERm8NXuQPHCyfYrA1
	e/WRc5UbvOn2lBcD6/Da4HvMnyThBqG8ajLnEGdK5938P9ykB1M2NJURhjhmEv5fbCk4H6PrX+T
	3oC8c23Z8agugPD9GA7yBWNmOKfN42Lha1ze+GvU9kQXKepwGrQNn2YOWXcgdBRm8LI0pH0X15Q
	Bxhb3qStATO0rQTKDHwmATbSCn/+Z4+Gpyx/BjR9MrkhRixvtyglZJSzBSqSA==
X-Google-Smtp-Source: AGHT+IEIimT/JtDzJI1ot6LuvWbMc8bvHY2TrKze3dCis1kt7y9uCwhYmAEplPv3q6R2PqrBed4Fog==
X-Received: by 2002:a17:902:e548:b0:215:7faa:ece2 with SMTP id d9443c01a7336-21614dcd852mr167824285ad.35.1733691022545;
        Sun, 08 Dec 2024 12:50:22 -0800 (PST)
Received: from localhost.localdomain ([73.109.132.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2161fd39ddcsm38587815ad.86.2024.12.08.12.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 12:50:22 -0800 (PST)
From: Jason Devers <dev.json2@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Jason Devers <dev.json2@gmail.com>,
	Alice Ryhl <alice@ryhl.io>
Subject: [PATCH] rust: sync: add #[must_use] to Lock::try_lock
Date: Sun,  8 Dec 2024 15:50:18 -0500
Message-ID: <20241208205018.52930-1-dev.json2@gmail.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <Z1X7ZO0wd5XEFFvC@tardis.local>
References: <Z1X7ZO0wd5XEFFvC@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
currently does not issue a warning if the return value is unused.
To avoid potential bugs, the `#[must_use]` annotation is added to ensure proper usage.

Suggested-by: Alice Ryhl <alice@ryhl.io>
Link: https://github.com/Rust-for-Linux/linux/issues/1133
Signed-off-by: Jason Devers <dev.json2@gmail.com>
---
 rust/kernel/sync/lock.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 41dcddac69e2..f7d355c5d90a 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -147,6 +147,7 @@ pub fn lock(&self) -> Guard<'_, T, B> {
     /// Tries to acquire the lock.
     ///
     /// Returns a guard that can be used to access the data protected by the lock if successful.
+    #[must_use = "if unused, leading to an empty critical section"]
     pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
-- 
2.44.2

