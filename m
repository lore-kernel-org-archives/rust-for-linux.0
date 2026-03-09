Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A22F2EC0A5
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 08:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773045487; cv=none; b=nITnDuNsE5F5Gzo21i6Qx2T6Sg2AQkB7b0ERSjJGSBUakY2Dyt4DGeDXwBSFrD2QEPju7p60uuL4rp5r4xB7Pfj//zh5R114zNYgTtTrFFzI8xPNoPjKaFj2gg0HRM2N305etR/pZuVd5AfAboCdSO2EGXmg5dpyQXEI6/3T+9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773045487; c=relaxed/simple;
	bh=LAXfqfhLjEz/vccTbHYHqComphgsNBknaq/HgydD83U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b3MXJgBGMMYOdPTSrKQ/mSyqXOFLqx6tO4Nzf7yL/aFw/HMc5PmI+enp4voEmPuZC1qba4si49at73O7+GHPtjvzys6N7UuaywEDzhjlwVwA9eRYEnC0GSQFx9Ed2C24YP9c0R5wYeZ/BoaOYz3BjKSnMtPmey8fbbI4TbVz3ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X5w9yr7A; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X5w9yr7A"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6618bc12875so3714657a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Mar 2026 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773045483; x=1773650283; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpCisJYUS/zIUy8dvtPRFx4mGY6K6itoONwU+IWy+Zo=;
        b=X5w9yr7AfCw0WcUtmawzX6nlCFAuonvNv8ZUBBYyvvaEkqDJpCLhcvg56U0Uh+2Mf7
         qO3Fn/raSQcctujJNalUOVCkYXk/ou0TYxvv1y0UxpS0+XSRyFgvEuTZsHWvcCktA0v1
         mlRTuiR/m2iTTEn6bi3L9ac0OYILtQo4T0Wq7G63RyxguXUhkWUTtDvcfncXcDN0wZzq
         00cmTki+YL5yzFd2HfxwI3lmeTgvTyBgFQUbTGijjsTAE/nypkXKYTq1gPdiFm+Enk+c
         zkAD7NGq40J8anSPkcdr0ZQ2A3X9+flblJJZgl1N4GrtcopwZTfrNEsDv8l/kSd8DpIE
         Jc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773045483; x=1773650283;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hpCisJYUS/zIUy8dvtPRFx4mGY6K6itoONwU+IWy+Zo=;
        b=fmDT0PawzJQuZWrpOpbTg6+eEcv7oj5HkmfXhhCXZFV5vdP0a3+5r/Y4H2+8LgsGHh
         1CY4CvlvIl7z/lSt70y2QuupLFjuCawKIOBPAu4qqi3Jx5/8yGldiSqM/drYSIHK0P98
         W4hSDzkEVG/SocVR+rECWc0niQtDoLFbbCtzx3DrWC6Tgpagy4AC3WMuHHQV01uNtuWA
         7Wayjf9nSW/EtHc83bC1dcVyg4LkcUoyZCpTiueYrhocCnoE4hyB0Fs6KRCukOqpHgEN
         IH88Kwy4SyMI0Wti9AL/Fbvt+NAC13E//wtQpPIklXqtxbKrYAvyj+rc04Hg1xic32Pu
         zwuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAlahcKWRu4dwiOESCSIb7pBsydWcSentGlt6uqn2xzJ0FzvgWJ5/ZgvlsyWGAZQ7V4ruSvus8b2GJdoM1HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEvozEJNCA/ZePrgN3whuwsC6zN67OWRWSxzwTl9Cuzd48whyP
	R0/UMUPo+Z235aB4/D1od8rRcN8aggAuDDRhM42b0rrlGUQ2wmpqo/1zyr5vInr9vce72JJ1ixR
	DHzrmPcmwzcNXynqejQ==
X-Received: from edxf7.prod.google.com ([2002:a05:6402:14c7:b0:660:ee31:dc16])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1ec8:b0:660:48f:22bd with SMTP id 4fb4d7f45d1cf-6619d4c7b1cmr5809698a12.11.1773045483342;
 Mon, 09 Mar 2026 01:38:03 -0700 (PDT)
Date: Mon, 9 Mar 2026 08:38:02 +0000
In-Reply-To: <6022a652-36f2-4dc6-b24e-54c27b095e97@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260306-binder-netlink-v1-0-daceb5bc83f2@google.com>
 <20260306-binder-netlink-v1-1-daceb5bc83f2@google.com> <081b1f16-5c8b-4a18-a9f1-d56e757de4c0@lunn.ch>
 <aayYhgy3pRxFWbr7@google.com> <f93ee07b-5dfd-4748-a7f2-814539e60d81@lunn.ch>
 <aa2UWlN8waUrQ8ij@google.com> <6022a652-36f2-4dc6-b24e-54c27b095e97@lunn.ch>
Message-ID: <aa6G6sLatJ3W631D@google.com>
Subject: Re: [PATCH 1/4] rust: netlink: add raw netlink abstraction
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

On Sun, Mar 08, 2026 at 06:24:16PM +0100, Andrew Lunn wrote:
> > If that is the case, then it sounds like the correct API design would be
> > to have a separate NetlinkSkBuff type so that you cannot mix them up
> > with an sk_buff used for packet data.
> > 
> > > So, maybe you can have a base definition of skbuff in rust/kernel/net,
> > > and build on top of that to make a netlink specific skbuff, with a
> > > limited list of methods which can access it, those needed for netlink?
> > > Make use of the Rust type system? And leave the messy fast path packet
> > > data things for somebody else.
> > 
> > That makes sense to me. If there is duplication between the two sk_buff
> > types, then one can be defined in terms of the other (or maybe it's
> > easier to not do that).
> 
> Probably struct sk_buff is one of those complex things where we make
> our best guess design now, and be prepared to redesign and refactor
> the code as we learn more. To me, it feels like we need a base SkBuff
> with full access to all API methods. And then a restricted type for
> NetlinkSkBuff on top of that for users of netlink.

Agreed. Though in this patchset, I don't believe I use any of the base
skbuff methods, except for the fact that the nlmsg methods seem to wrap
them. So it is probably dead code to add much right now unless I bypass
the nlmsg wrappers.

Alice
