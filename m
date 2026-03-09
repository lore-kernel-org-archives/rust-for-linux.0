Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632223859D5
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050298; cv=none; b=UQpaMQ354n0EPk66w8dgUcZs1VgC6YoreFvqS78HzsGsHhLP+ff52Iym6Kops8G9922pskywZLhSvv4ClofZTMnNNrd4hM1oWStij8PT7vQ5NbVC3+Hkt4o24TTtcQ8SAG89qD+n4RZ7CmIbohayBA4LbI+7wQKKss3B7CDQUKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050298; c=relaxed/simple;
	bh=SUfOjeox29ZT2RsTua6W9LzSTFJPTYWVjjKoEgPYwm4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LBRfSDk4TkQcLWfvxPd0gpppbPnphToGnaA3dtHS1WIIBUSU2EISkvGFhQT0ny2tord/l/XYbvLOsyPnhceBxY1ekrNjO8KJ0rx1EGfxcHKqxHROpuzLuz8F+j5LwmfMS8jFtuh0Wdvj9Fhq2CG4VRzYFUskP4pOsTmyjjmLPjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dg/jpG7h; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dg/jpG7h"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b90484c398cso1009299266b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Mar 2026 02:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773050296; x=1773655096; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hHkNiGwy5TmnN/F2tJnTKyH3OPa02KR5v3rz+QeQiXw=;
        b=dg/jpG7hWckO2sGkcVw7dbjIQDECszuzrBUV42dtdyFK1TvPR9lfPsNTWKXiCsDevP
         mmfg3WKG6oSGm2UrmAOOSqFDLqJ8R04Nahc1n7U48VTcBXsi+Uk5q3sVuixOHtcz5WSN
         l+M+9pL09cNMtl3IXyuLszcTcL5c6gPPklAjZAXS0VovJyhFTIQiu4gqKJw5IomXzdvD
         ja/5r74Zjxpm/tec5pAUQ+2TVAfhxdJ5XEzlXiWJv34mCizv6lsRPIGSaRw1oylvFAXO
         Ca+8Rx1wpyncyzDebL3E2ZI5UI+YCKD3w3444qP9VDv+TebFA8Me8/h7W7BofxadT1AH
         JStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050296; x=1773655096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHkNiGwy5TmnN/F2tJnTKyH3OPa02KR5v3rz+QeQiXw=;
        b=AyVz4iNCuPwbqGDfyexKBW9NV3RhSawqQjFCSMlY7ZPCbeLQcLVUjXwvFTZwQWLa+i
         aXODt4hdgEhoBPGihW9jreoTDdaSrFuESNt4BOyL06R+RJuvuttxsaFUoISeFvu3L4bi
         0a4Wm+j3AHbU3gtodjvAocle0MfaIkccaHfkMsk+dRM6a4+ZZ+1zLYYDNqQaO8ob7ZHo
         qZH3Wnbd4n8M3MdcaienrkVyUMAj82yEAe/QU5+p5NmS9XtpY/NUE+L5CIeOTrX4RtlS
         CKWGOjZ84pwUdtaCs7OGaVDS0XXQQhlZUfhllHnXK8VtIABpnZbn03YCMOzpJOvoJJ32
         ePNw==
X-Forwarded-Encrypted: i=1; AJvYcCUQAK3AWrzjyhZREImIBEs29ex8hb8GlQA/tm7A2HMHIgHHPozyjFNcRV1uSjtEmwbYDiAq5/H2SpVDHoDntw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIMkbhjBUOAiHpv528JIN9flxDqhkazTCfvLtl/B+t+nHjQ9qz
	52HyzzpCL9YJ4fdUAEca7zx3tolilTqA0dHC2seq2nPyKyCsXadxDQO+wqTJ8xADhqynLJ00QAD
	S2iMZkBMDlHc7fdXa5w==
X-Received: from ejcub16.prod.google.com ([2002:a17:907:c810:b0:b94:562:edf7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6e8a:b0:b8d:cbb5:c072 with SMTP id a640c23a62f3a-b942e05c670mr611198566b.57.1773050295425;
 Mon, 09 Mar 2026 02:58:15 -0700 (PDT)
Date: Mon, 9 Mar 2026 09:58:14 +0000
In-Reply-To: <20260307204708.60398-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260307204708.60398-1-iprintercanon@gmail.com>
Message-ID: <aa6Ztn4Sul7Os1nL@google.com>
Subject: Re: [PATCH] drm/tyr: replace fixed sleeps with read_poll_timeout
From: Alice Ryhl <aliceryhl@google.com>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: dri-devel@lists.freedesktop.org, daniel.almeida@collabora.com, 
	dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"

Cc'ing rust-for-linux list.

On Sat, Mar 07, 2026 at 11:47:08PM +0300, Artem Lytkin wrote:
> The Tyr driver uses fixed 100ms sleeps followed by manual register
> checks in l2_power_on() and issue_soft_reset(). Both functions have
> TODO comments noting that read_poll_timeout() was not yet available
> in Rust.
> 
> read_poll_timeout() has since been implemented in the kernel (at
> rust/kernel/io/poll.rs) and is actively used by other Rust drivers.
> 
> Replace the fixed sleeps with proper read_poll_timeout() calls:
>   - l2_power_on: 100us poll interval, 20ms timeout (matches the C
>     panthor driver)
>   - issue_soft_reset: 1ms poll interval, 100ms timeout (the C driver
>     uses interrupt-driven wait_event_timeout; polling is used here as
>     the Tyr driver does not yet have IRQ support)
> 
> This also changes the error code on timeout from EIO to ETIMEDOUT,
> which better reflects the nature of the failure. No callers in the
> driver inspect the specific error code.
> 
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>

I thought we already had a patch fixing these? Did it get lost
somewhere?

Alice
