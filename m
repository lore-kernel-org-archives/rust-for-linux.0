Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0EB353A69
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 17:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555711; cv=pass; b=Mhb0CcPpDL4LBc0+irrwyjItBcrV2TwBpvhqD0ETj3Tct6xd/ZaObsWB8lWTQzJ23XlIf/ucfE+ZiRCWtDwcvPKM9iuFjlrwE8LAPXtPYuIQbdLUQpnVe830uDFFcAOxUO3aLGuHTHUuXzx8tq6o2lOrFjbS39kwp9Z/ofpaloU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555711; c=relaxed/simple;
	bh=xDuoRVLGvIxgGh+NYTpMwY6kAetMdNmoxMSHdG9U/dY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Hntrl6oqLlPkuYLZED0WGZPwgajPzgwOjcjbMSFO1XI7ZZFcVfarUIOFQmLLESiVXR28T1171uQIh09qudZExNOJO2VfAA3kdxd11kcPZgNs3+cWbxDxt0K0jpvmC0k40hSJFUbNecKO88eiQUEQJUAdYUagx+pG0r8nz8TRges=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hajdamowicz.info; spf=pass smtp.mailfrom=hajdamowicz.info; dkim=pass (2048-bit key) header.d=hajdamowicz-info.20251104.gappssmtp.com header.i=@hajdamowicz-info.20251104.gappssmtp.com header.b=uljnez9K; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hajdamowicz.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hajdamowicz.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hajdamowicz-info.20251104.gappssmtp.com header.i=@hajdamowicz-info.20251104.gappssmtp.com header.b="uljnez9K"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7ff05e5d009so12863187b3.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 10:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786555709; cv=none;
        d=google.com; s=arc-20260327;
        b=BXmi/yRjKV39y+h0KrPd0Mx1JbiTfsM7YlFsf7eURiti9CNDxvv6tc/ApSgGWqH9vD
         z3wyF8x7frWkLBRiwC+tChvG0ReiupehoBROVACXnZneJuB6bU3U7eU39LtQdSIWCitR
         ksN1yIYO6CAuWpBPGzRbu6h8v+HjW8x5rtNXn6iMPEX6Xla8AIKn2bTSHB1C4pt6Qol/
         HZdTM6sXaM8Q0m5FxvoAKoiRbGbLm32ba8JegF6Z6k9iyfCrK5ZbI34Au3NI1gUp3OIG
         xbhB/RUdM35lo6DJiaMKmXF5TsPMjPUNomjdJe2DRgCZh4CRNMyB7shHbRMOynvFOCE+
         6J0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=egsgisS8cJvTWYjyoiQcqyGXJnxcouZlY2kuiYM7TZY=;
        fh=MTCqtkAgsAe7O5caNtnUmGL42U/YwFC3Hgwy0wY1+X4=;
        b=olTEN20ra0cP5I5LN1MfO4CMpBqxtyjA84srBYEpwhz+bcII2Qctbo9XRitTQotylW
         AKyP4V+BDBeuWNMZedXwoqbF1aBcqJuascEKJBYOGercQAViw/CMhn0x4BKG+JTiBaLy
         JTonyn7O+pe632ddGXPi+QLTm5V5b87taqeeJFzffdAx3dQJKX5rWPldapx62q29Ao0r
         StDtged7wCngfx7MjfuLEVUUUWnmKCsuGYWcSMEEpsQX8kIXkTpnRwxBuI27GgA+49cg
         Wb/kgIolYLLLux0SjLklWJlpnMEfsmdN+rPV4GOomNO1/AI2GIQm+Kr5yvmbpcoZU1DP
         ypWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hajdamowicz-info.20251104.gappssmtp.com; s=20251104; t=1786555709; x=1787160509; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=egsgisS8cJvTWYjyoiQcqyGXJnxcouZlY2kuiYM7TZY=;
        b=uljnez9KKa8CtxfrBHyrjX+1c4UMx9xCBB9mmeO+RlphkGqW2RfPau1qC1biyG3JfC
         6g/CU/TxL+82ux69ZtMfvlHrScq7TefT5qjD2sZ16H8U8P0qqH5NSTOZCDWmjr4180Cw
         LUGi7pf9U0SAVCSCof80IRdL1UYXeU6V+vwRGY+tqwF7JbmV2MJxIqHAoKhj+yoKV3u1
         m5RSbsDIAQ+baX7qOH9GpwrQX6HHPrOrr1fWImEYmBnblAmZKFYmmpfY7uoZVB72X784
         yLGeXR7xUCQWT7gw6hS1Hu986ztYXZLEFJQsNejgTdxSMCE/nyKqOgcjAr+C+x6TgZJ5
         rVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786555709; x=1787160509;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=egsgisS8cJvTWYjyoiQcqyGXJnxcouZlY2kuiYM7TZY=;
        b=q7vjNvjKRsWMjwspbs0r6MWRffqRg0iQqeTvXEDxaDN+dtV3xs/A6q0AgLr6K47PS4
         VYIFmxETRk3N4yDj9iDlhqZnIfLqfzLQdCPTAl9DO8mNDcPlog644eQ/nlI1Jodx7RWV
         TFxqViXOkK/KaOKFnUCtiCO2vmZXvb3KJ16SuzTy7q85KlRKUqlhZM2NhLaYv1LZgirR
         6AORP2tinoJMsXmxUN2Jls7CSjYOhfsMqmnC0xs633POQU47yK2wSKN+tpHf9QCIOSam
         AZhgIs/8NEA6ra40rXgplVYKhjUlagQn+XmiktXbWlQUdb+6CROx4qe2pUxALtKac7uM
         Qeng==
