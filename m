Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268456;
	b=BYjAFpIHJesYrrEIuJJXh5Pkhszf2sPVEZNC5RZRyMKxkWbfGqh4P1JQuYqcWJyDqvtt
	 pT68Xn8kELJdzq96A52Arqw8KvGgLujqUMQzfIbRHAySh7ADUQFURACAa/lYqBtEguSy4
	 RP02ibkWonIQpozvdKxTPOHhLEO/n3aiYf+V+xtocfs7oUheR1GKGcunv6xWwl/jQ+7qL
	 hthoJ3agnS+Yr1BqI0nmyZHjsivnArzvNbe68I6c1hx7aJEFoKxTFKc0+7WW3V23AzvKf
	 Oqrn43E6f1+wtRdfiwj6ZnUHQYvIaVmW6sc5T4I7a0p2iXEpdNgmFla2zij3zJwOCNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2pI/j71t4VuCaLXQJYxfTinJklKy3KjSKz/+nzofH0A=;
	b=Bq3ZkiUBVCnQbNwPpjuFATHeKyipyHKqxkV+eAzmc1qvsmay0vy7WlJs9XaPjKWGjMpm
	 R1MUcRWs2MsoCpzj/uSWhiV9wRw8KEEPjGc15zSezGOaIzCxBKv7ElTYEY3KnfzoT9PNE
	 XGrJw7iTmf1eAnNwaldCbEYMuH8tL/+jD2//ggque6Mp0Nf7AAYPmcL/SuR4mUlpBwO8+
	 khhFVem4jNKThG9/v6TAEs63B44C9iLfGzlDWHRJupMT0lNJV7TAMZrotf+/notbhWI8e
	 jh63usRxBvoE6S4wP5WjdZUJeo/dK9JnmCQTAZ5f7jKx+CY3yHI5daVTDg7ZICQNoqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fireburn.co.uk;
	spf=none smtp.mailfrom=fireburn.co.uk;
	dkim=pass header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=N39LkpF4;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055FD606A31D
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 10:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 055FD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=N39LkpF4
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso15822285e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 03:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20260707.gappssmtp.com; s=20260707; t=1793268452; x=1793873252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pI/j71t4VuCaLXQJYxfTinJklKy3KjSKz/+nzofH0A=;
        b=N39LkpF4plrPg0Obd2SDQHqZDbH1N/plfK8Z4waFl06uhEx/mPRo1bMz2Iy0PUEEkq
         bRHoiAPI3uVCv/t1Hr506HXglkhKmiRwwYik2zjiXRwthNUNy2b3iSlP9bO14+f00W4p
         WyNqwLLyOMQhapQa+piUIp/eedHDjD4w9EE4QBOPNFir0TQN1LOoqQVywW2FWTl3f9hI
         XVjoNUb8m54Jsjy9pOnhDlxs0JD1QwYk2RVf5a4im8u6eiqQUjqPmEReLoIZzlVCpszx
         SPy+kZBGyh49WJd8XIbuYiCxOASRW8j3anS3qp+/VYPG4ZoZBFWHtZ7nb7DtDhKvJpn9
         XqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268452; x=1793873252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pI/j71t4VuCaLXQJYxfTinJklKy3KjSKz/+nzofH0A=;
        b=D2oUjdiLt6VrGOASyO83mwY85/SkWgt4diQyWharRT8QNoGxGoFEISyQFTJngSB36F
         hTZdCBIT/GsJQZ9aJbtfH6+Qhgx73SVR/UBjpd0qyYqDgpAEqtmM6ppy3vzVZdCejWeV
         BM742IFgOAxR/g17rtav0FE74H7rb5Vm5ZmcdEcx5igDbxwopig/2XUuOLZXFGgUvcQF
         N45Z+rCwNk9UJwQCAKZr+FBC20/fjmAQ6OX1yTxEwqMseGZmdBAWqwo1EqvCOHDVTpOm
         I4JbgYcHG3N3A5Ax/5GGGeaeoJQtQmrFfj4A1ELUtu/gJ/u5Sse5HQOvgEjKMmm4cRog
         BsmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwSJf22lUc6PkWK4YUj5kCKoT2/po9CDhYk64YVEm7LEF1/759XZofztPsp5DyILYzvpck/sMkLJs8fCovrQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK8VgYWN1T469rMlVW5eMsYzVhDglEfYKlJSyTjXFHtFkitli5p
	USXBFGcYEjF92kmLzDx0gLUT3UWjvWZLDe/YbZN/cb4BJHIDA17fLCqTReJUfyjJgA==
