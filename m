Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3546016ABD5
	for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 13:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902278; cv=none; b=P05c3IoEKIn7cp7WojP/0qz2wdj0sgqhq3SRkxI6KZ1GOxJ+z00CS/Aa0e2T9S3cBcn/N3E74V0CyriUECkpoYNb0zXfXZv1tvxiznN9glON3pWZk86RGVPjmMROvTaX8DF9WR+E+H54hUoGUildCAJ2fa8cH8m6YgGGTDrWiGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902278; c=relaxed/simple;
	bh=JgKjnfJRpa7UAUxJLJ3rRTMKIgxDQ2+llerOlsxZuqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Wrqf9Sy2E7MA51rm+pUrAP5Q0+Jkh0/tBvQNvznuxyzoBeYJ7IWUePwswd4jPmQATDdkzCQrmWMMkeGvYmFcTm6oWEqgp87CEyrrwufRusq8F/Y6SxWzN6qMsmfEue9ouvZPxkEe8XSbbPwJECtTg/tAT/Z13B4hO3PvNTaPDMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UVS3ebLq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UVS3ebLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716902276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lXhZ4GwLcoi2UfjZqW+CqubaUGEnLtPdVEK+h8tMm30=;
	b=UVS3ebLq5pz4hE50uihTCs0b60+u0l2JJKXIMnBB3t1z5EeWEhn/raTmYNKZvTBEmZIIaq
	azIwbhkoowSDOEhbN007YyY+MZ2UAfSDcXO6sdp+qvuoxByKzqTKBAuea+if43168Mrs85
	j4J1FCSXX5fHYZv6iDIKWsCiuS+7Aos=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-Eo80Hg1oPkyf4uZyFWy78w-1; Tue, 28 May 2024 09:17:54 -0400
X-MC-Unique: Eo80Hg1oPkyf4uZyFWy78w-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-420fe1575bbso4923945e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 06:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716902273; x=1717507073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXhZ4GwLcoi2UfjZqW+CqubaUGEnLtPdVEK+h8tMm30=;
        b=kIbnE3RLT1mkX/VdWhf5TQBy5v8A5lIn39w/LbsMvI+je2ERKAYeeykYA4eJ8QzdsT
         n19wgEOQAU8VHKcXNIT3vPhQRMUf7tKB3UUOqOBEX6HBixWYJGMgaFRkDqpPWDdBjpf5
         K6bhA5GMsvDc8IJisFwoLAOUiUpv37WtjvEaNCHe1n7rkTntBUQxJLemmgT90Y69uwsu
         TwdwQYW1Gwe0qr+iCckK2freKoCcZ7v5MWnnhKChNjclYjhRvBqD0xcQ/xpnUYqQIL8A
         qquxTnnG4XwUaxev3Fgk/8TFLHFhMiQhrFdZnj3H289zbs68O2IpS0204ZIE47wMDpiY
         4l3w==
X-Forwarded-Encrypted: i=1; AJvYcCXlT5FVAajMoQUmJzWe6u4Nqs5pJktAjaZYik3P3XpL9pf3of4RN2N1ISRWex3jeJYi4AIXKqeXM+xLyK3C7EAZ38lcet/4l4ZUUw1Hrt4=
X-Gm-Message-State: AOJu0Yzfdx2lwR4bYehEvHMnMfCdxzFwJR9WfVRS0BGEY8MS2EchFoUJ
	IUCfgsLadXXJJB9ubNttkE3x546zlKeF6GsRtFm/mZfJeG4H0XGW7pBnMGlnedimSBT5reiqsmN
	4n0ANKTCZ4so8N5VeOIfB/soMY8O3y83lI0F/qddH7afr/Q9z2vzpW2dKg/LY5pKK
X-Received: by 2002:a05:600c:444e:b0:420:14fb:de1f with SMTP id 5b1f17b1804b1-42108a5965fmr80598585e9.14.1716902273653;
        Tue, 28 May 2024 06:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeoUSYJdlcKYm+2Dyn96J9Jaogyqz0LroLG0mk080drd07yOfZ4belYxCkfOPHgHjsh1EdZQ==
X-Received: by 2002:a05:600c:444e:b0:420:14fb:de1f with SMTP id 5b1f17b1804b1-42108a5965fmr80598225e9.14.1716902273213;
        Tue, 28 May 2024 06:17:53 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f1410csm174063405e9.15.2024.05.28.06.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 06:17:52 -0700 (PDT)
Date: Tue, 28 May 2024 15:17:50 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, mcgrof@kernel.org,
	russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlXZfgdZkBveaUJ1@pollux>
References: <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
 <ZlTdh/eQAIhxNn9e@pollux.localdomain>
 <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
 <ZlXLzCYiwdMxic3X@pollux>
 <2024052816-makeshift-irrigate-cef5@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024052816-makeshift-irrigate-cef5@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 28, 2024 at 02:45:02PM +0200, Greg KH wrote:
> On Tue, May 28, 2024 at 02:19:24PM +0200, Danilo Krummrich wrote:
> > However, if you have a driver that needs the firmware abstractions, I would be
> > surprised if there were any hesitations to already merge the minimum device
> > abstractions [1] and this one (once reviewed) without the rest. At least there
> > aren't any from my side.
> > 
> > [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/
> 
> No, the device abstractions are NOT ready for merging just yet, sorry,
> if for no other reason than a non-RFC has never been posted :)

I did not say they are ready. I said that I'd be surprised if we couldn't merge
[1] once it is ready even without the rest being ready. :)

> 
> greg k-h
> 

