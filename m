Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8112481FB0
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 16:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046380; cv=none; b=WKnOUtOTGfSMRczpB9xiLBP9TRqxmPWHDenoHP3SZLQwGzS1IMpwwvhjKmKGYOmPsIcXPe3IQRiYyG92P6cLgHOTXZwhGEQpTUOAG6W4liSi9qnFgRh2KAW9SevV47uEtB6V0Fy0rZzsiw17Sj2YrTN6DCZigUy9z4wgE0qQqr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046380; c=relaxed/simple;
	bh=9QB/17nM4/R4mx4h2n5NdP9dfwITN4STF9A4EmU1/6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ea5CWulCrvvo0dhjctAR+1auQHE6Gs/v+VeUBRCeIniGmJlqq3s8vONFpRxPh671pb6yCJeC9okwU9p9jdFSjlYrRQaL3o/L1d2P+VY6SDcWOF9e7S3+FNrHeGxt+E0Q1PWJfWdZd5F0s//KXzysjZMq9jtZTZWfkX0Js6hr9iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ajOdG0QT; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ajOdG0QT"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c2a449c57so38616021cf.1
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 09:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784046378; x=1784651178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K2Wx4ci415T2EcKJc2YaFvxNMNUQo+sVpQO5XLInrL0=;
        b=ajOdG0QTtDhTzsbNOF6G8o22nrNSHvbFHgSTh5STGruCqxzUbuw01YZVyOlH6WYpV4
         yBn6S1mIaptgx/BSOEbwzt53j34PvcQ1guh+Pw/mZL3W8qD4LVOtlxIiJ78BRDVxIUMd
         sNUmLxzVxSwdEFtmGp2FnHMgxtUDQTuiii1dnadDpGDCirkQu7bG5/W8bZcBhCB90AHa
         KLrFC2U/5o8QWJ9TQiCc4hQDiAPiYeUP5B4rA/0DsWfxoQSqvTtFxlPkIhmFRBl6neHM
         7JSkuO5AgH/ackG27VR2SakVlaJEy4pn3PvEkVf7LqX0BIXwT70CLTlTU/q6s2rHZ9q5
         jf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046378; x=1784651178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2Wx4ci415T2EcKJc2YaFvxNMNUQo+sVpQO5XLInrL0=;
        b=N/6VE61958baM0Cn60mfgY2sNfeQvCVyT5CAcPLd12zOrPl2+zIYLAorQxeGQmGdAM
         0lD5s/lqMNjid7nE27kLU+WLHniERQhmyTVOqVJTGAifTF5aTPUEyfg20QtaaMXsA4d/
         S5abhhi1FWd/A+yxosE0wDdl/UcEJQ4CB9r6Q9TQgn43G8nA3JN8AGdRd3aWsVLs15ta
         +o14NJzUFA2zF2e8uBq/3MpfTgsrS6DIauUt2RW1+w5K8L2viaJmGCeyU9XiHea1wU8e
         OnI4UDSwWKuX1dYt/TfqsSmHM+r/Diy7CaV09DOImxDNQI8DwhG2vD50gYlIlTViNp/U
         JGog==
X-Forwarded-Encrypted: i=1; AHgh+RpvYRvcnHWZbUJCElRq/XtRHqWfJMIoNOu5xQsVa54E6KK2lDbGKxqOO66II5r6PWevvWEgutzS+42Kya4Ggw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnftwLzJxorw9ClOnCZm9tti5HEkTQouP1hrAAHK/bPxuVM3Iu
	R6R3iKwEB64HeJazybc3TcuY/pnBaCjVjkOKWAm+0W1Bx7AxwXPwQaXrVt0IGIp3kQ==
X-Gm-Gg: AfdE7cmzDxSVWsGFgOMojhjygAYBZgAnhMwqoK/uVAta50Zp4cBqlsxN9UpC8mbHQ6r
	CrCb5GN0imbo+K0e3T94mlXRQm2Rit8BQ3vqMF/3exvoVBrsabN1uHZwE3HSftoDp8YMQDF9xA+
	yekwD9mTDcuyx6w9xjuex1fEYTnDCVr9s6RZtIxSFDgrABJDEbbBRxBRsuMYFP0ABacTBh7d8mS
	JbIuGDwdpD69yQRziUqKRAMn7Du0QjAt4RNSUJGynr/T6+onMuRg95EYbJfW/HOE5n1LrsbOlT9
	kLj7HKQwHCa2NocrCs38lQOlKnQ2dcKzpckVfNs7bQtbjziiuWLMfYEdVGKrXvS2e1ZyC7wYTQG
	aLNo9Q2elZaJfMllrziUJGPFwzOjtpFqQmpkS+vvYTC2+S+naKMqPQLJahB3VYB3ANqDvtAsZux
	LIf96RynLM7PdkWw==
X-Received: by 2002:ac8:7f85:0:b0:51c:2022:cf0b with SMTP id d75a77b69052e-51e3c2ca712mr44748001cf.56.1784046377696;
        Tue, 14 Jul 2026 09:26:17 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caae23f42sm114990581cf.19.2026.07.14.09.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:26:16 -0700 (PDT)
Date: Tue, 14 Jul 2026 12:26:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, Colin Braun <colinbrauncl@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	Colin Braun <colin.braun.cl@gmail.com>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Message-ID: <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
 <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>

On Tue, Jul 14, 2026 at 03:05:16PM +0200, Danilo Krummrich wrote:
> On Tue Jul 14, 2026 at 11:26 AM CEST, Oliver Neukum wrote:
> > You can see that there is no way a configuration and thereby its interfaces
> > can last longer than its device.
> 
> So, what you're saying is that, in the generic case, there is a guarantee that
> if a usb_interface is bound to a usb_driver, then the usb_interface's parent
> usb_device is also bound to a usb_device_driver.

At first I thought that we ought to have such a guarantee.  But in fact 
we don't, because the user can at any time write to a USB device's 
bConfigurationValue sysfs attribute even if the device isn't bound to a 
driver.  This can create interfaces which may then be bound to drivers.  
I just tried it and it worked.

This wasn't the original intent, but I don't see any good reason to 
prevent people from doing it.

> But the relevant question is whether this always holds. In a previous discussion
> [1] Alan explained that it currently doesn't hold.
> 
> Note that I'm not looking at this from a USB topology perspective, but from a
> driver model perspective. All I'm saying is that usb::Device<Bound> from the
> driver model side means "it is guaranteed that the usb_device is bound to a
> usb_device_driver" and therefore can implement functions that rely on this
> invariant.

I don't see why Rust needs to distinguish between a USB device that is 
bound and one that is unbound.  There isn't much you can do with one 
that can't be done with the other.

> Analogously, usb::Interface<Bound> means that the usb_interface is bound to a
> usb_driver. So, if we want to be able to derive usb::Device<Bound> from
> usb::Interface<Bound> it must always be guaranteed that this holds, not just in
> the most common case.

Similarly, I don't see why Rust needs to distinguish between an 
interface that is bound and one that isn't.

Even from the point of view of the device core, a device that is bound 
to a driver is the same kind of data structure as one that isn't bound; 
the only difference is whether the ->driver pointer is set.

I'm aware that Rust has separate types for pointers that may be NULL and 
pointers that cannot be NULL.  Putting that into the language helps 
prevent a lot of bugs.  How would making the language be aware of 
whether a device is bound to a driver be similarly useful?

Alan Stern
