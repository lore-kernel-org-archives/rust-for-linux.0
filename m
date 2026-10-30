Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347088;
	b=qFSkGdyoa0mTRjWg/cOhKwyR4jdX/nznUxAzd11iK87q5ohR8rs5XHM3/poAsI3a3zRE
	 0WK7iBA+6wbd0UFHXHRyFKuAwo4mcZng4hE39jVT5SKAJUKR3BAUbauQXFyX/SvoWTES+
	 rLrgkgTMbaE+KyvPBtbBgaJNlbSExPL3nVb09aCFGSuCk6BdBgAmbfwoC5xNHSAiekHAJ
	 ALpTE1KFbhfMut6znEvbf/B7wTu6v1WCQLoz5ptgFIOZ0WH5/eZkoZcamgJyqtRYlgmRb
	 EKxPN8/vF8xuRnd7+KYPPzS775Yh6mthe8nWOaU0B5fuCdfbCnoWtkN80OxZ8fSPyvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YZj2Qty9JInb5244dlMUxHY5wM7oXDHaDgfyNj4i0kU=;
	b=vuz5a3lbJaagCFoRi1lDCZtGbDn0Q65/CgL8fCGRKYHU2FU3FCPusEa7Oqv6n8kUrk0O
	 z6uC6rCJrYlu0ZRam9r2lFXZw7OUJ+LYR54Jw1grKmSjmXvqeGHtc7ZE36+6y3lr8lUnd
	 JzpAApJiPCYkNpSg94ZoOIQZfcyyk29YWtLnbY0cqZDAB2RA8+KWHoo/238XTHxtsFHE2
	 FZs79IE4N/9hYgvHJuh6h/5bLdsE3G0n1WcruQ4QLxBAik/CSnx/TkoY/7WaVZgeW6jET
	 RK7O7nT/RypGbPEGI3wr/TVmDj/qqN5vGkFkPK5pgX3snnVOXL3dpiRHyGc3XOeR+3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fireburn.co.uk;
	spf=none smtp.mailfrom=fireburn.co.uk;
	dkim=pass header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XFE8VPb6;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA433606A31C
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 07:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA433606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XFE8VPb6
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so1882765e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 00:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20260707.gappssmtp.com; s=20260707; t=1793347086; x=1793951886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZj2Qty9JInb5244dlMUxHY5wM7oXDHaDgfyNj4i0kU=;
        b=XFE8VPb6m1GPfBx2CUgfiC5nJbXLI/Nv8RbA4+Ji34UonIDhtgJhIHSc75StLMcva9
         KOWVbUN5h+ZaflzQySQO6eC5cwkxqqI8zuCDcFe21kSNODnzkzrXYalCsimjIRCEiP8N
         +Kt0MDJ6+REjoou+T/CgBTbRGvgfrMtu2lEZbe9L8p0TkrjmYDQivqPSAsiTr55xygK4
         8qY9VU+KadIp8YSwur7BL2MF0b+kcony3MVrFZmgkddU9eJyCzEaWjNMN+oqRx9LOBeA
         5NHmsY8ReCQ0lqHVfQYG6HR7Odxo+A99SP48IVFY96FkA+y2ENhxGwCKLI9mfrDOia7a
         SDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347086; x=1793951886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZj2Qty9JInb5244dlMUxHY5wM7oXDHaDgfyNj4i0kU=;
        b=ARZIlv4FjHUFYmxM3WbN3dQ0Kl9IYDU1+mPcJTy2v7UDXJLj98qGAauX0nXaSGSuY/
         3y18g8jcNxw32FNRtydIaj1dOzU6eIcpr7uXmXKFBIlcNewjgjNudkCWFohwuU2oZi6P
         tqP/shx801bb85YpJc6PK3dQtk+ebcd3CzI/jKYxz4oe5x6RMkAobO0Ai65svtYzJC/d
         JZsbuSd+AI19v3qB1LMY7+eb22Z5MNnRyXxE91ey+QRDcUQr+eEQJERSYqJtSX6PdweP
         gqkEgVyVV9SQcQjl9UZ+ZxgC9c9TdstUhiEOeVUOnldZ1qQqfvGPyrafT2OeKGQiklRV
         Qvvg==
