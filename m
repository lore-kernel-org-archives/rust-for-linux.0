Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347080;
	b=GAOnoyH0ByNDCCptx01kRHFhkw/XWR391N8/K7/ZCuZZAE+Fs3LBifVbz/991cOQkDeM
	 6g4A/hBKqpPxRKjwgJ92RZGSMi+2XSuytTEZeiXiw5aXA91k3YUHzblARDcH17hLIt9Ct
	 ewyyISLJV6p+mYkQaaCw0Yls6pXX/pvHqDl2riPe/FOAZJtXFONwRaM6gLLUfOQLKDHJ9
	 XPwRXFyxYiz87iIaLOLoZv14wwIS86NnB6coeE1E7Vy5imkKcuwooHNit563HPw4q1yv3
	 1oYePNNnh3iJGrM/LMCvqJz2QdBfbasfxXqi1EdlV9ohfgHBo/9Y41M+DmQT5+klxzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=btT2jCwgt9ggtLpF1TehDKFcYntdtq8xlMgzuzJuKoI=;
	b=O40BU3RJl2/lY0B44u3hI6O5c271VNfBxGljXL4CcS/cIhJ++lsPDk1yI80dRnJBhekX
	 F/ZqOongzzBKdAUpvQqzCpeGMfzn6YMIWp0GQruV+KrYgWItavxM8lLc7nrOezBAVGXTD
	 y0oNllIx/eaWUwJ5NEXLUlRYwhfhjfoj1MGDyRDEHUo1t7RrKaE5bk6SyKQiNMt2RQcqy
	 VmQcIFRTmh7ZfLMMqFMe0eWOKQamt+/8ErMBfFCebi/qTp5q0svTw94hZYh8uiRqE9y8B
	 xNK/1kMtiBNDr416eHZf72zSBkENa6HOw0HhasLmfPh72nD5nT7Ol3eQ0HEprmCX7lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fireburn.co.uk;
	spf=none smtp.mailfrom=fireburn.co.uk;
	dkim=pass header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qYTgNEps;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6FA606A31C
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 07:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D6FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qYTgNEps
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so4459495e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 00:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20260707.gappssmtp.com; s=20260707; t=1793347078; x=1793951878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btT2jCwgt9ggtLpF1TehDKFcYntdtq8xlMgzuzJuKoI=;
        b=qYTgNEpsbmLGlZ/LFVGrKXt0ImCVPBw6tQd5FClNm+gXLKD44URRo2hdr4rDI6uyNh
         uZ+sBVhpFezlNlB2TIRQLdjeVzA5Xw9fx8/WnbZEo5JhHyjKE5QZK3zKeH6nbywIcH3f
         nvtL1oou5Kfg5w1bLrtJPM7X67FRA/cTDmGJ43H85KKYYE/Vt3pZjWmVa6lgCU55DVVa
         VKVuQaOl5fuT2zdt1H9DZJpMZGUYjs0lzxQAgyYeIuauPMDgBmp11T92moteSBtRbGaO
         Z0yTzCjJx+igcGXqVIVM4KiBf/d3j9xCvRdTss6orQZ23DBp6+blcwGvwTukHCvbVujk
         sLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347078; x=1793951878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=btT2jCwgt9ggtLpF1TehDKFcYntdtq8xlMgzuzJuKoI=;
        b=t5WSxg8ipFs3svgdnYCl6mVHGJY4gMehzPKUN5kR5amCkcB3rjU//rAWE5hWxPbIzl
         1fo0Ai3jyiTeuiUYN+u34jLRO7XNheUHz/qIgvAIbGv0GE98ohDM5VKo5vBHDMF5/ltG
         7Dbaj7AzYezOgFj8WjFX3UvELNsk1aN3tz7Yhs2NdNNvecfE0h+1ZMTCk1Novgn5lMmj
         J6O/5HWAP0X2TULhzfeiYENaSDA8THZhclc594i01Ym8Gx9Y9mSvE+js29ExZZA8GRr8
         iogL4iw6NgzwOHmh5taXf6rdblThGQj0xp2+ahwBlgB4xtIZXkopNfW9WezLKjbatbhx
         NxBw==
