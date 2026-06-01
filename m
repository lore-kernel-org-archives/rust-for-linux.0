Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489521448D5
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 01:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780278485; cv=none; b=Tve/61x1Y/IhnpxX1woMI0xurhZRB+FOExBGxW/Mpl7L1AV6v2RFEADdGxyMWBs5Ni38qzEtL4i9J0DSL4FXEXRTz/YhBrgN/RTFd8X1X9uPbKLSan4gieAXuz+5x6GreC6eE0L9or863L/Ewp5KcoDm1zKt4BqT8EX1VPOQpFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780278485; c=relaxed/simple;
	bh=WrNoHxJvvM6s001dLSGWe3dC6PRLGMD61IUwbr5AKVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e5+InIvX5XoBjq5Q0TNiJYr9YRAsmc7b7ticeWW85XfColPTh+LeutZGr6R0fWhzGG5579RqGneNirtpnI/mnqOyE91iWo9abQTwmSYQf74Az9ccHLGiMD/nTMByqhBW82/ajXxZX6piPfxIJ+ec6ZgjWTuJzsTVdIMWP8q/YWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=MauDHxzy; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="MauDHxzy"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-43b4dad80a5so6738497fac.2
        for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 18:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1780278483; x=1780883283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yml48kmcFqsVjGuwhSwxdayEWSO5y1wDWTo47bTAUpE=;
        b=MauDHxzyPtPgw7WstncirmS7iepruDC6HmNikCancFTfhf8j1kF41BiG1K6st/0LrN
         vcEttuuz7oQpjygj/xHHirkdxnPlp5W6vR60weelHAf3ZW/T6pZdZ48o7bpBur6tVUvh
         88JQLbOTspnO/kdW/wGIQe1AI0CZX61ysEJDKSMXYtZCI2e1HG5GpJTckhJujeVooC/Q
         vItrN80EaV4OTwXSkSzz/d2LhDQzIZYvMTOPsB+ZF2Oq1MfD71A4CUMwzWOyPLCwhS/c
         HCIiOtt33Dkt3JgvGsMu3iR+blWuU3VTAGv3vrFIWdvio3Q3d1O5VWvIjA3O/jqWwUqC
         dCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780278483; x=1780883283;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yml48kmcFqsVjGuwhSwxdayEWSO5y1wDWTo47bTAUpE=;
        b=sEfloqbCU1+fjqBHUUda4Og1ulaQWqaIq/xT94k30Qo+dbt0Q03S3ikMQXi8rswmSd
         A35kB2kz7ZlK4CMmsenQ/aIUmaBQKT9tCHRPT2vN+WKufpTGatjLDqJOyH+WQhNw2H4m
         eo0squ65/okm/5TxWV+hkV+pyowv3WUX3CXgUlwiS3pLgBGQOkl5YuFKSDjAY40a9dI/
         pnSha83rrEOzXDWd4QWlWjumLv31sVRa9wfscS5imKf/fQl9FDzmPj6qz2SpfQ2OFjEJ
         dv9KYWh+cCBLLXc5jVingrNq8GB3VlfZ/lAvH6LLRrfWMUopmWrTBV6rCsP7CDIW+oV0
         fMyA==
X-Forwarded-Encrypted: i=1; AFNElJ93bC6kYB/JUg2bTM+3eOsKmh/txFdPdXeJuT5TXAlVomCEJXEbdrS9hOkQDjtXTCVquz4r5ErJOoW8QbcuoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/+OePZJtUWeY/sofk5oe2w2ZcdGiZsvMm25ty7hfWWUyt7wqy
	PX6rY2TwmN/bS7OE1paiCMbhienNxxEt6Ox6ybTfnVqM0a+PhMTbSfRDR6k6NPylwlA=
X-Gm-Gg: Acq92OHC1P0ffifGQ2HyP5h8KchIdw9TbIuC8Y2kiC45EG37BTxrnjkW56mqARGH74e
	dGTAqfXgKinW+I9/1J7s860ggYLe9tLVkWXJLBgq9Ffvq/uVZMi9lsNZnj1Ij9N5HBMiXQ4LomB
	Dp1zLGOKEvGF5L7ehInOJyjdJAj3NH0SOcdhz3UMKB10GShDnEQxHzQRpHQTHJrWndp6lbOA25V
	Y6waxhH9vuC3Xz4vwc1buAnbQng1tQiN9Kf5elJOR9GRzyuSt54ogpyJ4roxt67udqYvDrnfgK9
	wKHU0uguy21HyXQHzrB2XwgSvKcFNtvuu+sPd1VPP3pih4f0tgMbBKREkRh6WI/6QtG4uODBgNk
	0xa1pCLpXFV47CBbS1jSSs6jKLrJ+CvfT4ESkFavQxAlaLRkG1F+5fVODPzuzi0CquOib3E1Lwk
	rn/+X0sAjhNyGnbksexEmZVQw1stO4s7/BkBrThucZmuWyNlwujum9VZYRjljrVUA1rw8=
X-Received: by 2002:a05:6808:1b1f:b0:479:d937:c4f4 with SMTP id 5614622812f47-485fb2ad84dmr5005420b6e.19.1780278483233;
        Sun, 31 May 2026 18:48:03 -0700 (PDT)
Received: from [127.0.0.1] ([99.196.133.55])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48605f6a38esm3494847b6e.2.2026.05.31.18.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 18:48:02 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Ren Wei <n05ec@lzu.edu.cn>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
 daniel.almeida@collabora.com, tamird@kernel.org, sunke@kylinos.cn, 
 yuantan098@gmail.com, bird@lzu.edu.cn, royenheart@gmail.com
In-Reply-To: <b70aff9a920cc42110fe5cf454c3099561863519.1780063368.git.royenheart@gmail.com>
References: <b70aff9a920cc42110fe5cf454c3099561863519.1780063368.git.royenheart@gmail.com>
Subject: Re: [PATCH rust-fixes v3 1/1] rust: block: fix GenDisk cleanup
 paths
Message-Id: <178027846532.370486.3544820081108249434.b4-ty@b4>
Date: Sun, 31 May 2026 19:47:45 -0600
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 30 May 2026 14:11:54 +0800, Ren Wei wrote:
> GenDiskBuilder::build() still has fallible work after
> __blk_mq_alloc_disk(), but its error path only recovers the
> foreign queue data. That leaks the temporary gendisk and
> request_queue until later teardown. If the caller moved the last
> Arc<TagSet<T>> into build(), the leaked queue can retain blk-mq
> state after the tag set is dropped.
> 
> [...]

Applied, thanks!

[1/1] rust: block: fix GenDisk cleanup paths
      (no commit info)

Best regards,
-- 
Jens Axboe



