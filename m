Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E11A302154
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Sep 2025 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758273200; cv=none; b=gUDBG6o/3bJ651fYMYwlTGfJ89G1FCv8JYiOsaVAbdTNRtVNAaKtFkldwP0WB+lAGpDDyZPyxoR7HTG44YnT++h6G5I1Cjc15dzevAO0MKFX/t37WcdJ1WWSIGlhBQIojkF+uhD1QbbJe0xG8IX/0KVK4lAdeVJILLdJTZg6qQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758273200; c=relaxed/simple;
	bh=qiImjsEzOnaVKlSA0NmMABN9A4Q0NbEvUqksJ6TQ7Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AX+ixMD0h/iH7T+SZDSVGPyAoM3Ckg6+q+x1wwLB35Q4SKeR9ZzFbXirxtvB683zASOhM4YUz5CC7mUb/wj8ESUhiqJEurlm7PkqBnmoFQu+9JFUm7yX/wH+tmKTR/5Yo38KDJ+DKCiRdLD9SIQhdeD05SMw+Nn/5SxmK5NXgg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=di82UDSw; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="di82UDSw"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-79a7d439efbso4356686d6.0
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Sep 2025 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758273198; x=1758877998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HC7c63QfQ23In6I7fvHeR2uJH3BX6Ddk3KhkxkSWOaw=;
        b=di82UDSw1Ujorkjr5j1iFvqsxFzI6TpG8UvnCWoEYTV/yi4iSgNCZrePM1tJqYQgKn
         a/gOoUYZqGWMkRY5BbIStmEFAvhVV53M7XpKOQycfQkMY79RFdSOT8uY4EZk+ncik3YP
         4pExHcCuLv0ZDf+W1lkTc0NxMq9706qW9wH1XY0f+9RlcDo5LoHVBC5Kj9X80fuJT2Rm
         lEW5TANsWIzcGemzDz/0NS5Ek7Yb4jO65988YvXWmlZtilQxT/Tz9asi5RPbZHI1r1U/
         aHTLP8+TWRC+L9WL80ocJ2drlmrNCKiyeYu9gm3HDWtPw4TzbDv1Ip/jyu3dn7GWSSoW
         /iyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758273198; x=1758877998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HC7c63QfQ23In6I7fvHeR2uJH3BX6Ddk3KhkxkSWOaw=;
        b=mCbi9Vb07YK2CPl+v7QrFU2LxPJ88Z05djZzT4ea+h4LLm8jET5ATfRNqiqglBe2tp
         MOako6BIXB+Uyw/vN/spHWXL6HImyNewzrjqNBR1pcoiUXq2ZtwDASQi6Rr6qclCMnaI
         lXQ4Cj7JRwzxtfrHosSon10XeUvy/68xaVrDKIri+TajJg/zkp6pXb7yn+xZCoFD+OTA
         0ZA0TmG1SNpxs1juHfaFVafwIQxtnDB3sm3Fsv+7Xypjvywy/emF+JejI7L/+ia8gqxU
         2FqRRxK8V74ldE5wcOVBy8g9fp6UgFih/mfzwoU+UtOgqskHYa+rQCziey+8iahrUXDe
         yp6Q==
X-Gm-Message-State: AOJu0YyxH/gdCT+nRqFrdTWT4BRwbl0LHiAbikrzRbGLCkZc+VMbvJ1d
	Xxd9vbQfKODUy1EQaR62Po00TFneEqzOud5ntQnBwI1x4xoh55lYCBl0
X-Gm-Gg: ASbGncu/m1/1Zd3N5P1bWaDtEvMNKADAtWz8SCan73oHCT1tifTe+479+0upUuoTItJ
	gKAvP6P/J07sdYegmJUht0rmxN9aaGkp3gL2rB0fOiKsMrF52gAbJOmnriCgHrs9cg6op46OquZ
	tF1jAHry4qcieQMQsm5R2mYOGhIdSwf5gKkgcrtr3IZa4CajEOZiLB4VPxjnJT1bFN+o3LgdjNJ
	x5PCuOMAsaX5H25sR1Lq6Tg0cqiSm4FjOIXtrtMsOHZn8IbkuQp8WPLqXJ4IlmKrRoEiYJg/T5I
	5V82oVWluorZHQ6hfadiLupql5JO+Ovl0RD76ZTkm22lkpqqelHkabLftMveziltlfERsizwflP
	9yo3q5v8A6M1xmQ0smtKyWXof9pcEcdAM2X1fJvgxPbOzX6f/Odtwbhn5NV+9Z+NOEZzrPZ7Qon
	a7thy5INg2EPK1
