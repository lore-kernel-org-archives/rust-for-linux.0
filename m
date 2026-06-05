Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9B13CAE6C
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647830; cv=pass; b=MPjVcFUO86W8Pgf7Op0U008kB75gXCS/35rC4JYDYd3kJQp+XiBInuAe/DBAZ6BXgpUUiDZuzPObtBMEKseIyIpj9n577oKc/k+2087ffts1G5SaxFL8rSGvvvuAdj/BGnM2zQApjaiCi2xgI1A88/RM8y9c6U9ckdXU13JWoqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647830; c=relaxed/simple;
	bh=ztvFAQnPcWQQLPxoeTzlegVkk4Ybko5X4UCIpwXzV6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kb4qvk1HRalbF1QxSHte69sXs6M3Wj46rxcI0gs5uHuVOZZ7oRU2yledOBjWNmjPL7bIyEEWA8sgRJlpFaod+WiAs1HNpsxcBlE/R3RpoLsFXj6gniwwU60wNMk/1r2UCwZf6rhIWfmZ6aOXRpuEeWbTEa4NjGiAoYrloQsKWQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOq5Lchj; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOq5Lchj"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304dc707bfbso67615eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 01:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780647828; cv=none;
        d=google.com; s=arc-20240605;
        b=PwMsI1mKwJjYamMK/WSuZMgjQ+VM1xxy5gGqZjGTUAVsKubNMNi0bfzxGylGT352Ec
         ueT/0zmRtZHX7s05KB6h6ENN99k1lT0CL6kjfla/KdkolGbcJD/6JRPdcSk4fEaVnesZ
         lJiFGN3v6kAni4Y3V/ldd52Fj5Ue+6aBmVrQ3kT5gk+ridQpNZ6yo+Aqt5HIpoappBJT
         R3ykLbxCZbNxnKbedRawqf9Z94X3AOj+sOuXMnLZlCqXBH/kbY3ZDXQeBsPkp5Xj2yNG
         YWIQ2SZrDlRYbF5Ut45oxdyN7tB0d+aCbYenWSXdNLwB1SIQxTB8CHE11rs8EE5ll52S
         n1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Sd19hW4Zhi7QaeR4Q5YXb6X/rEi4eqFLIxE0KT8DhQ=;
        fh=oOUBA5PlWgtAAbsetx/UCS2u5ZXwjKXpcpydLoX/c3s=;
        b=W98S04KdDDdqaor7qqoFSTexy/KFSEYSu4ITFgyOdi9FLpBWd+/st6Q1Y/v1nKEFQ6
         lVw6vlLvZudTYB/TKOds8BB4uBFJt8diw0oXdCmpAT6p/KtAvemUJ/NDjcGSGmDlpJtD
         hTpc7nFWxJJ8qIgswW9G3Bf8v/OhP2aJJFv40tZt/1GvVZqTLkeq3bmdd6q1RhlFmnpi
         Z3fQJ+4WUOS8FY7wpbAxnI1JI5vJkM6sPvvm4S2C5v3g8i5HRxGCAh8/vof8cquslR7o
         F4EqAr+jtVFPHhJWrygiqBVOlOa3b/jcCyLUDNUFwFFhF9DF3H4wx4/vc/MQgneh3MeB
         qb/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780647828; x=1781252628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Sd19hW4Zhi7QaeR4Q5YXb6X/rEi4eqFLIxE0KT8DhQ=;
        b=nOq5LchjZ3nbtNKfQqPCdeBegeQhdElC9Q0fMBS4fIF26CWJGa5So+ncWAMw9Bj684
         VKYAzylLOvg8olfHfpOcY22aIJj1PZJyNN2MSZIaL8txxqwaRjBWJFli8FcAxNFE44mB
         /vTnaHEbbJTjgHrVaXcHnqdqYp2sD7mGXRjmMqoRKLwmcLmhN3lpqhTTHtb54Nh14upA
         WT6zTuvzY0T5b/F4qyYPhvXSGzYwhVVvLesabVoZ0pwd7wxsy0FqUyWMxIOtkCqgupDB
         BzFWLPRKoCfWKEFV3HKJVnNdmkKTwK791L6awTmXF9nFT4ByVcQRLSlzvKRdPnS9jxRr
         DhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780647828; x=1781252628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Sd19hW4Zhi7QaeR4Q5YXb6X/rEi4eqFLIxE0KT8DhQ=;
        b=gZY+riOyVEZ9hoAaJX4pyZQEFkM3TsZObr+RBs1cdOEb8aYcjLN3anu7WTJ/u6b88w
         9Dy6SZ/mZEwSpNG4KuJ57JkmDCSQf5vly9k9R9dcbLVLlJDqRMdu5spOgs2F0rlR8LwX
         zD0N7Nn0PV/kHZcBUIl3lAIvaqoWNtfvaGCAo98Elah9VxbFbsdK9uFf2TcTiFP3bTYE
         LUwXCINoBkW4C3FtTgzjBmr90WuIYWebGPBHzOqslGDZ7lbsTH6BFJMN4DdbKmtKWZ7i
         4dNncNqSO/gZdkYVGMtFFV6GAQQvqvtNVBf1kJlGx947rIMb9aBVT4a3CV5DX7f3BsAh
         1fKg==
