Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604B43A7F61
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040950; cv=none; b=hbCEJHlFOytcPTHcAwfhtAFS0PNJEwSvxXLnmKNOBxVMVFfI0gwmv2LVRfSUyt4BajPrU/hcJKFh7fXVRJQgLW2DrpUfXubbgnp5tTQE0ri5gWs2sZmJTyoTT8edcxhvgx2AFLlWy5Dn9UuV6GqH7F3nBMBFLLl0IGfZlvhT2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040950; c=relaxed/simple;
	bh=05dVcR6hxwxGeoUudLUyRINe56pjnzvDHm1lNLbA2W4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iBV7QMkcQ1P9qKzfYAnfmG5MF7WL7szUU9yt4KSBQcKrqW0KbPzsA1IKFnqrkqu8Xnna3poB6ZBCBFCDPBW4ywBAaFCmx6BytlzNH4oN5GFl/+DMq84E/ihf54ZocSm68NaV2afSA08Qvl1GS0tPdVtkD8H4/tlOBZ2E9YJPXac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CDnkhJ3a; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CDnkhJ3a"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-45e73a4f1dfso9731641f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 00:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780040948; x=1780645748; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I3qXU9Ct0hCIdQg4453GbW11DudxQMDRfVtomv6JPkc=;
        b=CDnkhJ3aZdlUCUDGGrTAqc5v9i85ON2KmZfnDyww2fs+8M4rb1gagab5YVvP8gKYit
         DvkSXRSj6fQSvjvtTUiGsvTdIU01pGzAP5YkFeaaHVet/CKkPdii8vlOjCCoNxKZlkpJ
         cM23hYagAsItfduKY2HVEcK2IgfEuxxSwEupVAUpZU6w7keDSHjH5e/vV4lY47sAM/9G
         D3rqqdGWkllOTi1Yjh4QKg0ZG8GRTGnxyoj9qt8nO/s1pcjWLE5TMTqKFyMUd62fCtmq
         aV55b4pUIN7JaxQSGyYWDrMIaNCzWmT+D7pwMR9rwk9ECLfhYgwxD8OLLzZPkEmPTF8g
         /cdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040948; x=1780645748;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3qXU9Ct0hCIdQg4453GbW11DudxQMDRfVtomv6JPkc=;
        b=rGTYHSa7Ev+1lfGx6TlFSOHo3MsXo70Eb+sN1ubQZWCV5hociqOKMmA/fmCZqitRhI
         eVOnU0lspiO/GqRhNOZiO6Weqvk9yRqpDaIK+aHeC27DGR7fM08NoqvhuI3N14zQr7NH
         WeI1SW4Vi5Xr1iz6WS9LxzpFysM4R9pwiHbad9PuViTxXIBC54dZJXB4tlVVkPpZVFzu
         s1MmSidtSxZcDoYLFCrNU78SyR1GueF2L5NQvHTXPjQMX4AbefMZs789PVQHLlmMJCAJ
         Vbw0YXdOvAy4/0pqofnBUjI2I2JGpQ3NzZQACUntRg7FzFtSfoj0zUFz9LOAxNK2JwDZ
         k3Sg==
X-Forwarded-Encrypted: i=1; AFNElJ/TYfVcwj8RUzP/MyLoQgKBwT0k/yCxLZ8H+5czmzPC7DoAvN40Me5zmPCshAi156voHHwxQQTkR96xfvWvlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/MlGNABk+35kcylGZeSGvIm4omIhB+wsRbwleHqelNJ+o0Slt
	eaIkqpmf8tQeYdAIqm4N4dEzYD5lDBl4U3fuJyBOAeAe69/Gxt2ZjeRnRHBsHElDUaonLqxtiaY
	7go0SoMCUCo27sFcw6Q==
X-Received: from wrtp2.prod.google.com ([2002:a5d:4e02:0:b0:43d:73dc:1920])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:fccf:0:b0:452:6aa0:1d11 with SMTP id ffacd0b85a97d-45ef146822dmr2309610f8f.19.1780040947624;
 Fri, 29 May 2026 00:49:07 -0700 (PDT)
Date: Fri, 29 May 2026 07:49:06 +0000
In-Reply-To: <20260528080441.01ab1847@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260525-binder-netlink-v5-0-a90e2923ebeb@google.com>
 <20260525-binder-netlink-v5-1-a90e2923ebeb@google.com> <CANiq72kRC_k1cnJLmG+AUSiUH6kDXVsox3nMJnV-c6HkNXOwBA@mail.gmail.com>
 <ahbAyBD584Hk9Mst@google.com> <20260527192130.21dabf08@kernel.org>
 <ahff7OTzS46Rti5c@google.com> <20260528080441.01ab1847@kernel.org>
Message-ID: <ahlE8qZ6DjcgEfGm@google.com>
Subject: Re: [PATCH v5 1/2] rust: netlink: add raw netlink abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn <andrew@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Carlos Llamas <cmllamas@google.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, May 28, 2026 at 08:04:41AM -0700, Jakub Kicinski wrote:
> On Thu, 28 May 2026 06:25:48 +0000 Alice Ryhl wrote:
> > > > Netdev maintainers, what do you prefer that I put for these files? I'm
> > > > of course happy to be on the hook for this code.  
> > > 
> > > Can we put it under rust/kernel/net and rust/helpers/net ?
> > > And then add those directories to networking ?
> > > Just so that we don't have to keep wondering with every little piece 
> > > of code.  
> > 
> > Sure, will do.
> > 
> > However, it doesn't look like rust/kernel/net/ is listed under any
> > MAINTAINERS entry either.
> 
> Which is why I said:
> 
>   "And then add those directories to networking ?"

Oh I missed that. Alright, let's do that.

Alice
