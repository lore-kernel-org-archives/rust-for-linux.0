Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BC13A1E6C
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 22:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767391333; cv=none; b=G0DwB3SYsQ5i13bypPB9mMO7szlmIeKUl6mg6Wyq6PpsHdP8QYfbM3orBvTdfZYlLJoE9a8sWgYwJqnIKu9K0Sy7mBgTyD8goCiNwJE1am4IJQKN/QEXt8plxqYL5xwgDSajEzsX20EqRt1sSaJwYNQPkw4jvjTefVVsGRgqA68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767391333; c=relaxed/simple;
	bh=HiwJMnq8mr6pQzgKiF+VCQjWYlZRdru5QWhtxuLezo4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HOjVtB4Csike5jzkbNSrbIG8VG2iJPdqGC93g6COuWNomdnwGiYbg74NEqM9qCKXXRzyGjwwFZSlb+F4t/tc1goLAu+az3v2khitt/tTwfFnFsdVMqPRuTzAEyY7H/gmsW/8y4MLDMJNZZGr5XrDYVDdSiSfHGEFiRGJT/X+2lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZ/SI8+1; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZ/SI8+1"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5dfaceec8deso187814137.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 14:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767391330; x=1767996130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00GmlgJ1AaWzlpDrlo1/wDhQO5iplJBPhyzyjHKeuRM=;
        b=AZ/SI8+110Sf6t/bk7fRPdrqmktmnNflBjk0kSs8G9Xos33PKuIPH4jdTf5CiaYKyN
         ByRNVVunxQAfSlA+X4jSQmEy5SnOXcTiks471g7qXJtFG4kakZXWsqKtK3XCE5hi6fzR
         NtrcnaaONfH6WlEnXCAjmbFlpVYpFi5OQDt1b7YyaAdvS+OYXhLAL8CWA9yzkxpIli1w
         /X8i7/lV4zllmgLD1kVatkGX81l+dm1U9XBXPAiUY9AiDR2A9RC7jwzihlhk8qtBsSez
         ya3BRUSsQ6RuLkqf+dAZGx5xiW9dYlTaL8mdgfyrWHyF9dQ2KACmCZJFd4hkzxCpy1qf
         hQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767391330; x=1767996130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=00GmlgJ1AaWzlpDrlo1/wDhQO5iplJBPhyzyjHKeuRM=;
        b=xVeJrl8AhSwHiGm2j2ZIhuxDaMLKHp5d56R3o18k3efCFC1+JYh16klr1I3nhp3bAp
         cQafNnyv2wSoQGPTwSsoaGozXVMjudjf3shtSDUOc+eXI9uXZIjlS/diUAOy65zeYRkL
         C+lP82THONkAUQzwuQrL9xmA4bkw9OOnysQMIw9YjwQT9Rzxsqm4H7AjhPjzmdZUx67J
         4sfNTskcYjdq7MTNKZhQ6vo/OM7/S84DnpoIzKzkhqhzbuWgeZF8iIccdNb2D1YOQE75
         52GlcP4qbFyOmzVTBNF1BxzPggmnu/PUfkHIEwWiK4KIXDLAk3gQ9hVwCyykfePZ+ioU
         a6Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVGHw2M8YqOCpyaWksbUNw9H/eczqSOP3N1IVM0miVJbxyzdSsjn7FVnWBLoJtIjo3PPxTkWbyvwHHaYN3krQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYVhsNktbV3uD19Jeyr35WaSrOLPHdeEgoc9pnNA6RiM3lwvFX
	oXwuTqmKOswXCKT+vYgvszvLss7p1Xbw3hEiRw2rTw/Vwsa3pDXGDhkTxQQ8vg==
X-Gm-Gg: AY/fxX4iYOayjEVw8TGKbEt4+sCx+T7D8wN5K1TLJ0QXlgHiXtUtTwA9mMAAS1eSe0R
	9kWb44P2bNIanUeZpmUMWtxy7EjScXMDSRWMeNzKtHSWxQ5hC6LD18ak5vgu9aX+poLYxA6wjDq
	MJexmpsTQaiZifpiOP0s6FgJBw2TjhZBXW4dVPNnQLlZLv9fl9j0N8s3+rAaTSSujjxo8zpjkKq
	h2e05LQ7wCGEew2JtYwXfuxK3M1lB7o/qtmFniCJL9ru8XTQ81Tv00hR9IcfbEE2q/FgmYCg2jS
	9AF8OoEL6NFGweJ9d/zZjaq6XyTSbx3fN7/pTzthAni3maWLyVqbBd8GThfCkHVh0sOCd6unLZ5
	5NJOb4bvkPgqIj4q0UgITDi9Z+Llx76z695wAJL+giXOukX3DMyThxjDvYU54sbzueWE+WgzKHz
	iaMoXpbm21RwJby7fln7gM/e/OxFwwUw==
X-Google-Smtp-Source: AGHT+IEPMyBJPq9CEUhq+9mYwW8PVJVrcnr0aB/pVVOfrs9LUwZ+gBfHYbBS0sfvzwsICPax6EXltQ==
X-Received: by 2002:a17:90a:d883:b0:343:747e:2ca4 with SMTP id 98e67ed59e1d1-34f45399a2cmr556499a91.9.1767385730273;
        Fri, 02 Jan 2026 12:28:50 -0800 (PST)
Received: from shankari-IdeaPad.. ([2409:40f2:2123:b1fb:b93b:b5b4:2357:c53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm41163964b3a.64.2026.01.02.12.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 12:28:49 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	"Todd Kjos" <tkjos@android.com>,
	"Martijn Coenen" <maco@android.com>,
	"Joel Fernandes" <joelagnelf@nvidia.com>,
	"Christian Brauner" <brauner@kernel.org>,
	"Carlos Llamas" <cmllamas@google.com>,
	"Suren Baghdasaryan" <surenb@google.com>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Alexandre Courbot" <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Alex Gaynor" <alex.gaynor@gmail.com>,
	"Igor Korotin" <igor.korotin.linux@gmail.com>,
	"Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Abdiel Janulgue" <abdiel.janulgue@gmail.com>,
	"Robin Murphy" <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH v2 3/4] rust: usb: Update AlwaysRefCounted imports to use sync::aref
Date: Sat,  3 Jan 2026 01:57:13 +0530
Message-Id: <20260102202714.184223-4-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260102202714.184223-1-shankari.ak0208@gmail.com>
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update call sites in `usb.rs` to import `AlwaysRefCounted`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
v1 -> v2:

Re-worded the commit title to rust: usb:

Link of v1: https://lore.kernel.org/all/20251123092438.182251-9-shankari.ak0208@gmail.com/

---
 rust/kernel/usb.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index d10b65e9fb6a..79ff2f881572 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -12,7 +12,8 @@
     error::{from_result, to_result, Result},
     prelude::*,
     str::CStr,
-    types::{AlwaysRefCounted, Opaque},
+    sync::aref::AlwaysRefCounted,
+    types::Opaque,
     ThisModule,
 };
 use core::{
-- 
2.34.1

