Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA593207
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Jun 2024 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717240561; cv=none; b=VXEos9CCoDEx8dIPCJ8bF9T8d1omi2t/Tp+H8A7u3NvB8VmwI4y55bdn4TADHOZHR+NZpoZlXvuR5W5CXtlXeQnZY6R7mgOHBt/cVUgz3gGGcw0vOmteHSLBP9SjQ+iqBb+UOxNcWYqGXDtChzF6USNmyj/ZfzHiS09XuNmGuV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717240561; c=relaxed/simple;
	bh=/PJ2GjT7/rLhw5D4POjI70oJckkLJy4s/NNLOSXov2Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WrUKO0HZqau2KZVVrhUQ7RMNb5sGUJhb8r2UxhxJvNIjPKsqLdYt0ypx+5WN0rOV9AtbIlwx06poQ75r3N8jenFV5ehYxuoUGu30g8xYSa8VtMMOMYk9aaHojH2TnROrmzkmkUSWUdDx0oYxCYvvII61yELGfSWXCWziFS08ZVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=0SiD5IoE; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="0SiD5IoE"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a68a4a9946cso53103166b.1
        for <rust-for-linux@vger.kernel.org>; Sat, 01 Jun 2024 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1717240558; x=1717845358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCryFmGVnMLpUEOQA4poMI+wOTAgkfQR64/zK6nQuRw=;
        b=0SiD5IoEXllMOqSknxxjRIoG55IRlLx9cyqV56ztzj3YuwI6pRLFbnppaFZ+8euC7M
         h7guB5Lyx4AjZqahRM0NHZ8qCVFWz4Vp1fOYY1zTDcER5rZqik7X2Lm6NT3KxnIDkhC3
         j97scRkElNwztko78UTYF5MqlHeyEnF1yDTQOZ5YA0d9fMROAwacpYHsXxqkdEazUC7Q
         n351qelNhX0xI0ugorV77H8VOLz2LOR0zXPfi9/wbUepCFBQfUUcDTgls6IudMhwRja3
         0QTuC6DzjzHD90XevQVoXmYCy6ZLkAxoJTWs0B8w1GukEec1B3ewhIKuOIPiBLEVZcf+
         Zkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717240558; x=1717845358;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCryFmGVnMLpUEOQA4poMI+wOTAgkfQR64/zK6nQuRw=;
        b=T7Wm2x0trAOzJgD4TJbYeGVY5mBPTtxh4Y4almmZ47jXGe37dZwXMoXju+UZaOH8Iy
         H/SnsvhxcMx3eb0FUF0KFjcpvBqQ4tCV+eDH/Tu0ac68O8S/zkoQ4TQgLZKVgtg1QCL0
         /H+1Y/xcKZ+VwviZF2mc5dPOhP5wkqXazb+6C521fbxUBG6z0jMeQnL+lYJNiagDu+h2
         sFpmY5ctQkrET+07ucB3xJ1OTgfd1r7NYEF+jI3Av/oxtQ1UASiY6YU96IdtiLVbkThI
         0FqSYHjgMSS1dhVVaWUv3ohKi9P4VWHZO+7GqabB26oEiDGs0wSPHQ1ZmkjjBK4/eKHf
         dEFA==
X-Forwarded-Encrypted: i=1; AJvYcCWGO/mnW4QK/lNzMB1QtkBrQdwynitKNd5MAzPDV/WnTWnV6iLfeBTNZt2mX2mypXb8ZMyqjT8oCs97FbOMbNi+QB74C/begPzDgQgcHtc=
X-Gm-Message-State: AOJu0YzKEtB6Nn6iSvHpD+iJhEuKbtZOzqZj+4BmJ0EF4Yx2SCqgB8SW
	i2rY3+h9riN+Vxe+Zz+JgBRJKP4t7wiqC8+oacrmfs1QlJf+hF9bZqrNCZ832NI=
