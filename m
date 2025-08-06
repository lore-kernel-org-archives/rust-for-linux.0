Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5B228A411
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Aug 2025 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754471507; cv=none; b=Owo/6ejOZNRAQ/now4DpF1neYh2mo6MdROj6fJAttXSULrkn3btuKV7rVa+lt3GAjwhFC2ZwdpuPqAuHXaoI3bMVw//7BA0KEFxYAXFsXxGCmkYslBs+bE//yIdVyK+nPLXCK/JpGcDN+wJCBgAK+vInUMsqZECd4ArFnjw6jLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754471507; c=relaxed/simple;
	bh=ZObCFNQv4UMF0xsJTXeG2FT2Dm5Gph+xuZC2Eg7Hb3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/qBNX4h8As4qFOtPYYxcGM8VCguhnB9n306LqMzOA4TV3K85MKupVKEaC+mb2Itio8mVGbkE3IvFKpxerviyF+bzT3dDDCFXvXibNLQi0DqLKuok8R0AZZELZzPCYT2ghebZfcqnOfQD3KyvDtn6Rade9Y+Kkxy1YM/4sfJzC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=K80YoHgV; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="K80YoHgV"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso5398090a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 06 Aug 2025 02:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1754471505; x=1755076305; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JBLc7ArxlNR8pTtajC/NheRkCgoQRk7tluXtx6UCq6U=;
        b=K80YoHgV7q4XSJn2VCc9KoCxtLyAZavIj/D4th1IM3gqDlDyxaOgY27uun2/YGcMFV
         ESKynfQdeoR+3Fdx1SqKCIxxI+SL/IKv/iduOif9p4mDaA2uk9QfyXujhwtQWVGBnNIz
         7iEDfY2XszQGcjQCj/p7FqBC/fNvhKtHgyp5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754471505; x=1755076305;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JBLc7ArxlNR8pTtajC/NheRkCgoQRk7tluXtx6UCq6U=;
        b=qADFTu/qL2abTq+Syxm7Fp9xWEJI8rMHNLbnKIxows2mlDHRfN3mwIA7FvuzgkjMDy
         xKS0mW+NKO5je28MjdGmYURjUfyJ1H6ttuxr9lZUJFFj6JV3MLo9e/1sUrv+wce6qo3T
         VBrWPp/AHu6A1FwXqIGKcPwc8LjOq9gsMZ0m6UZuo+X/gds+AWODPnHVW6kn2qAtFseY
         EGuclv67UFk9zapjvOW8m+FQoBx3XqfeX5G4xLmU4cUlIZH7PS08S8ULuZak/zXqLtGq
         0z9EcYztb9hyEiVfGo/pUdHII93bCUnmnU0Qdvp3fX/5HPuCIsJ2z9p4OVDxcX1Qnqi0
         yPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHKSDvJwcOe+7M35GshOsfeS6LDCocNFWLW1ykCiXOEOk0wks1o74ij9JavGlmu1Gd0VV8PNkEYUTKwVbQSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfmzGmKfA7j/fEN9NnPt07dG272RCTCv3gdU7k+puk5mzKpgzb
	TNbIlP3iJ9hs8akdnwvgCTjSmtr91UThYHsh7wbWs0ML/egBu8w7LHq/hAMdZzQiQf4=
X-Gm-Gg: ASbGncsZRVyT3g4s1Z3wKsItldiaUOkYB4YOYrKcSOW1v2HJ0oxf2M75jQSuRgdNpq1
	Qz1FKqGknKWqdi8ef/mDi/x6T9+mr1QOtV5vELiHx7xZvQRaVlOpUA0J+b/baBJshlGK96LD7t+
	GgM+7cFXxPUCrzUSuCRqt2X5wbWD6XpJEZLQpEfF7v85ZBcgneevK9aTuOKRTL0qFbahL+aM16b
	EAal8UVo5UGA565HHvoc3hThKuye9MiGaZ/LirfbYBEhobcR0dzjPwp+AVr2yh/i4JrUMQWJgwA
	WNoL27W+L0tdHm8113UGQDjcwgsTkTFL5waVZh8v004n8+JKYdFCMshNoYNcSqM0BeLV0q7eQoN
	q3XPPhWtOM7lcIQnGL1vZxMokBFXemBuPdpzAvFw9rg2xD76JQXNWyRHl
X-Google-Smtp-Source: AGHT+IEWkAjBZFDYdLy50hCv58jLmZaDBOkfpqI7EJKFdUOgiLxmusBsskvWsfDmmjOSSkTedEuBhQ==
X-Received: by 2002:a17:903:948:b0:23f:e869:9a25 with SMTP id d9443c01a7336-242a0b8d68emr25026705ad.44.1754471504994;
        Wed, 06 Aug 2025 02:11:44 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b642931sm13045501a12.0.2025.08.06.02.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:11:44 -0700 (PDT)
Date: Wed, 6 Aug 2025 18:11:39 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/4] rust: io_uring: introduce rust abstraction
 for io-uring cmd
Message-ID: <aJMcS1aE3n9gYMOy@sidongui-MacBookPro.local>
References: <20250727150329.27433-1-sidong.yang@furiosa.ai>
 <20250727150329.27433-3-sidong.yang@furiosa.ai>
 <D6CDE1A5-879F-49B1-9E10-2998D04B678F@collabora.com>
 <aJF9B0sV__t2oG20@sidongui-MacBookPro.local>
 <8A317BB0-750B-4B68-9C62-2732DA3986F8@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8A317BB0-750B-4B68-9C62-2732DA3986F8@collabora.com>

On Tue, Aug 05, 2025 at 10:02:18AM -0300, Daniel Almeida wrote:
> Hi Sidon,
> 
> > On 5 Aug 2025, at 00:39, Sidong Yang <sidong.yang@furiosa.ai> wrote:
> > 
> > On Fri, Aug 01, 2025 at 10:48:40AM -0300, Daniel Almeida wrote:
> > 
> > Hi Daniel,
> > 
> >> Hi Sidong,
> >> 
> >>> On 27 Jul 2025, at 12:03, Sidong Yang <sidong.yang@furiosa.ai> wrote:
> >>> 
> >>> This patch introduces rust abstraction for io-uring sqe, cmd. IoUringSqe
> >>> abstracts io_uring_sqe and it has cmd_data(). and IoUringCmd is
> >>> abstraction for io_uring_cmd. From this, user can get cmd_op, flags,
> >>> pdu and also sqe.
> >> 
> >> IMHO you need to expand this substantially.
> >> 
> >> Instead of a very brief discussion of *what* you're doing, you need to explain
> >> *why* you're doing this and how this patch fits with the overall plan that you
> >> have in mind.
> > 
> > It seems that it's hard to explain *why* deeply. But I'll try it.
> 
> Just to be clear, you don´t need to go deep enough in the sense that
> you´re basically rewriting the documentation that is already available in
> C, but you do need to provide an overview of how things fit together, otherwise
> we're left to connect the dots.
> 
> Have a look at the I2C series [0]. That is all you need to do IMHO.
> 
> I´d use that as an example.
>  
> [0]: https://lore.kernel.org/rust-for-linux/2D1DE1BC-13FB-4563-BE11-232C755B5117@collabora.com/T/#t

Thanks, 
I'll rewrite the cover letter and commit messages that reference the example. 

Thanks,
Sidong
> 
> - Daniel
