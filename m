Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B737A1B4F1F
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Sep 2025 14:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757170194; cv=none; b=Xi8CZxwFsEZXAcoJ5KkK+bS+s0Fnpqje6RzgfIigaAX+i4wnrPBDbY6pRGWufaJMW1WpTU7iS3I+kWAXPybo2rHEsnZK8rJB+2POH4GWp217FVpaST1SnlT1Ho//2S4DCKTanuVdx3/vh9hs4qp6udDW9iGt14AtOIaz5/MsTUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757170194; c=relaxed/simple;
	bh=g2NIkHqbNIPrnoCWO6Uyv9zw10cVGxsc611WcMwJHzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLic6yi2VMy1+IeXnD3jMNu5aviY8En/McG8kiZlVVLjfpbT32lxd1g2QnbCozl1mqp8yDJsZjsNB+SIa7xzFMI3ObT7czKfhg52vyPh+t+MsVUaDDUXDNaGowZbkkcu4hjxx12yIu9xH1LFwxj9yCWkIMu/5fRhDDEjvj3Llfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=an+nBZBO; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="an+nBZBO"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8072bb631daso298377985a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Sep 2025 07:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1757170191; x=1757774991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3vXvSMQKI3HPkrSn6O8IK/1xngHU9cw/rXGl79HFTh8=;
        b=an+nBZBOj03JVZNnB6uUlfsDPXZGMa5+iaaDMN9Aj2s7L44xc5ojGGg/FYcpbUO3gJ
         QHJ7/WFvUC1d/LxDiBv7emj2x/lES+DqkA7HysmxeyM2eZo9C1qd5zK9Z1uEr48bC2bb
         qkO2MtPQZWzbsSni90FwjejH206fynzqwLs1RWDiFVZjOM7ak/IfvoUWy+b4ML/VBsb9
         rEjZpyzGSX/31+73GHKdUb0ClaCCPBNRfNABKe5mnrs206orXOTczznnTGTg+JVs2AIq
         OMJNi/8RchTIbEIuQRkTDHFCgt9hL/bim1GG5Ja9u7fzhFE0grsyvtCXU0snriRWmxYf
         mCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757170191; x=1757774991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vXvSMQKI3HPkrSn6O8IK/1xngHU9cw/rXGl79HFTh8=;
        b=XC60WpyI6KuW3y9G2kA2oJe6IfxCaZ0sPcMmReDP7DLJZgtj1udn4naYq3vufHAWOJ
         wdYHE9jxyXEzbNwrZjOr/Lxl0dNcY8ND+GalklRc/a5JKc5sQCPw0v9HUZWOWiMU1Eam
         8BpIB6Ikxyop5gd0GPPvLxoIKQ2e85f+ciONA893L69aJY4Roytdm9ghbsSmGMJrQP5Z
         huc12y8n75X2BjG0FlaxONpSfmbNnss44npXH0s3ikWLtTwuOgVevc58L0HIUfNQ4Kyz
         MpGYCeCHmljylIOea1f9p0/0hLZq0NLE/CvntiQp7AKX9qqbBTxHLCtO8m+K0GDfF8bS
         aM5A==
X-Forwarded-Encrypted: i=1; AJvYcCUGcC/OZ2+QVnmXGnkRH9tJzOac/Tfw6Tgd1uTRVUCgz0i06iKi0mo/GjYzZW52mxlBMA+tDCBbajXrMXemOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw23Q/6TeErs++tpQjpBck/0/xiihLZzElMIrcBN4xLgozxOV3
	x0yRKYfZx1aZQVv18LYAppV6FZ3t1SSQisD913fxnANdBmZGbFLThAfAiG1QUG2rtg==
X-Gm-Gg: ASbGncvQuwdBJ9jw0JRVEYKvGbAnZ6gCBx8eKRQZ+ox9vOlcXBD+x6k4LSg/HyQPMZa
	Tdd37uLpGdOkzE9VLNul0KJD+bNKJdFG67SLH8fQdCcdxKD/24jVc0gP3STl3wFWer5Znp8qMhV
	sLnmhL4UOkA3sHG5AQOr8pEgUQeMotoxiosqN04clNWugIjmFFj7DYED9AZKI6suIVdH6kUXyeH
	IWnpjm8tKQB2pmilHjx4F/W1x63pRJJi6eW8Uy4XY7RcIpZJoFeag9ioHov9Wx7fJO/V+kgnrR7
	gsRVSL39Ym3MOQO0zQtq6ojZ3uxujWw/KrBVyyPkF1hOPNtWFQ3L+v4bpq7BPGgwS53b7vO82+Q
	CvELtjqb0eGQub+mDK7QYpBf0
X-Google-Smtp-Source: AGHT+IEFyarvDSbj8SBjw7QGmAebzX8l4EH8NvjZtXX1EJ3M/LNHcWN2VdaRx2jOME8i59Ud6mcPQw==
X-Received: by 2002:a05:620a:284c:b0:7e0:f0bb:b1a4 with SMTP id af79cd13be357-813bec0a4dbmr200284985a.27.1757170191461;
        Sat, 06 Sep 2025 07:49:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::5b82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa77f6e31sm681722985a.29.2025.09.06.07.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 07:49:50 -0700 (PDT)
Date: Sat, 6 Sep 2025 10:49:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] samples: rust: add a USB driver sample
Message-ID: <a5420377-1d23-4453-af73-430022dd6a6d@rowland.harvard.edu>
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com>
 <20250825-b4-usb-v1-2-7aa024de7ae8@collabora.com>
 <2025090618-smudgy-cringing-a7a4@gregkh>
 <D8EAF874-4FED-42EE-8FD8-E89B6CB0086A@collabora.com>
 <2025090601-iron-glitter-c77d@gregkh>
 <831C4AE2-6964-4699-9E74-E4B721B87B17@collabora.com>
 <2025090629-economy-geologist-3548@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025090629-economy-geologist-3548@gregkh>

On Sat, Sep 06, 2025 at 03:07:16PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Sep 06, 2025 at 09:41:16AM -0300, Daniel Almeida wrote:
> > By the way, I wonder how testing would work. I tested this by plugging in my
> > mouse and fiddling around with /sys/bus/usb/drivers/rust_driver_usb/new_id. I
> > am not sure how this is going to work once I start looking into data transfer
> > and etc. Perhaps there's a simple device out there that I should target? Or
> > maybe there's a way to "fake" a USB device that would work with the sample
> > driver for demonstration purposes.
> 
> You can use the usb-gadget subsystem and dummy-hcd to create a loop-back
> for a virtual USB device.  That's how syzbot does USB driver fuzz
> testing, there should be some documentation on that somewhere in the
> tree.

Gadget zero is a good one to use for testing.  That's what it's meant 
for.  If you need any help setting it up, just ask.

Alan Stern
