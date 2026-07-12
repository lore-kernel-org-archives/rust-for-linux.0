Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365E9233932
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783859755; cv=none; b=NBksq1e6TjXSfsUG1DIVo5Pq3vHnhW7DV/xmY5Y67H5+A5o5OS3GL1O//BZGr76bh7lp4dXSXxWvBd3s8e5RvpJBHhrCaiR7B2J8BixcyW7FpGQI4JlLBEJMij99x6CzgwkFLbmuhKDs40zV5gBEeSKdG0pDKz9rjVSimHXWGCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783859755; c=relaxed/simple;
	bh=vbmsavjMRnQA+eomV66j+Hk7itBjYjDe+/oxr9QMvXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=up4QvV2sP0dIzljaRZhdpxzrGOcPMJ8Kc2YmT8KvDxSu9OD1+Dgk8bs9OkHwGjNt+kMAcKo3ceWJD3M38NjVGst2Sohu4/QX3Nn+8acFQbluYz08z2TRJC7Px+U5fovN7OMhghNVsKFz/z8V0ggvoo3nEZoU4Kc3Yn1XhKvzdqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTa8hEsz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTa8hEsz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f60208a5so17969075e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 05:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783859753; x=1784464553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFr7i1z8fyur2AGVEYY9/WLrL9vlCD+OnEC6ZMaETYg=;
        b=mTa8hEszFZ274aJyuOI3aegKmqIFb0feb1k8X1wQDWkqvIb7bL9PEGn5ZuZ5dMIZ7K
         75QNysPl8xDhWLtpQ+qBWoBWMs4nNUZntM6Hf2alTrrz5aCyxZfqK15tIWJEJ4v/+sZm
         uDNZW7haqy3VN3ZyWzWYMVumTqv2J6EvzkKIjZUlO4u6ZFx1qCjUPd5Si5W3png5qti1
         uzhEXWzILMFBH7+4Z2/x07GM61yDxUC+NXsFmiWUKAUjj5aPTZSV/b6u4kQ/nd5X7gWb
         ICXmgbuA3ndMslPwuEl1bfsUQtnolCoF9Z06A5THlbnPQN4VkpcYlJrNcGNiJ3d1L7UM
         DLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783859753; x=1784464553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFr7i1z8fyur2AGVEYY9/WLrL9vlCD+OnEC6ZMaETYg=;
        b=pJ1Pd/PVPJnUE3JwgVM6MZdslagJLZJfRjLb+fbo3NdgPxFut2PSp8gjpoT+2Rkh4w
         TjuJ59kZO6lRd8UMHH7eKiskEs2Se1ZESpcQKxJvd6ki3lk9q/ZBnrxp8KoXiFdA+nZD
         Z1twPBnrQ49c31buxKYKfkR40BUZdl3j7kRTCoV/PP3289hS3KK65G5ea4s1n5Qbm8yd
         MZakoXY9fn0rfkp8k8ZoB5ESPKTlgj1ox5vWMHbx9AT3XCZul4yiFgiDPtqFAk3Zbezj
         CFxJZ7s6xWl/VMrv+hr6ACiBMk6a0X9FUzfpwGf1cIcr1zZspb/E9DVtzKQyBpKPGpYe
         zTjw==
X-Gm-Message-State: AOJu0Yz9vOoDUe4xenrNPNFAvod3m086BbGzphwAZ5ZyFLtZJMT1d69B
	zbjHlBcy1nHzgKmYeO5mZoaG9nWQBGtQWfhG/6OOA2S/oa5X6iACdOmu
X-Gm-Gg: AfdE7cm4rrBw6Cg60rALWxLQdYadMu690c0osqflg2ujFB1f7DpdPRRFM54mjdRU4+N
	XKaCgkCHtCC5+2azEteZc+zCjNVPnNyicUSo7XQewgeTMLgohk9zw3BF1Oo7pImrTq+brLJalG8
	Y75mW2Hx0nfNPq09bCq06SAEVS4195xrkNcJF1MNXKIlKVdqhWdEDgm+eVMJ9tdqPO57xbPkDcN
	s6JP8jKBHT8T0ScWWIJgFGr5wHvk8jVlX953/gAZ+HQFr/13RbmWbZRKkdq7i5tV+QyhF5y30MT
	QvrWeI4n2z4R9Ztimh17Gf9ZIJOJak8UlxqkqDR8cSlcu0UEqKtEjf8WDmXAATqaRgy5HP7LeqA
	nGCOEyUHdzVIGCjdFgAh7sRDW9qz16msuxqKZSppa5Ydod97DSVAUkQtHI/GTngfqf0iqHJLQom
	dqiDp6ienYPL/rEM5/VJyE1FduDAAxRQ==
X-Received: by 2002:a05:600c:190c:b0:493:b91c:6bf with SMTP id 5b1f17b1804b1-493f8818dedmr55304095e9.18.1783859752393;
        Sun, 12 Jul 2026 05:35:52 -0700 (PDT)
Received: from fedora-dell-ale.Home ([2a0e:424:a465:0:bdde:db24:d709:ef36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm76497317f8f.11.2026.07.12.05.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:35:52 -0700 (PDT)
From: Alessio Maroni <alessiomaroni0@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk,
	ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: fs, hrtimer: replace read_volatile workarounds with atomic_load
Date: Sun, 12 Jul 2026 14:34:43 +0200
Message-ID: <20260712123502.2829-1-alessiomaroni0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712121420.25179-1-alessiomaroni0@gmail.com>
References: <20260712121420.25179-1-alessiomaroni0@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please disregard this patch. 

As pointed out by the Sashiko AI review, using `atomic_load` here
introduces critical alignment issues on 32-bit platforms for ktime_t
and violates the safety contract regarding concurrent non-atomic stores
on the C side.

We definitely need a proper `read_once` abstraction in Rust before 
handling these cases. Sorry for the noise!

Best regards,
Alessio
