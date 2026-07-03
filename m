Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701EB2EA732
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047713; cv=none; b=U4o7lyHlqp8pReXQyW63IXBK43SNUzsPhVMXKciqaMGs4l1MnIa/rETBE2scCVYlcaFUiZR3WPrnv0FpJ/JrMephC3M0woI2c0SziR/EsggZAfdLiv8/rurBEfW4iD2avi7wzeLWiMaqNqSYQv6p4x+NPgudvuto2sk1t5nS7V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047713; c=relaxed/simple;
	bh=6n+7Xybo+4tbChhPtCG3wdCpi2v+Kw42OPefRP/D0iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hm4OS4vKI04KlFHFGZhUlHKa0o7wf74dRDiIEI12dqicJpBiDQXVvfQK1BNZVtNFM9KkazAAsVZaBKpQerb+LxEEKEx5fLSeJNhAeYnQAEmWSYnX4AIf/tuXFF1lLxepz8PRvngPp9Pc1AWlJQFZnkE0bMgCD3fCN8636UHlUjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=inJjUMoN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="inJjUMoN"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-474303f3c72so56341f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047710; x=1783652510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X0KENn743fRuXDK4+pZpz5mtbV1fUQ2ZuaqUrbUZWQ=;
        b=inJjUMoN9X6KwBHqrWd2OwZ93wOzNhzHDnioXMp3HIxOzhRU81LhspJtdiMBqqpTLH
         5vbWiwxlrECiBoZm4YDP1M/ZwqEms0tf7V0FEnDi77Iu3yJAIbOBbbyMRPSegd1BNyZc
         Bt0uAcK9UzWGsuESn1rmkzmYulHCRSiop6WKJMBjVZwAqcFnHvNbdUx2znpKz4+oLTvB
         qJ9YKehU3vhZ9M7KE/iedIDv2Kp/uEq/ZM5WJL1tetaVLv5BNJhaVhtuWTrZhE3rajCp
         AfSzwn+1fkIPfUglsHtJqkh1Cl/plrqqmyeC0YX4YZCIT2HbsxfpkG5epxzkSC1wpdJO
         B5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047710; x=1783652510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5X0KENn743fRuXDK4+pZpz5mtbV1fUQ2ZuaqUrbUZWQ=;
        b=soqHmvIbnN+4XfjC+SLI8kFxUzRW/infL9EFexnS50i031ShoaaBmceeuKYaoSpkEy
         R6RH4A/0widFhTqgp7YgLN83PmdzQfVuYbfYYrJPIavcArpkSkD8Y4nVyiI1Kdgy4QAy
         QWp7gLCuHjpSoQ1ImE8qHQRhtktfZItpzO+KbKiI1SNjqknOu/cOt7BWQkCtW5ZLGL2/
         pFE4AMg2wNb+nreBrZgnuFEcZ1jCbCRm8hACJXDCwPE1wl11x385pI3dMsmHRROJPy+m
         hcJR+Z2kbzmXe8IegJ1U+U2T/yjhhIoKLMFzdV9jYbmby8xigFVoxxx1nXSapYwxmbj/
         F4tg==
X-Gm-Message-State: AOJu0Yz6WBEA2z4bJem/X6YCj+JP8CpYDwiVmQ61UIxZOAnaDN6DuBox
	QYB8zkPMRav81L1kUqHc7iawS3u6IbGnOTrrB4tjn3ohIhTEiHelX6CUPGomWtTOiiHwIIg/umB
	NGxMbNqUd
X-Gm-Gg: AfdE7cn3rGj4U/a6XdFsAQMkQW/XfszS7LqZo+Jj3+xpCYQMmQLv+N9g0m5m2YcKC9U
	I4WNEsKe5MN0MZqFTOPVumVae+NzpMpmZKW3BiK77IJyFE9JmtT+XpMeVCMcpd0QuXCrfo9HpoA
	KoP7X5xdSGNpdPzm4f6LVY3bZ+FJCWToDrBVQ32o760nqs/iN/9Y9AoaDkh900Cev7vJPNAvev7
	XlqWUzVCmWnzkIImxVJvw8jhK0axtQ/b5NYnjll1v2TEAS8YbV1myHDEuI/BTCg1B7xhpKzkJZT
	V7paSSHCrUB+nZmdhOFbacALGItlf0wwxKj8QeE9H5rDjNxBpuzceYLjtzpa4ViiN6gj6UfH6zA
	Vj0H2m/CR/uqQkI7l3MjWwhk/KtcmEztOdGr/6GjU0CsYs3LJDs5GNZWMlxjfG2xJcT8U09FSYt
	vUeRaRPO2Q82NS5AHPhEd0Sy3RTaFaxi229QG8fJwLxL4h+OTKiDbiO2jv
X-Received: by 2002:a05:6000:4816:b0:473:f495:4a44 with SMTP id ffacd0b85a97d-47759754b7fmr12833251f8f.41.1783047709918;
        Thu, 02 Jul 2026 20:01:49 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbacbsm14466500f8f.4.2026.07.02.20.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:01:49 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 08/18] rust: drm: tyr: add the Kms associated type
Date: Fri,  3 Jul 2026 04:00:55 +0100
Message-ID: <20260703030123.2814-9-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030123.2814-1-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
 <20260703030123.2814-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm::Driver::Kms became a required associated type when the safe KMS
mode-object layer landed; tyr doesn't do KMS, so PhantomData<Self> is
the correct value (same as nova's). Base drift: this tree's tyr driver
predates that requirement.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-sonnet-5 [Claude-Code]
---
 drivers/gpu/drm/tyr/driver.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 360f57cb0bd7..a598c61162cf 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -186,6 +186,7 @@ impl drm::Driver for TyrDrmDriver {
     type File = TyrDrmFileData;
     type Object<R: drm::DeviceContext> = drm::gem::shmem::Object<BoData, R>;
     type ParentDevice<Ctx: DeviceContext> = platform::Device<Ctx>;
+    type Kms = core::marker::PhantomData<Self>;
 
     const INFO: drm::DriverInfo = INFO;
     const FEAT_RENDER: bool = true;
-- 
2.55.0

