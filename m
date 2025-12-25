Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5BB2F39A3
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766657955; cv=none; b=m9wpHRKSl9f+TdYz7yIfoCrhb9gaqrSy+5ra2B61j++Og7HpTVjIyePPlYnyhL3dzmnXUJqnrPCmQKS6s91LcNZ5n+tAxIAkiGU2fypoGzYA18YFZOYCavH05QjTuK0hWxXbCacQRbZHXET8MG/DOk+Z9D+Jdbeh95jl47cn9/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766657955; c=relaxed/simple;
	bh=kUhEEcyeX+pQXDOvMfwKXPAjHAuScIlJSVDFA+dcEAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ui2ABeEM3fH9q7QnS7wMLVj6IuoQrnvlv133xvTVERe4JRqJvdrvPfalgCWGdtV7QEjNAd6O+kJm1EXJ1nVreydQFKxFjVq5s8EKt8623ie69THKOyQW0XeKzLiEA/6ZLVaY86e+ksdvwnj+g4qTVq95PMereKLvR3vhJ2OF5p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2257oxH; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2257oxH"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8888a444300so70689936d6.1
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 02:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766657953; x=1767262753; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=miZGUQ6K1J5NwF92QvnAvuWWv/LljifSu/1l61TDgUY=;
        b=W2257oxHdD85K+qc2aC52c7kAbA8akLhnNnreroMR5CnejimyePbx8vVF0je7x214F
         RRvdB6yhqMATULvq9uSm6t83yF8Ias6lml4R1fU+WZCqyfG3iaHE6UG1ud7q3WIoG3Yo
         ivhjQBpzjkFPSa/f7pCME98TGRK3JqOGYZpYPzA8DgOfTNdt3SgySsN6tlUDFMp/Ht3i
         wmhMVAFw9HXRilF82EUp3DoOJBgNAHK3EqP18ksUeDgVQK8PzxQmJuJOgQqpMXwFstTb
         iFMv/+DFNg9rO2Cca9flMWbJAQFppr3w4ijvNT4AuNwKWgI0NjVpES3s0I9lT4oEEN8d
         wqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766657953; x=1767262753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miZGUQ6K1J5NwF92QvnAvuWWv/LljifSu/1l61TDgUY=;
        b=hOpzxvKSL/J83awJlWNHDby9r4tAYLsGui6wT+aNasYeYk5uyzqRh7oncoAO/dVRVb
         rknh6AZhYnPk0g9IVgUo3PmX15zyi7sP8FkGJpRMSKspRDCXm+ucSvlR/+r4sWMpjbEI
         A2pfst4pTd8fgopQl20o9PhmCXp7SN7+wkd94sCIwCTdsKljmc0/uQp4621zAzEZw6pE
         BbW4n1QJtFlrrKfW/KvlbTqO3I3lrtMlPwHGGHbVVi1MYSQPFBaeI6GhqcapmJ4V3a/p
         qJCJPgannxKCLvUA+feQhBIIt4F5FJQXK6vxVUz40AQkp5AZcKkAXDf7WPzHDAYOn3hN
         3XlA==
X-Forwarded-Encrypted: i=1; AJvYcCVQZ1LAKimZeKSnVRJj0fsvEsb0Y96DgMQXrWM6zhz/YH/F24qOF2TJXwgpK1XMUgwpkPeZ+3AxvwVTMIecDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzls/IyhlFQBFV4LDS5Hr6aBgvtBKv/BGw+9k02zJYmcFv5WaQN
	g9T63J4LUlRq6Jvm5XT2rwJbWFV9T6oRyphkUlzy0wiV1Q4wRR9cBamv
X-Gm-Gg: AY/fxX4lcW4rT730uCjWun0M/Ej3jhT5RlERGnf02/Xr0h+pJqsav2qVKYBE9TpeCth
	8y1aX7ITqcKlwhQ1QnQB5+2ZTb+XPYpNp2xAlcBh921Ueqd33gMdfTZweuSkYkqNYZjZ5d5fDCw
	3s8sQIWwYKpaJyORIiwK5+VQBk/+RAgqLtGtMZGthH+mLbxRoHEt533xUICGzJV4Yz5hu/lY85V
	q4oaD4VBKzf1umNN8qE3TFrFnBl2sqarR3IpjTIfkomscixmRv9mKPEwL1y36yMy73jvG3zlaG4
	VM4gFKdeuK1eVUgNKVuSDofL/CZXdZm3Ppsce5I299Zy4BpKuZ0lX5OJlYqWyryfdWZ9zoXIN/q
	cfl3TIs9fIoXxrNa/6WyH/WeQ6tXomTH9BjQb/WNtfLWcVPyZwhROQHNbN9Su+YVkbFPGb7CxWi
	8RvDY5YVGfv5zlNyhN3PUO/yK90RqcuTT4ygDHhYlavVqrNq4wnj7fCHt/LjBgB4iMdAwuAcMLf
	RbALsI0UR4nMS5YU6RFTroXdg==
