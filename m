Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3851279C4
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 15:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729698912; cv=none; b=KYDLAwvaVHrDnA2siPolhy8MNkc0TFw4bZ0EfBHxQ3ceyGcqq/Avsv3VmyJ8aOszrloBk+8+aw3WzxIiSPYx+tHReGPUPdz6Vla3AMqw+Mb7IcX2020zyFAz8oNQBntLTcrFkbBtukjcJvPQ+L+Ifpd7WcFS/JRfkX7mdSzTXXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729698912; c=relaxed/simple;
	bh=gCVrrxKT+isLlMiY4wiXuvKGgJFDKxTVYyJ1X2rveyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sk4ciJWiEhri4/qizQGEniqn9O0WIR/SX6OV2N+nlE0WJLB6tyaaBd0kmtPXQRABosYg9v+ZCV7qEezg+1nveEIZl6D9mF4m+wCAdAGVK8sSKqQNVD5KFqU58GwVAcuV71oDa/eulmoUInOL4LfBX6RU4SscdLM3YaK0AXSlYMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbT//cFh; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbT//cFh"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e2eba31d3aso3313a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729698910; x=1730303710; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SthwcPYDScRLY7ydOspMUv3zkGtZEy+T4wKdDgX8fu8=;
        b=KbT//cFhL7Q0URJEvDeBgNib590IeDqXldl/3rT/RzLg6z66QVktS36cqMBpya4aFX
         94d9ec2B3ATJVijRnuF2teSYvTKrZj4AXl3FZ/yA78SISdO4Yl6Tu4MHh+93PmhIkfS5
         P4GLEpf1aY0+sB3JATF3TnBDk1ojf90cu6LjhBnVnxvtTPBrACDrNA3NwnqJEleM8OKT
         RTUU6SDNmH5DFjnXK7IBiU4vhrx0L3bWC61/D3FkXTpSLEa2odwnPMhU6RJN6OKYxo4Z
         kX/D9c7fyOUHOVG9MKehZkDj97pQY4ePduhzNK2/st+ZevZPIKcjrcbiU4oPY6pdS/Nb
         226w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729698910; x=1730303710;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SthwcPYDScRLY7ydOspMUv3zkGtZEy+T4wKdDgX8fu8=;
        b=qb9pXoq0AVLYRNkTz3c4eK6Au4o5yMmgnC0OVf2w9T5szfvuzA3UGDC1HtvYrVWMag
         b0wZLik/wBa4y7Lh2fUKwGE3Xv17Rc1+aXj40X4H45Ss4NRySqEBap8BNtH880a/3qEN
         C6sEIONcCK1oCfiT1+mfTQb4FpoSVBosx0zsr3YVkJ1tMyxa9JAHMZzEIaxp1aVSIOOZ
         LDSsXC1toXZHSpqlykQfN1ugwTxDBfdvZ8ZiyIJKxhinnAajrkvQmWJPbB+8JIt9NG+i
         CCG6mU6oCp0o4UhWYKCRjb3JDZiFz0gL0Wffu/5PZHPaAK+AuIhc/7jfYuQdrsREYGP4
         +Lww==
X-Gm-Message-State: AOJu0YxfC5KDhP3+PZhgzaBB0/sM1+veF/kBTSrKq4oQeN36J0VOVS1Y
	V3ytw1iXzpewMpPct9vEBKNVgpdacOuK50J5THVTe4Hl+KS1LmKbqON0MEoA
X-Google-Smtp-Source: AGHT+IFrktWK0TK6z7gC4Xrw7HumeNs98sVu5fjk4sqY5tVZbCAEB66fyteNnhbiEMXOwEkxxT6++w==
X-Received: by 2002:a17:90a:68c7:b0:2e2:e5d0:dabc with SMTP id 98e67ed59e1d1-2e76b5e71b1mr3112945a91.11.1729698909789;
        Wed, 23 Oct 2024 08:55:09 -0700 (PDT)
Received: from ohnotp ([2001:f70:860:4100:e712:ac1a:da07:2e53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76dfe0cecsm1721983a91.52.2024.10.23.08.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 08:55:09 -0700 (PDT)
Date: Thu, 24 Oct 2024 00:54:59 +0900
From: Yutaro Ohno <yutaro.ono.418@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] rust: block: fix formatting in GenDisk doc
Message-ID: <ZxkcU5yTFCagg_lX@ohnotp>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Align bullet points and improve indentation in the `Invariants` section
of the `GenDisk` struct documentation for better readability.

Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module")
Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>
---
 rust/kernel/block/mq/gen_disk.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index 708125dce96a..c6df153ebb88 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -174,9 +174,9 @@ pub fn build<T: Operations>(
 ///
 /// # Invariants
 ///
-///  - `gendisk` must always point to an initialized and valid `struct gendisk`.
-///  - `gendisk` was added to the VFS through a call to
-///     `bindings::device_add_disk`.
+/// - `gendisk` must always point to an initialized and valid `struct gendisk`.
+/// - `gendisk` was added to the VFS through a call to
+///   `bindings::device_add_disk`.
 pub struct GenDisk<T: Operations> {
     _tagset: Arc<TagSet<T>>,
     gendisk: *mut bindings::gendisk,
-- 
2.47.0