X-Forwarded-Encrypted: i=1; AFNElJ8KWyqf0u33JcfUA1MMr2yzsipbS1YAGQuZPd0h4YTe0+Y2+ptT0IaU4dkHLsWiQOFBC5cepHXmvRJr/Ig3tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQuvKevsCU8Y5Q5QFmtO2YvMyWeGXkPlPrY9hlYrqBmAXiaS0Z
	txVDAL7C7TeKWubkuMu+VNhgZntU8bMU+qRz3MBt0c49monV+A359sjttHaMjIU1RSrDuPDH4Xc
	QHjEmZd71Zrt9sD31QMBCMvK2hSKU5xk=
X-Gm-Gg: Acq92OGk2bKpzK70T1yT3w3GJwXp9nd2xx/HmL2VTKubi97vtADyVPcnDPKUpNPnHmX
	ReF58ca+/zzVEt2E8+eYItNwJB9j1ELSfeKfkRQUe3tcXhmhf+cN8w+/zw+svhu1nrG57khLq73
	qzXpj04h9LKVGjg6WVEDEsI31Ug9UkIv1ijK9s1NZrpjHBPnn8P1DDM0NBNP1hzCEkQ6tQ9aDbR
	FFQeFmnUWmv7rUcMYNdy0ucEHL3ItFAw12/UeYJmVtwJg+STviFJ2wOr0ESHezL8Y9M32Pba70x
	aNXGM0qPYHFMMY9ZPoSmBtsWuS0BxuaQ1a003uCT7fqO/plT2YfWurMf688xGMTLFs8s3GCviIH
	O4ogKjZR12UwcOc17ZWafEOUHYMMb1qilDw==
X-Received: by 2002:a05:693c:3749:b0:304:c73b:79fd with SMTP id
 5a478bee46e88-3077b21905fmr565626eec.5.1780647827968; Fri, 05 Jun 2026
 01:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
In-Reply-To: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 10:23:34 +0200
X-Gm-Features: AVVi8Cc0V_mPWbgZwqJ5GOMV5Xx3qEWLtYtwsW8Dxd-NGXwfyyP5qAGAP7_StUw
Message-ID: <CANiq72=87b1heSP3ssk4+9E4+1Vy_Zk9eSC_9EF9Cs_mUT=hpQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Rework index projection syntax
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This series reworks the index projection syntax in the pointer
> projection infrastructure to use the keyworded syntax to be more explicit=
.
>
> Doing this allows adding a new panicking variant of index projection,
> just like the normal index operator. This is useful for cases where
> compiler cannot prove (or cannot reliably prove) access is inbounds.
>
> The new syntax looks like this:
> - `[try: index]`: Fallible indexing (replaces `[index]?`).
> - `[build: index]`: Build-time checked indexing (replaces `[index]`).
> - `[panic: index]`: Runtime panicking indexing (newly added).
>
> DMA sample driver and nova core is updated.
>
> Danilo, we previously discussed merging this series with I/O projection f=
or
> patch logistics. However, I'll need more time for next version of I/O
> projection (implementing view types that have original container type
> erased) which won't make it this cycle. This new version for projection
> syntax rework is minor changes only comparde to v1, so I think it's worth
> sending out so it can still land this cycle and get out of the way.

Applied to `rust-next` -- thanks everyone!

    [ Reworded docs slightly. - Miguel ]

    [ Fixed broken intra-doc link. Added a few extra intra-doc links. Rewor=
ded
      some docs slightly. - Miguel ]

Cheers,
Miguel
