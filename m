Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79B481728;
	Wed, 15 Jan 2025 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736951953; cv=none; b=mZY93pK6jZDKcEMmkFOL3HsiLc+lw1qirVZ1hNCtBNLZIC0sYZ0fOcNzqu/4vVC8e3sv4JnABLcsYRjCeQsALV1qjkkT/X40KCeNV5eWI9zFinn5/Xu7t+zYtFMEDPA0sQmYPvO9XUmDaXSAl2gotkHXF4XZzqQkipumWHO4ehk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736951953; c=relaxed/simple;
	bh=ejQBx+TjdjkluUda6ulXRnrrMydOTEcSmif0kshn01o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GU74RZmKk5N2qYT5lx2J6zefvDTx8Ytm+ZdyuP4afZ39ukWLOzRLn6XdBkZcIj9z101sKnHf00H/Zov6nDzsvHItHDWX9PJx3uiKVntVYHS/VKzuZLzeoUInSihNZz+TXqmbbrx/gSVJ3ixWH50WXYC2/d2/D3QW0/ndYHoIZ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqH8N8MU; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqH8N8MU"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6e9317a2aso80075285a.0;
        Wed, 15 Jan 2025 06:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736951950; x=1737556750; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cgoW7NPzMMMA+xBFkb8OWRlWKkK2GIpZCacJUtJFHt0=;
        b=TqH8N8MUfyD6ORY0aQSQBSZAfVi8W0wxQW9vaqkhlW5n9wtsLPNUeELw05DKzl58HK
         JPGLJ5qBJn3RYj2i/GrX9F3O780ecf/wyrwMyMy1zvBzYdLIiXTQLsU8l6zRuE7q3zK8
         T4mgEZDxICFrpRHeFjP2sQTNqz0J3TBk1dQ7Mu5FuLXWa1iJ+L4+EG3PDorl9Dq29fj9
         CElYUrsO/wgFC3zbqyo7wRYHHw/eOH7Kcv/jt0aXKLHuAGEp99Kcr/KL5agRyMKrlalT
         KIj24liFTgPH+93JQ9pH4zpa4P4LDFyCJ3dNX6t9vqyIeiBTiLMwb5V3/GSERAgSsNuB
         eSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951950; x=1737556750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgoW7NPzMMMA+xBFkb8OWRlWKkK2GIpZCacJUtJFHt0=;
        b=vLDwPViSgLpU3GvnGgrz9k7tQreVTdlgaeyxTv425vsuqYWCMenjVkGV/KcmE3rRrP
         KJilRzXki9mSnXu2UPFyKJZrpNchGGEM4yrc6wzxXHE8ayqAnUulw4XXFTOBpBGQDoK0
         8homRbHoPQcBHILr8H1gXzT89cUvRYSHjO/x4bXNVOwi0cj6Xov9SMEfVaowiM8KqjgE
         2wDHuEOF+sdU7Hbg6pF0va5L8Twx07uVi4qfS0y2TzN4Stf5h1mcm9vwmwtcNfRP/uSv
         aghpi7KddJz3faMmZ+Bct9c17slF+vVQUUWux2xu77n3KcSu2c6P/0ZjRM9MNStBiEXU
         EoXw==
X-Forwarded-Encrypted: i=1; AJvYcCUcNdHoqz7jvSDx2Ov2C6W5lJAexlK+VpXyprO2x2YfVMz+4XmKCURFDiTprhMW2bMGy7cSiVLOHDfqJF0=@vger.kernel.org, AJvYcCWcr18PT386ArqRTGETXzi3MCgXL2U4II5yLIKGVSoMPYyVtcOYHny6d6hminlK8HJvECzzqo/dfW82cjL1A7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK4WkK/hYESut8ojlQ8yvc3LxhinsALZeEEtCInlKL3oNBjnqU
	thi0W16yMRWh5JuFibnp+oesuk3tdG8H8LUXZjdpQ4U4vF39nt8m
X-Gm-Gg: ASbGncssIZilphyB4wkCTIcMndJtDUAgKNd0AM2Ffb/e7euivLgF8npNbqPBZjvv9Vx
	Uuor8aEGClwZ/B8kvuxB0rob1JsMOMzOdtTGPvt0MQYm/h71onFTIxotSOfDclVFS6lTYyGR2+C
	S2Wlt9sVVPSWQ7/ntQGNn2AUC8ZrDg2c39qUIxQBlj+W6fFQ4FtcPQw3dV2+2zlXKHTKPRS00Ts
	XwFbjBb1l1GYdAtSwEq2EFgwuqGlTRp/q789c240aznIw9HnT5WACQCYMDvUV5lxbmqFEzGA8g1
	/8DvRSf1qEDrOba+6vcZcPs9AYhtTno5FgrFDds5qF9bCsI=