X-Google-Smtp-Source: AGHT+IFZ8F2wXi48IVZenpQOrH5DZrRMNXs/JXKEj22vTrsl2NFuYo7YHquPhCVcBtbRl/WONq7N2A==
X-Received: by 2002:ad4:5964:0:b0:768:d8cd:17e5 with SMTP id 6a1803df08f44-799197edf17mr24758906d6.40.1758273197932;
        Fri, 19 Sep 2025 02:13:17 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-79351f71705sm25966476d6.39.2025.09.19.02.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:13:17 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1E63BF40066;
	Fri, 19 Sep 2025 05:13:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 19 Sep 2025 05:13:17 -0400
X-ME-Sender: <xms:rR7NaHjsQFcs5aDTv2VXVLNdXb9_pxMP_1Bx_ndi5MAZw-05I27sMg>
    <xme:rR7NaJzHBL1KHIatq7JOzdFjN31GWe6o5KpQpTIo142PuHO4_g56NOvps8PnL098S
    1N_Fyj-nwBSzt5NKQ>
X-ME-Received: <xmr:rR7NaFJ0Mu7EIWl08DNB_-kBf6A7gzBliS93rGueFk99Csc-zSWhIJEUH0vq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegkeekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnheptedtteegjeefffeileevheeguddvleekfeeigfevgffhfeetieekgfffhfeiledv
    necuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpdhlohgtkh
    druggrthgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghe
    dtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhes
    fhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepphgvthgvrhiisehnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuth
    hrohhnihigrdguvgdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhu
    gidruggvvhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhonhhgmhgr
    nhesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:rR7NaO0ZqSAf2bLVlVfPY-9p8MKJ0n4DE0ZunMaGiFEkyJ8KzDkd9g>
    <xmx:rR7NaPfhOZWOxHWcUGv4Dh0JNMQ5I3bh7l4tAU28fgIGRB36ur__hQ>
    <xmx:rR7NaC7ZyIctnTg-ZNs7AKVz7qALDWyuyPxCsmjRG6t3BcVssH2X_A>
    <xmx:rR7NaC9jZx5ajRr_dVnJSy_lMdlyfVFKaC18LPeB2f3xVyDdBVTydA>
    <xmx:rR7NaJKWPxC0lm3eY3mVj6hWnz4-sTBchNKI7Az-4iZKZk9X1nKHGi_b>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Sep 2025 05:13:16 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@nfradead.org>,
	"Ingo Molnar" <mingo@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev,
	"Will Deacon" <will@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	alex.gaynor@gmail.com,
	"Gary Guo" <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 4/4] rust: lock: Add a Pin<&mut T> accessor
Date: Fri, 19 Sep 2025 11:12:41 +0200
Message-ID: <20250919091241.32138-5-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919091241.32138-1-boqun.feng@gmail.com>
References: <20250919091241.32138-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Almeida <daniel.almeida@collabora.com>

In order for callers to be able to access the inner T safely if T:
!Unpin, there needs to be a way to get a Pin<&mut T>. Add this accessor
and a corresponding example to tell users how it works.

This requires the pin projection functionality [1] for better ergonomic.

Link: https://github.com/Rust-for-Linux/linux/issues/1181
Link: https://lore.kernel.org/rust-for-linux/20250912174148.373530-1-lossin@kernel.org/ [1]
Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
[boqun: Apply Daniel's fix to the code example, add the reference to pin
projection patch and remove out-of-date part in the commit log]
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---

Notes:
    SubmissionLink: https://lore.kernel.org/all/20250828-lock-t-when-t-is-pinned-v2-3-b067c4b93fd6@collabora.com/

 rust/kernel/sync/lock.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 9242790d15db..cb00fdb94ffd 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -245,6 +245,31 @@ pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
 
         cb()
     }
+
+    /// Returns a pinned mutable reference to the protected data.
+    ///
+    /// The guard implements [`DerefMut`] when `T: Unpin`, so for [`Unpin`]
+    /// types [`DerefMut`] should be used instead of this function.
+    ///
+    /// [`DerefMut`]: core::ops::DerefMut
+    /// [`Unpin`]: core::marker::Unpin
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::sync::{Mutex, MutexGuard};
+    /// # use core::{pin::Pin, marker::PhantomPinned};
+    /// struct Data(PhantomPinned);
+    ///
+    /// fn example(mutex: &Mutex<Data>) {
+    ///     let mut data: MutexGuard<'_, Data> = mutex.lock();
+    ///     let mut data: Pin<&mut Data> = data.as_mut();
+    /// }
+    /// ```
+    pub fn as_mut(&mut self) -> Pin<&mut T> {
+        // SAFETY: `self.lock.data` is structurally pinned.
+        unsafe { Pin::new_unchecked(&mut *self.lock.data.get()) }
+    }
 }
 
 impl<T: ?Sized, B: Backend> core::ops::Deref for Guard<'_, T, B> {
-- 
2.51.0

