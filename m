Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32073C465
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 22:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767391401; cv=none; b=OjK8gqGY1Zzhf34PopxlW+1RD5hdwVbgpoGo9ZIAQjcTprcJc/3ECO9fJGQKQA7MQ1h5C2eo7RrfpM4crICpB8UJzZV6s6FU2tNwLJJIqQbY7JZZNWGWoiLWo7vErEIZdfVhZ4Rn45ZJcVFjEfUnS/wV7KjAjsA3SS4Y7nwzbE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767391401; c=relaxed/simple;
	bh=EMMkEKDBYQlPPVj8hbI9T1WIarwzfCraz4glSicyigc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lr1F6v3JfJB0h25eOK9YZ+skDq4029hZXxD40cW02/n92vlqAgr9yKUT1zPhKbY0xZkLvD05GXDRLLiJgzxJ4MnVTxKvy6RWTaMuUBWpj7JMGXeaHWTor0NK/ua+XbpF/J6p9iVJpow5DBCu+ViRo+x6qAKzW784g7ib+F0fIxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coe2flqi; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coe2flqi"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a2ad13c24so120740196d6.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 14:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767391398; x=1767996198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHf0Cw2T8TXNCaYX5vHXpRGxLPgjtsELwtTPtFxfep8=;
        b=coe2flqiVZmuhha5LqBTLvQcpuYWC40BS6d38gn1+74p4etfjLE6PCAxlUOxehbOlX
         NnL+BQqfEKPssKiDHASmXMeKwUUHFpx7y1/4BoICBHZWe7s7h6F6nVWz2v6iCXnmryMO
         1hxRDvEbDwdCUVj7JNia7IroKjcorlT3QJG+1NcyFwwbZ1aedjlxXW3P5u/Ov1WX1JqI
         KXs9bSuw6SPakBMi75rvcDW8iB0NCiM8maov/uEZk9UOFtJ0LYn4m33zWqQZ8kvskaNq
         5OrAKsnX8CGGSJZp7efmCzT0uDM1ISiwWy+5D1GquPSepT9HVpG/CHHkEc5O5d4xUHnU
         YNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767391398; x=1767996198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EHf0Cw2T8TXNCaYX5vHXpRGxLPgjtsELwtTPtFxfep8=;
        b=wBzLBvr9X1Gl5hXhWfX2llqa22K4CLosEtyTz1h0US635dC1Onbb3EfPrel2WwoPIf
         1A2iHP+HOzmFH6rvyMGiW57aHehIWYsHyafmaqMgMXQ0If5BzxCWxIu2Y53U36lTk8gS
         xPh7Fjno7nYlHGcNn7y24W5KlQ0AVR9m6umIBgFVSElBbF2jYjoWM/ZECBeHUAGEwOmT
         HRh5InI+k+xg2l4CFZ0CdypQ3nMD7IJX34xb+fWxrIxLyuep+2EeRVL3OLgTqQQMtlfz
         cIHlXgQO9MBmm3CqRVg/5gCtm89tmSl2ICgShv6l9i9oQRp2cTa2G/fjdEnyNO+/pSlC
         AO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtm8r3yb7ngHsie6Mty21q3MUEY6qsuxoBffobPnvM3RQDY2lqAqXciijxxPC+tyfOvRwgroxD6f65Av/2Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWK5Ex8Z/JwMaIO4EJeVW/cMckBmh8VkKDGKn84LZB93VK7WSL
	9OPL59AU2glzYv5NoFKWvfP3FvWZnDs6iYZDPBJkKrVvyEIsHzI1B4eSe4BT0Q==
X-Gm-Gg: AY/fxX7ue4dpE6s/xOh0hvjBQOktgCU1G5GcuQ9nOKLCGdvB3aQ8wCbRY4zUvaK5mbf
	zFG5VOqMrBESrG4Rt6E1L1tJ/kmyGCv9MRCQKeQ4bxlmfn4VK4mqKWytY39+zzXp4+PISU7WJnK
	zVVMP54DOViOrxRmFo56UDlRc87GJJ01uIPmBVX3E1Qi4AeAu2dGC1k+eBGahi/SuuHXaeMG9Qw
	sYOM7n+obZQX/pIFluiLJ5mpWD8IJMeVweOu52wLWTuWUygaJYPkN1+RbofhpjlEW79xKA7F2Dk
	9kW9+6HNMwQB/RMJksy327d5vYYj879pFpJHeOph+caXHp3yt8fkJQIWmbLL1H1rHeRMvcgzKro
	2PiY603q1m247KdSoftjl4+bsXi7DiRDqyTi0E0cAyYGxAX7GpvLAUiGjT2+Nh6wn0FRDORUWOA
	afMJryssRGkJ290JBfUFqpc6UlcwYBAA==
X-Google-Smtp-Source: AGHT+IFUU02kaMpZOmAE1cbvVQkZ4U+cCpsROlkOGIuje7KQvVu3XAsyFDM3AK3Twn/ENVZrOLU0sQ==
X-Received: by 2002:a05:6a00:1d08:b0:7e8:450c:61c6 with SMTP id d2e1a72fcca58-7ff6667b6bemr35159912b3a.54.1767385751373;
        Fri, 02 Jan 2026 12:29:11 -0800 (PST)
Received: from shankari-IdeaPad.. ([2409:40f2:2123:b1fb:b93b:b5b4:2357:c53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm41163964b3a.64.2026.01.02.12.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 12:29:10 -0800 (PST)
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
Subject: [PATCH v2 4/4] rust: types: remove temporary re-exports of ARef and AlwaysRefCounted
Date: Sat,  3 Jan 2026 01:57:14 +0530
Message-Id: <20260102202714.184223-5-shankari.ak0208@gmail.com>
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

Remove the temporary re-exports of `ARef` and `AlwaysRefCounted`
from `types.rs` now that all in-tree users have been updated to
import them directly from `sync::aref`.

These re-exports were originally added to avoid breaking the
kernel build during the transition period while call sites were
incrementally migrated. With all users updated, they are no
longer needed.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
v1 -> v2:

Re-worded the commit title to rust: types:

Link of v1: https://lore.kernel.org/all/20251123092438.182251-11-shankari.ak0208@gmail.com/

---
 rust/kernel/types.rs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 9c5e7dbf1632..4329d3c2c2e5 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -11,8 +11,6 @@
 };
 use pin_init::{PinInit, Wrapper, Zeroable};
 
-pub use crate::sync::aref::{ARef, AlwaysRefCounted};
-
 /// Used to transfer ownership to and from foreign (non-Rust) languages.
 ///
 /// Ownership is transferred from Rust to a foreign language by calling [`Self::into_foreign`] and
-- 
2.34.1

