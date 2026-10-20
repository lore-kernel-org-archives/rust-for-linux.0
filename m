Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504914;
	b=aavbytNwHKobEtSuCMPMLalKic/QchZ08hrCVZX9nD5NMsHz/6BBOUksUfrVdJeKrxie
	 WzbXAefKHkIsGr4lzxNwoUzN0ewFOfLEKrTtFzRsyWfJWgvzal5Q8ghXW1J4p5QpITZrh
	 WUQPigW/9J4DVJFgvx1E5U3auvTgckNsv5Q/Y0CZKa3kGQf4y169dUPpKwatB87sTDDo8
	 XQlHSBGzSqBz3ypznPxXI9wZpFlpR2+MD7uOPJEK6mCoDAdDW+nK9kfhdpRgCluGOHHi0
	 s0doBbcuMe0OkuN0UHYwN4y6GkW6FEDNUqMQeJuIqus3gLZb88PH6sobfxauU/SNrRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4WqTnmYwNtZuc8yE6m3Wj6x4W67f77rHRf4agpevk0c=;
	b=spzJe73k8+5tRqnAU4cRWB/6p30dkhBoi92rezeZ5VSRGFLZoh0/OxHolpmObBDn66e8
	 02Z7kTe7fxqr6nJLxq66PqcWzEXq/N4QYMkoPo+BpGRKUhQqvHmkHQf0vWXOCNCeoYl4M
	 xa70ke31ve+19ZUNyRsiHbB8eCzwT2S3Rb1/NqHDn+tDjJdqissEuj+p+r4GBoIAe8Ub4
	 P4UD73LS3SkD8L3UzWhXrG1DgCpxVIoz29N54RvID6iHMSaQj4+E05VcND6Z7j5NGrVKo
	 Pt4IpaX9mqp0yDEUXdorkNj5R/ZwCnE9yGr9SGB5/pZyCfQWQfjaf/Eij6GSSNMhg7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=de5rgw+k;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F65606A31A
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 14:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86F65606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=de5rgw+k
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso38667825e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504912; x=1793109712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4WqTnmYwNtZuc8yE6m3Wj6x4W67f77rHRf4agpevk0c=;
        b=de5rgw+k1ip+RCToB/0zFGwdEzw6BeOZ2hldM8GnpgRW5HItuajq1CB2OZ12a91oI6
         UbLuHxn5jG14aXCRRM2hRvhkbFsnaoZeb57mzykK3ZGVKe3/1iwEJOSKW7vIihvIRF1d
         YgVrEbUv9Yi7Cm/Hkol9PQmqddnBUf9JHCU2gTuKaLvuebg+LYdywGrBaMs6MjzfJ+GV
         mUfZdnZZ07tRCgpvR5t2zQ0IcTcNepxuwJBYf6YGe6Me6Mqs129kb81o+AwlwePxrqRx
         8HBQHf9hjJ49kJtPAZPJ3gDhEMzLFqRVHeORumP5l0zcoxyah1mMb/yN+6f07egIszKm
         Lp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504912; x=1793109712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WqTnmYwNtZuc8yE6m3Wj6x4W67f77rHRf4agpevk0c=;
        b=vgobLm7afHjP47ggyOESIZd22ORGn97L97XQmtYoI7CoDNRewZX03oOQC+vm7lBRWY
         SDIMrZzlqZjMvG9SKt+wLKn4sob6LzpfTrmrogNXOjQYtWgHYoz0XfsZlIRvGCwsFW7l
         W/HpfhkUf9kSY9IV2D+hDqH4Y/QmXSP9/Ecua3p9dRQPRxJ5nTK48NrnMXX0d/0sMlLO
         qeKBfyzbb7XdhCYOMQdQYo9szMpL/1gA2MOPmitqGFibby4+CQAwWQ7G3LMb7ubxN0Ma
         sRc8EkyhDzfVHId+V/qNIruv2JIu8Lus2ddvZIVTGAEu3WMT32Mle1bybRSQXLp/mmaS
         +eHg==
X-Forwarded-Encrypted: i=1; AKwUvBzwh0IRBxShKhP/f2G3Eix76QxgwKDdJD0P05iyzBq40impC33x9uOW3qT3xGsdMx642YfxCAAdqNXPv7msLw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIla4FLU9BVsPz+zDWRJ7GlKi5a8zYtnCI+b5H/2RmTM5FWOFH6
	Ebief4sydfBob9el1eeZLg1w9mZfOKIWXSuWnKi+Cx5sXfHT/MQP+Ysi
