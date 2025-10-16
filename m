Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF9232D442
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760625580; cv=none; b=tt7iKNIZ01ADGCqrlczdWuWHNbTZxcyvMuBx4ZEro1mtWBges9REEqLRFuKnlAgD/mWStU/UsT9i8G3JA5OGAJhSyI6ACXste/XPZAZdMbip9YSPpDL0FxL6LeqwUaYbShFSsXk98KUplwlzD8m0DgRFGhum9I014lGe3Z9YvrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760625580; c=relaxed/simple;
	bh=oAFOf0C7FHbG2dP8F5Uk3uZewMXJkblvCyuuZPnvJXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cNzKSKAqASAnz43vbqyXB1xGdrG1guOf73sNyAVTMZ5BDT3SfXBTUq8eNEOWV/SE0MeSoepsH+nj4PL2yZ7TUWvvfzaPpUTCGJSB00mfZOaAKItHilSjPEPzSSaGbTjzIUhJ6z30RZlZmr9WLkWBOypcY5MMRb/9zOfT+gxyeAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gu763z17; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gu763z17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760625578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AtluYhVLkbO8u0oWJsyCOzeQxxX6dgreB/25XigeFbM=;
	b=Gu763z17LVMZQYyaO0bFjIe+KPY9KCmn8hHLtJeloHTzsJB2SNrPS/4CnLB4/Z4lSocrdK
	p13UnCqm3nquyYy2E369zR7tBMHpMzoiN3g4NVLnIDJN8vjkjmq8v30ImzN/20xHJmtRHs
	NzbqNdobpzogucxFOQ/kvxv/Morcc9M=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-YaPdrRWDN7KfgO5W54wBhw-1; Thu, 16 Oct 2025 10:39:35 -0400
X-MC-Unique: YaPdrRWDN7KfgO5W54wBhw-1
X-Mimecast-MFC-AGG-ID: YaPdrRWDN7KfgO5W54wBhw_1760625574
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27eca7298d9so19538375ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 07:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760625574; x=1761230374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtluYhVLkbO8u0oWJsyCOzeQxxX6dgreB/25XigeFbM=;
        b=GU8DhjdpbrxjY+/b29Hyyv+XKoRws1tWdgNk03WHGHwE7JX1JpP3dVbjXJQr0NNPIa
         X9lVtSZPeVsXSPxEZRWbloJira4tDTtxM9TAD5TYmTIgUHbd0WOrfE/9xuMPynqVIxvA
         NJdeJi4C+f4CVmMVCsDHuZaYfSMVrfJ1PqjNrL9yNiMj4TZh04yPhEDN3pYnKhf2Hbq0
         Qyaeq1ia1JvbgMEz/bER8PNR+eQK7dzcqpnIfWHktTp5a0Xe6L+lX+1HFg1u058273w9
         sSihlqtaF0ohBdVZ82W9QuUMbIxi22+i1AV+AOAbfUOLNeg0Poew/Ae6o/Zw127hFKfI
         7DtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlSw4EhklGsq3SEGRov+eH7CIhCyfCWaB2NfbPFf8/esXLrjAyN+OTCm3zwf4Ggls6uyDq1i296SQ3U5ug5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJnovn7LR/+SHb3BB1nGEobfyG2F9ZI/SYHYEwnAiN2EcltkAD
	29TXp6UPa9RhilNUXiuhN5yEndVxF0xx7PhM0hEjopinb1SKkqymGaFI1pUEfFtwpx+cPrgYVpi
	Gp6fSxlZMUZ79tMOrs1r9/Q8F94iC1NMCmUj/63ATUtANDd9mQAMg36ctpAHQDRHNZSDs
X-Gm-Gg: ASbGncugPRLp3GcXMr32u1Pi0giKJp4Y5viqn3WHiHFBsBlyIMu6NsGunnwQfxBQJ1o
	jvfP3l/p2gePp31t/7jIBtoYfvqfzI5qgmQR3VwmRl4Yr7tOQHmPJCxtCRKqIs8k6+Jvm23F7EO
	1k3ZeJfTpuVnGPkTbS2rx0Vcpv1hbuOK5mhCGRCXN7gysmtYjLEhKiu+6ONEGG6wnrSrwsRdgP9
	No5dgv5n4gi/kTAop9CjY9B9eaz8sTXug9ENsLvYENFpVuineUZImio0xZftF3bg6DavkGDut/V
	AAf4tZ5RlQu/q8XSmWc6anMl4a33sp7IvxvuEtdeChOKi5WPQFI273Zn2kiAzJO8lcpW0Q==
X-Received: by 2002:a17:903:1a0b:b0:290:b14c:4f37 with SMTP id d9443c01a7336-290cb9475cfmr2113295ad.30.1760625574006;
        Thu, 16 Oct 2025 07:39:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoR3sOX166Tcf7MLH16gWKdUAYv0AI7cWSg6pn0j1tfmbyKX2QRAiCoA7ig0qK9oVKh4us1Q==
X-Received: by 2002:a17:903:1a0b:b0:290:b14c:4f37 with SMTP id d9443c01a7336-290cb9475cfmr2112865ad.30.1760625573497;
        Thu, 16 Oct 2025 07:39:33 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7cec6sm32751745ad.55.2025.10.16.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 07:39:32 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:39:28 +0900
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: arnd@arndb.de, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, viro@zeniv.linux.org.uk,
	brauner@kernel.org, jack@suse.cz, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH rust-next v2 0/3] rust: miscdevice: add llseek support
Message-ID: <aPEDoAXCqGxwPM5D@zeus>
References: <20251015040246.151141-1-ryasuoka@redhat.com>
 <2025101544-stopper-rifling-00e0@gregkh>
 <aPDGxz04OQgzRQqL@zeus>
 <2025101610-detention-dangle-cef6@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2025101610-detention-dangle-cef6@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 19EkU9Rm52byfnUIOTqeBsXTQC86nRVoi2mgSUn8JVQ_1760625574
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 16, 2025 at 01:24:12PM +0200, Greg KH wrote:
> On Thu, Oct 16, 2025 at 07:19:51PM +0900, Ryosuke Yasuoka wrote:
> > On Wed, Oct 15, 2025 at 07:40:12AM +0200, Greg KH wrote:
> > > On Wed, Oct 15, 2025 at 01:02:40PM +0900, Ryosuke Yasuoka wrote:
> > > > Hi all,
> > > > 
> > > > This patch series add support for the llseek file operation to misc
> > > > devices written in Rust.
> > > 
> > > Cool, but what miscdevice driver needs llseek support?  Do you have a
> > > real user for this that we can see as well?
> > 
> > Currently no. Because lseek is one of fundamental functions for device
> > driver, I think it's valuable to add support. I believe we'll have real
> > users based on read, write, and this lseek support.
> 
> Char devices that use lseek are "odd", don't you agree?  There are no
> such current users under drivers/misc/ and only a rare few under
> drivers/char/ (the huge user of that is mem.c but we aren't going to be
> reimplementing that in rust any time soon...)
> 
> So without a real user of this api, I suggest we hold-off on adding it.
> Let's not add it until someone comes up with a very valid reason for it.

Thank you for your review and clear explanation.

I understand your point. It makes sense not to add this without real
user. I'll hold off on this and will revisit it if a concrete use case
emerges.

Best regards,
Ryosuke

> thanks,
> 
> greg k-h
> 

