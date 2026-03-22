Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8714A273D9F
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 06:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774160651; cv=none; b=azigwVsm8YW7NWh9rpMT9AEWAGVm6D7vNL4dQ8G7OZ8US2aJsRbacvGJRdUKR36w5YWDcv1ZLkuT/PT4086bNarF3WvBGa4QEnhvY6KnL+zyd3ilo24/7JuuUb6iHmZH07/gUdYeZujyvekS8srtZT6JAH7UAFtCK19oXbuOOUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774160651; c=relaxed/simple;
	bh=d/1klNg2aFhsp6OGvAAoWYikrcXambFiOwbGCQtt8hg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ETJ1ozRB2M2c9IBjQfNb11hr1ZUjy0meBT6IUySzRoicw/qUrb8cpwb+lcLP5yuhPGrRholhHSjFT4LBuzcSkhjz57vTDBtewB54ZzKEx5EuX4LC5On1UI9RFZt/viVPsvlxPkj7BSeq5x5Se5BQo0ii8NizdiCeA3O94kP3TSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuMq3kIu; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuMq3kIu"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c107ef474fso3115749eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 23:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774160650; x=1774765450; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/1klNg2aFhsp6OGvAAoWYikrcXambFiOwbGCQtt8hg=;
        b=fuMq3kIuAknkwi5qY0ag8rYHp+wAD5mkVJRRVajiUGpE1ImJC9IeLEh4FQjZh0VuS0
         n5Trvhivm2LiLXpxTd7MAE3CRAoyN2QEwxByJ6LnHWMgjiWOGD6Db3p072pBVO6Sgu65
         eT2NBewxxhyXiVbXeLlHqclB2V25NTSFuq+Ou/TF5eBRzZ5Xu5PQAjrWJqAvXW7GNNNB
         DVV4Euo5sF+49DfcFDNJrdrqsIj9T8iCfUw6qM249sR51jDliqmxFH3zqKQNgpNkot4z
         Bdn/S7jANMk726dT/YnBGxdZAMLgU8Q1NsjFEs/YZRs+8kd3klhLalRZ9J6iy7Hp9CTs
         CFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774160650; x=1774765450;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/1klNg2aFhsp6OGvAAoWYikrcXambFiOwbGCQtt8hg=;
        b=tZCGoyrTUqDeqfsn5qBrmW+Z/Ka5zWnVnFpT6Yzd+HLoG0rfSPp3WTj6x4MektJFfK
         2cNvBuCnW4lhD05UMPd0T4qjaCvJfI7vZ5dh37kFoFVXrYEeze+GyVTAU35RL6ZxanL+
         JH7M701ZdLKhuZ8I99SO2pj8iudOYfnM4efKRGBd8+UFw46or/jCBdqTSiWsru8i1tp4
         8Hp/7x1E1LMGX3obgm+1mVzgd/geExhRtdxKuaYR3vmma04uphH5zyrD/VKEX0p5Z/qx
         8V+luwG/nWFtNIfH30rHjPlg6oIw6Ba590alnPbqdsgN80JyUoiNwzUhwzOM1delytuQ
         mePQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlzhDHqmWixkkSe1gQ/25lOgZ/LEW03KRe/CLKS2y0Fgx9xkwDniv0fA+jIRdtJF8ch/udI6aJcTI59GPfaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGl0YjBo/rRy+k/jfHbipNc1KHGQhYxq6geYnZ24nr4n5oiqnC
	5HxBilSPZfT8jWe1wW/1hzPCQvqWpi7BlUXtFxg75dagvboHl5iHgRoA
X-Gm-Gg: ATEYQzwfsmjWoUUTwgt8qYzhfsiTuFyJj4utdE4QBJCeY8MOW8QL0GByfh8rHFsCrD4
	0I5Rh9EtZg0kxgySFFaGT6humJM1rjxiqoX4iUYuNpZGv33Z4oE72kOoM2hOkVo+pjfKsxifnOy
	a0BfKD9M3Bw7EiKt9DyZ425qZte/SjX+1LYVYaiQWT0kuPxmQdw/IaWsUvMgrvB6xE7sXUiGdZB
	j25EJCPMzwGCJc8m4JFrPpvEp33n1VE2AeIRCahVqYHu0mYiN5gRptu9cVFWKRSRBxMQ6XUGjnP
	s7Y5QKjSUFmtvk1P+kQ1BbD2ZWxnSYCPjgIIZ91fa83iSpYRb+/k5axRX7GKjwgq3x8uON1hYze
	18UxN5aEU5jiUbGEgn6r5uyhQ5/l9pQAVq6LdouYc8dtnRRjPsRYTO4GwjlknN4PGCMXbs+nXG2
	3AYn4ahLElPbDOQhbmL5PEwFm65r8jHyKJ2LSFVQadw77a
X-Received: by 2002:a05:7300:e785:b0:2be:2f58:2ef5 with SMTP id 5a478bee46e88-2c1095d7861mr4599770eec.1.1774160649552;
        Sat, 21 Mar 2026 23:24:09 -0700 (PDT)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm9235890eec.29.2026.03.21.23.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 23:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 23:24:05 -0700
Message-Id: <DH93GL0U3NZO.3STS474THERXH@gmail.com>
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>,
 <aliceryhl@google.com>, <acourbot@nvidia.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>
Cc: <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/8] rust: dma: add generalized container for types
 other than slices
X-Mailer: aerc 0.21.0
References: <20260320194626.36263-1-dakr@kernel.org>
 <20260320194626.36263-3-dakr@kernel.org>
 <DH8UHISTLOA4.934370PUTLB4@gmail.com>
 <DH8WATAVCH33.19JPYBAOILCZE@garyguo.net>
In-Reply-To: <DH8WATAVCH33.19JPYBAOILCZE@garyguo.net>

On Sat Mar 21, 2026 at 5:47 PM PDT, Gary Guo wrote:
> They're going to be removed later, see https://lore.kernel.org/rust-for-l=
inux/DH87CCNRR5EC.2SK3IT6N6Q8V5@nvidia.com/T/#m30142b65bb87af64860838565c78=
4c304e02b563
Got it ! Patch LGTM !
