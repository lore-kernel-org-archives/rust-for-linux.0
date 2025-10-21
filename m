Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C27333430
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053604; cv=none; b=dRuK4sHZisrnN8mNURWYzehx/fG7TkPPSblMUoiFbGs0DB2IYTFWCQW/7+JURoiNuMCzRhSguwPhgHe0gilwdfEttem9vtz54VVpsVqoih1Z1Z2w0GpxnUslyNKq52n4gNFKhBTr32tlLJ1q4n9scyxABKqG4oxqpoObeIW2tzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053604; c=relaxed/simple;
	bh=Jb0vnnnhfxGrNucsxP5BNXkOEu1a4p48ToRxxUSpaQE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kl1vz0txuh5w843C5WN3ztzh4827zZMSWNNqxvHqUET4m22LAuroRFfUg1iVHvGundWN1AT4XKTuTk3ctnwT2Z/lWvjSk2QsYZncy+30c/qhjcRCr8w85Mlu3Wze8dNtmbz5xMhFovdPmfAUuYtqUtIjua1Iq+pvL/JGfmlGsPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FVDD/WG3; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FVDD/WG3"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-63c41bc2dfcso4034977a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761053596; x=1761658396; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fWdXzd7QdxlhFuF65XkScJdJM4lE4siYSCj2mHt57X8=;
        b=FVDD/WG3UVOYCxRlX6VYpRZLwtGSb8GfnQTC77vw7gAiOr0ZE928l4ukPvn2WiTTJQ
         cpgnqLpojx1CL5MIyhEryI0NUz7j3da4BrjF28f04bCXV7DWpjxMiEOOyp94i/Xsf6a7
         Kb8yK+mWu4eLtLP8UQbH5DHEXrClSC/XwcJkme/I0RvRiCbIjDyxfIGbGj9Q1IcOmwru
         5EcWYDysuFp/h6lHD/cek0QoPQ47QavNBWcqtngmDi8lwWP7iZva/MG3+U5u6ZNpoWt3
         4EndkKiV652XUy0XJY27LHsXxyMNML4ldCTTlLNSqew7T+Kvm2GuGTh6rUQjqPidhydn
         2ABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053596; x=1761658396;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWdXzd7QdxlhFuF65XkScJdJM4lE4siYSCj2mHt57X8=;
        b=YhpwCLhV+6fw0bTlCQ5d4uQw3XHTOO0wdoVEzNEye0FZmVOTGpMp1QO7eSdOTHQ7BS
         3IkCr14f42ymx+2D7nWeha4EvDz7/OFRYIesjvVzpL2Mc/d9I7ZDNMoUcnnkoYXp4TFW
         YnAuw2IKTU5es/nkJGIYm/sXrnKQwDZT3dSqAGrPQxDZsAuFdWLdXeh/5da/rHc1AyCd
         s3U9nDvXEgj7b1Vu46/IRQZ1yLwDOnNpo63CgIekx4uKPSsz8RCTn2Z43LK5jW6scJin
         G4hFJrR7P5wERUDB+9PfihsB6G/xbnwdzZ4ECz41zWr4R7n5IEsmr+jc6IpBjVsSKnjV
         MKwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD3upWTOL8Flis+NgtO6mQsRpfZJlCDNxMIyxzirfUPhXm8BzMa61hem8859WdOWSz/VjFzjcyPv8o+ENDsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyccXu2HgUOLawH2MfIVfKdum+8M98Bs3k4lxF8Q6Mbw0Lc3+ra
	LigB0b5h8GoefeouG0XVW6pK5CJURAEBhFMWakT9CJq8XCHb2DSwsxXjbinim2nMCtqOjxpaGwx
	bJ3ORBHiBbTpmgRcYGw==