X-Gm-Gg: AYBFou0MYgnu+xpTwgJ93ZNZb+HoILz4YLzGwR2vC7D+Be4hVnkln6SmgK58M+A7tGX
	2lDVmXq/ELeiwxbUDo5AZRT5Q8ghiQaL8p7VsgmvUtzhanuJeZ+xwdtG1i1TPzZLEqqwgwyzqz+
	uEO2ZJfDMKT4DrSrmQNMUmG5UDiDig+JcV3rRb28li3ZQYLzl4tIa26yvNUd5SajvJzk5DbM38S
	O8dH+QMlngwU9Jr3xxz9d0zg7B6ZRAhFdE33r0TICgi1evzZhM/7Hm6wnIMO3uCz8Lssov5Z2li
	xtBfdt9Vjg0obdOTqZSeLVCVQDx+3AepENJyLRnJZrnhwG7AfNq9cFZit6uZem2muzher6R5ig/
	zwa3bN1veC0AYFXj2rfMzTWHcsIx6U58TYyGjHhLjYynnrMYxqgP69EZV7bkhDG9cBE83E8dnkq
	CUXpR0ClTIEY0FCxsYHavyPo8Qs6PC2j2WGcti6JsLt8agRuUAyWORwG6zwnmOUfa57/tcANiIz
	Vo6b7C7J/MnR5ZcMsozs8rnOG3y29ysXuGyxIVYk7KIBkJNLyLNGTy4pxkeDqAd7wPRp8dbVhFB
	0hXce+14xI3+JdHoKOLthxU+fnLzDGy7WJBRq1qakPdisWBfOVBb7TMw8ReE66U99ODqOD9Hmu+
	OK2NKg6TQonW1vIQce1WHzA==
X-Received: by 2002:a05:600c:3146:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4a96552d0b9mr101086605e9.0.1793268452134;
        Thu, 29 Oct 2026 03:07:32 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm11425165e9.12.2026.10.29.03.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:07:30 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: Danilo Krummrich <dakr@kernel.org>,
	linux-usb@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	gregkh@linuxfoundation.org,
	oneukum@suse.com,
	stern@rowland.harvard.edu
Subject: Re: [PATCH v3 0/5] rust: usb: host-side abstractions for a bulk-endpoint driver
Date: Thu, 29 Oct 2026 10:07:23 +0000
Message-ID: <20261029100723.4160932-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <DKZ34IA4DZAF.16BWFH4JPGROV@kernel.org>
References: <DKZ34IA4DZAF.16BWFH4JPGROV@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending, the first copy went out as HTML and the lists will have dropped it

On Wed, 26 Aug 2026, Danilo Krummrich wrote:
> Well, Alan also said this:
>
> "At first I thought that we ought to have such a guarantee. But in fact
> we don't, because the user can at any time write to a USB device's
> bConfigurationValue sysfs attribute even if the device isn't bound to a
> driver."

You're right, and the cover letter was wrong to lean on it. I took "an unconfigured device has no interfaces" as an invariant and it isn't one

What the series relies on is narrower. Changing the configuration destroys the old interfaces, which unbinds their drivers first, so nobody can be holding an Interface<Bound> while the device is unconfigured. The unbind comes before the change, not as a result of the device staying configured. I'll say that in the v4 cover instead

> On an abstract level a USB interface is a device that is operated by
> some driver [...] there is no layering violation in shortening
> intf.device().bulk_send() to intf.bulk_send()

Fair, and I overcorrected by dropping the patch outright. Io already borrows the interface and carries the transfer methods, so it's most of the way to your IoDevice<'a>. For v4 I'll make it that, so no I/O path hands out a usb::Device<Bound>, and keep usb::Device public for the calls that really are device level, like set_interface()

On IoWindow, my question in the 1/5 thread is still open: can the lifetime and higher-ranked machinery express a window that closes and reopens within one bind? Suspend/resume and pre_reset/post_reset need that. I don't want to hold v4 for it, so unless you tell me it can, v4 will carry IoWindow with the Devres comparison dealt with in the commit message, and I'll rework it if you point me at the right primitive

Gary is also right about release_driver(). It's gone from v4 and remove_all won't be coming back through this series

Thanks,
Mike
