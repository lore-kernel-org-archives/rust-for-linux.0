Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD8D25BEE7
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763890043; cv=none; b=Fd7KxKeymoaLMMikc0CoANuWK9BVU8pS5NTbB3fhhqO/0IFHpk9fDQ7nFybvH8Es2RlO6ZckTK6ZJGx7mxTtGlYVWtC09qmsJsoHkZ14H2UYkGro/6gIjlGSWzAXCjAX0MLsJQVTPsQYOC1MsOJBoOvksjOMWMqCBPLxS5z7Xo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763890043; c=relaxed/simple;
	bh=0T0m+vzVHWTBjikXdKLHTliy+liCTCohp1BbecNTmzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VgE4nQP47QLtXrGwoHRfzNsZWgPuNg/7qAoj817c8TBVFzwsEKk8Rmw//XhsgOCOlcErb1zyoUVqXHlF3vZGHLHEtCAJ+u3Vvvr41ugbnMWnC9kMTxxLL/TTD/cu/0yNqzCygKvffXt5nbiNM/HcoasN8rG02wu2/v6JZXZ+VGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BK6HxJu8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BK6HxJu8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2953e415b27so41070935ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 01:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763890040; x=1764494840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuE/I+mSjy5RFqX89Pi5DjFF+u40p6VYH+8i+leWPLg=;
        b=BK6HxJu8klsBazdbsG2lf0ie3JYLn/L698A1rKw5A/Vq5mhZ06S0sWiXKKUDLQ9cbc
         EaPdiKjt0CHqRx1KPhUsmjr9jUABQTE8qP6DFMuR+o18KmEl3nVeig7aFrdnARYS2Q+h
         F41cf/ghn+cEukAlsxvEt/so/q9tm2nfpguCfTf0+erBS+qjzniFGgcMwKROsDTEwc2g
         e8Q6vmv9Ulx55qKrk5Fb3qS3YyRz0PAK5D1MGO86l0r8JmE/eMVLPp2xMed1IKqGIFdv
         7080TVJwaycuxrAyxFj7Y6uitFgPRg5OEEO0SfvsqT7OldinGtLHFwkSEqOa3jD5j9uQ
         V++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763890040; x=1764494840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cuE/I+mSjy5RFqX89Pi5DjFF+u40p6VYH+8i+leWPLg=;
        b=F9B4YkTZa9qNvyFkGDm3SHKGkwrsuLSNoGnur27OOmZt3mCc5HR1PEF3TehkaZWjp5
         9z262ck3C7gFFbo0SoiL0rNYYPTEa7pci/XfF0cpHleC1vwRRSbhc04dseB0/C8CSU4d
         3cM8Jk2OJ8O+minWeOdTUt9SQ/Op4hqapE1DbpA9Nb2GTNeYz9CBi3Jclv+WP/IqJf2j
         idaQ22SEOUUEPriT+uFawwF7ih//JCVXDq7xwXAl3G1DHNKKXupnKHDYECg76tGZQhH6
         0RsDgATLCeCIbMk/cM+A0nbz+w602eqmDShEim31l0y+XsgYi8QQxoQn+FzKdTKJewa9
         HZzg==
X-Forwarded-Encrypted: i=1; AJvYcCVYHZfLnhGA4P5dntvAOxz2oinUQNh5Zkj3iHCLFmwu9U6otdGgs+7yaAKXRJRcUaAITsPIUiKrI2h+O+owpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmza4rVweWE5wQ7fC3Fo4IONpjDACcpmSmGI67NF7LO8SXLTRm
	DhUGcGbCEps5P4kMxQts1lTed8wkipVz6Jq3+yvt2iZ9ut4xUz/xCEtf
X-Gm-Gg: ASbGncs4W4DeA1oWKrJW11uvM5hKBwRjYwwla3Vm1YKq9IbXFTIYn8HBS8o2bnPelaM
	vYdNlgpLrbfsCwE1h3XmnawzACioKfPAr5q7OsXIE5EtfkR5Mep5UOrcjUhAp40MfCGa7CRMBWi
	9/ORpYBmHhSYdhrRdcOdBRX9unBPtMUL8EyuTz76Y64amlyWhCpWbdJOwrZsvBHyIQo9m6CdW3O
	P0EuKWkBgIhBE8hATmuihb7GsX2jrXmwbDcFugz+bVYWIPvgPjP455PrnXAOaEQnt108S/AaM9h
	+WDKz0IbzkchcPGW9SLLIX1itZpCSepRcYSR5TlU0tru2O4S+q5naEgFd0J1g36JwmPsOe3tajh
	cajl0lXOrdXXldZsUupjTdKx4dxLDAJOT81bC3+edmLTC5F4y3qlKh5wETTXZfhD9ZOyExVZkmb
	KK5D+yCPScQ168bkcwswn9mWY0Vw==
X-Google-Smtp-Source: AGHT+IFMN2aUokRTTtS+sIFfNu4kcDd93MwuGAJrh+xf6L/Jjr+U1cR7WS31QoNboosVEzIBjpWEvQ==
X-Received: by 2002:a17:903:2c06:b0:297:fc22:3a9f with SMTP id d9443c01a7336-29b6bf19f1dmr93932225ad.38.1763890039910;
        Sun, 23 Nov 2025 01:27:19 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 01:27:19 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH 08/10] rust: kernel: Update AlwaysRefCounted imports to use sync::aref
Date: Sun, 23 Nov 2025 14:54:36 +0530
Message-Id: <20251123092438.182251-9-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251123092438.182251-1-shankari.ak0208@gmail.com>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
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

