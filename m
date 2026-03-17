Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466553E869B
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 14:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758629; cv=pass; b=R1toLL/bIhlE4PFiHI1lfSAU0EIjRfGLHEhE922KOD3LSJ9m5OsCuAKTFVfCe11GeCb4Be/aGOTurt7NECaGQ6s++MkN5dl58nuOw6yCb9SBW0gQGGWxMLJ7aIdkHvZfoQVQfdzlm+fWuMa+MyMLnaJasDWSokWHRc0s3PIWmLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758629; c=relaxed/simple;
	bh=bAjDAgNxxOY8q2SKVtH3m76VLWJXframDsv7g4XZIBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FgJQ/xo7Ah1qEOHBOJXr+lmBfXIFge0bcZW9N+0/EMSIWOhN3DnWc+LonTgvmejQRQ4otOv1i/ubbP8JuxyFFlcwLjp/NvSYjCpIeal559z85PBS0AS32PHn6wszIycZCjc0LCAbxPNJzq+B1txsJKjc+ivs+uRly6PgAAwVNJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wfs2egqA; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wfs2egqA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439c6fc2910so4424792f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 07:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773758627; cv=none;
        d=google.com; s=arc-20240605;
        b=J9Rl6eupWlke8fWMzUSTwzW8S3Pc8WQIpWDxSE4sja4T8nWZt3Sa2A9ehLOeeQEaaU
         oQDrTkPCBhvf7Tn+URj24oQ8i7GvU0DPpkzFbHBT7wLhxFh/lfurMa6tCJsXFgnpba8w
         PeqQGNdIaG51dsQgpxnGg4kxOTzAoNpKfHAdhjQqWJCbsHsaMqHuEeV+bUx6exsPHqo8
         E+kaBeKz6EG7gGLXhBwlSa30k7QQshf2GEXPmyVS6FO0AmnQ1Wzs9uT6gM1v0i8ip7+I
         boG85GvhBVYA5y9M4ts0XrwcpOGM75obFg70acpGcIPcVE7DHXJaVpAw80ywuPLVZRbH
         Sl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bAjDAgNxxOY8q2SKVtH3m76VLWJXframDsv7g4XZIBg=;
        fh=ZhxNwy4kQyL3EHoYkC6/qeuE2zOZxvWR4PMkPMK9ZeE=;
        b=Jrxzo+aVkGZmazj/0E1mcjJpRVxfILGRKr7RDIEMZQFSKw+1TxRgcp5KjpgAYCcO/i
         hYqeqKbDIxnv7Ql7bk0ZYUL22XH/cIIJhJz8AQ8XWDw+IN4QujBAfxeJF2zkLz/CtPDV
         ktv5cwD1IpQmOoWHoV4RaEaF+3GsGGJF2rF9WFiUxyh+LAElQg1RyQxXlMUb3gQJ0pA8
         HttudNcLbimaaWkz55jGBGmMGnNU6V0WLPX4IOAEZNh4HyHh1oZ356E48m6IXqGMd4ub
         zINLaHs+v7xwhyeR6EZEvMVOCBsgAYapXS+D1mFtOo60oxlNWmqKK6uhcFidzNOHkqxS
         kmiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773758627; x=1774363427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAjDAgNxxOY8q2SKVtH3m76VLWJXframDsv7g4XZIBg=;
        b=wfs2egqAb/R1+kLAqm7NYqve+9RoVck2t8DJfnP+B+N+AQnq5gPbXul7wu1vLYGFn2
         euhbxDRulAMkd0WJ7srlEvtOi/H7Z5FX7S0vlZWDMSn1snZDPCw/RWuHZ8YUdilklbeT
         DUxzAa7PTrxPJW1yRwQ6CZqkxfB/Umi4hvWagUZkvU5cmgnpnxZU/jkoXGK64DCcBAxX
         aPaJD8PLxApf3t8R7VctqfmDFelcSYk3CJmIDaU8oJK5ktUp1Yn77krWMfjLqQldWIsU
         IMs/T7CR9DdTHe4cZDwThtXwwcdh8BDV3gJ5+bl8JS7g8wtBWKwvOqb4UV/vfxfntFW7
         0iRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758627; x=1774363427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bAjDAgNxxOY8q2SKVtH3m76VLWJXframDsv7g4XZIBg=;
        b=ioGyqKlPNYhtD3OWumD9gsVMyVkSulPzMhCxZXeJuumA93r+b6+uPYXgB7Sndczx4y
         WYO7MC4ZyESAi3KP3JL60SfxjSV02Z93ErHQ5Kk5TCE4NmxXKdyuGRJFMhmt/OpQ8QO5
         JrY2KVHgWcCf2T2aTuYm7tRXLQrXL4AI6qyIW2v3TZof8bbGhWGXqLcYZ/sUqocvYlgn
         t7Az6PXpjzaHGC3WjHBu36lNEc1PENrq21++umg6bKsk9hzzWxbnjx861/66v7O/dwov
         /kirFW9MX/fbzpVJ26kE6s5OHu4GpY/2trkAhdfa0KCNaCWnZlGnhaM8hR1HizC6hCla
         fqnA==
