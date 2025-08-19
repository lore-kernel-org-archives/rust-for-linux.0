Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE041A7253
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 05:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755580239; cv=none; b=gzbh/iFO3weOUGFuNKz+ew6ltKXiM7qFQkVvro955gwvpe9irAbgO2zY4MszXP31pwtX5Oj2JwdmweyTJnTk54ez17P0Jnztbms28duSB3bcuBXr+a21iUxBGriltpa4fAFLe+9Si0pWjNv8O0HmeUNtCMr8e6EL7eQ6+ka2gDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755580239; c=relaxed/simple;
	bh=URETRUUnf5Nf4QLwoBwTW7sh1xhwroIB5KhjlsfYNrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jQi/0/ur4allClkFZDRkMl5DDBZAqSKHVNT8sOD7G/Rt3wRBmiESVoFWVJYhW64KxQqu1A8M3FYjfdBI3+bXlb7vlSSSAfnnohx9yoYszzt/2x2Q1YeBvf9qp879mXGxC1yIgMaOlEq3V00xt6gjJh/Bpgr0WgB/jQYKo0DNVAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F5RjcTl7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F5RjcTl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755580235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UcMWmSwQxQAwGftbQEwa8JZHokvZ0U7fwYMtmA0OKvY=;
	b=F5RjcTl7DVqUkdQMS1EZax58CPpwr/+iY+O5GstmVIZWBH+Q6cML/laQl1R+zQTPoI3Mii
	DdwDgem/Wd9oS+aEnOx/ZqW6iAU7seDpw4xJdb0P8P03I8eJwjDksItdQqvq7G9sCjvQVm
	sT3LuAtYW+/wtk9Dtk6fXK76LAp4HpI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-48oKDIkSMH-0YmEZ-OoBJQ-1; Tue, 19 Aug 2025 01:10:34 -0400
X-MC-Unique: 48oKDIkSMH-0YmEZ-OoBJQ-1
X-Mimecast-MFC-AGG-ID: 48oKDIkSMH-0YmEZ-OoBJQ_1755580233
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32326bed374so4212447a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 22:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755580233; x=1756185033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcMWmSwQxQAwGftbQEwa8JZHokvZ0U7fwYMtmA0OKvY=;
        b=cN/qLKYyAZpEgis49AOVxxLbpOQKAK/Sf0qeier8iTNqM84tciDnSBx6RKWmfA3Y0L
         fFXD+GofGiTjcl01Iz5Ty7wPpdco34or+1vFxuyxGvYLncYBqnnno2UGKp2Oqn9y0Uv1
         VdvfQMfFabP3Za9oZu9+IsSgl+JS0RDq0TjiklguGoM1Op6Dg7IXJzaBPMtCyydJ+yA/
         l33glNBEIENNqjZxqFli5oGtQnHG1yYbyHxNJG9+pSmLvUvFlOjQ3+NNndSLXKP2Wh7T
         A2Y31StmEFidHrRxlJXB0MLOG9tXQD3LLjCSwG9U3H8KwYS6CuBljNehf9nLTlHrxiUz
         4W5w==
X-Forwarded-Encrypted: i=1; AJvYcCV9CIAAwNMFmKnwCKK5YFbGKHV7PpLKPIgtgTHa0yak3SgeUpxUf+r2Obd4GOtNk7OLVWMpg1XIaJSTFytgVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQV199K0byxEgVoSNTyL5u0lv9c3pf6iiMXCKqNuLc5OqLnfqs
	HoBEhzmEu8TuLvDKmxgWu/PTc3c3eK9ETniUUr1XCmzIDB7vbzt2X2b4zuEe+zZV+qhUuH7O8Vr
	YpQ2VnZtGLEtglgMOUHjbTTFDu58xTA6E4mFC3gE/6WzTWMRKMiZ8YCK9oJcheCJJ4JBG
X-Gm-Gg: ASbGnctOyonEvJlO34/dINjrcRj+4B7E5CFHnXYUaTE9PZRqJ+u0YJoyR9UQostupRI
	DKiAYsSEnaLFY6CencT6h6MM3uAK/s2UFKLRYe8YuokHgdNJeC5+UPVhfcUKYCfEeSseWU2+bEE
	eVzdqWWCtMakcafmPSHZdSqRQEHYXcv4nvC09gsKsDzmfWhlw77LUBvwlQBIrxWZVWPJsxtffzw
	moqSpEx1GZuB/5ZEdBL1ybcpDQKq1+YsaakYAfIeMyMkTs9SmFx7ur782RBBTLM8oCEgKQHfFdy
	icy9eXEcR28hsGAZdON6APe8ozTeEuhxgg==
X-Received: by 2002:a17:90b:3851:b0:321:c53c:4e50 with SMTP id 98e67ed59e1d1-32476a6cfeamr1808242a91.18.1755580233033;
        Mon, 18 Aug 2025 22:10:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY9DXiOXbeVkCNAdAOHO3J5NlS0U+d+VNCaQG7DmDml3jFwO/JkAy0MSW2lJdU5b7sc6c5ug==
X-Received: by 2002:a17:90b:3851:b0:321:c53c:4e50 with SMTP id 98e67ed59e1d1-32476a6cfeamr1808217a91.18.1755580232515;
        Mon, 18 Aug 2025 22:10:32 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32330fc3684sm12883856a91.11.2025.08.18.22.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:10:31 -0700 (PDT)
Date: Tue, 19 Aug 2025 14:10:27 +0900
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: arnd@arndb.de, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, lee@kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH rust-next 1/2] rust: miscdevice: add llseek support
Message-ID: <aKQHQ4av5ZqfQ8Q1@zeus>
References: <20250818135846.133722-1-ryasuoka@redhat.com>
 <20250818135846.133722-2-ryasuoka@redhat.com>
 <2025081836-unbraided-justness-4b43@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2025081836-unbraided-justness-4b43@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pu9N2KGjh-834rBkqdcNAVVgG2oOrTfBP7mr01yWQRU_1755580233
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 18, 2025 at 04:17:40PM +0200, Greg KH wrote:
> On Mon, Aug 18, 2025 at 10:58:38PM +0900, Ryosuke Yasuoka wrote:
> > Add the ability to write a file_operations->llseek hook in Rust when
> > using the miscdevice abstraction.
> > 
> > Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> > ---
> >  rust/kernel/miscdevice.rs | 36 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> 
> What misc device driver needs any real llseek function?  The ones I see
> in the tree are only using generic_llseek or noop_llseek.
> 
> Do you have a specific misc driver that you want to write in rust that
> needs this call?

No, I'm not actually writing a practical misc driver. I'm just creating
a toy misc driver to use for testing.

In my toy driver, I need read, write, lseek, and ioctl to verify the
basic functionality of the device driver. I saw the Jones and Alice were
already working on read/write functions [1] and I believe they will
propose their patch soon. So I propose implementing lseek which
anyone does not work on currently. This is the background of my patch.

As you mentioned, lseek by itself probably doesn't have much meaning.
Should I wait for their read/write implementation to be finalized before
proceeding this?

[1] https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/.E2.9C.94.20Miscdevice.20read.2Fwrite.20abstraction.3F/with/497953296

Thank you very much for your comment.
Ryosuke

> 
> thanks,
> 
> greg k-h
> 

