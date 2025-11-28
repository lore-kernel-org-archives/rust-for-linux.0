Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED03002D7
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 09:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764322188; cv=none; b=na9yXiWh1HpQ+z9KG3/3o6ShYC3+Ff6RH/O6nrn6j4ld4nOmAuEbN95MI3pZuVzp60KpSYnB2P1LgS1uqPvljqqEz4cgqtiuESAf6ceVns94KTpf126pF95z3JrSAXcmcA19n+IPTIQym0H4akZnakkI7W919SGdrH4sszeTvww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764322188; c=relaxed/simple;
	bh=KNyuDffDRTcSiEGAsAx3lmVebmv+1MRenGOG2Hw4yOM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EF6+bDrTkp6Q59Z+aIjW3JxfjIMAa9M0UEJoB8M1bc5VaKbW8rSVKZLwlboiB8XbcL8CK1AIv8R+zZtrMuQNS0TPYyhl97vU3ZT1Vxui3p6i/LQMLYlE7UdasXgNIldgBGsfYW9FnpPZ9536Wsf5JYyNvZgF+vXi3d89TRF/KZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hxFt2BWr; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hxFt2BWr"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4779ecc3cc8so8652495e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 01:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764322185; x=1764926985; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kz4odsY9az8NKfblDAsTmnF718nRgG5QxRoVjCQoF0Q=;
        b=hxFt2BWrjcI8qUdWTu7nVb9aDWy0oYF+4KAH+VsgEkY/dVqDjOKuatHMWZxs28quQA
         RbpM/1QhzWC1kOGCxSWDsc7qscY57E0wg+dkTeOsVp4r4nBccrn/EjNdWhRW1n+LjRE9
         q1gvS7SlK6zo9fZ2OX4pwo2YALlboFLVKQcrPhlMbGwj2HRwVuueTGNLT1AjmgWdvhdp
         vSy5TGUOVKgY3keuDlKYvdOx019h6dIeryXg7falNRsHTrWE0/0oCI0FVwJpFVZ2BMBc
         YflCkBKS4mq1ROxEwfTJiYA5+IJKeRVAj7D51VzZy7EI92RA4/hKdRyyDPSjqeBP1jbR
         auAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764322185; x=1764926985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kz4odsY9az8NKfblDAsTmnF718nRgG5QxRoVjCQoF0Q=;
        b=CiNE+pTwmHgiFXi3dgfSmUpKwrsptsNm++o4QrDRhXXrIqd5IJxaOxn7LHII3aDcCn
         CBfg1jqMAWOjpYKkZPthgMKa6ZxlUg0YPpaj36FBLmll5DLiJ7v16HuqY+J8kpwi8puy
         NA9hepZ9q/kTbCt3Mq4pcnAblkigbFHQWocq0OG4AQrNrlCCCwoerXSAvW+RcZvGOt+l
         nvONI3c54254UlRMbojQ8rGkR2anwz3eI2JCMBRcdjJ6S1dTiJUGu/VsQaHHFaeCUzs5
         wRItSF1//3clzEYhZTkrRxCpNKoOolQy/qQ6MMVlIuAo6Y54DcaccSiB8p+T+Cd8Sfgw
         S4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXKnVMoHTPjJpV0d7/PLVExajiLeTNKKwVLoyeqqxx/tIcTCWL79iS2n9RLyhckO2LBN2GPY8er2Cc7Hp0kug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz18zvQoCwHIjSH65EarCDa+CVJmBRnz4Ob7hsmSaakwjAMKiDw
	dkByHAK42BCQqCM9fuqAjrgbpD09pq+N74nxb+jwHtdncTIJG5h6bb/zTHcOPA7kYJcOcIfwWk/
	1ox5S7XfADa4loOMNHg==
X-Google-Smtp-Source: AGHT+IEGr+RPs42E0FQu4piPGms3EvqaIxP+0rfbrSCad6KhByZX+KpeKxsk4YrEGc87+/LJciZbG4DOXLS5/dA=
X-Received: from wmfv21.prod.google.com ([2002:a05:600c:15d5:b0:477:93dd:bbb1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19ce:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-47904b25e63mr144378965e9.30.1764322185489;
 Fri, 28 Nov 2025 01:29:45 -0800 (PST)
Date: Fri, 28 Nov 2025 09:29:44 +0000
In-Reply-To: <20251127211843.46258-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251127211843.46258-1-deborah.brouwer@collabora.com>
Message-ID: <aSlriGna43AyfdBX@google.com>
Subject: Re: [PATCH] rust: drm: tyr: use generated bindings for GpuInfo
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 27, 2025 at 01:18:43PM -0800, Deborah Brouwer wrote:
> Currently Tyr's struct GpuInfo is manually copied and updated from
> include/uapi/drm/panthor_drm.h. But an auto generated struct is available,
> so use that instead to avoid copy/paste errors and to stay up-to-date with
> the panthor uapi.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
