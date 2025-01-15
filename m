Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1983211CA9;
	Wed, 15 Jan 2025 00:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736902029; cv=none; b=fyi9/pNb3aoLRHOgTqv7zfXb18r3Za8GoRwy5usIjSnxOdaNMBONqQKQD/ANHarbFyjU3E+h16HY9M0B6q2+vRHXf4pTDxDdhQQSzMdBFQDStaFZZfQuxfKsgx+G9iSW3aKzcwtGlr3gdY8SgezpE6jVwfhBcjpn0WsqHXdJs40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736902029; c=relaxed/simple;
	bh=LAmz3XWZF42x8D9rIX04dU+0EsXezMIR9P6kEIxfoZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2sZLr2H+hrj1+oIP+5aMKNNNKYlASxdG4F5lC/czJ/6Hp6sMxdqGtvVK+GR2BrGh3RMDV/a/6mu175gdQJFEToN5Zkv0kSZBb7MSlnokoFTyB1sq+JBQqqaFnveYOwOTzmmQAizuXfrGwJEDc5SabKK+A4SNGL8idMhX0stkwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=At2+bO4M; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="At2+bO4M"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6c3629816so346778385a.1;
        Tue, 14 Jan 2025 16:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736902027; x=1737506827; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N+2OfBaBKfnunFZTYj+zCPfArMWf6i0XIgE5tYyYRVU=;
        b=At2+bO4MZaD63lxZBhJdZq3CyQM7dDOzoRpTnAisFyWW7584ojIJLb2ECe0c+9RUAZ
         1Of7uTRQLnDiAkTi6KAk5CzgrMKCsuI2p/wUdQt8mCNkU2I4XzZqOWPOQ84PkdFA/VKP
         2/l/Ta5XBxKbosTQh59upwb5DZzmRHdMBrPctpvycXne1urooULAZH7FCmrplkFINSH+
         Sv1HimMF5duFBjfiadeUastvHtstFvMSjf0UhYfTP9jesQT1l3aIe0LLBNJb45DgQG8k
         mTUSfITsojqSMDkIWlcav51nCcq9cpBya6uhjnuBwLaOG7ug70KlUkLgyoGE0EwWLdAz
         8fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736902027; x=1737506827;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+2OfBaBKfnunFZTYj+zCPfArMWf6i0XIgE5tYyYRVU=;
        b=rMxE57sgm1cx7c6AH4p72VVWjvSBf/z0iS0AZcDPakeFXV3odK8zkrjSEF3+vc2Rft
         S6Cagai3ZELGE+q9mVA8qJZWjoq+32vtGaNUL27gwx7xgsZZ4qDhYuOtXS2xQdzaq4Y6
         6UYZ1iuGo86jOaofnkuvzwf6r1V/fufonfVZ8FZMkBln4brwmHf4spMyjvdFE7MLsrxM
         2nTTxYO58OsvElDcGk2yM7ERV5IeJfCLv7WNPzxp1mnUH73Gq99VoujB3Rzpu71ikP23
         JPmciwl5RW9ap3o1pJkijjwkbUPg8IpqCYpmKlvBa+pUFLlw6ziRIZUWRclWsFrYCjtG
         vMow==
X-Forwarded-Encrypted: i=1; AJvYcCUXRGO8HMz3UgPaOSgQA4aoy5zhzal4Mf8J79Bmvj89F1Y3ba8w8/kGG9vXRZmNplxE52KUQAxXd30ib8p3qPk=@vger.kernel.org, AJvYcCWqIbXGmu8rWGLfjFxnKBr/rP+mwlgnnw7pFsipG636YfgxjIWGMDkOR8rPtsZa2f2gkwM9lCzJpUJmuSg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3X2e/vT3Rb3IuF//CMrRe7phSpxh1pObwMhVbiCUvsHzYgt+W
	Uob4X/Y01wNOvWTKDfgHvS1+IC1s+VGBvu2b9uTDnkiGOpE7Rskd
