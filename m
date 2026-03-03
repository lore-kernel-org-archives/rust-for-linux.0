Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3FF347531
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 21:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572435; cv=pass; b=RFvRYhIQBywretA5iD+n5KljCH6+KnbUhmqhAZQM4gFo/md7SaL3Yoa9INDLj8r2bPneh2sKOf4wWpZtTll0gH3uF0asjlJEI74PiXePVctaTZ1qg/MN/eU/g2Cj6KIwIv/UP+WKLHdi039YVCQAWXbddznMwZv14EhKxNrc1i4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572435; c=relaxed/simple;
	bh=K7285z4a7v/bWl4xO+qaw6D2aRgnI3Erv2A277LduLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kwbtjkv/zR0ZNdT/Tz4keOj1rt5p2g2UZ6WP+jIajrVDF5La59oBMV+MUpTjfleeRf7t03XuSDXcvxqCdJ7CvuyDCOFn3Fm+ZRw67PxAQsMByEed9gbUlu9TvDb8XTnfirkDXOgw5nmG/36qYs3tui8Z7pFhzKiLy/U/2ShaySU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYn3CE6R; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYn3CE6R"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2be14f5827aso119270eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Mar 2026 13:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772572433; cv=none;
        d=google.com; s=arc-20240605;
        b=kh8PVYHB2c0uWUtWi2eScOVe9vPdsl7d4arSVMVPZn8VFAThSM4vd2FQZ56As1NmZf
         bZow8607jKtLYS3Bk6362FiKS3X9pHlAeY6Mtk8DarR90ih2wv9Khy7XQQlqvbNxa+zR
         7llw6Ki2XwdiFrzN/ZSvuoh6hRDan6vbnVsQbYIuNd9u9LQ+Ts6VozmTgYtHKSFpVBGp
         7wzpN8NmSN0mvbxIUL5eUU4j9K0ZYcMkEN7I3dDWmq/a6g+8HJXIGldKXKmATWQTAvcq
         epZDW8mf+EAoTwDqQVsSTj7vdUeNWH3QL0ZUMWzn5Ggy+YORp0hvfhk1WqJ4na9ylsL8
         738Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K7285z4a7v/bWl4xO+qaw6D2aRgnI3Erv2A277LduLI=;
        fh=eE1yoxa/E21hQRxADtojgJAdgm45XEYDGfB0SBijlng=;
        b=E8Kv5wLR8rQc8RffQx5pKe68LntlON5uhEJuM34tjQd3uOxcyDwsnafdvrkabqBVWF
         X/oGp3NgfNXC2yhq9ovcyMvA79L7a3adKRzTLkL6WpK/b5vJVscuL9X2jI3dXg0b3v2b
         qePU66U4OFzpXqBS5tZzsFOOXAGHOVvecfQr0+T3py4kzIAwGl4RzwjpH56vVY2rtKOj
         YBxyTCcyu/sAu8ysYsBcD544FxQeaGFTnLh9NxT97Vdulo7w99rEwzMmbBU6hMXBdnbE
         PM0cOf9AyuU6OuztVZs07QA6Bq+tHwqAojafxPImS1xQC2uYVqlQdWR2RpdPs3UXzTFZ
         DSLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772572433; x=1773177233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7285z4a7v/bWl4xO+qaw6D2aRgnI3Erv2A277LduLI=;
        b=FYn3CE6RcvwnFJQy4XCSTOcpSs8RCyqX8Yh1a1d8pAP1ltYCMLubTJOxMn4WJ2iyhl
         D32PlEUenmjrq5jcnl8Cl5n70eDHhlFzbTBBOAYa2LHNmgHl01vbe4kKZYl7uhQVf1rF
         EKVHgZPrPw1VWQJrL07uYYPKbFQWvPi0oIdL6Eptw1cLnUZpQN7zxBDe8xaHLpWImwBe
         Q//goomYjqlHJMsD/n9CDmq+4E+V81A43mwee1sL/G5g91xZqkjcrOcIgRtvp8MpqheP
         QqutZtn77UztVQDKpi7c7NhnRo1dYsW+J5tBsomlI3OdoU/cJMBvYYKpi03oNBFMaQAR
         AwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572433; x=1773177233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K7285z4a7v/bWl4xO+qaw6D2aRgnI3Erv2A277LduLI=;
        b=VvbdaGzyDP9BtJeabk7p13/571Mt3IUMkVSiJWXJuEcfWSjASOrazSGGNGllDIM6+s
         EMj4sdOX1vhlvxrT8pXBRrM56kpoK6BUyMik0SchJS6StqR63gxeEfeSJeOLCfdkygDj
         S6YdzPxZURxFQHFT8gcAyaXYF4x7Xb3GuiKcdOIp7eQYOjRByzbuCsm+fWymXxf93Yir
         vJUbhBNZz2eX3jNkZevZLVkB6jbTZQUNsPaaUbGSInzalzrQUE7NgFWDy9HN/TP91BKe
         inCN2wTqO0C4hX9zp9AHIoyJnokR94+GBVNkcxvKcn+3r1oAPUYFHUfpP7xSPEmwvDg+
         arcg==
