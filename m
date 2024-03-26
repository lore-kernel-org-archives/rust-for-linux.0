Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47846131185
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 22:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711492734; cv=none; b=c1oaKMTeIit6rflsYOqZwMq7zyMQ1PtuVAcDjqDrxx29HUus/V50Tb3+z4wksPPqSI/C8RSbNS07aEdH7ICbnfYtJYSeP5lh5mE3lX01TIkhtv7OIfxLHsfMUhfBcmNvmuSmg00tuIZAG0gmlmD18U/bsWsahNoB72kbANPCdS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711492734; c=relaxed/simple;
	bh=OHFxwnRky2FK7BMBz2InBtwZu32sh7UmGU3TwpDMV60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fWS++OTdIpbDqQvp4jChYZTSNQn3SyO/yZOpizTaQ/MgdC7ks+acOQbXaqWQKPl33I3J93J80JT4rw+3XFCsPn4LDD0lZ/HNzl6Tfs6zaHXrgaDtqnTUNlH8txizrti1pODXIkS4XMLscTVQ8BSySgmeESK3vEbbaQbrCPsz4Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XC94UeKo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XC94UeKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711492731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IB9H9pdE4SujjQ9kiHwCF+AHY0JaTjnlhOQ1DprkoxQ=;
	b=XC94UeKo0iDNk07IkJLpTRmNr3gvQ/lw1i3Y3Xx1hl+J70KxlbJSwGp3G8Db1tS1U0uWPd
	FOdaA6g+zZDPZmJzxkMSXHqN2JlFB3C3Scipjs6+P2UtMifqWb226ZZwc66J2Feo2VzvCi
	jU3fdgNy1Vev0bJhcedn8oS9h3gGz2s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-RztJgI23Ox6nnghhxCFcWA-1; Tue, 26 Mar 2024 18:38:49 -0400
X-MC-Unique: RztJgI23Ox6nnghhxCFcWA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-56be6572ebfso1864109a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 15:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711492728; x=1712097528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IB9H9pdE4SujjQ9kiHwCF+AHY0JaTjnlhOQ1DprkoxQ=;
        b=Z6ElqLp9tgj0Vbr9+r8w2HUITmOntcj5e/EHy2aRZj5bum6sGJmAI587TEi81ac1GS
         1lMrhephHRDo3sIWxngw+5vKFrEcAbJ1sBY8DCOoZcT6Qr3vh9atyYVIrT5I6PI2N7ZW
         i8UHUnBd3guUCYb2g4JTCdc0C6Cy2PVlPUMvGHSBGivBuXFcO9qkX35xgO+flTX9CxJX
         RuzGSGq9WXwS9yiC9wN1C2/7VbTwXLdiFnoTOwrQ8yK/LHChStqFwAqeNAGcPRjz6SNr
         NDVfwsFIJhikKLUmlEW/HDuPVuVBtUoTazqMnJvsnLd5jioTJbpbw6Z1Kwnhun/+I77z
         1rGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeFWguHSt/gNPauw7Vm8Pn4t3pSwSFhipK/lZiWqeFDxPwQ5us438nshxRxzVydQH0JwhaGvEilTW7WEXuk63mmdmGSjBY+OCslKmO3/0=
X-Gm-Message-State: AOJu0YwULTdQk64jlm3loH1sEajY6FF0H+V066IslJoLvoR9O6iE4wsQ
	NpeK+iNNbrt3xAnl9jhIyqiHwZQ6t39OsS4iecSpPy75wA/Y/4yN3uYD5HxowaoMWQmvOVZHcr3
	Wum9vMU3Lc1v+jrGgB6bkQaObpfk5SRGEi7ty53Ml4LuYWhiu9O4W5nrYe8u1MizP
X-Received: by 2002:a50:d685:0:b0:568:9c6b:eb0f with SMTP id r5-20020a50d685000000b005689c6beb0fmr9093200edi.21.1711492728199;
        Tue, 26 Mar 2024 15:38:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxFxSzUE5NiKGkgwJEzGz5/M6nHUdu49tDEHxQ8sBNPYtgP6+0TnPRYBvmomQ0t2ec9XfGug==
X-Received: by 2002:a50:d685:0:b0:568:9c6b:eb0f with SMTP id r5-20020a50d685000000b005689c6beb0fmr9093175edi.21.1711492727840;
        Tue, 26 Mar 2024 15:38:47 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id cx10-20020a05640222aa00b0056bb1b017besm4584716edb.23.2024.03.26.15.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 15:38:47 -0700 (PDT)
Date: Tue, 26 Mar 2024 23:38:45 +0100
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
Message-ID: <ZgNOda6P-dfUaZSV@pollux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-3-dakr@redhat.com>
 <2024032501-unplanned-detergent-4357@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024032501-unplanned-detergent-4357@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 25, 2024 at 07:14:17PM +0100, Greg KH wrote:
> On Mon, Mar 25, 2024 at 06:49:06PM +0100, Danilo Krummrich wrote:
> > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > 
> > Add a RawDevice trait which can be implemented by any type representing
> > a device class (such as a PlatformDevice). This is the minimum amount of
> > Device support code required to unblock abstractions that need to take
> > device pointers.
> > 
> > Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/bindings/bindings_helper.h |  1 +
> >  rust/kernel/device.rs           | 23 +++++++++++++++++++++++
> 
> As fun as it is to bury .rs files down in rust/ where no one notices
> them, I'm going to ask for this to live in drivers/base/ please so that
> we notice it and it shows up as a first-class interface here.  Otherwise
> it's going to be impossible to keep in sync over time.
> 
> Also, who is going to maintain this?  Didn't checkpatch warn you when
> you ran it against this patch?  You did use checkpatch, right?  :)

Sure, but I left this open to discuss this intentionally.

As you might have noticed, I'm not the original author of those patches. I
gathered them from various places (mostly the original R4L "rust" branch).

I basically figured out the dependencies, structured things in corresponding
staging branches, fixed some issues and polished the commits; the details are
in [1].

Of course, since I've taken the effort to upstream them, I will also improve
them based on the feedback I get.

Having that said, the best candidates to maintain this are probably the current
maintainers and / or the original authors. However, I'm happy to volunteer as
well.

[1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u

> 
> thanks,
> 
> greg k-h
> 

