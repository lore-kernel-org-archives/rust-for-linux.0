Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE34A92F
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Oct 2024 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729479131; cv=none; b=s60GIgm94BUfH1Udy8dMWY483aRx6cX1aLF0o0dDlMGJmiT3OruP8CCLCNJTxJet1sCCgq0BBhvwvDw+NbspiTbZnL87wc097ydCjjfPO9AMcXF5h3iBolnvuQYT5kJHNWPkD1v0zkwdtkPtCcyoqG8wYOXpDcVZRjKT41ODVrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729479131; c=relaxed/simple;
	bh=m8taVsHseeIgN7Fc0m41s5RV0ej3WQnIhszH5YmiZYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHd6i5Bg2qxk+PNGOQQXvzcuhmzTf4JVsauLMDOjWUK4GOHQJ4+N9w+bC5QirfX2rf47LkSa+LJrps354eUgJJxCFKB7N+rvgQJu02gLu8F9eR1sTgmvceA6h4KMT4u0Y3wtNE3etAz4yQT/O7krzkmOczI1wX++EsAlM8NGfek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRwMRSTm; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRwMRSTm"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-718078c7f53so1810831a34.1
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Oct 2024 19:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729479128; x=1730083928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GluipjFLvYZWUEJNr+tJm2QMhiWNgytDs3gMO0g4lA0=;
        b=SRwMRSTm+acUw77TUeM/shBnVdzBDftXxDTi0TCezuSB3QUlJ8PhjlCRXZif5AoyFS
         cIa6ua+q06duIaOvNFNz8NHazybY372tJee2bbdehhCiSqF4ZmR9NCfVrBQrCtqLFDpA
         3QzTCrpHbHsPqBZ+6hlMthGFpOZU6or2YLX9Pph2P7tOzmUmbgx9EFkcO1RHZcJn685z
         XuXjJvXRj0RmE6X3tgy8LwY4FHxUaldcKbFxEieE8pOLdbs4zSYMOycmQ5kM4l308O42
         /OTk+d30epYf5s3WYOjDYei+uR9THSRv6L/TEBn1mWVGyXXASdzTdFTzcK53JPliwdlr
         vr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729479128; x=1730083928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GluipjFLvYZWUEJNr+tJm2QMhiWNgytDs3gMO0g4lA0=;
        b=NPRtkjupWptHTpJYPoHCXpZqenA65d9I9qohK01mBv9v9RKs17RBLnedO72dbixlcz
         0ChjaT62rX+R5MNSyP2mmbm7rAVUhfNNVUFf+3M9AKuDGjdfHrHP/xPVnSqMQWIsztkV
         XoiKVnuT9Seii0pnZN6gISJEIDaUT2aLrdbQNNarT+jXDj4zLdyVftEdE8/MZ1PX2v8k
         gPMfuJantmqizughjsuM/OQ55OWB+atC/O7YmsVGCa4T50eBXTGHRx55ndGdH8pB1agc
         i2AbOxecUJyooFF5HYY2CwKVMFmGNqjUbBbRM6wG4TgH/cZZl3y0fjcjcKsumYlVl3Z6
         gHew==
X-Gm-Message-State: AOJu0Yxzae1HKGdiloWaDVN8dUC0TZoNY4iLc6ug8snNFv8oo8nnTjTh
	XGpj5s5KnHMot3dGDlLGJv5RJqJRTksQT9lMFJAlmggJCHUhjIKT9td7aAiH
X-Google-Smtp-Source: AGHT+IHmTH1VWlxADCjd9imOL/8T5Vy8aZI/DRz3mVXfMSD5gzVZfZi/mBmKRhcTsyQRZOj660PaVw==
X-Received: by 2002:a17:902:e847:b0:20b:a73b:3f5 with SMTP id d9443c01a7336-20e5c14b4bamr151058505ad.14.1729479117240;
        Sun, 20 Oct 2024 19:51:57 -0700 (PDT)
Received: from ohnotp ([2001:f70:860:4100:e712:ac1a:da07:2e53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee62b1sm16260125ad.48.2024.10.20.19.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 19:51:56 -0700 (PDT)
Date: Mon, 21 Oct 2024 11:51:44 +0900
From: Yutaro Ohno <yutaro.ono.418@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Valentin Obst <kernel@valentinobst.de>
Subject: Re: [PATCH] rust: kernel: fix THIS_MODULE header path in ThisModule
 doc comment
Message-ID: <ZxXBwMOsNjtz1PD5@ohnotp>
References: <ZxOBW2WeAnq_mFda@ohnotp>
 <2024101926-crisply-immersion-5077@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024101926-crisply-immersion-5077@gregkh>

Hi Greg, thank you for reviewing.

On 10/19, Greg KH wrote:
> On Sat, Oct 19, 2024 at 06:52:27PM +0900, Yutaro Ohno wrote:
> > The doc comment for `ThisModule` incorrectly states the C header file
> > for `THIS_MODULE` as `include/linux/export.h`, while the correct path is
> > `include/linux/init.h`. This is because `THIS_MODULE` was moved in
> > commit 5b20755b7780 ("init: move THIS_MODULE from <linux/export.h> to
> > <linux/init.h>").
> > 
> > Update the doc comment for `ThisModule` to reflect the correct header
> > file path for `THIS_MODULE`.
> > 
> > Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>
> 
> This should get:
> 
> Fixes: 5b20755b7780 ("init: move THIS_MODULE from <linux/export.h> to <linux/init.h>")
> 
> added to it when merged.

You're right. I'll add in v2.

> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 

Cheers,
Yutaro
