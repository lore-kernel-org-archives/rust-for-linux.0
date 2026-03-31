Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F255736BCDE
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951877; cv=pass; b=k8j2P1CW/3twc23xVs56hzCJ3EpbYyOeQ7JCsDd3bLaNnZ09dTfT8N6yHubImVN5cyNXjQ6CspZN+ipnn8K533Y+DPb6A2B9BW/txg7+bKtfxannI3RM1e1Osps1DcS2Cva61rBnfRHMw2z9Am/HH3tjEiHT9CX3W3fUnOTUwxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951877; c=relaxed/simple;
	bh=BuB9OAdchbjZ2fJnCBi8+LXdUDK8kDhBZoLPIaO+/7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgWuRjkooqnwOD+k/JChz0mquhlDe3G5hTUooqLRfcpxAB4AAOgvE0ZiBHDzTx3sDooWhxVnAhydR6A19hSgqZs2vBT2TA7pl2OTL6naIu/d5WmFzBmRsE/n8a5V2Ap+saYSVlHfQLPzTHsjuTnvnV/ejNkgDHgTtSbpOQwAeng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLPAX4bZ; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLPAX4bZ"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bd5658b901so199840eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 03:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774951875; cv=none;
        d=google.com; s=arc-20240605;
        b=JA89KMI3f7kAcMkVMtu8BqfRpTMFtmCTdGpdSnbwgTs9LkjL9LLSv+whuPWRBccaJy
         42sAcF2NB5BbKrX/ISvZ0GNDFCq3SyGHKcMvS2ACKPh1hWmQVi4Y+T0rLxHEedNUHF7p
         xTAcHsUQzXIO/q29nb65GRRzCGkgqw1OwlbICfg6h+NVeOYJiBRUV2EfTj4TCTuQX8jK
         OhYYVISa6WQhUQWM2eFN/FN2bmYq9JwjWxwGlShruVBktlhEjquYiW7Myu7vJvzWBuiJ
         07FeV6HPn8qTuAnx3VwXRyBSEgmltYv8sIZoOAtFlbVb5uErQFnGJdd4eDNQpbFDesdD
         UIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BuB9OAdchbjZ2fJnCBi8+LXdUDK8kDhBZoLPIaO+/7o=;
        fh=JNJAXOVPsHRemMey3zmK8nUbkkvjVTLpQmaUY1aB4v8=;
        b=X2SQntiSIIEz5DfXv+og+q9HvMtdes/xMAeRa33sDMgdRegINZprqmhwwJj0i6ra/C
         hhg28B3xJbkkMo8nTFir6d68eV6sDX0GgcXDgfa/1y3b3TrBzGIgWY9c/kPEBy13xpmj
         Q5IDXCTLd0Yehn+dxWhH7FUO1GvE4t+k5svjYLa+DR/5iLvshoe6jaMbPrTwF14LrZ1y
         lumJPjX9VVW2I3XgHpYWUzcLAz5LdLtBnSUfjqmg5oigz079CP7/LRC7GpYa8T/NBNd1
         F5PMhZF+Rh+iZM7gWSXFFfzb62PIiXKDakBcNhh4kF/0f7NZ7xk2ogeipPppA0i+viRs
         /1Ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774951875; x=1775556675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuB9OAdchbjZ2fJnCBi8+LXdUDK8kDhBZoLPIaO+/7o=;
        b=gLPAX4bZLbFDe3BIjvh5WgrKtT0qiVHFwz77EYihWbT+/wS88EkaOi/k9qahFqDuuy
         +/lG8jZqDIRN1FLDJKrp3gwNmxeI/YuhDW3ZDQEaqGHNnZC+rV5xPMfXl1ERodmAPrmt
         wzXyZKtRY4IibVuRmGYKAFbGKxSVYVo/3DfCA/rPYisZPFgB6A0AbpmUvjO6+teO32zK
         91vhUc4uH5zxJP+vtaudDq5bRBG0CRsHV085wicgYmOi+R1AuBBxT34kRcVgkpCown1V
         psxK+v/3/BDxFMMpsuPhfVW/WDNsp8Z0SQIFg9vyc/VeeiVfNv/fOv29JbZen0cNP7xO
         3iEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951875; x=1775556675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BuB9OAdchbjZ2fJnCBi8+LXdUDK8kDhBZoLPIaO+/7o=;
        b=LR2k2dFQM0klIC/EusR4xdGUWlJkNd9yHJCnsbXQ/9nqsHOVPw3YTdpRf2vcryma59
         w1dr03BeV59M0jJnU8O0bIAIWpKogpXBtvxQl8+7R2wKszfTx1x/bXarbhUtfW4wTvBE
         LZCJLA5c8z3iHgW6ep04+gdhyik5AnMKL/7yT1Y4ryE8iH4uzmcyTYv9opHv1kDvYq5a
         Lvlj/fDaeIeX0LOTrD9xtzBEy/cS40fuL3CDHe8pC2kiaMAsRVgBotriBv6BNXCoReVc
         RODVuPLg+fIaX2+Qu3ETOMowUW98+wPwwt/HuOSUHAQivrDXZhCzj/1SkxTHQonsRNNz
         BUqw==
