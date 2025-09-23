Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B36255F31
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758639507; cv=none; b=LTcH4rjf/i7PcZsNc2Ek3wMxoeE6/FQGPEcAMwl5CNeLKU0WKvENXnoEVirJbEUGPo7CJlb6vHcTfe+bK9XAwX4jxcb53P1usdtc6wr25X6QicBajopAAUk5kBCxNG/7iAaI4KSTOwfkJ+gvGQtKMPemQ40F4eeOujFK9YIgcmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758639507; c=relaxed/simple;
	bh=2JkaldusHnBs9nmgBDsrH+Q4WyDqb15X4kwjmxawQQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICcctgYyvpfUEHXHXZpz5kBrBaGTsGuh4Ya+XzV0wEoGugH8vd4AiAZw+47Cz25Pf4iSNwD+Wir4I8RZb1nat5pWLBiaw5jUe5RpCnmJFgm/H702rDs4MC1OmBbyMVeYhDmehjYhArtsxf/ot+xgqb4utj3hXAKpiRdM9Qc0Bf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sP2q4quO; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="sP2q4quO"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-826311c1774so603928485a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1758639504; x=1759244304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ri9p27Eq4rFSbThj+QyWFkt8KhHdU/v11ZSJ66tpy+4=;
        b=sP2q4quOghk4AmdeQfkzmAp6v38+MLilc6cbq47H3cKnN/wlNnmOcFekTKtif/TOqQ
         q9BqQAwrQUVrln9qvB3EOtOaEqEsvwGLvSpIDYA/kd5jJU/O68cU5TsM+AfY1x0eZdkK
         92OYqB4u0OM57ZHV3w1cThWDLHlNqbsznZrF6NVR1FEisEZsfTrDTH70J0fUN1JhoQor
         WHj//WVSAHYVBuaweV8gGWQEhUklAAj6kTk3uyjGk6P9U9UZv6Frbqc+5sz2QJ/dMfMr
         al3sGbD18AfP9NVnOEuQj/f9ONO7uYhc1paHQFB9j6YezGYUHG1gqVJSKB3Rnjt2p6jc
         RFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758639504; x=1759244304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ri9p27Eq4rFSbThj+QyWFkt8KhHdU/v11ZSJ66tpy+4=;
        b=xGjUl+Ju7KOm5x4sQb197t0z16pI6TkSCCLKlNYQK8xUX0FZPVIbpmjPBE/WR1UUmZ
         uR1TvSrxgdTSlUqabxIZLnp2QHQv4U+U8lYZDMDOnPpQ1qVTOnYrn85UegstIf8k5GjU
         q0IjYBTcAS8QAWriSMNejX+f2z3s+mxUePHGyiipsrhWjps0/NOdWJhCohRjS/RUofQ5
         znSne0POcO71u0kkElDcwtnLLRKUZfqVYyR9ptVZX/hQp4lgCaukQ4TTBh61HzHWlLcM
         mKvgKu/ytNCtXf1UcE3X399fpYFak5d2vcnjZkmaXk84+5/oKrLb9jm5bQCbDajqDbW6
         ALew==
X-Forwarded-Encrypted: i=1; AJvYcCVkbJwHYB+ipw8ByziPgtL7PM0wU0Q/krxuDaeE0jX9zQXjx+N30l0OS1/NLD+LmVGkaE/3SoRVGFQRhEqAwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylBMeIjHCmrv4Yk+vZ0KlZDLr964EcuAXjEOrqA96xA9PS4jP4
	FRvgwcYHlPy4N34JWU/SZHWOxO9Q28dkzt5feafcwdhcf6hIUxeLC2bnkr1CyUGElw==
X-Gm-Gg: ASbGnct5MdriikfTLe4wOe3GKg2qAc16en3BsuYrgF26/Bvd5G4Bnk4pTwWHQjzuXk5
	ldIYusg4e64hNc2sTGX61dpA9zRl+WcGrnDllIua8T6vyXk1UjEV+SUI5Ro5f70k//aIY9I3JPj
	mMpnGQ5ftUlPF8Lh4PPYKfcrqpKJxlecE0PCNbqPjel509In+DwOQToZp6/95PjWClLx+smsn9y
	VMUyUKAsRJJg+1TvbWJmMSnLM3I+4tzyXqiamRDjNgZmR2zweUJSjn/fPtoSJLd4RdIRQpODwnN
	VFPQbT44KveRV+sKaluyoQjUX7BMEWD61e/ouGPCBTIrT5sgkbPAbko/YES3eFEvsGiwlKCHlVu
	Kk9lNxfSrwcDZQSCtymlCSjyJQ4lm
X-Google-Smtp-Source: AGHT+IEgq8/SYBm2nZcy+yIjnlm8ABqUN8h1aeiVdFzWtXPHXTllLJNSOfYjpkG/XFj9RGAIuprC/w==
X-Received: by 2002:a05:620a:2588:b0:84b:871a:1651 with SMTP id af79cd13be357-8516eb46222mr283379585a.18.1758639504418;
        Tue, 23 Sep 2025 07:58:24 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::5082])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85411d12270sm55868085a.26.2025.09.23.07.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:58:24 -0700 (PDT)
Date: Tue, 23 Sep 2025 10:58:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: usb: add basic USB abstractions
Message-ID: <0ff2a825-1115-426a-a6f9-df544cd0c5fc@rowland.harvard.edu>
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com>
 <20250825-b4-usb-v1-1-7aa024de7ae8@collabora.com>
 <DD07LUJXNZN9.3RHH9NJNRFVNN@kernel.org>
 <27AB9C59-BAE6-4F1F-8638-DF9244D0A616@collabora.com>
 <DD08HWM0M68R.2R74OSODBIWSZ@kernel.org>
 <2025092326-banked-resubmit-67c0@gregkh>
 <DD0994IZMBVQ.2HZOA2ZMWT2I@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD0994IZMBVQ.2HZOA2ZMWT2I@kernel.org>

On Tue, Sep 23, 2025 at 04:38:34PM +0200, Danilo Krummrich wrote:
> >> @Greg: Can we guarantee that a struct usb_device is always bound as long as one
> >> of its interfaces is still bound?
> >
> > Bound to what?
> 
> Well, that's kinda my point. :)
> 
> Having a &usb::Device<Bound> would mean that for the lifetime of the reference
> it is guaranteed that the usb::Device is bound to its USB device driver
> (struct usb_device_driver).
> 
> The code above establishes that you can get a &usb::Device<Bound> from a
> &usb::Interface<Bound>, i.e. an interface that is bound to a USB driver
> (struct usb_driver).
> 
> It also does establish the same with other device contexts, such as the Core
> context.
> 
> Despite the question whether this is sematically useful, I doubt that this is
> a correct assumption to take.

The intention of the USB stack is that yes, a usb_device cannot have 
children if it isn't bound to a usb_device_driver.  However, we don't 
try to guarantee that this is true; a particular driver might not 
enforce this restriction.

There is a surprisingly large number of calls to 
usb_register_device_driver() in the kernel (four in addition to the 
standard one).  I suppose a little auditing could ensure that these 
drivers do deconfigure their devices when they unbind.

Alan Stern
