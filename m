Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ED927587D
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 03:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777347608; cv=none; b=CI4hPvYtd5HVNTmcR9RtJaftDIE1ChgJ+uFjDzFBYmztYgVZVz5psg9LDdE1uFzvNt1nz3yLJ8IikOQWiUSy23UgUxxy6CIokZ0gmBhq1I+NEjolJY7Pub85BJ1fvXJPQazQ4YcV5zjBU/lQ2ror64R6TTofiTBJfcMFhS/1cIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777347608; c=relaxed/simple;
	bh=z/QuKhDtzwSqtzrCrW2uib+i/bVCUPOrOORc5YiUnPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z4rSNwqvzFHEIpR2OYYvlZZDszt6whmBSW3unjzO8mn2IDJI5xNcM2yPA2WyoWlIDvMbLdbkFRAm/4wO76uDbeC39sKNTDqj4TyYJJ26vN8/CW+8BEl03ENtFDwd/Et4kY2N2VgXeQnmMeq5cyRQX3x2SrgpQn/KhD+0EKpUDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCk10brD; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCk10brD"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c795a47186bso4376999a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 20:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777347607; x=1777952407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0uLVlaUufS4l5Hicmv3ZtS9sDE03PgYMV+ICnQGzQ4=;
        b=hCk10brDBE6MeaTNrq3HErCoqfy+UCopEGtBzj/u/OfxQs6rgG5/suq2O5NN3aZgqd
         v1kN0AnSFx13rLZwEPY4jmXEvTEXvTajAyik3tar2YAnWD5UoodML+81iCC1xQyvzzf2
         b3oWyhlQhFE9RJB3iL8cdolWXSFcxhBF8cnzFbF9eA4ynmHYsxswfWAL7+EoPT5ZH5xv
         c5APDrAM2J/W8yqo4g/BaOltr79vtFHsYVOdUdW29gpWs/GqNB0oSIDJLSdN9lYgGvv9
         wBAS27S3ItrBmlBPon4f5vAXSkEvzqxIj0PnhqzWDoq3EetRps3KrebHy1bNTjoDgm98
         Szgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777347607; x=1777952407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X0uLVlaUufS4l5Hicmv3ZtS9sDE03PgYMV+ICnQGzQ4=;
        b=gi/SdwiED2SxQyH076VCIOF0vYq3ZfyMosxWVdRTkhNWHt8FIrszoQEB3v6MhBoS2C
         meuCfdvzPjx64lz7GpRqY/OAIuqptssLIFdpmv0SfpTaABAjtKWRJIBGTPigD2XfNtBf
         fC1riBYbybHcpTao3RbcBzx1PSEPZSqHaJI+62dyIMEH4tsgJ5t7xBAzmfaB7bZxhykZ
         45Ao/AX2Un8iSwzQ/YdBrMbat4I95Rc7IG0SnE+Lyv0Wn2PMWgBk4iHjE1aTeTVGi1Tg
         XGzzPirgmA6GeldXrmN+wiIhUYSim6Rx/jdCpnTgTXwM8qWwDeGRdKAjQSLqtb93AKOM
         Lbcg==
X-Forwarded-Encrypted: i=1; AFNElJ+CkfiMjvRNSOxijAeHFvYONFoNQLtP61yQmygsXL9dKu1IkYIo2ehf5NsCFywc9FXjvwq29YYcLwbMD+IliQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyGXzzQOjPFbAcseyB3RdgdDX6ZtdApT4Any9lcmCv2fRC7wM7
	1CRDbcpNu9tlXd8wBKr5fN9WwNtpqtk2HG3dn234vzD9fbrPWgCFPQi34LWYoCnuRcE=
X-Gm-Gg: AeBDieuoE0/GjJMXJaNO/wju9YMB0VCmyw0rwQaOIF+uLCx6liEFI6tJdCtGZVfJNNa
	pH45zB2j9kd/nGnnFo1TcittsM3flqEuHIbWAfmFSQwJye1t6l/RAGh1XuPPCo4ZMT8Nwb9f4Uy
	B+HFXUiVQcyotsgihj9t4IaHRrMq6+WhWmOTZPs4KPYTVKolF9ytuRRhJ0QwPScIPZ9M650TJrc
	nXjzIa7LmTmf3Tgr8jFUwEdyvAloTzso3XhrSHQOXL6dftc+3RVac0XFvqK4DMV/tWwL2NnS+pP
	zTYycRtjAcZ9Imn5Ri+QHikGTHLZW8cWHR0m8Ucf6nLUwWpt9szcbvKkAmggo7L4dvsiVUFrlex
	tU1Q5vpaqeXBFTtJu6J6E8NXq7T87Bgx16NGWwd9rVZdJ17VkyRJB3OsWizgSQBNwVA/XIxHb5x
	4uDI7jqOU37OEsnlWdszORgygXrVXHZZhKfT41r4T6oyPSWcmD/Jk=
X-Received: by 2002:a05:6a20:6a0f:b0:3a2:ebfc:6bfc with SMTP id adf61e73a8af0-3a39c5b7baamr1298066637.17.1777347606902;
        Mon, 27 Apr 2026 20:40:06 -0700 (PDT)
Received: from Nighthawk.localdomain ([223.178.220.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc29b1c29sm768998a12.8.2026.04.27.20.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:40:06 -0700 (PDT)
From: Sagar Taunk <sagartaunk2@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	lossin@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	a.hindborg@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagar Taunk <sagartaunk2@gmail.com>
Subject: [PATCH v2] rust: sync: atomic: clarify AtomicAdd safety comment
Date: Tue, 28 Apr 2026 09:09:35 +0530
Message-ID: <20260428033935.16875-1-sagartaunk2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427203258.22148-1-sagartaunk2@gmail.com>
References: <20260427203258.22148-1-sagartaunk2@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous safety comment for AtomicAdd was marked with a TODO
and contained a grammatically broken sentence that was difficult to
parse. Rewrite the comment to fix the grammar and clearly define the
safety contract, including what `wrapping_add` means in the context
and why `Self::Repr::Delta` may differ from `Self::Repr`.

Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>
---
 rust/kernel/sync/atomic.rs | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 9cd009d57e35..4000fff16e69 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -127,10 +127,14 @@ pub unsafe trait AtomicType: Sized + Copy {
 ///
 /// # Safety
 ///
-// TODO: Properly defines `wrapping_add` in the following comment.
-/// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
-/// any value of type `Self::Repr` obtained through transmuting a value of type `Self` to must
-/// yield a value with a bit pattern also valid for `Self`.
+/// `Self::Repr::Delta` is the type of value being added in the underlying
+/// C atomic operation, and may differ from `Self::Repr` (e.g., `i32` for 32-bit
+/// integer atomics or `isize` rather than the pointer value `*const c_void` for pointer atomics,
+/// where the C function expects a byte offset rather than the pointer itself).
+/// Thus, for any `Self::Repr` obtained by transmuting a valid `Self`,
+/// adding any `Self::Repr::Delta` value produced by `Self::rhs_into_delta()` using
+/// `wrapping_add`, where `wrapping_add` denotes addition that wraps on overflow
+/// rather than causing undefined behavior, must yield a bit pattern that is valid for `Self`.
 pub unsafe trait AtomicAdd<Rhs = Self>: AtomicType {
     /// Converts `Rhs` into the `Delta` type of the atomic implementation.
     fn rhs_into_delta(rhs: Rhs) -> <Self::Repr as AtomicImpl>::Delta;
-- 
2.54.0

