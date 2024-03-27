Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1456175814
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711539597; cv=none; b=scMzjjiwTSN/AkHk/ossHZGg0uxM7GuMuqidO0LsmDCxfVtQHuDfz02e6SLnGtShuHX1/V2bKz2DOVbgIglZ+fA5bQehPYiqFCHJZ+pF+P00ngjC7pueWdB48hOADPtFhvtjL5pPwZp4WkOZUlUKnSUgEPt60klt6QxE8gI66Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711539597; c=relaxed/simple;
	bh=xCQ0zGAf/x6xz8zlGYGWUAOnjl5Cd9JWUPUWKuzIG4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=U4HQKymr67TLS+yO6Ivg58+ixLZ/i7frZ9/HXggesZvukxc1l73j71iNRSpOJPX886dj9wKkeszyVGIPXmO9AFiawbjIxiPB1TR1Pxq/QxPn58rDmzT+FUAq02sg4ldWZqXiu3r4pEe2ACLVJ+yeskpPv7iUhm5cQiKwnJ9NvLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AtF3haGI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AtF3haGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711539594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Of+vjJ6UM6z1p/MU6VEFBPxudeeVSWcq9n1Zg7B/LSA=;
	b=AtF3haGIOP7Fi3fWgo2V22TlZOnropf78pmNlf01amC1mot8AlfaJ9EdOa31oqLXKLukqg
	p89MLagBDYlkXboS5hh/f2FKCQ+tIIxjdZwwaQEI5tFFoz3X/pNyvuFiP0MAGcAvFJ6dOI
	OXpUfyUClI/3AVn8UuVkV1W5Xq/tgIk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-aGM2c8X1OzWd2mCbkCBkPQ-1; Wed, 27 Mar 2024 07:39:53 -0400
X-MC-Unique: aGM2c8X1OzWd2mCbkCBkPQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-34172041676so396265f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 04:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711539592; x=1712144392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Of+vjJ6UM6z1p/MU6VEFBPxudeeVSWcq9n1Zg7B/LSA=;
        b=fjq43xEODcdIXxdRWCSNJPpD/N3O+NOT3iuzvX7olnn3EAbhUmEJ3he4MXOh+PzNmG
         ayNG3dufqdCgv87Hc8oInz6E3rKC0Ib7XouaBmJ7KSi+IPUtldg8o02+jufMBjrTP6QD
         u8o2v4SkO153MxcK+ISAlpVZH18RpSHLFjipxT3EQJCx4dCfusPAWjJYHS2xMv10pd0H
         bHgU3UBMNt9XblvwNR8Q+jv5LgH2UdqFVyrQ+5NOFtBElyQ1qHmBGrmAY/3vbbi+EKPP
         jJdK5EM7qyqqMu/m/ZbWwZrVTeQhy7a8GeLbqDNh0Rs20t+PlBp3xh04dH3zy2+9f4m3
         nfAg==
X-Forwarded-Encrypted: i=1; AJvYcCXHUeWGIYgFLJmh2iiqlWxSoz3XYv52IDua11AJBh5Nj0sDGDMY7PRFApl8W1pOpO6oWjK/gHPVr+2nyxz1SSNM1l15WtXBfsm8Smz68Y0=
X-Gm-Message-State: AOJu0Yy6djVJnGy0wXCRQRl96IdepB68M/KV6R/AQU3hLRLDij3IIIog
	yyrLvgMvHvT4YxyWYfYYRxMrRiO/6Xn9r3yTh8ZW5oPkgE2TNUy8VxzhDGEIRQP1ZFSwrhKesDm
	VxIz0ihlaNcaH9pP+AfMvywhDl276TsARwKzanZvXkdjd6J3ZQl3/vxIgfsN3BPlG
X-Received: by 2002:a5d:60c1:0:b0:33e:d139:412c with SMTP id x1-20020a5d60c1000000b0033ed139412cmr3880560wrt.30.1711539592701;
        Wed, 27 Mar 2024 04:39:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6q09Y2YxTYDWAzvdaebCWNVuQIxRh7fzx6Mwn+AsMbOC+5CirC1evqxG1Vj13p2xPW0WhpA==
X-Received: by 2002:a5d:60c1:0:b0:33e:d139:412c with SMTP id x1-20020a5d60c1000000b0033ed139412cmr3880534wrt.30.1711539592394;
        Wed, 27 Mar 2024 04:39:52 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ce3-20020a5d5e03000000b00341cc9c1871sm8512703wrb.0.2024.03.27.04.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 04:39:52 -0700 (PDT)
Date: Wed, 27 Mar 2024 12:39:49 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 2/8] rust: device: Add a minimal RawDevice trait
Message-ID: <ZgQFhSurjk7r6SCP@pollux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-3-dakr@redhat.com>
 <2024032501-unplanned-detergent-4357@gregkh>
 <ZgNOda6P-dfUaZSV@pollux>
 <2024032747-labrador-remindful-4683@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024032747-labrador-remindful-4683@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 27, 2024 at 06:25:53AM +0100, Greg KH wrote:
> On Tue, Mar 26, 2024 at 11:38:45PM +0100, Danilo Krummrich wrote:
> > On Mon, Mar 25, 2024 at 07:14:17PM +0100, Greg KH wrote:
> > > On Mon, Mar 25, 2024 at 06:49:06PM +0100, Danilo Krummrich wrote:
> > > > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > > 
> > > > Add a RawDevice trait which can be implemented by any type representing
> > > > a device class (such as a PlatformDevice). This is the minimum amount of
> > > > Device support code required to unblock abstractions that need to take
> > > > device pointers.
> > > > 
> > > > Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> > > > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > > > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > ---
> > > >  rust/bindings/bindings_helper.h |  1 +
> > > >  rust/kernel/device.rs           | 23 +++++++++++++++++++++++
> > > 
> > > As fun as it is to bury .rs files down in rust/ where no one notices
> > > them, I'm going to ask for this to live in drivers/base/ please so that
> > > we notice it and it shows up as a first-class interface here.  Otherwise
> > > it's going to be impossible to keep in sync over time.
> > > 
> > > Also, who is going to maintain this?  Didn't checkpatch warn you when
> > > you ran it against this patch?  You did use checkpatch, right?  :)
> > 
> > Sure, but I left this open to discuss this intentionally.
> > 
> > As you might have noticed, I'm not the original author of those patches. I
> > gathered them from various places (mostly the original R4L "rust" branch).
> > 
> > I basically figured out the dependencies, structured things in corresponding
> > staging branches, fixed some issues and polished the commits; the details are
> > in [1].
> 
> And it looks like you ignored the review comments from a year ago when
> these were last submitted, as Wedson pointed out :(

Please see the other mail thread for explanation.

> 
> Please, when taking code from others, be sure you are not sending stuff
> that has already been rejected, that just wastes all of our time...

I don't see that anything has been rejected from the previous mail thread.

> 
> greg k-h
> 

