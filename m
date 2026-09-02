Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BA149483A
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Sep 2026 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353485; cv=pass; b=KpHAxrXQ/CVSwB63UaENtw5pbHZjtNQ5AnB4SSkOryLWNrND+cAbMsjAjIK0CGnMqoDwCPzS0b+tSpYD4raGfb855SZ6iU4hNEUjQk98fqlmvtk2PUHli2zxz7pMvgoQ5R7B7fBZK1mcMoj82Hg6eBKpyl+MgGJ6QSrk5Avtzzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353485; c=relaxed/simple;
	bh=K+swk/Ji08AFq0DopEKTbabw+5YxSqNaLFc8HIYssWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z1d5Rz6QHx06Jr9ABVsnYjBaXttA+JT18gqr0Cbv5O7zKPuF0KyXw0qOKp8SHK08msLC7M+Cqc87kRSLcWwXpdU5IE7BJ5V+yEHSdfbnyC6tRiQGudUkZFcNtiYnlCtd/EsAMk0v0t7v6c290HzZ59SbJDvmx+P4MMwgcZ1luyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=LIbh+SCH; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="LIbh+SCH"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66dee7a0c09so977235d50.0
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Sep 2026 05:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788353483; cv=none;
        d=google.com; s=arc-20260327;
        b=Wn92KIizJFSPGs6JjOSAbhJOc/xKiuEyzJ9Qc1wFbie0GAaHZ6SKsKTsJMDV++qQpn
         8F1AlSWARM6CO1ZCQ6irrK1af4kg1dw4znttDfF65d8lGrh6f74rcpSIa/Uis7AjpqvJ
         8U3lN37TPlLraanM9o0p43poKaLI36Draws7AWWv7hGggGzp2JJRB8H2zR0uaTCE2ZG9
         ywj53hxvjJ4liFfl6PnPiLwGBtU7BW5GpVUqGPDS7eHOqV2OGreJLnsfzwZgaEKIWcJo
         wmEqywowp6y+Fc8+80RJpJGjva20VHYv/qtsT3TFyXlbJemFGkprPuQH/GU3U3lRtmc3
         V37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aoJYi83K5jDu2HW69kc7UQzbMHQ0VncPovaw06vhQ9Q=;
        fh=oTVU51C0pl8x9Exs0EZK1MHTGsWYmvF7NsyIsO+DMpo=;
        b=Oor+RoYYZGUwZAZRNvy+UD2lAxpNrmiefqDNMMFgDE2Kruyau6Ot9isklr8tRgTv3D
         8izTYDe20fUSVVrg3YDb9AcFx61xOQTbbtNeYFAaTa/zPgVmBRsErb/6dVDnresXczP7
         9qt5J4nChR2dNodIzw6ijVuxujQPUu8z3xrSTl+lfUm4IEXiQLW8VYw2/EplhQAd3DUW
         adcFUtmvT+VAwCtlY+bsH7gdHnIzPl2+AHDGStVmkfjarw5j/qgDinOomtSQA8jnecRz
         6eHJMLZaNahN5aELGJww/XcP2fj1JT2XjJ+JuG69h25y4LOcoxzm1bRCzUJOSdW1VFej
         38ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1788353483; x=1788958283; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoJYi83K5jDu2HW69kc7UQzbMHQ0VncPovaw06vhQ9Q=;
        b=LIbh+SCHe7Kztt3Gfwy6XNZRmIF5lVKD4PG+iataVenLJfPDr5z03HhSI04Wr/bCJc
         0t3oxvLMaIZz7StbZVoROXT8P5QTA3rwm2GBXopaD1kSBeMGO8U17Aoy9uyPoTwKkCAf
         B4TBje2UUyztxGNpX6C/Zqp0tNxZ75sQdk/uoC3w6GEf/5ASeSuhypVYMKlAvx1nOwsc
         lE3EQ5kYgnBYsxv6TQpTaH9T5LqSE9Ul+iF2ULn83JDY4S9hdJZ9lRaYRX8me7Q4cvp+
         1j7uTyDSFs6tJs9F+gFRm8p6WGpiuUZm8VNbeiGPHnvA9xfDKnvJ1CvKtUzhTES6r3OP
         /Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353483; x=1788958283;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aoJYi83K5jDu2HW69kc7UQzbMHQ0VncPovaw06vhQ9Q=;
        b=pni1qO8LpDpYtP/Z/UWYtamM8RHLZR1+7UWZdILbsv+DqZ7wHleLSTDwqftFt2Nfns
         uHuxfEOLuaKp7t8UISZiVD129eGdyufmAORR+T4MQ1l9IDHLlx2H+VZN/zxciAzsMg2l
         02NAWoLuFztnTzXlnee4E85GoKP12y6q35MMfmBTfid2sHlyfSLg4BRG13fG5t6+E3t9
         QSBBlcq96CMzDdrZPUDhAqPzTkoiITKP2bJXVNNAW+UDkc6smBdSQNdvB0beUH9+rSE0
         8tXy/E6OuQsEu9vDGJVx9OKT5iR5nwYMJ9ydWMXdnX7/osxad5q9gzS+F0y9S6kVa+O5
         iGrg==