X-Gm-Message-State: AFq9FYIKIiuQY7pzffzZrB371ysdCkRd4txnv0yOw3eJytOtCV7nleoZ
	zh9gelkAEnZoT82/cY8YHVa93lP3pJ0tRO/5La0EHmZPYQsXaRiu6HZtRzZWYHV9c5Bhud+uLlx
	NqRZg4nYR
X-Gm-Gg: AYBFou2hJ//6jyHl2cN37o0Guo/FE06c/bZQJxdjYAEVjvsEMSc2V0vD5CKyQzwkWHN
	kF/cjyxDcc8LpPTJv48mYto/kXyozNN7Ey6v5hxCAy2HTdrDg5GhIRFpXEpXcrD7gE/CaQa9HgQ
	KDa8E1PL35TA9i/SVsx15Uv4UaYTnYMIIH+ZMtzKLmlfGTzg+f8GxBXr/EFoysh8rU9RaQJg352
	zIjGglNqfgFPFqd7QIdxl+EBJCxl0gvpdXBzKeRoxM6nNHEWCLsb9oNYhM3jR0XaKfbQ/Y2ykLM
	8ZsWR4gackABu8oPJNpgOK8IWrrGmZ0tbPxaJCfLEal2jWefrOxAn/m5TsCA4VSZEkeZZWOrCh9
	LmAc2L92KqS5ApMP+Hyyx3zd8hY4ohMBXYJV8iQ6PiBzRm5o2s2PznagziCNDcKLYtM1dtGH7tj
	AMi8cQuTLVj8EEvkURZwvsW46kogPIT6QFtMoP8LpJ2Lr8DnXKSC9+EohmPWRchwcnv1+bXSzWG
	06yXbeT4qsnFV7WrYH5N9TaWhoEaeF30Dwo7TUKeMIl0UoR0b4Ley+0xnWS6Y9y4OsjX24Ft6H2
	TkSN0t3+ttopWJvK2w3Z4IO68PsWs5R9HZFYV2apjthCjtx9X49a3+NHDkoeJBsnFGhKwO8F1Hp
	+
X-Received: by 2002:a05:600c:638f:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4ac150b304cmr29519325e9.4.1793347086099;
        Fri, 30 Oct 2026 00:58:06 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b289f7sm40818935e9.5.2026.10.30.00.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:58:05 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: Shuai Liu <847807867@qq.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dakr@kernel.org,
	gregkh@linuxfoundation.org,
	colinbrauncl@gmail.com
Subject: Re: [PATCH v3 0/5] rust: usb: host-side abstractions for a bulk-endpoint driver
Date: Fri, 30 Oct 2026 07:57:58 +0000
Message-ID: <20261030075758.356879-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <tencent_A0D3062EB058E244877B87B4324B8DFC4406@qq.com>
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

Hi Shuai,

Thank you for reading it properly, both of those are real

On Fri, 30 Oct 2026, Shuai Liu wrote:
> set_alternate_setting() invalidates Endpoint<K> without the type
> system noticing

Right.  Binding the proof to the setting would mean threading a
generation through every Endpoint and checking it at transfer time, and
I haven't got a version of that I like yet, so v4 documents it: both
Endpoint and set_alternate_setting() now say that every Endpoint obtained
earlier must be looked up again after a switch.  If you have a shape for
the Altsetting token in mind I'd like to see it

> set_alternate_setting() with transfers in flight is undefined

v4 refuses it.  The window already knows about every queue URB registered
against it, so set_alternate_setting() returns EBUSY while any queue is
alive, and the doc says to drop the queues and build them again on the new
setting.  That puts the cancellation in the queue's Drop, which is where
you suggested

The one in-tree caller selects setting 0 once at bring-up, before any
queue exists, so it isn't affected

Mike
