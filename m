Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4DE32860C
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 10:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760610002; cv=none; b=qa1FjQjHE9LihzOyolwMBvArBoDbIEhHMxiLZugFBGaN4q6gLC+dXIU6VpSsHDEldgkjSy5S8Cd674d/h3szFIJzxPnqzeK4dg4rKdBTAjcqAjlWRoVsvrbPHOn7QuEIuL94bs6bhJ2ir4ra0ay19q0gQOkGajJI9H0Rm/WUUQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760610002; c=relaxed/simple;
	bh=Ja9OCsmngnUSE9D933GXE20U1SEDuEIJ/kJB/Ud5X8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iC8ea41fFOcI3w9n/1HZBs8IqpDdajXiyZi3LZD7F0V2kll9Lo/6G2uAJQhOeZo6aG9dLZrM2GuOfZvhgMZLStmDF0eHJAJwWHxiil2YeyuXGq3jvFRXWxddDfbQ/uTTVc9uWcpkk7zf6p8Vq5raMbGdCKNaQISfPJhNM8Nrjks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CM2gDSjS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CM2gDSjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760609999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/lG9IkRu6rTULVmHXXnaYdq5MUjY3K7YFZ2k7C6bWjI=;
	b=CM2gDSjSnPKnViVoa82hUAb26nL9zp7ahFP49YY/5Mx6DiN3WzD849CaWWZESzTc34dKS7
	tsuRVuplFHPpMHxwU5BwDzorbWlb7BmMxcwdnMqQJov7bi7vY/U41XSuhII92W8T9ltQVO
	0aZa4bEwJ/baK4z+2SETmhKAKviR7k0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-dAf6z5g3Opye92H6DJ3pYw-1; Thu, 16 Oct 2025 06:19:58 -0400
X-MC-Unique: dAf6z5g3Opye92H6DJ3pYw-1
X-Mimecast-MFC-AGG-ID: dAf6z5g3Opye92H6DJ3pYw_1760609998
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28e538b5f23so8471435ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 03:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609998; x=1761214798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lG9IkRu6rTULVmHXXnaYdq5MUjY3K7YFZ2k7C6bWjI=;
        b=J07GuuWFQuclj7R6dkr9gwoArs08tEt1nECK8Ve32Y8u6wpWLmFlBP1vTbKq82u+AH
         y/0MVmdi4ExDHGPTRnMQfmLICPA6mKsjOqkF5jA8RWiYZ67jpYKZotkRUjtjeezvtgW1
         X+t/9ICTNGtdY0krje5iZjaEqziZH7KFwX5SeI34+KgRHg4aOVx0jXurwf97KLghr/wR
         F9UVVbC25dWqdzaLpMt2OlUnWprzdNiDA1OryWm6GjhwZkYHIp7YJ3CNG42PxZ5SRGY+
         9iZ5zq8haMl/ubJmB8cqfH/ay9UvaFOKu9mr07x8AVDYCQ+05/PKJGBw7x9+yIWbXIR5
         bNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlMgTtSVdpzFmz6zwoQ6D0PqhCecuNA+0h53VqwEWcOw9xurfIvM0vcQ+5qq+YVIffvje0sr7SKFwhlck9AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUaz7+Gh//TByvVtwXOKWxFTzL5Yk6Fxaxk7jODJaZcpCkstLA
	YEueZWODi5GxRYsUEtBsu3DdW8TaaUp/BbM6HzlFqQAREy0xuwln8P9mtu8Kw32b1J2jhBaFjaD
	6DkzQtHTM6DuUZq51cdnn5JL9T+AjTiGXQmpySIqllw/tQDmSAYPyE5uYqo7injdl5ArH
X-Gm-Gg: ASbGncuPTPPSVazTvbWegSgD7qReXA2BJNKiOtXlt6o2UfyqBrpi40Eqjpp0/rR49BP
	r+64o2JiHVEzwBQ9UcXUNFKTD5CBkg/VCSBhPkRAdGErmpJmDmr9/HS9TMgFWWq7cweBAs+EcEX
	XVk5sMAE3tRkfoBAX6cFjOU1vnmtOpZbA+4IQTS2hOP5LY9aTTIgsSzUJrNWmC/0H5GT8mtnS04
	+w1D7To8jz9aSH8sF7YSPa6TRBhnbnKd8ncPOKmNt71xH/hzsidc/iSAUzUBxnqIAbWHeU9f4Fh
	Hx8Dpj61t2qU2hOHH6uyA1BVlj0XMjM4L2/uI0X4z+0JDiT2vbvw//MfmxvXn0lQ4v36Jg==
X-Received: by 2002:a17:903:f85:b0:264:befb:829c with SMTP id d9443c01a7336-2902721634bmr337193855ad.9.1760609997634;
        Thu, 16 Oct 2025 03:19:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTlevuCwFZug23HK7ieK2PBYjuqcD3nAVQRBsGzWAIrpjkSn/kauHrjBi4EzPYnipAaY0fKQ==
X-Received: by 2002:a17:903:f85:b0:264:befb:829c with SMTP id d9443c01a7336-2902721634bmr337193655ad.9.1760609997255;
        Thu, 16 Oct 2025 03:19:57 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290ad977cacsm15444725ad.105.2025.10.16.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:19:56 -0700 (PDT)
Date: Thu, 16 Oct 2025 19:19:51 +0900
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: arnd@arndb.de, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, viro@zeniv.linux.org.uk,
	brauner@kernel.org, jack@suse.cz, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH rust-next v2 0/3] rust: miscdevice: add llseek support
Message-ID: <aPDGxz04OQgzRQqL@zeus>
References: <20251015040246.151141-1-ryasuoka@redhat.com>
 <2025101544-stopper-rifling-00e0@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2025101544-stopper-rifling-00e0@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H48SEFZth_Sp3CvcDULcBvyuTAft-lDb-ZYDL7TiE8k_1760609998
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 15, 2025 at 07:40:12AM +0200, Greg KH wrote:
> On Wed, Oct 15, 2025 at 01:02:40PM +0900, Ryosuke Yasuoka wrote:
> > Hi all,
> > 
> > This patch series add support for the llseek file operation to misc
> > devices written in Rust.
> 
> Cool, but what miscdevice driver needs llseek support?  Do you have a
> real user for this that we can see as well?

Currently no. Because lseek is one of fundamental functions for device
driver, I think it's valuable to add support. I believe we'll have real
users based on read, write, and this lseek support.

What do you think? Thank you for your comment.

Best regards,
Ryosuke

> thanks,
> 
> greg k-h
> 

