Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9192FE561
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Sep 2025 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758273189; cv=none; b=OOJU5hno38owJEKhV8cSqjhmB3ZAe/hI7IFrcgSdHdqfpcKHNWslfVG4Xk370SNHOqox00N6U67mroX42G3aS4btDmgAy2+26Uz7JM0m78FQ8Z7rGzcfbZKD3Z49r5+ZGFd9TPtXu9A1JLVgk3sOMOW2YZ+oP2MXyl/MQ2g6GbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758273189; c=relaxed/simple;
	bh=Lzovmfm5FiaEorEh9d/YkmbdKQ4FW9Q9fpLfGCU4K1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrOocfB7g2Ic+NpXS3iBntWXz+U0Wws7vhx5pqHVhHeYRMg4Of4teNflbaGXcB/TKNWfn84XhGFz5B2RsgR+gW0V/Cf4TVWe0LbChGRiRPEa83nIVs9+uUY8Yore6xiluLAV+fVQU/Eu/9zlhFmHVioxxJhhXnIg0pwrznCzBJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdbmJC25; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdbmJC25"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4b5f6ae99c3so20349151cf.1
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Sep 2025 02:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758273187; x=1758877987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kIwF6rXqWhVto9ZPqUAqlWxtbpHvuz3MRQbuOi5HJu4=;
        b=HdbmJC25TshYjud28rUPQqyU3sfKngH067nsd6b7RiZRMLUyz3SUNGdBNBmDJBjS8V
         Cg4AMRH2zIr4qwoXRLUYxMxEnteJjFkSRKzgz5Th60x6uXmijHvo3/AnVj3kmXAyHtpA
         rhcEQ+eferXCJfTFM5Jxy2apoyitg0bYSXSRWMbqtvhbpH6BGZOuhZuVR/ggMWUmuf9F
         tNgymEjhu1/SyYqBulq9R7l0ZVcZyWcPtnq9dGRy8mVzRtQK3UKzYcg0iVGnlT2WQTXr
         t01PwTWiXMoQ36zdsMpwYl/0DZ23OpvraxlnEJh4qZ2Tqx4I2ToBhYESLdXGr7bVjBMy
         0qtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758273187; x=1758877987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIwF6rXqWhVto9ZPqUAqlWxtbpHvuz3MRQbuOi5HJu4=;
        b=A7+46OkE1Dt2Q+rlhf8R4ZuvWAr28/d9YDg8TRvfDzJlXuFWxZHh0xCB1bhnZJL+k4
         OQ8t+E7OI1KbyyuIlj2+hIJPkIfB8jxvaHCvRxc/nRidILILfJzsjppCH/2PFEERRX+p
         tnoMRgucisf2NdcLfdyxumdokgGVHMrgT9N5YYJi2G5pqvcQmi4wdtvxEFlI6YfXaQaO
         Rq4FUnX2EZf5Qbm8V/yHi45fc+0TAcYapDgbDAUTBxZRVvn7BGWraPxzs6M+WlSOXqpz
         +YrDzWywQkXTWEet3aBROTcGDf5iCPrH1E9tvwGgH0yoLZOpV2MTlJnwFCEf7TzkfYP4
         TqYg==
X-Gm-Message-State: AOJu0YwsMkDdxndJUKjKA3mr1icUfyW0II+Ok+Tp0u474XbTGVGCraHt
	y3DCS+ivKW1iWMOmygymSgQMHLx+XNED3UFS/rlHT/x3iDvJYupXDoju
X-Gm-Gg: ASbGncvigWhF6fMa40xmzdrRkED+Idu/hDKfjv0PKtsEE97hJbnPrIQJW1fa4IpY15R
	QdF3bpzVBe8qhO8MPVElC/52aIsC40LFwuqLzcsxyGXnbBr7Kqn2l1D2DpxWKxyTC/ZK13dk1wf
	vB4KMWGU/AQIH8G/UyyTKf8POujKshso+k5o8zkYNQhYOFJpLJn36EpCzm7EbfSDRyLjNfCm8b7
	R+5u/KiuGWbieXuvkNZTnmKfwfAOKwHTQ6JmmhYA0mFEf4JFi/10Ppf2fy5w6azPXZ3alt/akIs
	y9B/qkvB1O65SEuCKiej8M9k/eSLW1QtAa27ouKwAxhqcfoJu5aiAnzFYUiXgUj83AHwoD7WxP0
	SeLXlW6x3UVsF2jAUc9U07H1tfIysVOsERRt/FepPYQyu751PfawLbblK+5YCL8TqGgoASljfpq
	tt+b3Cgi93Y9dS
