Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B704385523
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 18:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772131245; cv=none; b=GI8a0PCLqHs7FIEJsxkmTuIuZtHnGnxfmG02zSV1hZyWfMGnnuTxbq44OpfgUozq9+rtm/1xEpTKbDXyPMNM+5bFPMZ2X7pqNzG/WSSsNCHqLIMhMIkaHKPx4XgvhBu+zpNFZyuqvpbCtuLdqqrGuV3Ajkoe40inD/E6L/Le7zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772131245; c=relaxed/simple;
	bh=5ty71ZP/kn9UYFYi5Gf8attnjAgfMP8XR0y3mMnTX88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXB83sScKimDubpggPOm68r6KXGUx9l2mHflol37EeYhe/YWf2HhfRZv3dqO9gjU6uAWcx8l2TzaZUIxQ9hN4tR8BkAO/FeQ3i8f7osYq9bPGk94i7XUep466ZEsUjzv4Gs2Br7LAMlU5Ahr7J2Hfb4VYB8iDCHWMilcTgTdbEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtEut1M1; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtEut1M1"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65f9a875eabso2371598a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 10:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772131243; x=1772736043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ty71ZP/kn9UYFYi5Gf8attnjAgfMP8XR0y3mMnTX88=;
        b=RtEut1M1Hf7ppzqlx6DFODu+jXyhzXeyJ4Fgkv9Kq0aWDsxSq491Bs0kaIapAgANAm
         aTceN1nrdYtBVzb9tnge7sDTs5tGLEhoIc5Dpgtq4y1rIUI5cULRGr5ahkz0wrI2S7Qz
         oCOkNmo68x/7Xv3jza925NTcvh67rk/IaHwDzLTrx+DAXVnZjTIdi1ESpqNxxAD83wID
         S6zul0ykh8Y/521rRsjfJjCEEARESf/4E2yZOJhIDBJvtZz7VUmyybVzkzlyCiQunUhG
         UpXuE93mRXJZLmJMcr6NmDHgDdKWOM024cHZuBmfIqYotDXfJ9uCh30Xn1521aQThXAh
         UBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772131243; x=1772736043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ty71ZP/kn9UYFYi5Gf8attnjAgfMP8XR0y3mMnTX88=;
        b=au+omnFqzCzbAL5UAeMwdOVGS5QaHPcH6ZTEDEayAp1Oo2RfVkmMJXtVLYJwO8gA4i
         OqETy8J+keBHVyMHCOWqIAUgRk1JeIVw6reXVkz9kilCpG8WudRR/6wTqsfRL3bpAOJD
         khollny8P5N7LSLFyzVclhzWTz8JVUWvBHdgkQfuscSMl3ZqM5KG/M2JdVZZevMuadAb
         RNvEO+pOczMuaSmDoQpxFC3V+XfytV2eDt1Tgw9CGtl8EHuKyhxh9YOFwTHGksS2QRkz
         iW0A+t3Z4tT0iyOJgXMmeUI9HokPdIzfI/lnrvG5DKkpCKV3ORdFCK58HTgILG6+P+k/
         2E3A==
X-Forwarded-Encrypted: i=1; AJvYcCVlY7aRrzqIwUcCAoGE9A2KPYe/kfJca064ukmIL9nQBPtKeXc64sn9ECU8H73cBk6pkoda7NFv2XT7Gvy/0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsxye4mZulc5y/Aeavb3gVxVzhI8Y74lMxiL5RpdaDO2Zzq6j7
	cZuhzvAM3mr2Dbh+Sw1VPk8pF1iDbWu9Y98r1clBRc7dvH5P4k+Qok+S
X-Gm-Gg: ATEYQzxZLmPo6Drh7Iq5Nrck0gVuy46jz5v6HvHmO5DoWnjDFqNqAY8QyEavGDzqlrj
	xMREkRsvc7TqpM9NvtMXFjaOC5NEpBBM3SeqBw3AuLgrcWhGZVSqNdIeGByS6ak9Q3/4JnhjI4J
	YLKH+zIFhtjx/iCY52pkLhR9IBQi5VO4LrCXqXdOJxtTeEU8iYs6c1gVT8otDlNEDrYemav2NJI
	XQRh7s5P1x/0nEtMZtPZ5R0GT0VidGFoEOTXaZrAtQ4ESmf90SJtu5vCUzWbPJwRGmGEKpggkET
	vJVV4g18o2SZb3+ixSd+LSScxtXs0MSp+KFOTa+SLsA3bd31RjyLmBUtQ3JEPW2IMSbQdr9XsWG
	NDnHLuFfAUDT/VA+/HE9SklsYaZuCJkmiNzJPewkpmlyBjDdWvbZWk+NfsMunnlXsiMlYzZnJv3
	2xdXGx/963yclNvnQoUwvH+UwsXENbPovQDMw6QwVUQalKo1ustqLNBNv08Vsle7upfVhcxemj9
	gTAdeN6xXddKGja1jt0YCrZws6lPscFglnuRNS0m3vJPsA=
X-Received: by 2002:a05:6402:1467:b0:65f:9c21:e69b with SMTP id 4fb4d7f45d1cf-65fdd6e2ee8mr211415a12.10.1772131242711;
        Thu, 26 Feb 2026 10:40:42 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-002-207-075-089.002.207.pools.vodafone-ip.de. [2.207.75.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd36219sm669054a12.3.2026.02.26.10.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:40:41 -0800 (PST)
Date: Thu, 26 Feb 2026 19:40:38 +0100
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Levi Zim <i@kxxt.dev>, 
	Namhyung Kim <namhyung@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH v5] tools build: Fix rust cross compilation
Message-ID: <mnakvrusyjmuq2zwdjataxq5wc3m4bhyynbwdku2s3kdvtsi5f@2n7t65aqbupy>
References: <20260226170025.517743-1-9erthalion6@gmail.com>
 <CAP-5=fV7OuWN9K-wnsS7zza+s0FQRSR_JCcJi5tvpgQAbh=Nnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fV7OuWN9K-wnsS7zza+s0FQRSR_JCcJi5tvpgQAbh=Nnw@mail.gmail.com>

> On Thu, Feb 26, 2026 at 09:10:24AM -0800, Ian Rogers wrote:
> Not a cross-compilation problem, but is there a way to pass-through
> extra flags to the rust compiler? For CFLAGS we have EXTRA_CFLAGS as a
> make variable, but I don't see an EXTRA_RUSTFLAGS. I was looking for
> this because I was trying to make a build passing "-m32" to CFLAGS to
> create a 32-bit perf binary. The link against the rust workload was
> failing due to the different object types.

Nope, not yet, currently one can only set global RUST_FLAGS or per build
target. But sure, I'll add this in a separate patch.