X-Google-Smtp-Source: AGHT+IEZYXud4tM6JcqUgo1hgqJr7fdgasI9zD5M8BqVsUWiC8vI1fGU/UfvXbZpBl4UPndv1yXtNA==
X-Received: by 2002:a17:906:4f8d:b0:a59:a83b:d438 with SMTP id a640c23a62f3a-a682022d0bemr309841966b.23.1717240558265;
        Sat, 01 Jun 2024 04:15:58 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67eb344426sm185893866b.215.2024.06.01.04.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 04:15:57 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Jens Axboe <axboe@kernel.dk>,  Christoph Hellwig <hch@lst.de>,  Keith
 Busch <kbusch@kernel.org>,  Damien Le Moal <dlemoal@kernel.org>,  Bart Van
 Assche <bvanassche@acm.org>,  Hannes Reinecke <hare@suse.de>,  Ming Lei
 <ming.lei@redhat.com>,  "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>,  Andreas Hindborg <a.hindborg@samsung.com>,
  Greg KH <gregkh@linuxfoundation.org>,  Matthew Wilcox
 <willy@infradead.org>,  Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor
 <alex.gaynor@gmail.com>,  Wedson Almeida Filho <wedsonaf@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Alice Ryhl <aliceryhl@google.com>,
  Chaitanya Kulkarni <chaitanyak@nvidia.com>,  Luis Chamberlain
 <mcgrof@kernel.org>,  Yexuan Yang <1182282462@bupt.edu.cn>,  Sergio
 =?utf-8?Q?Gonz=C3=A1lez?= Collado <sergio.collado@gmail.com>,  Joel
 Granados
 <j.granados@samsung.com>,  "Pankaj Raghav (Samsung)"
 <kernel@pankajraghav.com>,  Daniel Gomez <da.gomez@samsung.com>,  Niklas
 Cassel <Niklas.Cassel@wdc.com>,  Philipp Stanner <pstanner@redhat.com>,
  Conor Dooley <conor@kernel.org>,  Johannes Thumshirn
 <Johannes.Thumshirn@wdc.com>,  Matias =?utf-8?Q?Bj=C3=B8rling?=
 <m@bjorling.me>,  open list
 <linux-kernel@vger.kernel.org>,  "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>,  "lsf-pc@lists.linux-foundation.org"
 <lsf-pc@lists.linux-foundation.org>,  "gost.dev@samsung.com"
 <gost.dev@samsung.com>
Subject: Re: [PATCH v3 2/3] rust: block: add rnull, Rust null_blk
 implementation
In-Reply-To: <2021ea8f-a3df-46c6-8fdf-61b1df231773@proton.me> (Benno Lossin's
	message of "Sat, 01 Jun 2024 09:15:59 +0000")
References: <20240601081806.531954-1-nmi@metaspace.dk>
	<20240601081806.531954-3-nmi@metaspace.dk>
	<2021ea8f-a3df-46c6-8fdf-61b1df231773@proton.me>
Date: Sat, 01 Jun 2024 13:15:54 +0200
Message-ID: <87ed9goqvp.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Benno Lossin <benno.lossin@proton.me> writes:

>> +impl kernel::Module for NullBlkModule {
>> +    fn init(_module: &'static ThisModule) -> Result<Self> {
>> +        pr_info!("Rust null_blk loaded\n");
>> +        let tagset =3D Arc::pin_init(TagSet::try_new(1, 256, 1), flags:=
:GFP_KERNEL)?;
>> +
>> +        let disk =3D {
>> +            let block_size: u16 =3D 4096;
>> +            if block_size % 512 !=3D 0 || !(512..=3D4096).contains(&blo=
ck_size) {
>> +                return Err(kernel::error::code::EINVAL);
>> +            }
>> +
>> +            let mut disk =3D gen_disk::GenDisk::try_new(tagset)?;
>> +            disk.set_name(format_args!("rnullb{}", 0))?;
>> +            disk.set_capacity_sectors(4096 << 11);
>> +            disk.set_queue_logical_block_size(block_size.into());
>> +            disk.set_queue_physical_block_size(block_size.into());
>> +            disk.set_rotational(false);
>> +            disk.add()
>> +        }?;
>
> Personally, I would prefer to put the `?` into the line above.

I have no strong opinion here.

>
>> +
>> +        let disk =3D Box::pin_init(new_mutex!(disk, "nullb:disk"), flag=
s::GFP_KERNEL)?;
>> +
>> +        Ok(Self { _disk: disk })
>> +    }
>> +}
>> +
>> +struct NullBlkDevice;
>> +
>> +#[vtable]
>> +impl Operations for NullBlkDevice {
>> +    #[inline(always)]
>> +    fn queue_rq(rq: ARef<mq::Request<Self>>, _is_last: bool) -> Result {
>> +        mq::Request::end_ok(rq)
>> +            .map_err(|_e| kernel::error::code::EIO)
>> +            .expect("Fatal error - expected to be able to end request");
>
> I expected something more along the lines of: "expected to be able to
> end request, since `NullBlkDevice` never takes refcounts on Requests and
> as such the ARef must be unique, but `end_ok` only fails if that is not
> the case". But maybe that would fit better in a comment, what do you
> think?

I can add a comment =F0=9F=91=8D

BR Andreas