X-Google-Smtp-Source: AGHT+IGADpUlc4d6GuGOP+3nLljBkz9sqj/QHSoZhghqe3A6PffXI/lWFd81SOfDZ9Hd2vishRWIPA==
X-Received: by 2002:ac8:5dd1:0:b0:4b4:96a8:f79c with SMTP id d75a77b69052e-4c073c99e35mr31025171cf.79.1758273186690;
        Fri, 19 Sep 2025 02:13:06 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda2c6d0c5sm26674071cf.21.2025.09.19.02.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:13:06 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id DBC8AF40066;
	Fri, 19 Sep 2025 05:13:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 19 Sep 2025 05:13:05 -0400
X-ME-Sender: <xms:oR7NaJMN8NIqYmxob3emmAK2QMQoXI8w0UgL_7fSePTA3eCwKW1RkQ>
    <xme:oR7NaBsiOK2_J3CiVO3uKdiLh9b728UehfAyglLpUQvo5f7A2EC1cF1VtJY59qJ7y
    7J9cFT8rHp0tSYcBg>
X-ME-Received: <xmr:oR7NaGUWcuZ9Fiy3wXwYhsNRVQowuvaqTIphspswsW-n7wztpQZIgg6C6zej>
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
X-ME-Proxy: <xmx:oR7NaAQu4uJyjW7e7z1Oj2ucAAiRAfL6szDlmSejkVLIWYH6jMqy8w>
    <xmx:oR7NaMIZyAaQOOwbbEN6uiT1dXxQ6TGlNt9WJMXFo00Y4WwrXscIqw>
    <xmx:oR7NaJ38miBjo4tiIWVqaTyO9madhc_aUBbrT8L5538tgPpb9Kuc7g>
    <xmx:oR7NaHIzCujDbDjjLbzXT_1WPIgnO_P51Oe8571E7o1EQg2miLHeCA>
    <xmx:oR7NaBl1ckk6cKCh5DTnvEXjyJ23FYv3bbqfDhl7VL3UWzpt5fzE6UO6>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Sep 2025 05:13:04 -0400 (EDT)
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
Subject: [PATCH 2/4] rust: lock: guard: Add T: Unpin bound to DerefMut
Date: Fri, 19 Sep 2025 11:12:39 +0200
Message-ID: <20250919091241.32138-3-boqun.feng@gmail.com>
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

A core property of pinned types is not handing a mutable reference to
the inner data in safe code, as this trivially allows that data to be
moved.

Enforce this condition by adding a bound on lock::Guard's DerefMut
implementation, so that it's only implemented for pinning-agnostic
types.

Link: https://github.com/Rust-for-Linux/linux/issues/1181
Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---

Notes:
    SubmissionLink: https://lore.kernel.org/all/20250828-lock-t-when-t-is-pinned-v2-1-b067c4b93fd6@collabora.com/

 rust/kernel/sync/lock.rs        | 5 ++++-
 rust/kernel/sync/lock/global.rs | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 27202beef90c..b482f34bf0ce 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -251,7 +251,10 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl<T: ?Sized, B: Backend> core::ops::DerefMut for Guard<'_, T, B> {
+impl<T: ?Sized, B: Backend> core::ops::DerefMut for Guard<'_, T, B>
+where
+    T: Unpin,
+{
     fn deref_mut(&mut self) -> &mut Self::Target {
         // SAFETY: The caller owns the lock, so it is safe to deref the protected data.
         unsafe { &mut *self.lock.data.get() }
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index d65f94b5caf2..38b448032799 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -106,7 +106,10 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl<B: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<B> {
+impl<B: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<B>
+where
+    B::Item: Unpin,
+{
     fn deref_mut(&mut self) -> &mut Self::Target {
         &mut self.inner
     }
-- 
2.51.0

