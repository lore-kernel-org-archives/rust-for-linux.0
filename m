Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ACE1EE7C6
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879399; cv=none; b=uXJ8QFFvPx3SF63WIiRxV5y64sLwwbpGhKgDtZxnnG3wHNvE/NQE10YFWYdLMeSNrdNHwynoFshK6o7u3Z1hJ8nbKbV5ozMI1d1oO/8A0BEiivz69TaPlOJQHl7u7pkl8rin7CGEjMBmX30DnwLXxx5UU5Wdfd1OLz/dSQw92/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879399; c=relaxed/simple;
	bh=hYZzk/qulSxWaTC/5mYyqc84xO+e/vN/svymz2EFLgk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=qmktVYEN9lAsTmWfSmSmRAmfuVI0qXpHMToq4gFzkict6P1t+2HiYpcvlqjCdU1e7jnFLUh1UcpD/VFDs4Ekj0Zey9HMGjkm0hp4tx6o+lyffR2nKy4DZpCEWcX5C8Ltfd4vxnzFOnow95VYKtzo/pC41om/ic0/6Eca7Ab40pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dETA1Yp2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dETA1Yp2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so18154745e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 05:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767879396; x=1768484196; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYZzk/qulSxWaTC/5mYyqc84xO+e/vN/svymz2EFLgk=;
        b=dETA1Yp24tO7FZ+tQZBsTLTtlWn3aQhQyeEJXWv3yhgOYiuW7EuoWizZKB0337Feqh
         GvMih9FsqLhapq5ER+tqri/lmBmwGwsohkuoQZSqdCfz55elp5syHn7iuVvpgN+F6qhn
         PcdpWFG4S/MdjIIGaGgtJwb6lPHuImHV3QerrWixlksBUpjjghPlLSdrARELPrDgVBo6
         D7R3wFi56AAv+COeGGkPfu5gtm39BLCCsvbhT4/0UT2y3d3PJ+/PmZ7SpCUaab7/EoSF
         Ht9JaEP8Me6Zld16GdxzPN8EjTVj9ZeIsUlrl7FBvNa+jYW2bmCg+RAq8S62/Cc0aq8m
         aZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879396; x=1768484196;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hYZzk/qulSxWaTC/5mYyqc84xO+e/vN/svymz2EFLgk=;
        b=GaPy3qlEx3XB6s9PgDKx4xdVMYK3C+kCJIm89IzPGC+cu9PxejfSgc38YutnqAVZv4
         Yj5U5IdTRGN/3uf3S7fGmu8pCG6MaXJ96+/0lcH8OMC6/mr9/P4NdZD33KpQy8H6gg3P
         PWlAYJPi0QmScRSCxM2V8clmMtPG/Do/piOEAczWN53bcewBMGDQtbwXOJy7Yl+Hhuoj
         IbrR3o9MAm6f9FlpBqvj1uF5zPKzXirI/Ka1jT/JwtQ1GKkMVVR+HCfvSlmRgXT6LwO8
         kyX6YEh0sQcihEh51+EWymip/jDGxfuZHLAAAe1TeQ01KYbgSpyXCA6CFHB3SBKQiMHH
         Hl0w==
X-Forwarded-Encrypted: i=1; AJvYcCW4hkh4QK6DgUxfmXl3B2Y52SmXugPnhrkFuhe4MKCkfFGJ0EDkz1Ha3DZqc38g+ID9xKnokzDo3Ay2kGmpNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBe1q2l+25/Krz6AH/vrd8qVRHyiqU9/9j9NOD2pUarAu7TVWs
	WPFf5r0HzuowFCvEmWW8FtkmvtxiUxJr8pj56AjCHITpMADZBP+7Yteg
X-Gm-Gg: AY/fxX7m5AzPVbt5Z9pTMOypg8lOymxDoGQz11zCpYGmOiyuWOU3aMTeEal7IyrEe1A
	DSxdxz1z71tU4462bv69giDm2I/6trsCVc8QL8s8HML5W/hVbZdIKjfQUji/DYMCzKc5tfjgV+6
	gLWDjvuYIaknaVbkfZaTM1W01Eikv3Jo7xtHFEzxdJVy9uoIGSKo+lBTTNc6YRm3ycjiyeoA/ud
	ws8/XWPpyBQFiK5O0qIThZEYXYQp3QWgdOqyDi2TkP0/d9YV4IksKuGhYPn3rtNenzq9KVShfE3
	cfg02h7ik/yNRxPVRNVUe4pgyUNgqdSog41j15k2OUkbafA/rlvHoK0rBAFqeKrdlAj2B7sPbKv
	xRgl9AD82CcHmZM+MrRF8NUNEkhRG9rHKOULHE2EUqv10PBKD95l9VMN0M97rHMq8HdJJ0o5vbp
	s3hOOO/ZGAyzm6Xmo9fNtvjrM=
X-Google-Smtp-Source: AGHT+IFWeaxPAh92AZovsHbT7JsUtzZUFDtHgT/y7wVHzwcDS3qRKtyeBQwoY59pYZMTc3gCAicTOw==
X-Received: by 2002:a05:600c:8b6d:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-47d84b4a7b4mr75576915e9.35.1767879396259;
        Thu, 08 Jan 2026 05:36:36 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d870c73c0sm39516805e9.3.2026.01.08.05.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:36:35 -0800 (PST)
Message-ID: <3e36262d-8eed-443c-afdd-beef2f8be5e9@gmail.com>
Date: Thu, 8 Jan 2026 14:36:35 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, it-IT, en-US-large
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>, rust-for-linux@vger.kernel.org
From: Denis Benato <benato.denis96@gmail.com>
Subject: hid-asus: integration of some rust code
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

These past months I have been considering moving some userspace code to the kernel.

The userspace code is past of asusd and manages a feature of ASUS laptop called anime matrix:
a series of leds forming a display on the back.

The code in question was written by the previous maintainer of that application when
the kernel was not accepting any rust code, and now that it does I think it's about time
to port this well-tested feature where it belongs since it's talking directly to the hardware.


For context hid-asus must remain loaded and attached to the device as this new code
needs to manage just a subset of what is supported by the device, using the same hid_device*.

My (main) questions are the following:
- is this something that is acceptable?
- is this possible, and if yes what is the best way?
- is a mixed C/rust driver something that is accepted or does it break some rule?
- technically is this something that today the kernel has infrastructure for?

Specifically to Jiri: since you are the maintainer of hid-asus do you have any
objections in doing this?

Thanks to everyone who will respond and help me out.

Please feel free to add more considerations and answers questions I haven't
made since I'm sure there will be more anyway once I start working to this.

Best regards,
Denis B.

