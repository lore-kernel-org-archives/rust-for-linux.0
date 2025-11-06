Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BDF309EE7
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 12:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762430957; cv=none; b=gHkpmWybO6ODr9wsCtzV+A+599c8mVAXHim+MUNV70dUmlQuBzYdJuy3tfofUiObWwBdLUy+61IVQYTVaMOz7SOL2dAbzxtciLULUwwl1NxGy/8SrY144fXuYah4Q3X8f071zuB7Ch+5sVWqvkY06TRVAqkWbpYKaymVDnR3miA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762430957; c=relaxed/simple;
	bh=EyMMNtp0mSRcwaDDRTyBRK9QbQwJ9nF3luBLmzZgUV8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hpNpZCwXYhvyYRBhdGH9VuNeOuiHLuwrO/NYHaCBrR+2zLxDLLXTDeKx0fe7dcXfbIaLGFtfq0s0Qg5Bf9NfzaqEYvBwJXu4mGmAu3r1lVEM2ZkZh/jx7pegg5L+1ZrXQWXZNgZxsfIsqWIWo1QpjTE3MDbWJQnRqbzp89IPxUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IIMQqhTP; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IIMQqhTP"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4710d174c31so7392345e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 04:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762430953; x=1763035753; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3yuiv0vx9yyLGLEDTBN4UlwysSZbhC50Y+9LYCTdmF0=;
        b=IIMQqhTPHoCEq99MN0aN3ICpqkC20D1pIjN24wYGqxvve7zBWgILlbZlrMCp1orKqc
         UnxhDxLsoCcP6z4mlZPg9pYvnRKAfcvUFjZC/TmdlRRT9z19DQ6z/lTxIbFmDgSo8OhB
         ronGJtU0mP6VC41TSNj/iGSIZ8dnl3cVmOjk+qyyCl+r4XZnCjzF3oxACm1G429mUdDo
         YfZ01GS2zlU/Gw5YCrWgiKsv71Ph0vqmGs+WmXsq06ukJLx/jmDR7eCqIGPqgRa8zvH5
         fDpyPTKcZUJgyC+ZTbR8Sm4re4yVObeBpwRoqoiXj3KaGf/QDVPwTVgHMrjNWyaf2xYd
         5ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762430953; x=1763035753;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yuiv0vx9yyLGLEDTBN4UlwysSZbhC50Y+9LYCTdmF0=;
        b=jk1wKn2lOZYBtX7ayqvzXs8CDJiBq5KTgMbqoGDhq5ZHAwNwCNnwY6hku/E74YlHkr
         wucjp8w6dvbbLMNNwYdf2zRYtBZhfJ8IRDaD7hpx9DHNNZWTluo2y32pAla5faU8jFio
         OoOoMTyfS6nwTX5q3z11V/hW+4V2wDZUfta/aX4KtJOxLllctXuEfGVJLc7ImnxOAWrw
         fzsHsjuL8zJciO1+bkkXxR5not+u/YrAWXtti1mQiErVwizrZp90pnSGwT068SXVjsxD
         XnszefIphGc0iuQu2VTst7QIVxueYYSp+/4so9yqXxTKDGubvPyClhsxjPW/z4OLNSdk
         4Ylg==
X-Forwarded-Encrypted: i=1; AJvYcCVHYyloaAWnIYShoysu3JIYX2xN4M+xdgcbfuURiZPD65K3iuvNNsIedb5iuJzjxucXFlCFtQ3cCBN90YIjTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxt8BfbiXarXU8A13JMa0lZqZ0+3bV0UstzYPdkSEcH8tob2iL
	tOd4gLmXK0N6hDs7COCQVHQYLLvDljWjpIHFKlhBTcVFElocD9QOxIBn7ah9uQ6F45OyQJwXG7h
	Deewh9GWH0midhqwR0w==
X-Google-Smtp-Source: AGHT+IElAaFWCI339crOQYyZTbKzwIvBHBPj8kWMdaYs2aO2RGlRlbK/3kO4EQXfMe39+BRsQuh9Y8FQiiwzxy8=
X-Received: from wmof6.prod.google.com ([2002:a05:600c:44c6:b0:477:40c1:3e61])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5299:b0:475:e007:bae0 with SMTP id 5b1f17b1804b1-4775ce1610fmr51085735e9.16.1762430953730;
 Thu, 06 Nov 2025 04:09:13 -0800 (PST)