X-Forwarded-Encrypted: i=1; AJvYcCU0yF8hjG87NdfwAyc7JlkC/UQBCYFv2mvNxgsJe85R3sSSSIFHimGujAnkD4TXczHkAbyJkv+ISSCWRQNCiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZX+43Afs6qhek5mGnqyZBFELPLL2GLv2u/jtFbEEXlqXzKyL/
	StZ6hoDrspldwsxD8Pau9nNJfjwmw6NYRjVSAxTlGpXrmMbh8duYUg/yHL27A4vvy90YRCZfe1X
	Mldf5CNE8qoXSFLrkptRlGQ+ub8ETb3uCjForhLPb
X-Gm-Gg: ATEYQzwAwvzssXRH7ppTTABUa3O0rWHC9SuVQ6MyEo/3jvVAijMcDs4iNQnuLbos9Z7
	pLiNqy0r0ZCke5cmkC2MAf8gVRqWrGE6rIwl/PG21PHy3jfdK/kr0rwdM0OUdrMIBTbEKl08z+Q
	jGHcW+YPGMeDY9s3tGnr8m4H9UtTDt5FwDiw+yJnxydJk+AHlA8bU3wyA/7hLoqBwRDuVaFTSHW
	jiZgg/g+GChgCU6Kng2yK5WKTb6794DVkigHPn5YkjnBkfEoF29wfnMgj6qq6lfIjkAIpBk1al2
	YUEr9pw2X/AzfNf0y9XgLIXKbNAJ16Ao+z4q0OPbGStohp6SHJRrNTkMUsYBgtTJMihRng==
X-Received: by 2002:a05:6000:2089:b0:43b:498f:dcfb with SMTP id
 ffacd0b85a97d-43b498fdd7dmr7040022f8f.8.1773758625958; Tue, 17 Mar 2026
 07:43:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303162314.94363-1-dakr@kernel.org> <20260303162314.94363-5-dakr@kernel.org>
 <abj6I9c_2IR0cKJ6@google.com> <DH54VWW1RXMQ.34MLWMQ1ZE0I1@kernel.org>
In-Reply-To: <DH54VWW1RXMQ.34MLWMQ1ZE0I1@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 17 Mar 2026 15:43:34 +0100
X-Gm-Features: AaiRm52v56DZ-OgaA6yqn_n9aUY-kVhP1nzCEQDyDgheJLFTSiIY2bIqeepmrHw
Message-ID: <CAH5fLghYV+k5=dYwxB7uRjfSMsE9_=JaOWeBZd_EdoeSQh4C1Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory initialization
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, driver-core@lists.linux.dev, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 3:40=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue Mar 17, 2026 at 7:52 AM CET, Alice Ryhl wrote:
> > On Tue, Mar 03, 2026 at 05:22:55PM +0100, Danilo Krummrich wrote:
> >> Currently, dma::Coherent cannot safely provide (mutable) access to its
> >> underlying memory because the memory might be concurrently accessed by=
 a
> >> DMA device. This makes it difficult to safely initialize the memory
> >> before handing it over to the hardware.
> >>
> >> Introduce dma::CoherentInit, a type that encapsulates a dma::Coherent
> >> before its DMA address is exposed to the device. dma::CoherentInit can
> >> guarantee exclusive access to the inner dma::Coherent and implement
> >> Deref and DerefMut.
> >>
> >> Once the memory is properly initialized, dma::CoherentInit can be
> >> converted into a regular dma::Coherent.
> >>
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >
> > overall LGTM
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> Gary and me concluded that dma::CoherentBox would probably be a better na=
me for
> what this structure represents. I.e. you can carry it around and use it s=
imilar
> to a "real" Box until it is converted to dma::Coherent in order to make i=
t
> available to the device.
>
> Is your RB still valid with this rename?

Yes.
