Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DAEC2FF;
	Thu, 19 Feb 2026 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771503625; cv=none; b=cyUqsQum0fwJQ2iJdQJYsSiLkgjqBMRCY+2xwa6oDS1BmgZpqlbsMkC6ETdtEQyX9PYtFiiczAHGF7taOJFaQS/MKm5EQRkxD/b5hpx8mn/9duw1D690swtCdMU0rjVHDdlgxYXE5joRs/GEBt3q3Gr40oD5pa2bVly700RzBks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771503625; c=relaxed/simple;
	bh=IGeC0amgR1gc0VNQCQu0UeYgxgDKjA/QuQ2DyOxKE50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYq0NEE68eM+lYSPj5uVtgIVJbgS6vFhWeAwwqSclsLsUEn4PfX3FbwRk5VrLAX3MUxyefqUqBAd39aqgCp+U3pfbKy0gxKQz8C68XL7fhZnUWBe8jbEsGHGHsPoWog5L4ndB1rhJ4aWlGsKf+BuuAMrFtf1iU2ykJqMCrjaMB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eu4qkiMA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eu4qkiMA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7AD9C4CEF7;
	Thu, 19 Feb 2026 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771503624;
	bh=IGeC0amgR1gc0VNQCQu0UeYgxgDKjA/QuQ2DyOxKE50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Eu4qkiMAkl69FEgtns475t/KPWjyT00I0PK0nrA2cZGnYuteIXMBsa4AooXRxAhBQ
	 SVJ1HATw3UI1O/PAo4XAq+AsZGPpjVWjFg92tllSW2dZjOsC8wnFOhvwsU2ucy19jo
	 //aq27MFT+QgOwEbx7wrJPuc38xYdIdJYX8g+o5vJb/MRIclHrS6/OGYhNv4Sbmw4R
	 9mNd8XGtdtLUguYt9jL8TWe9922SgqGzx7tdq3eiQ0aISKqGp+CKhDqcfwzDHbQV7O
	 ZC5TRznHjgl1fUSQ+B25qYmuqbGqCYw+gkVFfvNiKy/D8zajFKIMlLnRRz40OSyGyj
	 JB46V3mcZKSYA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 19 Feb 2026 13:20:10 +0100
Subject: [PATCH v2 2/2] rust: atomic: update documentation for `fetch_add`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-atomic-sub-v2-2-8bd99cadf26d@kernel.org>
References: <20260219-atomic-sub-v2-0-8bd99cadf26d@kernel.org>
In-Reply-To: <20260219-atomic-sub-v2-0-8bd99cadf26d@kernel.org>
To: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=IGeC0amgR1gc0VNQCQu0UeYgxgDKjA/QuQ2DyOxKE50=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBplv/7WKudRhDz04R4BwYCotLtxDz2MPotyNK1r
 bBzuzfPEa6JAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZb/+wAKCRDhuBo+eShj
 dwBCD/9IIKPAN/4/yyoekuoiEHOasx0yGcUzkdzmS8TQjE8arJsEzkzxFlvgbhgHZhtTOQ8NbAa
 gjPLhfvQBxhBLmCs8O7KdFAJ1+zpQZLNjMmZhexDK70dVk7K3YTzI4u84694XeU5nqdFIWxCA49
 qf0tde2N9/IG908niICzZDB3zeqNQ0T4paqMLB0PLRDSRa6+D5Alhbbv5Hn3vI9VEQeZJXyRaHj
 K7wBFxiGOM+PeaWLZr2ViQcaw6RVzMpNnMp5z/bJ7frv1sjfOqIalXFdFzGQcTVN4+DuffXDBgK
 cToA9gKngsjKWAMGOqV1K0wsF0NmOdvXh+4keKspAs5u2J37iJalzQWFbRAkh1M/OeWIabmnfTo
 +ZOApaDAmu6GGgKSV1kHcMWZxvV5B0ucUNlHCGiKRGeWz0t3+KQF/b4QVRwrEpnSfIImDqv8Hwf
 B7D5OOT6xaBGZOd9DKhzV0EfHgm08z0eUgfGIq+XcvFSKeGJYkl8FSYtQ5BN/6y8yJaIlb5cq4n
 SLln5Tw0999JcEQPnWHnsVadGBsnmFfxmwbSYHVHfxOwPgtategUxfiDkP/xwLoQAqEzhBGUPSJ
 RObQGI0Tz9q7DXZKgpp9mpQgkLT+IdOaY7VKd8VIyJ14q9ImGodvmrAg/huD68Ez6SzDBTPHZOE
 zpexGHazAbfMTQA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The documentation for `fetch_add` does not indicate that the original value
is returned by `fetch_add`. Update the documentation so this is clear.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/atomic.rs | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 83e03bb7ecd24..ce0ebd725d697 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -527,16 +527,15 @@ pub fn add<Rhs>(&self, v: Rhs, _: ordering::Relaxed)
     /// use kernel::sync::atomic::{Atomic, Acquire, Full, Relaxed};
     ///
     /// let x = Atomic::new(42);
-    ///
     /// assert_eq!(42, x.load(Relaxed));
-    ///
-    /// assert_eq!(54, { x.fetch_add(12, Acquire); x.load(Relaxed) });
+    /// assert_eq!(42, x.fetch_add(12, Acquire));
+    /// assert_eq!(54, x.load(Relaxed));
     ///
     /// let x = Atomic::new(42);
-    ///
     /// assert_eq!(42, x.load(Relaxed));
+    /// assert_eq!(42, x.fetch_add(12, Full));
+    /// assert_eq!(54, x.load(Relaxed));
     ///
-    /// assert_eq!(54, { x.fetch_add(12, Full); x.load(Relaxed) } );
     /// ```
     #[inline(always)]
     pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering) -> T

-- 
2.51.2