X-Gm-Gg: ASbGnctoqXc3B7Kk8UyKQTzSNQymzu16hneVK5I1wQmBAzaFvXSLRAXSwUSZzjKDQeB
	FjVLzY+kvX5kYvYzCBZeHy2gh57MrZtm7yR612q5CqWpVZJBVRMhVNbhAeY+F7XUxOY5MNKKSeu
	q7IWT5ymG8Bx0Wdl41ZmJXCD5AsTWkh5lt7K5aJLqVLMDU95p0hRKAAzJ4z0iQEDpdEsS9ul9LG
	v6su0XbecVehzcuazFMBfkvjjpjkZJgvr1Cuzy7j6UeBNsZkO9k9ItfMC9RDvtheVwnAgks8grm
	NwZ2BesSCOoI0eASMbj44so0W/UJ62UOnNLkTRcrTbk1SaU=
X-Google-Smtp-Source: AGHT+IH0jtY3zqYKVwyN9SzCHraFGbwmrLXr1DGU9QEc0axu9TVVEJnWp/kfL3X6lyzL8V28xd69tg==
X-Received: by 2002:a05:620a:4693:b0:7b8:629a:69b8 with SMTP id af79cd13be357-7bcd970a930mr3891125185a.17.1736902027000;
        Tue, 14 Jan 2025 16:47:07 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce3502ac6sm667123785a.75.2025.01.14.16.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 16:47:06 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id F24C61200068;
	Tue, 14 Jan 2025 19:47:05 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 14 Jan 2025 19:47:05 -0500
X-ME-Sender: <xms:iQWHZ-V-FIAgaSHrfEkj7e8leqvQmujninZlUwKr4fXSWqnY0aEu7A>
    <xme:iQWHZ6nhzcuOGyke7c1WM4yiG5BP1CVSZpzQBgXfOJgxf0LkfcGZGABTmEL2jPzkd
    8fAYnRsRDnQ2F83Aw>
X-ME-Received: <xmr:iQWHZyZDk0xQYjKIhDeKlY1m_N7nSR5u0i5m6WAD6LKI8Fpk_UnD5eP9Ptc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehjedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfh
    gfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduvddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtoh
    hllhgrsghorhgrrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgv
    rdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhies
    ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhn
    rdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:iQWHZ1Un8wiuwotbX2PrL2QgNIILU0qLjDfmubtVsHMgu2G2PXU-PQ>
    <xmx:iQWHZ4nhfXmkyX7Q5VF1kFLkS5UhLGG3-wuj1ZK48p4zwrAzlN9Hqg>
    <xmx:iQWHZ6e5bAxthtFjV-DCGTEMZHsvS4PMgmoB1ps6FIS0J4CpBWyEzw>
    <xmx:iQWHZ6GnqGPV1ppsd57f1qntEFnS-3AATZ1TN__u3TBZ9gWqj9EvGQ>
    <xmx:iQWHZ2nShiRqzSCLzISVHJhGY6OX-fQw5woYnw6N4WQpwYYu3DAY5rQt>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 19:47:05 -0500 (EST)
Date: Tue, 14 Jan 2025 16:45:47 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: irq: add support for request_irq()
Message-ID: <Z4cFO5NIW-E07Vl5@boqun-archlinux>
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
 <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
 <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com>
 <CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
 <20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com>

On Tue, Jan 14, 2025 at 03:57:57PM -0300, Daniel Almeida wrote:
> 
> > 
> > It's not the pin_init! stuff, but the Opaque stuff. If it fails, then
> > it runs the destructor of Opaque<T>, which does *not* run the
> > destructor of T.
> > 
> > Alice
> 
> This is pretty unintuitive if you take into account trivial examples like
> 
> ```
> struct Foo(T)
> ```
> 
> Where dropping Foo drops T.
> 
> Is there any reason why dropping Opaque<T> doesn’t behave similarly?
> 

Because `Opaque` implies the value may not be initialized, it's similar
to `MaybeUninit`.

Do you really need the `Opaque` here? C code won't touch `handler` if
I'm not missing anything.

Regards,
Boqun

> — Daniel