X-Google-Smtp-Source: AGHT+IELRx4EtlvFzotPmT4j3ykDSAHpxE8LMB6n3jz+WJQmz7KUPu0AQGuczmt78vVQelUhFbXvrA==
X-Received: by 2002:a05:620a:4556:b0:863:42ea:d687 with SMTP id af79cd13be357-8c08fbb8308mr3496223485a.78.1766657952699;
        Thu, 25 Dec 2025 02:19:12 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f5fcdsm1461045685a.29.2025.12.25.02.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 02:19:12 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id BB627F40068;
	Thu, 25 Dec 2025 05:19:11 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 25 Dec 2025 05:19:11 -0500
X-ME-Sender: <xms:nw9NaSLI8rBUYl3awLA0Ikr0EzR-nflKjXU5GXsYUEEr2TBVQDWJUg>
    <xme:nw9NabFAvq5EfgsjW7C7VSSL7B9RGkoMpSdh9LvqdRlC1YesG__kofhNibg5hNSMP
    ofZoW52Z7a-BWqxlByoESkr8x6oiYziBHgsSHnm-_icAQ-qD7on>
X-ME-Received: <xmr:nw9NaTCX-VTFYYSrbvZA1yttz-TwzNYlq6rbc8Con-TztfVRnoawVY5e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiheefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejhfeikeekffejgeegueevffdtgeefudetleegjeelvdffteeihfelfeehvdeg
    keenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhujhhithgrrdhtohhmoh
    hnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehmihhguhgvlhdrohhjvggurgdr
    shgrnhguohhnihhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihse
    hgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhn
    mhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nw9NaV1J3Bk0NAezLUsr0x34VUOdDfCkFHv84Pd9Cpa80h9aqUKmZw>
    <xmx:nw9NaQNtZu6iGHkDwtd6cDsWVBzuoBPz9fJsdPa5ZRRtY4sw7bx7vw>
    <xmx:nw9NaS7blenS2HGYVdB3j_djThInoaK-aAkg0sS4l3yNXzQ3GO9HaA>
    <xmx:nw9NadZCA809QIuB1YJDYXLN72eFAfwjcyhOuhWjZEbXj3he8QuZ5w>
    <xmx:nw9NafGRXYyU_jSRIlX7j6KEKxzY4YYq5-jRG7OsE3boB7EC_VveHP6v>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Dec 2025 05:19:11 -0500 (EST)
Date: Thu, 25 Dec 2025 18:19:08 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, dakr@kernel.org, bhelgaas@google.com,
	ojeda@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, joelagnelf@nvidia.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Liang Jie <buaajxlj@163.com>
Subject: Re: [PATCH] PCI: Provide pci_free_irq_vectors() for CONFIG_PCI=n
Message-ID: <aU0PnCV69l7lV2aS@tardis-2.local>
References: <20251215025444.65544-1-boqun.feng@gmail.com>
 <CANiq72n1SX4OGFR4wNzurNX2RQki_ZmD13bBfywxxOEmw6cGZg@mail.gmail.com>
 <20251225.183631.866118259815088053.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251225.183631.866118259815088053.fujita.tomonori@gmail.com>

On Thu, Dec 25, 2025 at 06:36:31PM +0900, FUJITA Tomonori wrote:
> On Thu, 25 Dec 2025 10:10:04 +0100
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> 
> > On Mon, Dec 15, 2025 at 3:54 AM Boqun Feng <boqun.feng@gmail.com> wrote:
> >>
> >> Commit 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI
> >> is disabled") fixed a build error by providing rust helpers when
> >> CONFIG_PCI_MSI=n. However the rust helpers rely on the
> >> pci_alloc_irq_vectors() function is defined, which is not true when
> >> CONFIG_PCI=n. There are multiple ways to fix this, e.g. a possible fix
> >> could be just remove the calling of pci_alloc_irq_vectors() since it's
> >> empty when CONFIG_PCI_MSI=n anyway. However, since PCI irq APIs, such as
> >> pci_alloc_irq_vectors(), are already defined even when CONFIG_PCI=n, the
> >> more reasonable fix is to define pci_alloc_irq_vectors() when
> >> CONFIG_PCI=n and this aligns with the situations of other primitives as
> >> well.
> >>
> >> Fixes: 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI is disabled")
> >> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > 
> > Related: https://lore.kernel.org/rust-for-linux/20251209014312.575940-1-fujita.tomonori@gmail.com/
> > 
> > I guess it counts as a report, so we may want a Reported-by (Cc'ing Tomo).
> 
> Since pci.rs is only compiled when CONFIG_PCI is enabled. So it seems
> consistent to treat the PCI helpers the same way. That said, this
> approach is also fine by me: it's already inconsistent that
> pci_alloc_irq_vectors() has a stuf definition, while
> pci_free_irq_vectors does not.

Yes, I think providing a stub pci_free_irq_vectors() is the way to go.
If you are OK with it, I could send a v2 with your and Liang Jie's
Reported-by. Alternatively, since you're the first one sending the fix,
and I would have replied that with the suggestion if I didn't miss that,
feel free to send a v2 (providing the stub pci_free_irq_vectors()) from
you ;-)

Regards,
Boqun