X-Gm-Message-State: AFq9FYIKJEFkGQ+FI/gSkCtjhczyaUOc4g5UgsPki+mPzqJVlWiLsNhx
	sFXmMHF2W8k1sg35MIXJmBL/FwCdZguE+CNM4KDBLcI0MkV4SYJsw0ClgGosIY2jrg==
X-Gm-Gg: AYBFou3sjw4Wz/wJf4rgKr0tEzeBlyidKQxWXhYUOt8wh2scvGCgrtHZnN5hj2fWFib
	Eeixv+Hd54QUmNqBaizyyYmIRLgOg3zaKAMfmWJyc8ii4z+ufdnkv8dOHKWn2op3hVuXAoqZ6MQ
	KHcnDKw5A55VVXnxv7MHCnEUAmhkC+8Hc3XE7cDNNuLnsTmtT0d6LG1t5hqBPvZbTJKmIkuzWrE
	QjTuFDLvKPrX13x31ibNt15Spx8PxNcnc2ZCYTzxZLeDJxoYcTnK7lKyWxgnRx+f9/nwazRBIhZ
	CkAzIoWZVrMPC5oCnsI9jTqkTrf56Il8CH9RF0dKU82pRD82ENsSx43qSUCVzQ5pYNxMDhcREXm
	aXiBLHeH5hv786aVNYXTsjW5vZq70uYwyWhefy483L7ikI0rZ/4R5SXA6J15ykDYqYaYQeaQfH4
	0i/23vJdrG58OPWOhE0ubfy1DT+EEMrJxGHp3LWEDDPHl8krXS/DG8VBVxXVLEk4EsLwkFidwRq
	Zr9XOvdt760j9KrROcXbUl0Tw4iB1K3zYEY/daoHo3EihCLjCq6xoFk3iKHG4m5lS4qESDb53md
	NnXhNO5HGsC7DqnHUnAp33cQ+YhSyP3BRqHG590pBoGPB0HjLSHzzei0Qx8OAfm12qi8lMWe1Wz
	L
X-Received: by 2002:a05:600c:4e08:b0:4a1:9c71:9f17 with SMTP id 5b1f17b1804b1-4ac17287d04mr32293475e9.9.1793347078577;
        Fri, 30 Oct 2026 00:57:58 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2950sm118250725e9.8.2026.10.30.00.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:57:57 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: FUJITA Tomonori <tomo@flapping.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org
Subject: Re: [PATCH 9/9] rust: time: add ktime_get_real_seconds
Date: Fri, 30 Oct 2026 07:57:50 +0000
Message-ID: <20261030075750.356854-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <87h5jzx5gj.fsf@t14s.mail-host-address-is-not-set>
References: 
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

On Tue, 8 Sep 2026, Andreas Hindborg wrote:
> We should represent points in time and duration of time with a single
> set of types.

On Tue, 8 Sep 2026, FUJITA Tomonori wrote:
> I could not find a user of this in the posted series, including the
> drm/vino v3 one, which looks like it uses `Instant<Monotonic>`
> everywhere.  Where can I see the code that calls this, and what does
> it do with the value?

Sorry, the user wasn't in anything I'd posted when you asked.  It's in
the drm/vino series that sits on top of this one, 7/14 in the new
posting, which I haven't sent yet

The dock has a real-time clock and the DisplayLink driver sets it during
session bring-up.  The message carries the calendar date and time in
broken-down form, so the code takes the seconds, adds a UTC offset that
comes from a module parameter, and works out year, month, day, hour,
minute, second, weekday and day of year.  That's the only use, it's read
once per bring-up and nothing is compared against it

So it's the case you described, Tomonori: the format is fixed outside
the kernel, by the dock's firmware, and what the caller wants is an i64
of seconds since the epoch.  It never gets subtracted from anything, so a
seconds based Instant would only be there to be converted straight back

I don't have a strong view on Instant<Seconds> versus the plain function.
If you two settle on the Instant, I'll respin on it, but I'd rather not
block the rest of rust-core on that, and the function is small enough to
change when the types land

Mike