Date: Thu, 06 Nov 2025 12:09:00 +0000
In-Reply-To: <20251106-resource-phys-typedefs-v1-0-0c0edc7301ce@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251106-resource-phys-typedefs-v1-0-0c0edc7301ce@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2328; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=EyMMNtp0mSRcwaDDRTyBRK9QbQwJ9nF3luBLmzZgUV8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpDI/m8hRP7JN7T3KPKvhKnddfYjNgyza2uOyvG
 GXoq/hy16mJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaQyP5gAKCRAEWL7uWMY5
 RkwJEACMzGjkNbU7MWw7DXBuSGxCTFwsEw5B+6RiqnXNmuh8ueJRlmmso/cKtUkBkV5ouUtc2F7
 yoqVpS/PO6ZEmhxFsQcZlN8XZB+pv6bTaXp7QvdtLWd0cqh7IhAm0bgC2EngKN/Ekjih7GBKBTa
 taYdYwwI2b4MY/S/ocbaqG0Zi1lHwbR3DcwXbv63f5MMqnl95O6pRK6HMop93UNVmnNo9E5ULMS
 hvu/g03i/uBgcS9/kZSxOSQEpEbxc1tU2r3WLQT0mTk9g6atb40Wfxb9e67OfKxdxyeeYToV4gT
 xIRBzzxc0dwG9tqb1dq7fM8KE+TIaNouAZ5shf451cJjgPd8LuDZofUuhtNULsH+lUl6KRWAUGB
 R3gS/6YFlsNZ/iAsFTHLKJnWqNjqC7nklcuIQKbHv7LrvwDhFEOTBrkId4yhSCKiqVePfL5GW9R
 GEUXpzrMsP51oxDXuQPqmf0Q/uYX0cMfNLjEZKsf9d/H5R7l46fugPivXXnEs7CYw01m6q1Zui5
 8UYK9JbgeUYOs5NaUxSTWgENUXoMRnZM7z3PUcAh2aO3DUjcLD0unWzkcXdlr9Zk3E3J7vYOGUy
 33YzEp+R+Ba69BMRcjpQaugcE0LFhWMHYa82Ez+GixWr0GEAciE7IL1eyi0ZUEu9QxYnpHMJApx WVcndpXIq9DUIKQ==
X-Mailer: b4 0.14.2
Message-ID: <20251106-resource-phys-typedefs-v1-2-0c0edc7301ce@google.com>
Subject: [PATCH 2/4] rust: io: move ResourceSize to top-level io module
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Resource sizes are a general concept for dealing with physical
addresses, and not specific to the Resource type, which is just one way
to access physical addresses. Thus, move the typedef to the io module.

Still keep a re-export under resource. This avoids this commit from
being a flag-day, but I also think it's a useful re-export in general so
that you can import

	use kernel::io::resource::{Resource, ResourceSize};

instead of having to write

	use kernel::io::{
	    resource::Resource,
	    ResourceSize,
	};

in the specific cases where you need ResourceSize because you are using
the Resource type. Therefore I think it makes sense to keep this
re-export indefinitely and it is *not* intended as a temporary re-export
for migration purposes.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/io.rs          | 6 ++++++
 rust/kernel/io/resource.rs | 6 +-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index ee182b0b5452dfcc9891d46cc6cd84d0cf7cdae7..6465ea94e85d689aef1f9031a4a5cc9505b9af6e 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -13,6 +13,12 @@
 
 pub use resource::Resource;
 
+/// Resource Size type.
+///
+/// This is a type alias to either `u32` or `u64` depending on the config option
+/// `CONFIG_PHYS_ADDR_T_64BIT`, and it can be a u64 even on 32-bit architectures.
+pub type ResourceSize = bindings::resource_size_t;
+
 /// Raw representation of an MMIO region.
 ///
 /// By itself, the existence of an instance of this structure does not provide any guarantees that
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index 11b6bb9678b4e36603cc26fa2d6552c0a7e8276c..7fed41fc20307fa7ce230da4b7841743631c965e 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -12,11 +12,7 @@
 use crate::str::{CStr, CString};
 use crate::types::Opaque;
 
-/// Resource Size type.
-///
-/// This is a type alias to either `u32` or `u64` depending on the config option
-/// `CONFIG_PHYS_ADDR_T_64BIT`, and it can be a u64 even on 32-bit architectures.
-pub type ResourceSize = bindings::resource_size_t;
+pub use super::ResourceSize;
 
 /// A region allocated from a parent [`Resource`].
 ///

-- 
2.51.2.1026.g39e6a42477-goog

