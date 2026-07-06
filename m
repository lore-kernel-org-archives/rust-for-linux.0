Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AD6332621
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 13:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345610; cv=none; b=LlXUbtMIc1UgmrWoLtWbSKXlQ4TMfhCDhYEzWsYRawKXUj5qrkL+AZWXxRs1yF1b5kriPk6P1t0bTFdczeFJsWtKFbcmpRPbDJWZt1wqCjWBnQjcs9ECobMdKb9AJk/Ej9uxB7vj453wqeEw9KmNWvoewVOoo+Yg66NmHX7CsAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345610; c=relaxed/simple;
	bh=joPYbp0ZP02DybuDa2CY3O03ozNssWKlSYod55rT1yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYN6KNsooTiP1WW3FhG9b4rUTzM9Q1ZWzWdxtLn4AUjMP73DFeU5+VfBRHTvsVX49rPf6jOAb4F1Xxixwc0a+S0wPDtaMzdLvC9FFwhT0D7Db9Y8PdfHGa5IukaWTh/TzGMgFdnjIxoTroKoxd1rZ/Eb+zgr6FnsY7/fD2nfsKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ny9BCBTx; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ny9BCBTx"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e7c6ec9dbso127107685a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783345608; x=1783950408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLLNMmJfCjN+k7kJeesIpc1+87YvCV+RyOBXDpUSJNQ=;
        b=ny9BCBTxZVqeOn7UOLSMwYjmTp9GRXxzN95DzqprsyYH0k5Ru5V+B3FoDEif3Dwi/R
         vI6AH8ly6DdeqBU45VpqIIEwEhsa492yT+XLv3jwiCemi5bFmsqRwwTD1t5QdBhmSgBU
         8+zNzspfqi0JCAn+QHZYwZovZZxFWkvLCNAq5n0O/oYh7XXCUMhJH35ahIEqAXaB+yAe
         Z2/31tBY5bSqCy4pyZagoGQeTjWxqkVxFLe1rTkcTWBpZmKHcKZWJi+5yvxk3nptIgpP
         u1sovfaI1n3MmlZPPY1SkLZfc4VLD0ew/uNmlaT6dJzSe/z6pUJzTPSIIspnhwXaxITJ
         joCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345608; x=1783950408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLLNMmJfCjN+k7kJeesIpc1+87YvCV+RyOBXDpUSJNQ=;
        b=G+OJTirMOOD2k6cnJFP5NYzEbeS97RfOGmwYOhOhnAyR7jBV3HnuVjo8jY7Pk7HhyN
         4Tz2HO/eshHJ1xpVx/AiJrcxs+/wNXDhUoWF80K+9dvKyW/yGp/CY4EEPBeLWQvNihaH
         IHu25jRTFFoE+bJlJy9W+l6vZNUQETjRBeH3sIlcx7bstpUAhjVfnUeEZCPgcVYRIHrE
         jBOkIVmbU8gCRKrYuiXGlGnt2i/4e6IBsZNzg/JEZH87+10MqWmwadrt34r9f0cUrxVU
         H5MkA8YayZfoNLrPKP4sGs1tE4PCZaVPVbBjpJJYdmW0NDKJtf1FjpLbHqx91CxkYkcK
         eQTA==
X-Forwarded-Encrypted: i=1; AHgh+RqUG7P3O2jG0UsMLzpjDkPRDn2PB+EPjqnjtvOWlbv9ohFTeNsCYR2aZcWIWIv0SB7O+YyfwW9NaKMoRo7zJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQwxB9O7ZInx5YjmwONEWuW/qIHLhn9PErhHOsc3QqbwXF7LV6
	HrIFh6ALFaYIZenOpVLeh/hmMJW2OICsLRcVAwu4ccG9GzjKHWKNlPXqzf0tp7PYeA==
X-Gm-Gg: AfdE7clxjA9kasVAO9f/fUl5SOTQiWhSjDx06zGisbDoYsQSUwSpBkZnROMMHprmIUf
	tSooU09cylrpAeFo8oU5ipI1cS/JoGUlIcEnJV6858mI7hPvdh3QA5hyI1Ktx2/hgJQ2TgUFMxq
	rk/5uEv6YLMPfpCjxNih+L2F+ESGlf1+l4N3gfp7yoCnQcT+m9Qo5vozbp1eQ851UvkVN/XG/6t
	pOt4/OHKjmIpz06n17VxmrmGX303RMNNbUAM8gMAY2CExSqPRZ2CIasqYrRSpNfrr9IBzHwNhPM
	BwZUEm0y7w0j+2TqL0NP4PgsMvaEz85xLH19K++Pi6MNSja1kQzanXocyaJcRQAERpXU90m/2JC
	EdwnViIWIftozEc/NBGaWG8j1hk4kGTWue8F0Uhn3TyIYRMQpsglRKgbQYRRpuaUw65oaoxkhJM
	DNrU56FAXOYF0iOg==
X-Received: by 2002:a05:620a:40d5:b0:915:8bf1:bb10 with SMTP id af79cd13be357-92ebb4c76e3mr86066985a.10.1783345607509;
        Mon, 06 Jul 2026 06:46:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b804ccsm938566485a.10.2026.07.06.06.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:46:46 -0700 (PDT)
Date: Mon, 6 Jul 2026 09:46:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, Mike Lothian <mike@fireburn.co.uk>,
	rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 10/11] rust: usb: keep usb::Device private and
 gate transfers on Interface<Bound>
Message-ID: <24196da3-62e8-4707-8024-d989bcd5d3a8@rowland.harvard.edu>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
 <20260703030020.2694-11-mike@fireburn.co.uk>
 <fddbeaed-ff21-4962-b09f-d975c96cd926@suse.com>
 <DJRF98V7SMXT.14BS8WGBEESZ8@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJRF98V7SMXT.14BS8WGBEESZ8@kernel.org>

On Mon, Jul 06, 2026 at 12:38:40PM +0200, Danilo Krummrich wrote:
> AFAIK, it is not necessarily valid to assume that if an interface is bound to an
> interface driver, the parent USB device is also bound to a USB device driver
> (which is what usb::Device<Bound> represents).

If we're talking about the same thing, then yes -- this is a valid 
assumption.  If a USB device isn't bound to a driver then it can't be 
configured, and a device in the unconfigured state doesn't have any 
interfaces.

Alan Stern
