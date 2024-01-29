Received: from mail-lf1-f73.google.com (mail-lf1-f73.google.com [209.85.167.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0885BAC4
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706527644; cv=none; b=uOfcT1rPvn2N9O6/Q4KnsBxmqdhHACXVAV+29GP5veIrnAmaZ1b/P/LwIcVo94L8Mhc6JJ+g62vlTBOQQRITTRT3AbaY91oF1IynmKPu4y7rHToQ8/6NEIpwGVrPxdzo6myDIFHU6oJ7V6Oz377I+m+6539JCDxY5mCo+/vjhwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706527644; c=relaxed/simple;
	bh=xwbIwyGvRMWs4hBsLsCNroIDkpLYSHTMDQDhkBa8L74=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mjdcfHiiEkIBe0Zk/XMlnwhwH3ccQhlwIo9iMEWvG8TpVXqljvTJnpQGOjnMb0C7905SVJZaWw+CoVO0VPDtJ8vidS2VUuoUaRc6ojceshw+WsZySu6dvwNg0wKyNW9q5AEwvuLqtu0x/H+vVKgFzIvPFPXFekf9vw6um2GLmT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LwdkmHFi; arc=none smtp.client-ip=209.85.167.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LwdkmHFi"
Received: by mail-lf1-f73.google.com with SMTP id 2adb3069b0e04-50e55470b49so2533937e87.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 03:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706527639; x=1707132439; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ciAu2iepPPTTlz6SQhWGzKw2H9yUzcD+nhooeg1F38=;
        b=LwdkmHFijhVURdhrNdEJ1c5xHHIvZAeaejji1uxp4nr6G4j3bq6mILzLeIkLdfA8a5
         wdWmJBS/EyEh2hXxIdUmBTMgw3aylgctjiIdwaKRn7h08Y9K6f2kW/iX+u1R9k0s62Cz
         1IP+WKvj3Y2xyDpQGGASRzqyjQMVJMVNJr1gSlt/CAE1g0i2f6hoMIxlpXEdE0DBtrTl
         k3cMwqJhgnCsuDKRvvHRnjTnwIt+QEzorxBGzjihr7D+CwdLrjARvWHOosShKz1Rl90s
         T5ubd9ct+8OBbxnHz18abGs6EbQsicKP60ofMi2Z9joI4FM6KYBE+xXp0L3Q78tfMWSG
         SJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706527639; x=1707132439;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ciAu2iepPPTTlz6SQhWGzKw2H9yUzcD+nhooeg1F38=;
        b=PQ0KuicLl6Jr11tIrDBu2UDhSKn5WgIq2rgT0EnAXu7p8j3DigYmOa56Bc9KdEZRCN
         /zagimukyc82n+khFN0r8jcpQAy89dLM0mu9IllQP4WhZH0H7Fbw4qqg0W387JHFrZ8v
         AZlKX5kY8mZVuk0MM2ZURvTs5bKeZ0y1pnpiMAv+SG5NnSczJJ0muR8msftSObooZDE+
         TShYCc/8YPOj1TW8jQHDMHMd/z2RtlvgErM2uQ1JIdzbqk5Vw1DVxa/FM7bHJuRWNMK9
         0uSE8wK3LE2j97FJAGEGt/NLjdjYgJM45/+0saOR1UQ7j1VLof+3ucS/Q/qRyC1bFV0b
         Il4g==
X-Gm-Message-State: AOJu0YzCBWy1CqZZFoIMtphb35gdQEo2vybv75Fvg9dOxDRIIAjq558c
	4Em2giKdhsouDGE9PznVjC0yCwo3L0asVvyugoDxKAHC34y+Tx7sETLAVPPO9yRsX0rM99sfeNR
	ovWk0nCYksyjn2w==
X-Google-Smtp-Source: AGHT+IGyx6ysf8Ig80nYQqAqHzM3OGIcL3e1RrI9hqUxfVyQTnE3EXQAJRwyyRJWJvmMKlqGhRr8nmQnpwOj/+U=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:36c7:b0:510:ec5:132d with SMTP
 id e7-20020a05651236c700b005100ec5132dmr6293lfs.4.1706527639336; Mon, 29 Jan
 2024 03:27:19 -0800 (PST)
Date: Mon, 29 Jan 2024 11:27:13 +0000
In-Reply-To: <20240125065551.2436403-2-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240125065551.2436403-2-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240129112713.622929-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 2/2] docs: rust: Add description of Rust documentation
 test as KUnit ones
From: Alice Ryhl <aliceryhl@google.com>
To: dirk.behme@de.bosch.com
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

> Rust documentation tests are automatically converted into KUnit
> tests. The commit adding this feature
> 
> commit a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
> 
> from Miguel has a very nice commit message with a lot details
> for this. To not 'hide' that just in a commit message, pick the main
> parts of it and add it to the documentation. And add a short info
> how to enable this. While adding this, improve the structure of
> the sections.
> 
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