X-Google-Smtp-Source: AGHT+IHbrShe1CVslxqPZ4woq/ZI4yq1IfPW+q899BBpHhWJsvqFnY+JnX7KExNSOrVTPSfIyOHElw==
X-Received: by 2002:a05:620a:410c:b0:7b6:c324:d3a5 with SMTP id af79cd13be357-7be5243f3f9mr444024185a.19.1736951950524;
        Wed, 15 Jan 2025 06:39:10 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade897d4sm64943076d6.113.2025.01.15.06.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:39:10 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 88DF5120007F;
	Wed, 15 Jan 2025 09:39:09 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 15 Jan 2025 09:39:09 -0500
X-ME-Sender: <xms:jciHZzMaZQhA0EoxNBb5dkqECgjrNWlerFIkJQp3D7O6GxxWg0_7Cg>
    <xme:jciHZ98VkBFe44wOchEQCDw_yVX06J0h55xWK7CHREUndlcCtuQcnz9ltIxS7F_JU
    TjRVHUUOFfSl6gWkg>
X-ME-Received: <xmr:jciHZyQC9HC3XkGJ8J5Eo2F64OEGFEmngTCBzNuiJrasyiP9yIupQ1P2rhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfh
    gfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduvddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgr
    rdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhies
    ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhn
    rdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:jciHZ3ut5MfNs3LXTGAS1vQiPXtA6PldQNOpC1rz6ePKjX2z26Qxiw>
    <xmx:jciHZ7cj4mP3I-anh1wM-7VLUVZLD1kYV-3DNyHYMS3lreFxsccerg>
    <xmx:jciHZz07-tKQ1OHKSHNxjEEOtoV0JUrDVSIOgLilEice1lmYv2R8CA>
    <xmx:jciHZ3-YnZqWjAGWEC1GkueTexQDNrXsqXOmm8_jr3eMCcEoK8HZyg>
    <xmx:jciHZ-_U4CvLyFf5F3eHwhm1Ck8ISa7V0I_yMHodf_az9Yfuu6NuWdYU>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 09:39:08 -0500 (EST)
Date: Wed, 15 Jan 2025 06:39:07 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: irq: add support for request_irq()
Message-ID: <Z4fIi_Gr0XZog4Ye@boqun-archlinux>
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
 <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
 <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com>
 <CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
 <20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com>
 <Z4cFO5NIW-E07Vl5@boqun-archlinux>
 <CAH5fLgge1pp10a8w4xp1eDobMJUHpnM1Ezh+JHmVmfF=6_vpTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgge1pp10a8w4xp1eDobMJUHpnM1Ezh+JHmVmfF=6_vpTQ@mail.gmail.com>

On Wed, Jan 15, 2025 at 09:27:39AM +0100, Alice Ryhl wrote:
> On Wed, Jan 15, 2025 at 1:47 AM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Tue, Jan 14, 2025 at 03:57:57PM -0300, Daniel Almeida wrote:
> > >
> > > >
> > > > It's not the pin_init! stuff, but the Opaque stuff. If it fails, then
> > > > it runs the destructor of Opaque<T>, which does *not* run the
> > > > destructor of T.
> > > >
> > > > Alice
> > >
> > > This is pretty unintuitive if you take into account trivial examples like
> > >
> > > ```
> > > struct Foo(T)
> > > ```
> > >
> > > Where dropping Foo drops T.
> > >
> > > Is there any reason why dropping Opaque<T> doesn’t behave similarly?
> > >
> >
> > Because `Opaque` implies the value may not be initialized, it's similar
> > to `MaybeUninit`.
> >
> > Do you really need the `Opaque` here? C code won't touch `handler` if
> > I'm not missing anything.
> 
> The irq callback is given access to handler, so it could touch it at any time.
> 

You're right it could, but would it? C code doesn't know the concrete
type of the handler, so what it usually does is just passing the
pointers to the Rust code (again).

A similar case the `func` field in `ClosureWork`: it doesn't need to be
`Opaque`, although workqueue callback may access it.

Am I missing something here? Daniel, why this has to be `Opaque`? Could
you explain?

Regards,
Boqun

> Alice
