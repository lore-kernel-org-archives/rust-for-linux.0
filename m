Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFD361FFE
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 04:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767070237; cv=none; b=dqVYb+BvKqdyj0OoLuLTpF9eBB0WdL0Gijo2XTmERABpacsQbOjkxcZUDqwpPBXgodF2V3K02TrRPtbXyjOGPxqwpae/Kl+li3geF3+EAOQKC7apPs9aNP11WTe78TMUlUhNkQmiaTPRIG+o3A4OFlCDfFytTPykwvhAZfG576w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767070237; c=relaxed/simple;
	bh=xissyskG0qR90M0G1WwgAZAozu2LoD5LNaS70ZDa83U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QvuCcEJS68jqZlqaS85UVlFhhd4BKpV0KDHSZQMjhjMQLSo5Alrf1Ic6wQgn/f5/hoFJbXcqjEyrpxvCYOzx+H7OhR1CobdViR/fVbyUu0nX/WH8PtFqOKgsxOYJKhFL6iOmNctJVKojDRqarlCRc+GX+HJDlX9HvokBLd15wEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPkMx5Gs; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPkMx5Gs"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso10403859b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 20:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767070235; x=1767675035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Qr+4ta4/jYgKWvFgnJT7af5StHuT6GQN0B6K9K9dWg=;
        b=aPkMx5GsIJPXUE38147xqS3EJmAhxtx5BCF3ai4bEWG6ZJde4pobX95nC9wk71fb9T
         if/af+5KM+UvSSoz0gKnIMBb0F7pnwIIQ35vacXTah7NzLNULl5OtLMTANFQv9LZqPKU
         SpTrc8hwy/7xlFmS/q7eLtJqk0f+QIWfQqcXQ1Y8kSOHpmo0pH7XRQCeFIUFwrtx9QSx
         AUDBXFdXLm1fUXkFk5SaDuD/W7QVRTkGYMOLW5Vv1HgiWa93cIAzhklJVjQZ9DhI2tAj
         +l3ms52ssQyBFTYu14A4hmFsBRURLRMEkWzh+QSvbzD3ePrJrMvrdoqwTe3XCZlMH0ie
         T3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767070235; x=1767675035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Qr+4ta4/jYgKWvFgnJT7af5StHuT6GQN0B6K9K9dWg=;
        b=d7pS43RIh5CgmyUY5gzsih9rrX0OsxynMSDpVtTPA3YM/E5JmR224nuPPH1bsGsijy
         kwbYUvwX8zzx+x242PY20Z+hHdeUh4Y+MKZmfPIbgsDP4X9XEGsPbEt5efy5+aLyJWIa
         QOGAgchK5TR6q3MtGPC1lMy8dcx2fRqvgkYV1uPPsgQjtSJKGi66ad7RRpJ94SaC4wk/
         oImQP+bKSzajdPYV4jddk/LPXsrPHSV0n6uP8kJX6AuKnPZB3r5uFcz8Hw1w95MegaL3
         02MdePntp+rdIw7OwyPf0BFv3USROWQJGK9AzVUtmEJIlDQGWOksNCVbIG/pqhcRMFzv
         BFfg==
X-Forwarded-Encrypted: i=1; AJvYcCVVLrhLrNKW+BCy3zObzbxdHLScCBijXeIFeQxVaztk0EhNtP3zJlaGyMc/pRwvRVKl5zgFPmfWh0oUv/YUng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq3BMYnHIKVR2/THGSEtt68/t2ZrbUTVML79NB771LNeL3+CMO
	BpRDBrqdBC4VOVt00kt5x7gtRpFPKNhtlWcbFLI8yu/ZE4Io6Tjjt38gw1cT7A==
X-Gm-Gg: AY/fxX63XVmrxLFCtDHaGXgOdFV+kDOqo5Xouxv5WceyoN/z+zba8kgd96EIkp/SlIy
	7ZnMHWnHCxe/oZ4NpmUQAYaWlaqX/P/1agfBZ4jNdoZf1zGU2KDXoiwtIQq0aJ5wP6bURYTUCYC
	v+TTIFyC6fHfKLEnmoTpL0+oWDyq9OexbMxDp5feGePGB3sy8JDjGIS7UCgfFRjB/pEjYn+a00e
	Ljmg9tolcPnlKq9K/GG6/cFy8re+w+AjK0kyvI1cwtKp6c5326VRJwyCoz+f4cNX3a4hp80mtfB
	be53QsaiIrSjPzvcF/O3xowvKJzbj4+c9B+q+1cKAE9pR5bA6wbtADHK7IRBeJVMufzbbPHN52H
	LLBROOI7/+qTytWXBsOFdFgXn3SQHQ94KGn/1zW5VMDjhSjAMjQVuWcZUa1R/jRdiEI2BlWzML4
	tgtcW1rNVfnQ/FPfhDEqWIiAXc1ISUh8B9G1sZIGu5auGe+AXhfIdhrInW4+8nQw==
X-Google-Smtp-Source: AGHT+IHZwqw7WI0eDteGJtVMDgY/WJufMm18cyPwTl5Ld8U0NeYz2hCd2aF5Y/zSFAWmeqs1ibz72w==
X-Received: by 2002:a05:6a00:4298:b0:7a2:8529:259 with SMTP id d2e1a72fcca58-7ff650c7d8dmr27613478b3a.9.1767070235487;
        Mon, 29 Dec 2025 20:50:35 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa328basm31100194b3a.11.2025.12.29.20.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 20:50:35 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v1 0/2] Add atomic bool support
Date: Tue, 30 Dec 2025 13:50:26 +0900
Message-ID: <20251230045028.1773445-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This adds `bool` support to the Rust LKMM atomics.

Rust specifies that `bool` has size 1 and alignment 1 [1], so it can
be represented using an `i8` backing type.

Since `bool` only permits the bit patterns 0x00 and 0x01, the first
patch also documents an additional safety preconditions for unsafe
`Atomic::<T>::from_ptr`.

`from_ptr()` exists to operate on C-side storage so I don't think it
makes sense for bool. We could restrict from_ptr() via a marker trait.

[1] https://doc.rust-lang.org/reference/types/boolean.html


FUJITA Tomonori (2):
  rust: sync: atomic: Add atomic bool support via i8 representation
  rust: sync: atomic: Add atomic bool tests

 rust/kernel/sync/atomic.rs           |  1 +
 rust/kernel/sync/atomic/internal.rs  |  8 ++++++++
 rust/kernel/sync/atomic/predefine.rs | 27 +++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)

base-commit: 13ade169e801a423bc1a5a5c3c6ac680a144a608
-- 
2.43.0

