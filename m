Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5931A9F90
	for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 03:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784343840; cv=none; b=Lxk3EPtrWR9xcPTkP3eBnTiDiZHp3I8KwvV/EMJsfVFjI8QL7wM4b/LZTkkNu3JUB5RWDxw7Z8l2ny5aQ5JttjO6gSvBOEPBn/sPU91tZmuo325fdX6RCFKPet08aaQQyCCSAq1hKbz3P8yzYYmtISO8juZbt5PZ7ePZLZDQ9pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784343840; c=relaxed/simple;
	bh=pPCpxr9XgsyMz1xhP7Hg7iTwImnOiQD93GKWC8ZNcxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzeTUZKknCP5RIZgl7eQlEKfHaIkXF3yXACIjVpDGBla+mhQIX3ATwiD+QksmSOGAgLS8viTjZlx9PK5siwea6sDLn8woMCQbr8TcsH1e70JMVWvzwiX8S+MPBckJ3cAcRtVDKtsU7YEV6rEkIxh24s0zjoaL5gEpctq7uQz1oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTwgm+Wg; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTwgm+Wg"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso3134511a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 20:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784343839; x=1784948639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPCpxr9XgsyMz1xhP7Hg7iTwImnOiQD93GKWC8ZNcxo=;
        b=iTwgm+Wg2sS+mIV0DMNR6fLahIQmiUCyx4MCpU4VHB2tOSMZZJEnajl7+z+JMectZC
         Xb9ETdLRW295iKotIi0gKsgIq6Ammqyq7ZcNhqWE3gvozAbBRLAf2CxBVaoklYWTwTER
         SEp0pNdVmmrZgWTVDj4VldMMNmeXoFzScibBXI0LrDOWeU9dKFVeOpgVyZHv3Hhw/hoX
         uPYWH7pYsu1au0atDZtQRWD8ofsWKpGQRKijQmqvIIiE8yPdzuRWOdF66Zf+tXpOBmF6
         4/9Rn6hUrr/ehSvZ2RuiaBgcDh2+4s4khJNv33FuondztEgNSFyzZqcVMy2fDd42gKBs
         YPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784343839; x=1784948639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPCpxr9XgsyMz1xhP7Hg7iTwImnOiQD93GKWC8ZNcxo=;
        b=DAJaZlNmWnSKM2/JsUI7AJxGhet7Votj0DWiYu4o28qQqAU74uB+A83x8mKAQcgvsC
         0TsqTqclMdRJk3/IsJ6fj0X8oEWywWVzORxvhhAOVL759O+giYSKZATDJ6qFgKmTE3hS
         Mh/xZL27spemNuFcLWu/DH402E3D+a+Iw1L4a23oKK2rpkleSO1ByWGEC1g8RZeI3VpI
         fL6ZF4V4DaE8aJ3ZZ44yLpLS6xIq4SBYGj9DWNh6dImRzWolXs8IvahnqtnZDwwH0KoB
         VxIl1D6ybcz+6KCuG6G75ndjKHS/w2YSkEfSBfyjOy3uKAEB12e5u8t0uaBo0U8FuaZU
         fdaw==
X-Gm-Message-State: AOJu0YxXAwVWl4M+AIsyiIh/lW3Iep1AryFNDeDjTjnR5U4DrlNJrJTo
	gfgVjSTgAnzMpRo6CnH3vizSWJrCzIGNpWxv4D+X9nHbfhx9QeoWzhls
X-Gm-Gg: AfdE7cnLNfj0LlvSiMLbzdo5alkZXeXQoMlnUdOraw6K5q9fg1QWiDKsxTjFbYzfuyT
	goUD9t2AztctmcNpP3GdJdzE74+XCpb2fYHEqml4MKK2ixJiGb2y2lD4WdxIt3/lkuLuEOW3/7l
	KorTiO7DPaVFAKug4X583jdDY5ONEg95yLJjTp8SHyH4xwDBpGHh7UbUWRNSzHXTLspcxuf78q/
	txu+Bc5R2AFfCdct0Hn7uIaJzG84wqlKqA5znctJpRv7kBm6QzYQux2M7HvtfoSe0kmNcUKIHK0
	JGdv+Pu2HJUKrtjyhsynb6YTKQtAatxIafTlUTRuKNiUevsppIaNTU3WD+59umW3v1G2KExgB1f
	SGkmWFmU6l7Zjnlfdd7QAv4qx4AD3DUgOQ2f6q7sP6diNjwUYFB3mb6h76ye2tU8lPpnpA8p1yM
	zIUBYyjrW+h7YrGkeegd2Frv+pIyDBWaqOubnMM8yIDUJz86rQpWb1D8v5SJuXszwM8n3agIrtt
	LYpXGjKqdnERtJcdGV2fMdYYh2NKkLvf1g6f3PzyXCbDsAaKwTbQB9MG7VlO87qwoJfcAOm6jp4
	rYzinWrUM4iGaBLaX8t6qhCnsT+zLft8v7MqLE8EHMVFy5/B9c03TFn0akASOEDjGhY=
X-Received: by 2002:a05:6a00:451b:b0:848:7459:5f62 with SMTP id d2e1a72fcca58-84c2945a902mr5377409b3a.44.1784343839028;
        Fri, 17 Jul 2026 20:03:59 -0700 (PDT)
Received: from ip-172-31-21-198.us-west-2.compute.internal (ec2-54-213-160-35.us-west-2.compute.amazonaws.com. [54.213.160.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e48csm2015355b3a.45.2026.07.17.20.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 20:03:58 -0700 (PDT)
From: Bruce Robertson <brucer42@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>
Cc: rust-for-linux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sre@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	tamird@kernel.org,
	aliceryhl@google.com,
	boqun@kernel.org,
	dakr@kernel.org
Subject: Re: [RFC PATCH 1/3] rust: i2c: add SMBus byte transfer helpers
Date: Sat, 18 Jul 2026 03:03:46 +0000
Message-ID: <20260718030346.1698-1-brucer42@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178376605131.22511.1602274538745913609@linux.dev>
References: <178376605131.22511.1602274538745913609@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Jul 11, 2026 at 11:34:11 +0100, Igor Korotin wrote:
> I2cClient should implement the `Io` trait rather than adding standalone
> SMBus methods like these -- this was already agreed on previously [1][2].
>
> There's also an in-flight series doing exactly this rework right now:
> Muchamad's "[RFC PATCH v4 1/3] i2c: rust: implement SMBus read
> abstraction via kernel::io::Io for I2cClient".

Thanks -- I hadn't seen the prior agreement or Muchamad's series (it
ran on linux-iio, which I don't follow). The Io direction makes sense
to me, especially given Danilo's point that it's what gets I2C the
register!() framework.

I'll drop this patch. No point in two competing implementations, and
Muchamad's series is further along the agreed path. When the
FallibleIoCapable discussion settles I'll rebase the SMB347 driver
(patch 3/3) onto the Io-based accessors it provides.

> Your smbus_update_bits() is exactly the kind of read-modify-write
> that's affected

Right -- and it may be useful as a test case. Unlike the AS5600, the
SMB347 driver is write-capable: it does a config-unlock write and
read-modify-write updates of charge-control fields, so it exercises
exactly the try_write/try_update paths you identified as unsound if
left routed through the infallible backend. I've offered it as an
early consumer on that thread.

The power_supply abstraction and the driver (patches 2/3 and 3/3)
don't depend on the shape of the I2C accessors, so I'll continue
revising those in the meantime.

Bruce

[1] https://lore.kernel.org/all/20260708214738.25008-1-brucer42@gmail.com/