X-Gm-Gg: AYBFou0/gcF2Dla66LzVPZ6DS0wKhPVjYMXDWI2MapSuQqMhZL/28JirrwySmAP0WrN
	pZUq+TBKZ4XPx4VF9Mvq+0/02//d6VNXWltX/EOKcmLJtj/iq1T56h+T7CzUY2wqH37R5Crftif
	tDDwVQlj5Pezvt1fSfPAPUrdFA5mGfM5C5aemfmZ0qmY2GTywG5P1FI98wx/rxfFh/QrKQLVfke
	MSYFapAgK00KEx3wpoJHrV39QdF+m1yvuYZVACTnbfcsSHf21pGCqNnATPs0rXe/ktPKsvStxqW
	pHfSzu7ojV3Ijal6Y1kfnm66B0BFTYAfEAdp8MwhZcj3hlAVIgLU/NM6PdaXV9kNrJ/VaXsxuq9
	ZcZ9BGRo10jLtTEwp/af6Qg/8IGVsBOz3l7I4UddOZlWd9YA8jF9nHWhVwOzIOsxpRF308o6lpA
	fHcaihBNdFuZ8fDcjRxX2nmQF7ezb6mphb1+cYQKALyNdf1Ss+OfuuJnVTyeBlhJYidQzxOhaBF
	H7inb4CnGPhJ7TEubh9fjWuFmtOOZLIrEkdxGi2ihyO6up4cAucJVap6dU=
X-Received: by 2002:a05:600c:4f95:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a1d75e3c9amr244362825e9.9.1792504911471;
        Tue, 20 Oct 2026 07:01:51 -0700 (PDT)
Received: from C422HJQPQG-Fractile ([150.251.170.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm67581075e9.6.2026.10.20.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:01:50 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:01:46 +0100
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?iso-8859-1?Q?Wilczy=B4nski?= <kwilczynski@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/7] rust: io: split IoCapable into IoReadable and
 IoWritable
Message-ID: <atd0SnEL1ZLXHxVU@C422HJQPQG-Fractile>
References: <20261015-io-access-modes-v1-0-93611b84b5e3@collabora.com>
 <20261015-io-access-modes-v1-1-93611b84b5e3@collabora.com>
 <DM9NGD5R8AP9.C4K59HIUYFDQ@garyguo.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM9NGD5R8AP9.C4K59HIUYFDQ@garyguo.net>

On Tue, Oct 20, 2026 at 01:04:03PM +0100, Gary Guo wrote:
> On Thu Oct 15, 2026 at 1:39 PM BST, Daniel Almeida wrote:
> > `IoCapable<T>` provides both `io_read` and `io_write`, so a backend that
> > supports accesses of type `T` supports them in both directions, and every
> > (non-copy) `Io` method that reads or writes a value requires both. There
> > is no way to express a backend, or a view, that can only be read or only
> > be written.
> >
> > Thus, replace `IoCapable<T>` with an `IoReadable<T>` trait holding
> > `io_read` and an `IoWritable<T>` trait holding `io_write`, and implement
> > both for all existing backends. The non-copy `Io` methods that read a
> > value now require `IoReadable` and those that write one require
> > `IoWritable`. `update` and `try_update` read and then write, so they
> > require both.
> >
> > The copy methods use `IoCopyable` and are not changed here.
> >
> > No functional change intended. This prepares for read-only and write-only
> > views, added in a following patch.
> 
> I think by Rust convention these should be named `IoRead`/`IoWrite`, but we've
> aleady named this `IoCapable` and I further made the mistake of adding
> `IoCopyable`...
> 
> So I guess I'm not in a good position to ask for name change, but we should
> consider it. Apart from the name:

IMO the -able part is quite important. As a reader, seeing `IoRead`/`IoWrite`
doesn't tell me enough about what they actually mean on their own.

> Reviewed-by: Gary Guo <gary@garyguo.net>
> 
> Best,
> Gary
> 
> >
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > ---
> >  rust/kernel/dma.rs    |  12 ++++--
> >  rust/kernel/io.rs     | 101 +++++++++++++++++++++++++++++---------------------
> >  rust/kernel/pci/io.rs |  10 +++--
> >  3 files changed, 75 insertions(+), 48 deletions(-)
> 