X-Gm-Message-State: AOJu0Yxn4uDS+zdRkPtXEmT1kY7yjvsgrfB+6AItTbTDXJzjrByrWfCJ
	p95pQJO9BgBaTuei8QFqmx8IXX+05lKUkSKJBs7MaKYRVNHTxK8FAWbRD76JgHR+p0KzvbjFTJo
	00dftNz3GyjgObUBESjP9SO30AbN9M9NotX2p+F+aPZi96lF8uf2OsdrJKQ==
X-Gm-Gg: AR+sD12Rw3CTF9o7N1buSorNgcehtqxamGHLZ98swsdqAxTaAuVbfhSadDygil3KNk4
	B8if3lgEsiCaKO6IVyQZSIV1/K8d8J8mQ7CXhxcFlUtgH401Cere5WKUmbHpIkrwI8ugDhd12dE
	1ZhpqdN0kuOCDpuIXrv84qgiVBhqloBAy5gRfyQ6qFgDHOesnfDYDGJTsy2YvA5u4o3LSKnVOGg
	0VbZdxAXq6ULqTx0d/ihdpKnOBlKym1BevsjB1dtjihmJDW1OoC1m7cCE0Px8bqwHApso665/my
	UpGA5GwDx3XTfhrHt1h+f0/zIa92MJXkUCl877SPyjm+gIfGjjZK0v0WcuE8klWAvDOh3kgMgA=
	=
X-Received: by 2002:a05:690c:c50e:b0:81d:472c:17a8 with SMTP id
 00721157ae682-830fe4b3979mr32786687b3.0.1786555709080; Wed, 12 Aug 2026
 10:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Krzysztof Hajdamowicz <krzysztof@hajdamowicz.info>
Date: Wed, 12 Aug 2026 19:28:17 +0200
X-Gm-Features: AUfX_mxI6N4CqNuqavEPjSz-i5nZclZPQTRWYabeRCmTPrOTa89GIVjG_87eLCQ
Message-ID: <CAG4rwVS1PCyBi7=rv_2OCLE1PvjyD-ng5=vsGcTyG_=wQfR0yA@mail.gmail.com>
Subject: Heads-up: Fixing rust packaging in Proxmox kernel
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello!

I was informed by Kent Overstreet that there are some talks about
providing a unified build target for Linux kernels.
I want to let you know that I've prepared a patch [1] for Proxmox
Kernel to avoid deleting rust-related artifacts during building of
.deb files.

1: https://lore.proxmox.com/pve-devel/20260812162527.98882-1-krzysztof@hajdamowicz.info/T/#u

Have a good day!
-- 
Krzysztof Hajdamowicz