X-Forwarded-Encrypted: i=1; AJvYcCUvGrFpaezHleu4DFR8dGcDEqWQCHaqau94DeNVffHhJHflnJe+J8y74es0D16/3filRfmPmb3xqgyX49z+rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG5xIicxGkZCHigbGE1uXJTZ2h2/zj9R2WNqNfR7SrMMFicnEL
	ilh+1MnmPs+YHUidLpOWwbK8BdYPjNo+NfMzb2Wp+k/AbepEcmhAcF2902Rg4v3XOalWLtMXu1F
	Nf3/QMaiOQaD9Lbvu1gnIesHsr1P+kpw=
X-Gm-Gg: ATEYQzzrkKUlE0M9/bBPw3uIcd7p4kD9wPQgJpLINiWWNs/mVRcPPaaziQyeF7c9EeP
	9N92EJVkX/VOjbYeE9f6M2Kr1kX0fEsWTYrsVNxkrEkmP37jb2Y/nP0gXfGA2yOVXiAZ0I36WXc
	zppPPtN4qJuk7UuBwMi7EJaHz6J9IV/G52D6rvHhcpgl8Xj9ZWUZ8PuS2pq+MHYZtp29euSYNWQ
	e9L33P6/HmuC78Nx4ww+0LXanYPi7Dykg9LhoSySUf46UB4jE1ydjyA5ZvrGySwqLdTErOf+99h
	kQRI0pBeZFfsvQQBvz3Rc/+Q/4/7wTn62chMlWJlSXpqzBLN3/i82HlHowWXD7FWHqTX1fvPcDM
	Uahji2EjcrIZ/OHYPcMdeJRtJ
X-Received: by 2002:a05:7300:5711:b0:2bd:a3fa:9bdc with SMTP id
 5a478bee46e88-2bde1d22f06mr3792727eec.5.1772572433198; Tue, 03 Mar 2026
 13:13:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302164239.284084-1-gary@kernel.org>
In-Reply-To: <20260302164239.284084-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Mar 2026 22:13:39 +0100
X-Gm-Features: AaiRm52aGuLZUD_6635J-TjKPHDQPf8UG64Mc1k5V8ieRrkUjLsjtfayTdZ-IRY
Message-ID: <CANiq72=SouYDy58_a9PmkmnRB9KspJMn5NcwC2GjZO=DwKZpCg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] rust: add pointer projection infrastructure and
 convert DMA
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 5:43=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> This adds a general pointer projection infrastructure which is intended t=
o
> serve as the basis for generic I/O projections. The idea is that we will
> have a unified way of reading/writing MMIO or DMA allocation, creating
> typed subviews into them, and able to read/write subfields safely.
>
> This is the first step towards that direction, where an infra for
> projecting arbitrary pointers are added. This takes care to not assume
> pointers are part of a valid allocation, so it can be used to project I/O
> pointers, too. `dma_read!` and `dma_write!` is converted to use this infr=
a,
> as they currently have soundness issues [1] and users have already
> encountered limitation of it [2].
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General=
/topic/Soundness.20of.20.60dma_read!.28.29.60/with/573645610 [1]
> Link: https://lore.kernel.org/rust-for-linux/DGE9DBH7X8CO.2EES6EX8UA5ZF@k=
ernel.org/T/#mc17b9c0309ac10346b3d6c6bd8461488e7c73161 [2]

As discussed in a previous version, Danilo wants to pick this for the
next -rc or so:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I am also taking a few fixes via Rust, so that is another alternative
(or even as a feature, to be honest).

For some reason I didn't receive yet all the patches (and I also
noticed a late email from Gary to my account in another thread), but I
noticed a few nits for patch apply time -- I replied in the #2 patch.

Thanks!

Cheers,
Miguel
