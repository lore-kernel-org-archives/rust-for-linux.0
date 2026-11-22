Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795337960;
	b=kP6Kudt9TV7GVwuxfy8wOvjWeop9JZ+D37CYh5dFTC9b44ao7DlUGGIQQNllMpSwYNpT
	 Vd9hFjVqDZdxxPcD0a1Wl2mClK/LFpM0B6r9zqq137D4S4BpmGEUiRut3snCLCyz1BRAu
	 L48K/opMimonBhZGJiTc7T3NxBOTaJFUwctvcFJISY4elnCJQURsOEsBdCU620lDrebGw
	 O6NhSIkvZ+zi+OhvcHsPZtcGu84QmX/16uX1cAv+m7F5IT9gf4dI7wDq45tiwizwLuIpV
	 xJYEomBI0RPGjLQ15GcBwgO8eKcMsmBvifzLiToTDbmg0Js59qLBZKJsXUb/WAg+Lpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795337960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=2xtn5830lTNiRdDIiYhj5d/UObB+cYcE2nyc42dKa0Y=;
	b=x6sa/kbKiENCZ+Ndqq4uWW5ms1mAvI1Rv2EQtmPeBGK4DpBdgsSnCYK9FCOwmVm+lvBs
	 SBeZatbn/mmzQpIBm7hfw7+dcURQf6/rOlYc7+fBXWr2+hzfIS009GKmfwb829f/riv9I
	 +brZhD9FrBczaaeVes5yd8cTaZp3aSpoTXShBXUWB1/jkH2oLyT74wNrV4bxr0cw/0g5w
	 U8K7W3ITwPhAGrBebkEKuJO07jFs7n8kcsNrXCplWJ8IrN4BJIvE51c47DLYIiuBwTe5q
	 VDCCgaDCzmGBomep3wqzMeCmoP3IDTMUxTzus7Fm7Rcc1cFM2kj3DY9sYAdLg3pUFaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hEtQQnKy;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2887606A336
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 08:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2887606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hEtQQnKy
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb66fc3aa6so21939765e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 00:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795337958; x=1795942758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2xtn5830lTNiRdDIiYhj5d/UObB+cYcE2nyc42dKa0Y=;
        b=hEtQQnKyJBzQvrv9WjCE8H3ZqU7wxX9gLJ1UcKPQR+IZWM/wTKSvsT2HgH7xMmt3kC
         IvVjvIbmukDLON9fqxY9Gk+Pazv2bPzDnqexJMe4Gunc0duIWYumQkbM190W0BI4eoy9
         96FP9vMch+B3jdiFgaXEApDt84ci9kDrdQEG1x73Jf2aeLqfv+2STFMBD0IyuP70u9CV
         18/wfBCy6FPdTJv3X148uzHCzh/WHsS+X+j5w8x9RmqpT+0qDxTMeacONggx0F6UAguw
         wjS3NOjLZts/DOj46iZrA1TioBcGnRgieGdDWs3/gm5WfR/qKSHoW1AwZIZ5r+03wWEC
         C5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795337958; x=1795942758;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xtn5830lTNiRdDIiYhj5d/UObB+cYcE2nyc42dKa0Y=;
        b=fB/WaOSFVAIX+6rH+jccFt8K76YhrBxife5Dq2ZT0qQZq1GK2fVQi/CI8ZNO9c2mk8
         sWBT10NdR+doBC67CH+kEnZWUMHqqH/f4F7Zk0ULxBZsDifq7CTfgRUs0ytRV276JQ9r
         Vf35bH/f+8MQIIl4V/iCy9WxdcGotzon3biqqptdjQQPGrm4VYmS4wkC6hVlH2JG7wp+
         fy8Zqdrjd1fTY5oOJ2hAYEMptgqevu75rot2T18uwoi6I8q1MAQ4XkcRGvvgUXjE3wiA
         Pjqlv4zCu4ohrqeQpQhuA6T/GkUZDW/3AwGfpCH0cIl9PzN8wu+mcgiAorivO8/rrnTQ
         WXMQ==
X-Forwarded-Encrypted: i=1; AL+hErGBRidMpTD6f58D2jytHz8/48twQ1bA8lyLd788lkRCTSIyp3yrG3MwWdojT6S2EYEwuKJjlzn8QbjxZldgkw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4rKLUlJRNBPO+imWNYPh55Gjkx1O2OG5QM9fJ8edJn/1b2FQU
	2YI4MMlbMyBn9vyOcywQMPFoR6v0TzvAO2WmazNkFsOLcoOXI4Jr/rmWc7X+QUsi/40gH5gPHus
	kzsN/Rpw1jhrQnmvd9g==
X-Received: from wmmo19.prod.google.com ([2002:a05:600c:613:b0:4a2:1824:f77d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f42:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb8881c726mr211965125e9.5.1795337958222;
 Sun, 22 Nov 2026 00:59:18 -0800 (PST)
Date: Sun, 22 Nov 2026 08:59:17 +0000
In-Reply-To: <20261122-tyr-reset-impl-v9-0-ed42d8f513ec@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122-tyr-reset-impl-v9-0-ed42d8f513ec@onurozkan.dev>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122085917.1094675-1-aliceryhl@google.com>
Subject: Re: [PATCH v9 0/2] drm/tyr: GPU reset infrastructure
From: Alice Ryhl <aliceryhl@google.com>
To: "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, airlied@gmail.com, 
	simona@ffwll.ch, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, boris.brezillon@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 08:40:31AM +0300, Onur =C3=96zkan wrote:
> Changes since v8:
> - Use workqueue v4 [1].
> - Drop "drm/tyr: clear stale IRQ state before soft reset" (applied on
>   drm-rust-next already).
> - Minor fixes (Alice's notes on v8).

Thanks for the updates! Both patches look good to me now; I've left my
Reviewed-by on them and we can apply this series to drm-rust-next once
the OwnedQueue/ScopedWork workqueue dependency lands.

Alice
