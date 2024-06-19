Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B2713C8EA
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718796791; cv=none; b=VxRly6v/vwgPD9b3SlhjbdwvvM54Ots3RfPPwNsHNR4uJNX2Ze2qhJgzE1hR9sIu0EPBpALZk/qj9k3kaFdSdcSPvoMkBJlorP6XshlhmDf8AaeyBWU1GIQ5NGHb0ghlVBxanYxX05UUl8rO5ZGywkxnYc9HhoC9ybt0soOi7AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718796791; c=relaxed/simple;
	bh=zu1vs7ZdDVtFoE38c70rrqDEqtDlY34Ku3fCysJmNdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=P6ePpxctuiihj5cjVE9+giyKdNPwRqMYzfYXCvj7jfWlPNIgprnxeBmg5m+v7cmGMIUKEVntqSim3ojOK0rTKPloigkJgglFf6URBGBh/Uxg3SG7siydGCLBHq4lUoFA675hOXgfmthGcXO1SJF0nBGokywPi1hYtcxpSLVeOck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M23GDzaQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M23GDzaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718796789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X/Q2VF9fZ8HK87tEqiSr0MKzekbPaQnI9QQW+NcCAq8=;
	b=M23GDzaQVd0aEulsh6z844yaxGWTHIczNb4/eCGdAPqCQ6/jXZqmRr2V2dtSmO670oWmJK
	1oWu4TVT96nt3cxvR3Rymri7jHlcL0qpn10gIsPjnR7d/7PRUry+rNuWET+PeL63DPZyZ+
	3O0R1E3SLYu+gKhi1rFE7QbQGaFmQXs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-0t6e8hIaPn2k8ZH_UIub5Q-1; Wed, 19 Jun 2024 07:33:08 -0400
X-MC-Unique: 0t6e8hIaPn2k8ZH_UIub5Q-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4247047e74aso16777395e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 04:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796787; x=1719401587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/Q2VF9fZ8HK87tEqiSr0MKzekbPaQnI9QQW+NcCAq8=;
        b=MRMyNtEEcUIpLKTn87pzlFVaWKV+sNBZYBi97FlQ0tYUI6CWcMjYq5lT4EWnObrZLA
         Q2Hj2RjEqlhSV6CkT7No+P67ZaKEUnZAFAcPeptIy1D/vSK4tDNTpkDUkSlUlxMRhyQ3
         e/rfShPsj5dsaOhoI63JPhVFUIbFh/0D7poOo/sAH4BRZnWQMXFU7oXhaqsFXTNWyzcc
         7mWpVRQUjeIYPLaBLV7uOpmATUdeE0zX8pJVYmIQnU4iCrv4yC1F7Xs0hLizFv7j2QQB
         xMfKmyhhE3hmpbtscZS41kfze6KDHgLroyAMBmFQvB1+xi6UXLbbjQBugGk+DxkLN/It
         bAbw==
X-Forwarded-Encrypted: i=1; AJvYcCU+gXUyM11eMC5QvbeE/VLmfr1eRBEYDtnFHGlnk+YWyulSIKofz7lUgSPUj2fJF7e3iZszqvCQQ1bCQaACYsNwSaZXNuqI787iSx5f0nE=
X-Gm-Message-State: AOJu0YwZDRoiSvF0Sm5ng99s63Bdfz37ZEldaL/mh+5XqpbGklgDHnxW
	UADk/PrtuwtXgoin/So/ZW6gas0bnSuP1G2ZaxZ/hOfYGrLSemK7a7/i7+3+lBQnFLOr+S5mnU8
	A32bYefVFVgUmCCNVtk7qUr/WwC8OkY8jIm51aRvSmWV5r3MzpCnVnmAx2dix75ua
X-Received: by 2002:a05:600c:4244:b0:421:f43d:dadd with SMTP id 5b1f17b1804b1-4247529bce6mr20526965e9.33.1718796787204;
        Wed, 19 Jun 2024 04:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqpVPfgWKKcRncsnLWODxvfCBzAlT7douK77Cb12ZP17mu8jO7pgfL+qWICCltVabK5jaTcQ==
X-Received: by 2002:a05:600c:4244:b0:421:f43d:dadd with SMTP id 5b1f17b1804b1-4247529bce6mr20526775e9.33.1718796786850;
        Wed, 19 Jun 2024 04:33:06 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6320bf2sm225835235e9.31.2024.06.19.04.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:33:06 -0700 (PDT)
Date: Wed, 19 Jun 2024 13:33:04 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Benno Lossin <benno.lossin@proton.me>, rafael@kernel.org,
	mcgrof@kernel.org, russ.weight@linux.dev, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com,
	aliceryhl@google.com, airlied@gmail.com, fujita.tomonori@gmail.com,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] rust: add firmware abstractions
Message-ID: <ZnLB8KfIFpN5dlid@pollux>
References: <20240618154841.6716-1-dakr@redhat.com>
 <20240618154841.6716-3-dakr@redhat.com>
 <8d6f98c2-afe2-4e94-b630-96a8fa0b39cf@proton.me>
 <ZnKod6Wn5louhPu8@pollux>
 <2024061900-outspoken-blast-a391@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024061900-outspoken-blast-a391@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 12:43:55PM +0200, Greg KH wrote:
> On Wed, Jun 19, 2024 at 11:44:23AM +0200, Danilo Krummrich wrote:
> > Greg,
> > 
> > Benno's comments provide some nice hints to further improve the safety comments.
> > Since I was notified that those patches hit your tree already, how do you want
> > to proceed?
> 
> Please start by not top-posting :)

Well, I guess it kinda made sense in this case, since I wasn't replying to any
of the comments specifically.

> 
> Anyway, patches on top of what is in my tree is fine, these are just
> comment updates, not any real broken issue to prevent the existing stuff
> from existing.

Ok, I'll send you another series for this including the changes for the
MAINTAINERS file.

- Danilo

> 
> thanks,
> 
> greg k-h
> 

