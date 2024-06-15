Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C2810F7
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Jun 2024 00:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718411150; cv=none; b=VgYyL/5YBhEQsqrXbU06Nl9N0HC6RxH8Ee43MGAyAQIbqBNMGlDLp/jdAGRWHQxUJf2VhFhmf7VjWRQNnEV6y5FLOn47eFjoMJEyEU0rMPrcGWHhiaCmQKH4ccXlh/kVv4Cr3vYs4n/uiPSe1UJsNipzP4Vxp9j00kNUGsNQGfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718411150; c=relaxed/simple;
	bh=l0U3qMRsLnZY2lqgtOcYQhCI9pd+f4Bj85pMynNRZ7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pNYLhkOB98jh3s76iNzpteuMV3xMpckISZzgIrTApjXLOoLq6/fDhzBp4zAbucUYZshiPhYCjOsXzvTZkSSBQmmWQJpN3erIMws7MP36cvzz9+XPP3DVMDAMRR+8Kb1JWYfdhwD5rYeoH3VKmZKsW4jKwbeRSnRZ4qBK8xnL3Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=e4OqhDM0; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="e4OqhDM0"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c30a527479so463038a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jun 2024 17:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718411146; x=1719015946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZ1xWC5EmOpv9HIfdMEnyUpCiKtYSD98i0rZtjKhl9Q=;
        b=e4OqhDM04cVQLldVMilHNuxofkMICXCGcbdPGmMrfcSxl5H2ldrIpwIRgv/xDZDjrK
         6OfDdpZcKjYuKThc6TLgvxvB4LynsHzwjrTGOnMEHnARoX1fOELGNP7Ovip/8+PObF3t
         yVTk6EAFgTgj/hz82eazrLB18I9s+jzdALmQKAANqILz4IwE+uHEzxa9d6erMBEd+1Pl
         h1Hd3YfUG1HreQFp+trxeqcT9y0KI/cgds/PdChVwWxlSYESUk0crOT6xzE1xj/LJT61
         2QYZqS+/ANOyCRfPpZX3RVvDvjpMZ2f9Kekvj8wJGofUF5ctJNQtdSobyEbGVpHOnQ6U
         OwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718411146; x=1719015946;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZ1xWC5EmOpv9HIfdMEnyUpCiKtYSD98i0rZtjKhl9Q=;
        b=rTIpg8ldHaDmcrM2dnog3GAmrPtUgaSqVunRDl9LEMwdTmkYF134hzpDHggW2JBps+
         spYwtzqZj/dOHvf5N9UsklzcLRvoYB3fdGnZ32G3XfmI7KYfbFtYC9BexH1eOvqfE/z8
         MmoOxVFk+1ZQ1Hct1aP4TdFCKo3lx5l3Tm8ikYMNd1TrO6xjLeDG2DUKxGzgwNAs+HuP
         9on3vmIRnQfGR7l3JXp7Y2kBp3JYgj2Ct4CkaW7kxs4OkxwrFxd0aqsveCoQpGLrk7zn
         V1rMjZ3ASWNoFBmB5DPPRdJhWN5uuV1D5AiKOWXLjK1uPndtQyl0le3ZAYIXOUecPdCR
         I79A==
X-Forwarded-Encrypted: i=1; AJvYcCVepAVVu1IMRKKbgrYNR/b2S81BNNC22oZ2uMMFUKSsNsKS4bdfR92lfBeEnT+ySqEjYKCrWO2BjkYdr+hGq25HbaHLQ/vK7q5+pJEp5/0=
X-Gm-Message-State: AOJu0Yx4G4fP2ufyIMr8ItQ0XqNPljMYxMIe4OhA29bNDnxr5YwG1/2k
	7+b7e1B0PqgymJfR+I4FfzJ12s729ny8eNfu6WVAojEzj9zPpgkRyrDbtQ/5hLc=
X-Google-Smtp-Source: AGHT+IHZ9UTPYHt91tC5/5Qvaoyc7IMwpsJEF3kdU4Z0NlVDGI8Sbduufq7pAraYmmhrTrg6mthYkw==
X-Received: by 2002:a17:902:e543:b0:1f7:2dca:ea32 with SMTP id d9443c01a7336-1f862c1db23mr45192005ad.3.1718411145945;
        Fri, 14 Jun 2024 17:25:45 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee80f2sm38478875ad.175.2024.06.14.17.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 17:25:45 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: "linux-block @ vger . kernel . org" <linux-block@vger.kernel.org>, 
 Andreas Hindborg <nmi@metaspace.dk>
Cc: Christoph Hellwig <hch@lst.de>, Miguel Ojeda <ojeda@kernel.org>, 
 rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@samsung.com>, 
 Boqun Feng <boqun.feng@gmail.com>
In-Reply-To: <20240614235350.621121-1-nmi@metaspace.dk>
References: <20240614235350.621121-1-nmi@metaspace.dk>
Subject: Re: [PATCH] rust: block: do not use removed queue limit API
Message-Id: <171841114473.4596.16051114715055838099.b4-ty@kernel.dk>
Date: Fri, 14 Jun 2024 18:25:44 -0600
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0-rc0


On Sat, 15 Jun 2024 01:53:50 +0200, Andreas Hindborg wrote:
> The Rust block layer API was using the old queue limit API, which was just
> removed. Use the new API instead.
> 
> 

Applied, thanks!

[1/1] rust: block: do not use removed queue limit API
      commit: 5e3b7009f116f684ac6b93d8924506154f3b1f6d

Best regards,
-- 
Jens Axboe



