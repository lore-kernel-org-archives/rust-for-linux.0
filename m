Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F592D9499
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 21:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772918389; cv=none; b=hrT5kxmkPlhgPzFP9elBilZPnHhVvxQym36NYUX2SjM2WAaVOQjIKZifpNaS40O+ydYpac9eYaDtEszixb9R6u94H2Ndt2HNzSWFya0b+iSwkhaHpSiQ4yLB7PZ40IZWKii6+g5HIug9Snbz7VwURnZ0QHgg3TA1D3C92qJGrPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772918389; c=relaxed/simple;
	bh=EyEhd8isLT2A1zxJ3MYPyibZR68tS1ElsUONBQssKnU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ScZMGBnJuyERU2uVzihDflTt8hWsAuWgTaiO/xpFWPWv67srbydmuR3zhwslyqOXNMJlj35jBE1469pVQ0OuJ2HHrp+XTWM2jRUcZpm/0+8Hf1afUZj1EtlEcYDBdv2/wJXSOD964iZu2+2bH9av83W6SmxgaeKPMPYJ9Xo/ELE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QnMDcQrh; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QnMDcQrh"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-439c112b1a4so4299177f8f.3
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Mar 2026 13:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772918385; x=1773523185; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lTCrtPJ7PlQ0PfecVrHBCkWSm+F944hA0c41XfadJYw=;
        b=QnMDcQrhMJF0650BvaoP36mNfAyAh1P6KcIHm8HQqlwBuPkPuaNiCOv1URgduKT0Le
         8rw0HLaWZfB/BSJemKM2556dJ/1/X8BqT2UWZXnq4ny+Dt4WUxFS6WYSbGlqdJlXw/NL
         dwVAIi7GbZwkN4+mUZg02eryZWz6jYa+Xq0wRQY72SVMGwhoyR4xJUUjt7kMU2k2OcMR
         CQ+5G8bs6zU88ZudMyZptDpnPb6/LKLxcYUzDB7D4v36PLYRhbRPPIZ02Gs72sRpoU+y
         GkK0aBWf0i3RepGaf0Uwc2Ro17wZPuC0bKYvQfBA116M9CQeavKShmqHRlpjEuiEd5bt
         wE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772918385; x=1773523185;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTCrtPJ7PlQ0PfecVrHBCkWSm+F944hA0c41XfadJYw=;
        b=d4W+KkJ1y4YwFoWiIhjWgbwdj+45BuwsjlnpI7P02es0X4rfz9fqiB8juZDaT73RLh
         FXBNjt2814F3SXXDQsHaiA5ywGTXCTF/5S505VJghRBAOz+sLAwcTKyOBhtgrFmhHXG2
         pXALNLQfX+7Qm7LIWE5pF012gyjHMlRymUaR42AsqlyJAbDGcQ5zyHYq3JFoVt7rlMuX
         svkFrD5pyWReHORxAelRroZ17GBDa3l2FjzFWwsZVdGOvMxzHsZdB+VqPbRpBv9EB93O
         2PNtM0lMOJsROXRACeLyry6LgJe8HZ1/boSUr7YSJRlNX9rTSTJQ7sP8R9iyHDlvs0Vo
         N3tg==
X-Forwarded-Encrypted: i=1; AJvYcCUfHuxslLeDHB+lSoJMIz8heHEF76+ctDOTRtnApji8st5IxPIzQhRR1hh7nDKYuu3MfePP2c7RM5fkwGnbug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx59E56nWXbU8+Y64shmOyfA6rdnY2XD7rkAYBU9qpcg2f+zXr2
	kQ93/sQm20g70MXD+PVQ4ksck/3+fCRzuGyIzHyxEi5+Kl2FM+C8Fhcl33BdAkBhoobmq/85+Mb
	La84PfUhRG40doqdb1g==
X-Received: from wrbbn3.prod.google.com ([2002:a05:6000:603:b0:439:cbfc:f8bb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2482:b0:439:bae9:6151 with SMTP id ffacd0b85a97d-439da67bff5mr11365076f8f.48.1772918385124;
 Sat, 07 Mar 2026 13:19:45 -0800 (PST)
Date: Sat, 7 Mar 2026 21:19:44 +0000
In-Reply-To: <273a1167-2269-400c-931d-953063bcb733@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260306-binder-netlink-v1-0-daceb5bc83f2@google.com>
 <20260306-binder-netlink-v1-4-daceb5bc83f2@google.com> <273a1167-2269-400c-931d-953063bcb733@lunn.ch>
Message-ID: <aayWcASp31c5D7Pr@google.com>
Subject: Re: [PATCH 4/4] rust_binder: report netlink transactions
From: Alice Ryhl <aliceryhl@google.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Mar 07, 2026 at 05:56:45PM +0100, Andrew Lunn wrote:
> On Fri, Mar 06, 2026 at 03:12:16PM +0000, Alice Ryhl wrote:
> > From: Carlos Llamas <cmllamas@google.com>
> > 
> > The Android Binder driver supports a netlink API that reports
> > transaction *failures* to a userapce daemon. This allows devices to
> > monitor processes with many failed transactions so that it can e.g. kill
> > misbehaving apps.
> > 
> > One very important thing that this monitors is when many oneway messages
> > are sent to a frozen process, so there is special handling to ensure
> > this scenario is surfaced over netlink.
> > 
> > Signed-off-by: Carlos Llamas <cmllamas@google.com>
> 
> Hi Alice
> 
> Since you are submitting this it needs your Signed-off-by as well.

Oh I forgot to update this, thanks for reminding me!

Alice