X-Google-Smtp-Source: AGHT+IHnChQ6BjR2arpBtBJOLhvxyTqTIy9o0xi+8HCMJp18jJNKb80TyCIs9FpjfcNIp//pfUno9FHoyjIxuRY=
X-Received: from edp13.prod.google.com ([2002:a05:6402:438d:b0:63b:fc78:ee0b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4304:b0:63b:efe5:f2b7 with SMTP id 4fb4d7f45d1cf-63c1f64fe10mr15861453a12.12.1761053596442;
 Tue, 21 Oct 2025 06:33:16 -0700 (PDT)
Date: Tue, 21 Oct 2025 13:32:45 +0000
In-Reply-To: <20251021-binder-bitmap-v2-0-e652d172c62b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251021-binder-bitmap-v2-0-e652d172c62b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Jb0vnnnhfxGrNucsxP5BNXkOEu1a4p48ToRxxUSpaQE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo94uXf7oRZ5UX3A/HLX+AvAd8Ta5lw6EyeZra0
 9Es5As7BCGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaPeLlwAKCRAEWL7uWMY5
 RsKREACpPZ/o7balEXqMDR0XFVp4wneltDDlP1/DDR0s7ishyKE2qzshZyKITzWKIEHRd83NNq+
 PwX0oPUmFBec6h/0bzBk+/2u0+pVQehFqJfRv8TRimsgNYx3OLTZFUzWOu+pCcpFx/sDOJhG2ob
 K1EjJJ1K1VPbfL+d3Bnhnr0wzXF+SzH817HhvWsbwCpK61Dks+/WEuEvh8xoVoJJiyJf2Cs1AB8
 EEV3Oxo0GP9YtwiR6OrlolcvrXGgmO1QToJSEaM+mIkZIiQloF6KS8p4D45jSIGW5ixp18db1Pa
 zc5UsNgW9tFjorDHL2FUFJ/KSBx83EmRzxHGCGNa3XUqvzwtnPep5E2tTVWpCGyS/sMKOOsvSf5
 opKtOJ1f/WBROoDzb4UZJkTK6XKztUCj7UyUMKPkwmTu27AbOTBjq2dllkdSG03tazlGqZZSCoj
 +we0byKKCcoIuYnbE+GV8B6FkfAl6m60sy9LuCqg5ckRCeSFdqft23hZgcdiPu/eFXIvmAOu6vE
 LjUFcHrzLO4r3zr8ru9VdNzNtvXxlvnYWE1QWwoWmYLWhduPNLRqvI4D7al3bDMhf6bkmP5j0oQ
 Mi5a+RKsPQvYajLMuL4LWuBzvsYYNfcmbYIy90Rc7eQkYgMa8WBcUIT09p+9qbTWJFIF/xllzvH exiRJ375cRmEEXg==
X-Mailer: b4 0.14.2
Message-ID: <20251021-binder-bitmap-v2-3-e652d172c62b@google.com>
Subject: [PATCH v2 3/5] rust: id_pool: do not supply starting capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When creating the initial IdPool, Rust Binder simply wants the largest
value that does not allocate. Having to handle allocating error failures
that cannot happen is inconvenient, so make the constructor infallible
by removing the size argument.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/id_pool.rs | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
index a41a3404213ca92d53b14c80101afff6ac8c416e..126e57f34c3407cb1dab3169417f01917e172dee 100644
--- a/rust/kernel/id_pool.rs
+++ b/rust/kernel/id_pool.rs
@@ -96,16 +96,11 @@ pub fn realloc(&self, flags: Flags) -> Result<PoolResizer, AllocError> {
 
 impl IdPool {
     /// Constructs a new [`IdPool`].
-    ///
-    /// A capacity below [`BITS_PER_LONG`] is adjusted to
-    /// [`BITS_PER_LONG`].
-    ///
-    /// [`BITS_PER_LONG`]: srctree/include/asm-generic/bitsperlong.h
     #[inline]
-    pub fn new(num_ids: usize, flags: Flags) -> Result<Self, AllocError> {
-        let num_ids = core::cmp::max(num_ids, BITS_PER_LONG);
-        let map = BitmapVec::new(num_ids, flags)?;
-        Ok(Self { map })
+    pub fn new() -> Self {
+        Self {
+            map: BitmapVec::new_small(),
+        }
     }
 
     /// Returns how many IDs this pool can currently have.
@@ -224,3 +219,10 @@ pub fn release_id(&mut self, id: usize) {
         self.map.clear_bit(id);
     }
 }
+
+impl Default for IdPool {
+    #[inline]
+    fn default() -> Self {
+        Self::new()
+    }
+}

-- 
2.51.0.869.ge66316f041-goog

