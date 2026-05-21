Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523AA385D74
	for <rust-for-linux@vger.kernel.org>; Thu, 21 May 2026 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779382729; cv=none; b=Fa/CLAI35KP5Ug0dxOr1YE5zu/35cSLoqM7O+A16hLicUhcygvKWgZ2oet7e0WhPqBhkcoAUXxZ8iMBHc86UwppA+9UBm7Mtmj/JrxL8beTRz1OdVmwzmrqtZT6ra2Qb4R2Dbwig0l+snVRRISpTejAmzdm5VvysRG4WFnC6nGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779382729; c=relaxed/simple;
	bh=12jDDR1pst6bwML7xhRynvYD5v8sHBp/LgldnVtRs5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYooDyNxhbKfzSgs6Ukz6cJwYJ+QEfQrfUdpE+9bBcGKpUPEaV7gnvIXwvp8NMlu/1Pm/blWsMvyFeAUfUnWXS05FYNf9xt1eU8sxR2EibRpMrpuLs1F95U8IKaUqmbqVJcJZEsngEO6NadhSBNeLePoWSuZaErbplyuxDdL3SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d48Qh+Ao; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d48Qh+Ao"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b458ca2296so46398525ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 21 May 2026 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779382728; x=1779987528; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qvcp/MxZM0KDVupq1J9TtiDnKmBEHG5Xhz/Dxyng960=;
        b=d48Qh+AoafoQ9WxQv90cow23D8LfxqtrKL2puhU57B1uoIpWeFWBtxF1uaTc1auOkD
         w0KdJDMuvNKsn5I7ETjdyP7iaxF0pZl5t85f5v5dpR8RJ9SnPEL1KyAwykXuH3y/iEbL
         qY7ICzA7TIyGXu1UFIcRD4zh5Q/XafcwwhQTjRyqlmXjQJrlhbwfUK5nb0A3zoKFjL8M
         XMGzn4KAwzNKCvVSCRAfjgM6DBceMwU6TQxgsahz4mBhpG8jxqlqQRTsASqNC8utBnKu
         PctHW+HncNbCkjQsuBpuH94eNm7xiLlwlr3JSXv6U1YpnbHFzzjJxfKxd52shcozJqCm
         CNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779382728; x=1779987528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qvcp/MxZM0KDVupq1J9TtiDnKmBEHG5Xhz/Dxyng960=;
        b=HAenZCAYx92vIHWBH0MNCLuLuhy4pY7j39AqVH8oN0I9unIk/faZthnMwsrCCEZ3o4
         AhkWOe/g6vg9qxRDlt7WIPKzi84YhoSYkwGjhEzohHav4BbgxcHyBhv/u+Ttm/hTr78c
         oU1CWFpgt4PRCNfjnbMs4TxjSwkCWvBTw28C3VmT+UZjgXPnGi45DkrGI2gc/MXUW5lP
         JXs0oeEJQ2cyOdHf0K/O7BNX3UPv0Lyis1REEzElRfGUvybHWwnDPg/t9ivSdFMn9MPp
         V0iTCYWj9/JxOyBIAcIFY+uuwZSTQIMxd5xPnO/pKfB11uHb8gVSI0EBfINVSRQqiJWA
         xxNw==
X-Forwarded-Encrypted: i=1; AFNElJ9p6fTpIVTpCLliI+Sl4SPnmx6zsOPahGVcCi1C07eYxeDVTJG8FdQpwwoNOJIIMsS+mM+WVkOlLuiX8sRRug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+9Hrs6wUr/XHW5NyhUUt+a7ZtGslfXuL2uYW72Hc/G/mE7uz1
	c8S+QPEIqCTDN+NII7IH/tXutki6T4AqpfgvgigsA2k6N7jo0fezwbQj
X-Gm-Gg: Acq92OEBurP+AjJq5C6yDHdNdMLPeJQbwZkuVU5evN3ryDkWCa0wI6si6FANj0URK6V
	x/25Wb0o6psXrhbYv083G7nbyT7iLmeq0sHLV8IsC34f0DHDtorIj8newz9HS6BM1pNFbekxutT
	XE2kMmtoaVHYeSxLy0zTQbfpVwh/ql1mIAr5keZ4DqlvtwlGkGjR9fiwqcnW835CCGXT6i7qu8N
	Afh+Sl2R5ZbxMn+4SRkoujVe2fccMwdv0/dEvvIxETDa9uvbi8pMooT+GauTCzsMXJiuUztum4S
	txd8Bg9sFkgqL4LZkDd8l9LeGFxyITvxfVxlFrNZzAdCi49/mOkjDfWuwnv+1VFqWSVj0qow6v6
	+hrz6jRCMcIL3j1QCtd9f+w+wHnk6ZyRb4cO2nd1xgA8rVhi53d9jpjvLCIAI2s9RZCMLqDD3V6
	Mtq4gdaRoA5JSff+crvWWd9U6nVbIs7yU=
X-Received: by 2002:a17:903:a90:b0:2bd:ef15:9fce with SMTP id d9443c01a7336-2bea3345f6bmr43355335ad.20.1779382727492;
        Thu, 21 May 2026 09:58:47 -0700 (PDT)
Received: from fedora ([2405:201:5501:4861:a13b:83fe:88b1:ec13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea98eca1esm15943285ad.49.2026.05.21.09.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 09:58:47 -0700 (PDT)
Date: Thu, 21 May 2026 22:32:54 +0530
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: tglx@kernel.org, peterz@infradead.org, ojeda@kernel.org,
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v2 2/2] rust: cpu: use `unsafe_precondition_assert!`
Message-ID: <ag86vsdILqttOkL4@fedora>
References: <20260518230125.476165-1-ritvikfoss@gmail.com>
 <20260518230125.476165-3-ritvikfoss@gmail.com>
 <CANiq72=mhWr4GqknqwSzSbo1w1whNZtKHeVL1Pc3d+3A1kJ1sg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=mhWr4GqknqwSzSbo1w1whNZtKHeVL1Pc3d+3A1kJ1sg@mail.gmail.com>

On Tue, May 19, 2026 at 07:41:59AM +0200, Miguel Ojeda wrote:
> On Tue, May 19, 2026 at 12:57 AM Ritvik Gupta <ritvikfoss@gmail.com> wrote:
> >
> > Replace `debug_assert!` invocations with
> > `unsafe_precondition_assert!` in `from_i32_unchecked`
> > and `from_u32_unchecked` unsafe functions.
> 
> The commit message doesn't mention why the messages were added -- I
> asked for it because I am not sure if it is worth providing a message
> for each assertion, especially since the original code decided to
> avoid it, i.e. the change to the new macro is good on its own,
> regardless of the messages.
> 

Actually, I added messages from UX standpoint, as having explicit
failure reason is helpful for debugging, when an assertion is hit.

I can update the commit message to clarify this, or remove it if
maintainers prefer keeping it as is.

> > -use crate::{bindings, device::Device, error::Result, prelude::ENODEV};
> > +use crate::{bindings, device::Device, error::Result, prelude::*};
> 
> By the way, we could remove `error::Result` from the list since we
> have the entire prelude now, and also take the chance to use the new
> style:
> 
>   https://docs.kernel.org/rust/coding-guidelines.html#imports
> 

Sure, will remove `error::Result` and use vertical-import style.

> But maybe wait to see if the maintainers have other feedback before v3.
> 
> Thanks!
> 
> Cheers,
> Miguel

Yeah, will wait for some time.
Thanks for your feedback :)
