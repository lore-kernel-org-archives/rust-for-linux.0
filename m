Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F908C06
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 19:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716234612; cv=none; b=G3wPLduL6A6QGjz8OGcDJHLelZkUUu1TDSp8pYWWWMsbHxGjHobuN13pwb0SO90AY74aom9nCfSO6SmmjWF8sZsxWWkuFrBsH705+lP2j/khQUcGcRpbMNq8Q04AhrOq+rCesRQNpB5y6XJhB/Jw2AhkRVtfO0f0HRXSiV37Ixk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716234612; c=relaxed/simple;
	bh=gJtO96/QOXNax5m7dA7p+4hZofa+TNrvNiDNq8i6miY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=L3pfoSXTzCHcNMdirC4PuYBzDFcIq7vjs82eLp1cEKFcE6xPsoon8+bCjUXaiG55rFmPKUB5bCn0ppEPvf8hpDLGG48iIGa2XZ4zl6kW7ZA02fIbb4g77i1Q4pSFX5hh8RfUkrNHGOgMP03uRdSSScaDa9Holryv2jjNhikono4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fKi+QQHC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fKi+QQHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716234608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p1ApWCJ3+udEonFuD2vtbOZd8j1mco+XVOTUyxyL7A0=;
	b=fKi+QQHCw7wxLF8kKR2rV5BKn50ToPOuUVtcN+sqe9UA1vbbOdaFM8pb1XD3yahHhpkG6q
	OeCmGzD7r1lble1WBkpS+zsJZ/qTg+idbAC1IcRUc1BWWcoy5hmcS0N0eaCqt0LffYLpMS
	qgd6Gglftr0nS7FYXrCFqxJn8uEBA5E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-SYywMhagPamd7fDcl3nujA-1; Mon, 20 May 2024 15:50:07 -0400
X-MC-Unique: SYywMhagPamd7fDcl3nujA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-34e08bdc701so8241867f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 12:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716234606; x=1716839406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1ApWCJ3+udEonFuD2vtbOZd8j1mco+XVOTUyxyL7A0=;
        b=oRT6kn14jhGCiwc86sVAhRTXeX2LKZMEIcFEuEUs8C1U41kqq+Fs+aQePuynFk5NUD
         TKryY/SXKNux6WItKahO0fBCNO/8nmxXV8KgeDN3uO6fpuRB0xntolzIy8stp2B6zBVm
         AbojAVuUlFYmV1evWoJE/v7zVxyDeFUzw7uLtTQVKnl2R+a7bLqdsHEVH+A/E5X1/24q
         CgU1VaM24MnVdiYyo7u+ux8mGEhTZcbwJMwNwGt5iIzOcF3jtv6gWJ7U6ljr1V5ydC+F
         vhMR4RE2BeenvKCdk42nrVZeW3jTTWOB7gwupwQe8SV65zpeg9uzYFaAf0r72k9Pjq+M
         1Iww==
X-Forwarded-Encrypted: i=1; AJvYcCX3koUwwNSM+QZNjv64SladSvnzWxtFKZnr5oqpe+IF7XNIQ8FAkmmFEslLWdcocFi6dIIhPq4yfk4BC62s87g7IGdaLyLKlGF0tvN2Snc=
X-Gm-Message-State: AOJu0YzFeclWWvJVDFwoJ81RRRB2U0I4v9nZltd+eDheT0H557XXl5Rv
	Az7yt+Cli0WxCrzYlXW3QVRUSS/1i251z7lRHaInkWo0na9EY2DqVHrCqrlEBMZkk6MtVYBGVsa
	G8lk4td6H+UXOQV50L5ztwROocbcLDT2rulNOh/CaVg+fvllSgvO7xMsoDcnrUxaL
X-Received: by 2002:a5d:4991:0:b0:354:ca33:2228 with SMTP id ffacd0b85a97d-354ca332303mr1801439f8f.33.1716234606223;
        Mon, 20 May 2024 12:50:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD2Iv/bESoQ0Kc6Ww/7RxmYUENXDU1Srws//gmTKJixcaSapdeDilp8Mui/bX6lMEu2TKMpg==
X-Received: by 2002:a5d:4991:0:b0:354:ca33:2228 with SMTP id ffacd0b85a97d-354ca332303mr1801423f8f.33.1716234605793;
        Mon, 20 May 2024 12:50:05 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:acb0:ae3f:f045:1823])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-351d7d8f15esm12651384f8f.83.2024.05.20.12.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 12:50:04 -0700 (PDT)
Date: Mon, 20 May 2024 21:50:01 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, bhelgaas@google.com, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, airlied@gmail.com,
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [RFC PATCH 00/11] [RFC] Device / Driver and PCI Rust abstractions
Message-ID: <ZkupaTM+xjCiBbb4@pollux.localdomain>
References: <20240520172554.182094-1-dakr@redhat.com>
 <2024052029-unbridle-wildcard-fbf8@gregkh>
 <2024052020-basket-amuser-222f@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024052020-basket-amuser-222f@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 20, 2024 at 08:16:19PM +0200, Greg KH wrote:
> On Mon, May 20, 2024 at 08:14:57PM +0200, Greg KH wrote:
> > On Mon, May 20, 2024 at 07:25:37PM +0200, Danilo Krummrich wrote:
> > > This patch sereis implements basic generic device / driver Rust abstractions,
> > > as well as some basic PCI abstractions.
> > > 
> > > This patch series is sent in the context of [1], and the corresponding patch
> > > series [2], which contains some basic DRM Rust abstractions and a stub
> > > implementation of the Nova GPU driver.
> > > 
> > > Nova is intended to be developed upstream, starting out with just a stub driver
> > > to lift some initial required infrastructure upstream. A more detailed
> > > explanation can be found in [1].
> > > 
> > > Some patches, which implement the generic device / driver Rust abstractions have
> > > been sent a couple of weeks ago already [3]. For those patches the following
> > > changes have been made since then:
> > > 
> > > - remove RawDevice::name()
> > > - remove rust helper for dev_name() and dev_get_drvdata()
> > > - use AlwaysRefCounted for struct Device
> > > - drop trait RawDevice entirely in favor of AsRef and provide
> > >   Device::from_raw(), Device::as_raw() and Device::as_ref() instead
> > > - implement RevocableGuard
> > > - device::Data, remove resources and replace it with a Devres abstraction
> > > - implement Devres abstraction for resources
> 
> Ah, here's the difference from the last time, sorry, it wasn't obvious.
> 
> Still nothing about proper handling and use of 'remove' in the context
> of all of this, that's something you really really really need to get
> right if you want to attempt to have a driver in rust interact with the
> driver core properly.

We were right in the middle of discussing about the correct wording when I sent
those patches the first time. There were some replies from my side, e.g. [1] and
another reply from Wedson [2] about this, which you did not want to reply to any
more.

I'm not saying I insist on not changing those comments up, but first we have to
agree on how we want them to be rephrased, especially since from the
discussions so far I got the impression that we might talk a bit past each
other.

Hence, I'd propose to just continue the discussion, where we need to.

[1] https://lore.kernel.org/rust-for-linux/ZgNCo4Hvs-EjDNGT@pollux/
[2] https://lore.kernel.org/rust-for-linux/CANeycqrdBVJhAiGZdv2NSnz2SUCuDC=04D_JiTF6vfs8iLvjrA@mail.gmail.com/

> 
> thanks,
> 
> greg k-h
> 

