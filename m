Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AA23A7F63
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 23:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772235890; cv=none; b=nxXYqJKGKn1wHPjiYCFbiHKc8MLqCor3oyoCDCKH3VMD2vuSKFE9oFTRWTTv/HP5zw4lnlmIyTZQYnLIk+9USX4dksS/ns//Ao3C94Pp4HtksnSyT3maDMkg+4maJua0Ljo3Bm8vgX/9XXLUmbsydYF/Lp7h//IZgzYHtz0chHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772235890; c=relaxed/simple;
	bh=Gr6QosS47841Nd5oir6zV3dcFqJcftEf6sCnm9h2QRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lD/rO7F17n0oF5Jr5OBkA5+lP5l12CBMTHY//LZbY6Uzx3IIIXaEhxDRLSZNeVPV+taihtZUbgzNDhdc45t4bBjMDFaCqMop4EUWGj4reQs1g8MvUn4D6gGvpdYfrCUkUAediKsHSED987d1qKtjQxvnIJA5dRrq2isL4/Y2SGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmK07Hnu; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmK07Hnu"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12758ce1e8dso334919c88.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 15:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772235888; x=1772840688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xrIOYsqemqn38YLNQBRSHnhQFO92CoUzmgCv58SLHyQ=;
        b=UmK07HnuMAWXm8wl8NmT+f/C6K6I9JX+wamb8CI7oetShfsl07Zg8HCMg3tBROUxKM
         X1zNFb+sGtMBVRUwmIfix2m0ZpEbbB9tABogz65KUeiRhQi4TE+UA8Jjsn28S5EV9Jpv
         mhGcH9SgL3xupr29LaZYKP9v8vtGG9K8swbzgTkSZ3RMhxEPZeZ6AUU7W5wCHmqcBCO4
         XOeBQCyw0ugHhGEPzL9c0rttEXGwkOYWcDdgZql9BUASpfa7LiFHcQhYKbyEToYfeF/b
         AVPWEX0d+HTIeVPN9FyNcO45QN1IcxmD2v9At01/OyJ0UO9olQHmeoZQU5059jveYXb9
         YZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772235888; x=1772840688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrIOYsqemqn38YLNQBRSHnhQFO92CoUzmgCv58SLHyQ=;
        b=cIE84C1doCALLCSwlufH0OFwuK3n6RG3w7jXSwQt0rAAPRw0snqatabfmFnrcTyqDH
         xVEFbcMgyWyyEsT+hvjcLKaHhFLABf2QGC3FA8jYUEIS3/Ns/VK9TZjZDOIJpBrmWWOx
         hiif/g+lFSy9L5D8wwRPIBm+Hcrigdnqp39D1addrO5hT0+xkh4pTRFhNB6F5RSni+hN
         YAl6y+/agwGLOtR0FcSx3Vnx0wzvTjYC3IN4Xxq2A0ZS6bG02F6pSGzN7fsTabw5PQ3A
         vpDYukd8rTHSCm6yV9HashIWi1PwkS+N1IUw+N359e485+8eYAl0imYecPepsFpBYj0W
         8QYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpu3U9S4pPVEoIvNk+nirj1KnftPOC7SVCpHEdE0lg/TNyZJaAVpfJAiILY7fHqd+WcgQALsY9dD0vWFHJzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcAZKjFgLVpMjQHmMJ2nkTrE/UwcXYMd70DVxbDQdoTR45zC8b
	DL2LRfDbEdt1tWZ4mvjDyF/I5+AULEoRUtda3WyxnBvL7EblWrSvGnIP
X-Gm-Gg: ATEYQzzKIKxO1ew3umRUkcPiuZlljizPIH6y8N9kIzyAM/1WBlHjLW8uRjcks/0PxWI
	S4nVMtPaeq4nGFXS9b4ChcBJ4XBXTMom0KV4bkAgPpKvrEa4kLrkXbkp2UWlFhJ1HbMhJCJKP+k
	IQCw6Z6d3AESgVqTT6GVVcqQ9uMNiTGz75UPXUquXwkFFqAJcIi3OcKV/NO4KcGw+d+tTM5bzNL
	TOauRq5lPg4PbxO3pRZKh7RznhmgPQPLCvz09erSCbPIuvteNsHEen0o3K26L9cQb0Yj4Knzl9p
	HVkJevf+HQrk31WovcNFKwH5K2aBBUVcTY+93s9rYcsmYQuCGNGp/jFSQXOzal4pPzh7RCuOUVO
	xwymk2v6oPaQhI9jBG9J5gwoUkMmdsqkg3a8d7fyI7lytlGvzXMuafBe7ywfviuC9KYpMe4yj4x
	/U4+U7WquXH7nOxEVjnd//OiQfoxFKlqbnUT1mPBif
X-Received: by 2002:a05:7022:4181:b0:127:3b1b:dcd with SMTP id a92af1059eb24-1278fd46166mr1656856c88.23.1772235887893;
        Fri, 27 Feb 2026 15:44:47 -0800 (PST)
Received: from deathstar ([2600:1700:22f5:908f:1457:7499:d258:358f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a5312dsm5857688c88.16.2026.02.27.15.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 15:44:47 -0800 (PST)
Date: Fri, 27 Feb 2026 15:44:45 -0800
From: Matthew Wood <thepacketgeek@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Breno Leito <leitao@debian.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rust: console: add abstraction for kernel console
 drivers
Message-ID: <aaIrV3m41n-0mWxJ@deathstar>
References: <20260227215357.667257-1-thepacketgeek@gmail.com>
 <2026022704-xbox-comfort-2493@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026022704-xbox-comfort-2493@gregkh>

On Fri, Feb 27, 2026 at 06:14:43PM -0500, Greg Kroah-Hartman wrote:
> > This abstraction is a dependency for a Rust netconsole implementation
> > I am working on.
> 
> I'd prefer to see it then, with the user, before even reviewing this
> one, sorry.  That way we "know" it at least works for you.
> 
Thanks for the reply Greg, that's a very fair request. Since the
complete netconsole Rust implementation crosses several subsytems
(module-support, net, configfs, console) and I haven't yet
submitted such a large series before:

1) Should I submit the complete implementation w/ dependencies as one
series?

2) If I create and include a minimum-viable functional example using
this console abstraction, would that suffice?

Regards,
Matthew