X-Forwarded-Encrypted: i=1; AKwUvBwPpeGLFQm+nZoVEJ+RjChXl1DyYV9Hl0sxr1tf9pxUk4yg4jXWuAql8x0UxqCgpruMX0Ba7lOhxlTI0hmH4w==@vger.kernel.org
X-Gm-Message-State: AFuF++k6+L9jWkiKu+1cwosHdUv4Ff/UzXGt/j0p1HifTeFOKUstISCQ
	tJFXmrNp+EbikPs5013BnB93umANNQZ4qLRRfTxNXMQl67EfRUqQvHTFlqmXfhCad2LRHkRFgq2
	4baTdBEmHJZ3WRU4UHhtwIdX6AYVy2To1aeKzrunr
X-Gm-Gg: AYBFou0ZB+tkk1l2uDUkdjo6fzGAuosEozOsJngeosKv3nd73nB9MHyF2f69Xy0LIpa
	HgFph82SoAbvl2NQuZpuSZoTc7CZd3G9e2QvwhMkKrpT3bQmm+nf5VgMKV7poXsqpDjtTl7RNKt
	X5heq20o11k4nvXmyMvwtGwjSJrTDdWYtLy8zDT+6rtb0/kzihGR4YyKrFd8urjNpG+WiHQtCix
	FZJSgCBR6CzMvHaQ2wbyszkorjVvK/yo2OcAIcTK6WNvryQfKM9WgKgjnA2LMs6X7G7nxhZwCU9
	ZSO0AeF3xwOjGgvDiM3akFV5rAmf4VnVm+J+QuK1RdVWDvWbtK6WXyLLdmf1p2JgxsIZi4e0WMG
	NpUbHyjTD3hxy34gw3Ew+7Uleyt4nh1MMJic=
X-Received: by 2002:a53:ad4e:0:b0:66c:c638:8e88 with SMTP id
 956f58d0204a3-66f9b8b0f42mr1278753d50.2.1788353482983; Wed, 02 Sep 2026
 05:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163004.3365-1-mike@fireburn.co.uk> <20260826163004.3365-2-mike@fireburn.co.uk>
 <20260826220918.GB3382628@google.com> <CAHbf0-H-nZzg=kGkN-yrUdfUUrruyN0x2inQjhXxOy4RAauDOg@mail.gmail.com>
 <20260831170546.GA239479@google.com>
In-Reply-To: <20260831170546.GA239479@google.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 2 Sep 2026 13:51:11 +0100
X-Gm-Features: AcwNN1UyIQqRoEjaX8v-C9V9M526WfqSWSvyF5UWK9e5ESZpZjZxqm_sdht5to4
Message-ID: <CAHbf0-H5pVMz=Vk55K2mNHiA+cYL5Sg3i8aqmqtPR5tYOMjsCA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: crypto: add AES-128, AES-CMAC, SHA-256, and
 HMAC bindings
To: ebiggers@kernel.org, linux-crypto@vger.kernel.org
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, lyude@redhat.com, gregkh@linuxfoundation.org, 
	lina+kernel@asahilina.net, mmaurer@google.com, ljs@kernel.org, 
	joelagnelf@nvidia.com, bqe@google.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026, Eric Biggers wrote:
> I'm not currently planning to make the crypto library expose AES
> functions that take raw keys, since computing the AES round keys is
> fairly slow and most users use their AES keys multiple times.  So in
> this case I guess keep planning to use the sequence that is already
> supported: aes_prepareenckey() + aes_encrypt() + memzero_explicit().
> For CTR mode, use aes_prepareenckey() + aes_ctr() + memzero_explicit().

I'll drop the rest of the AES from this patch and leave the one
remaining caller, the HDCP 2.2 dKey derivation, a single ECB block on
aes_prepareenckey() + aes_encrypt() + memzero_explicit()

> But if you're using either key multiple times you should call
> aes_prepareenckey() just once and cache the result, as that is what it
> is for.


Thanks for the review.


Mike