X-Forwarded-Encrypted: i=1; AJvYcCV7htuK3mySOIIeRA7YR56IdQeH53cgaIqwqSVZYK8Pj7+lv0GtYPg8kCKyn2Far7HuK52urI5S8MKar2nSiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza5mhYvE2PDcituc9Gh8pNWmByAqO44wAdmcMNtOw8VY5Nygq5
	TQGsTZmJ6txsMi8fw4B1PF3SDaNgQreU2TiL88wKtRho2y+rbra71G3qM9DuFaZHL2JmaUiriXr
	Iw7O2sGHYY9QnbTIzUy1yrajYxYFyVjk=
X-Gm-Gg: ATEYQzy0vZVB700+7xS0zaNUDl5ije6n9yGG8wSWlNUGC4AJGwZRO1WMzpuiffkZ2rv
	imxbsPcTQOeyn0nHhRpxZxtvAmCBi+ookvP2ii9astqbvx4T26MWVj9GDmfHh7M6AMINn8RgoPV
	IqDI+LEd+6kT6FuCf+mAL00Cb8dCOI+gOgCa2cAj5lWlGGfGXBmw/inR99YaRAinN1mF6c29TPj
	fStWR7yLBQPrmDozEV8XH2biBiRzzMSk7PW7eH+2z7Q7xAqm8lD47L9EK4YPZiVJcxRdecHkIbi
	s8SnqHnSj1uL3HAPoxIt2D79BhOh5afs0HId7YhM0HN9lNdH6cyhi9eO2Agj9dEJXpvcq5sVdGo
	cUPggy5ys+ESUDrl+OqnLC48=
X-Received: by 2002:a05:693c:3008:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2c185edf989mr4029939eec.3.1774951874996; Tue, 31 Mar 2026
 03:11:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
 <20260211032935.2705841-23-alistair.francis@wdc.com> <20260303150040.00007458@huawei.com>
 <CAKmqyKM6CBucDEo0aKZVWrKtozbT_ddk0PaZFtHyEMMMx558JA@mail.gmail.com>
In-Reply-To: <CAKmqyKM6CBucDEo0aKZVWrKtozbT_ddk0PaZFtHyEMMMx558JA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 12:11:02 +0200
X-Gm-Features: AQROBzDcDwr7GVEqtGjVwGa12fqkwc3LQ0Ho8hFkYoop4Cj9bvScGclhoV9SimU
Message-ID: <CANiq72nOt1E8=GYdh2T5BWNvG7J8sZRF+60taghoxKm8fkadHg@mail.gmail.com>
Subject: Re: [RFC v3 22/27] lib: rspdm: Support SPDM certificate validation
To: Alistair Francis <alistair23@gmail.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, bhelgaas@google.com, lukas@wunner.de, 
	rust-for-linux@vger.kernel.org, akpm@linux-foundation.org, 
	linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	wilfred.mallawa@wdc.com, aliceryhl@google.com, 
	Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 5:30=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> Yep, same thing. My way is the Rust-y way to do it

Hmm... In what way? I would say it is the other way around.

Clippy should be flagging this, too.

Cheers,
Miguel
