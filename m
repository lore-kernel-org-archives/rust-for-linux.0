Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E882080E6
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Feb 2025 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596763; cv=none; b=Qvc/I0I8XtOQEubQboBLs8fWyy4xwetTiHpJWNG4y8yUV9bdHCK3mkNWk4cwg+p8IMPomqYgyXMT/Ol7fc1MfC0/qI7B7FvYY/MViKAhp1XFuMdR2cAiYgxi5Z0nR72myGIiVrq3RmIJL5DjF5AFOEGmJ5t363UZDqPAB8qSlyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596763; c=relaxed/simple;
	bh=aVs0339rK+i2NEgNlf9OaZRidgVZu+tpkNfGjOGSoa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+7XP0hrx1ETpww981wC/S1+1ZrSzzEDidK4dDtrDfSL2s8+mB4ucH/1OlI7OJ5AAiMA0EmdgkaFP83K/pGmfud1u02WIoM+nql9eZltzCCkmTdGw9LxioousO5TXPyWGi/Mq6Cg/betYrSGrWeZnsCcN1xEluq76r7Ebn3OcrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=QKOdFNta; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="QKOdFNta"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436a03197b2so31218735e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Feb 2025 07:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738596759; x=1739201559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tASHm1C70jhwuX5F01PGLvuq2V3W2OhvSbK9UTRx0HY=;
        b=QKOdFNtaCFlwFJIKYY1+QPV9/xVADV6mwVcZGTbCtZDxbdWXRoqchOYi0WCDLFeEKJ
         U9POSfPEyE2aGmI18Zal4AXaqKjOMa5BZVHvY2vR1m/MOo51KzsoUz5B5fdkWRhUtQ4K
         7/2ZeanfqI4+CyJuQek2NcWO1kyXQwuELP1ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596759; x=1739201559;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tASHm1C70jhwuX5F01PGLvuq2V3W2OhvSbK9UTRx0HY=;
        b=w5SWIM9cRb06wDb6IUgR15KUIz8ZRTHPMvEqqTdqbuW5DQ5AUZcES4Pz5anVmIeIBw
         4u/nBBiCUnvuu0MStAHMtuoUDz3fHqycObYITcZSWpwQOP9nRTSG7g0tk3I5iCLy0w8H
         k4Fs4jMkov88iTnA0AqqgabzclE6cyOq618kmFPXeIpnW5VNjQskkWHCXAE6pHLPSk5k
         xZy8fkktI1YILOS/OyZGbWz4sUsObfsWdtSkrGsROczjU2DVWGeqPOdFTEJ9psn1MF8s
         gcBMGMX2Ts823wY4IrL9AxHgM34N3HTgf0DygWUajhukdAJnUCRImvVWgVvzN/zM4Yb8
         hZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCV/d+1ZDU9I2cP7V2W6yV8RDrW0zIbA3uW6zf0L5mvxIOF2uRSkQFx0qaezwKSO6NkzFG/CbzNBoRqPXAH2EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYzvFSdoX2q+sMLDn191aCHYKaPlNUtQAw0RNJoOTjxDnT33FW
	j5QsoItyaP2xbWUCsYU5HKYd2RKhi2mvYTG/5NVgvXHy8hZ1xeMaD++W5C1Y3Ug=
X-Gm-Gg: ASbGncvQRahCDKVPKazaBgl0JGV+zJ2c942ZQK0/DG4kMqoe5BGZYl+t03QdyU14q24
	YegZ5dbPDLJvQwCELmiyYUQqpYBep7ObVgfuMPb5VQIaawLrU+AWK/EEscTIxHYQ0Jq4xhsCrnF
	nWtQzpONxqp6CIBYrf5dpEBwjkaqT4RcAVRPN0pCRV3NJWq/yMhZJgPSDnYDaRqtDHJBv/aiGJr
	WE5abPyu3LnwY+5cpUCayfHXaJnb5WouaWzdfg6OfE18JfwhBfQAOz/cPkRa1J2QirozWQIzhGv
	gLxh8HPWlG5VsGqGYGuMVnry5+w=
X-Google-Smtp-Source: AGHT+IFTO5pDwjknvUWwhFFT0g4Fb+OGxLnooPPpMroZTN32fq+W0h8vJSj97BCGcY8k0kSqU5MzWA==
X-Received: by 2002:a05:600c:1d07:b0:436:1ac2:1ad2 with SMTP id 5b1f17b1804b1-438dc40fd65mr180957655e9.19.1738596759171;
        Mon, 03 Feb 2025 07:32:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc12f28sm192800955e9.7.2025.02.03.07.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:32:38 -0800 (PST)
Date: Mon, 3 Feb 2025 16:32:36 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [RFC] driver core: add a virtual bus for use when a simple
 device/bus is needed
Message-ID: <Z6DhlC2t4R5vHtam@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
 <Z50ZuzrDn-GQWOuP@cassiopeiae>
 <2025020106-avert-senorita-4181@gregkh>
 <2025020306-overhang-glider-7d42@gregkh>
 <Z6Ch8O-0oY70Jhi6@pollux>
 <2025020307-cavalier-knapsack-7f89@gregkh>
 <2025020300-carol-emblem-07ff@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020300-carol-emblem-07ff@gregkh>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Mon, Feb 03, 2025 at 03:33:32PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 03, 2025 at 12:25:23PM +0100, Greg Kroah-Hartman wrote:
> > > The more I think about it, the less I think it's a good idea, since it'd
> > > probably trick people into coming up with questionable constructs...
> > 
> > No, I think it will work, let me do some replacements later today after
> > I get some other work done, I think it does make sense, don't doubt
> > yourself :)
> 
> New version is now at:
> 	https://lore.kernel.org/r/2025020324-thermal-quilt-1bae@gregkh
> 
> I've renamed it from "virtual" to "faux" as virtual can easily get
> confused with virtio stuff, and we already have a /sys/devices/virtual/
> that is for something else at the moment.
> 
> Let me know if there's anything I can change that would make a rust
> binding simpler.

I think this should work, for vkms we can prefix the names with "vkms-"
and then add whatever the user used as name in configfs (the instance
directory name or whatever it's called) and it should all work out. Unless
the user does something stupid, in which case it's not our problem.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
