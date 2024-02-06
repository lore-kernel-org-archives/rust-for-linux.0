Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103C3249ED
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707216631; cv=none; b=Fm7ZJoE4/+3fNR/74DBE3Bv0IVLUQatngzzag5uigxxbCsmeODk/yTOcFxizn52cNogcwAZfhgaY1OIjUUDLdqto3kUgX6IwRJ6EOK17Yb4VE/BGzuCk6PJHjWmQD8sXpmkJWG30P8k8cWVeZEXAg+YQpGF5aEzTYTwCHg2KNws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707216631; c=relaxed/simple;
	bh=lKhCZDeoEDvk+g23UT8JpFI8GvIuQZBuAmdAx04RpFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6+SNgd/CFQN4NCl7CDiCvfb1FTEbzDwSogBZJMxfzs5VBKqm53h0JhZOK1wUIyynbYFmFnha43OPlaY1Pm1lwW99PfTbqwV9XXkov4MOqC3IoF7JQMwJWgjh/C67PAIxtfxLexhEPR8k+H43kbswMCQ5gWAkqG/ZbpkJsJtux0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=pW4wqDqB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KoSDXGmQ; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="pW4wqDqB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KoSDXGmQ"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id DDA6A11400B8;
	Tue,  6 Feb 2024 05:50:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 06 Feb 2024 05:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1707216628;
	 x=1707303028; bh=J9ISk/FWQkIFznQoTpg1liywwjssL91OHNxQt0rWQtM=; b=
	pW4wqDqBTWWwZrp/KttvfYG80iW4H2k3sz9KMeOP5C1AvjNtbXOqOugo59kGFRT6
	/Nf6TmrCU7FW3aFUIweV/+LERx5JUv2nnK34pHwq8jwcLoZHiIoX+PCbayRt6CDJ
	Do0oWC23UFkpX/9k/ouZhxtrFMQqI5JncRO8a76vqDl79Q5GUd7emw9M0LXqS5yu
	KybhwkWTPWz5RtNMenfqMtqcEevt8L3SX6d681YtQLZAzkrGzwzml9gb0iZ2gHML
	s0xqcDgMNbP1g8r3jeZ21vcKID1oNuTMaNvUS9fb5RS+H2VA+41Xc79w6gxKgeIr
	2Ui6ryjabwh4Zoj2bFTaDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1707216628; x=
	1707303028; bh=J9ISk/FWQkIFznQoTpg1liywwjssL91OHNxQt0rWQtM=; b=K
	oSDXGmQGUHvJIXhPFDmTWNOI6SeVUs/cQTpFTRlKla2Sczu3HRlvjOq/L5K4QvNF
	+eb5uP+wZoPhzi7FIY482a84D26CMaXopRgLSNYfrPL3E3wOFN15IpLG83yA5yhs
	tCmUJhd+DzTJBwRI+OXyBLMGWOrZZmMYWZlqk4ESuLcZgrzx51Y3alesZWV1qEnU
	MHIugFlJLvFO8s7bORYoY7gPp4CIfyxjs8C5Ik/gUbummD0cIf8CT4uQC/yDbuYy
	AFim0MZ5K9K0tlzvQZWA6NBvOGqDauhHcU+tRY0hX72Xii6LmTc0bizBbujvW5PE
	83HVoXyBDO08XC3V+Rq5A==
X-ME-Sender: <xms:9A7CZcYSBOy2v172fDiaqOAjCsiVZL7-nRhNseWyrtUSOUlD3IeLgg>
    <xme:9A7CZXb-F3HInjukQPX-bKJB05L1A0bmM0laN0HQAPAZByLyiH5EG8PlvgRmyKy93
    1IvlJ0-rFK5sQ>
X-ME-Received: <xmr:9A7CZW-0_ZVzXeuIUcr1RS4J9T_Vi-_R09fD4kKYEaHQ8yHkfNDxLm_hmKbLUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedvfedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeekvd
    eludeufeejteejjefgffelfeefveetkeekteeufeeiheehvdfgjeeivdfgffenucffohhm
    rghinhepthgvgihtrdgtohholhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:9A7CZWr5WKrDMK7eAq3SY0W2LiMZLK0qWIeH-HlbcG8cVN1DR8KsJQ>
    <xmx:9A7CZXoy841PMyvynhO-uASagURI1CP3AGgMs4n2C4eaaMFtO13DsQ>
    <xmx:9A7CZUS2RMUO5rmonj1xv4n9fC-TVdlJ2tzX1SgWgRzDtSkv6j-bmg>
    <xmx:9A7CZSAn_-1n3gm0_9Gx9LhvU6RYVm4fCQR1xAIFBK1TdEClUXpogg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Feb 2024 05:50:28 -0500 (EST)
Date: Tue, 6 Feb 2024 10:50:26 +0000
From: Greg KH <greg@kroah.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Thomas Bertschinger <tahbertschinger@gmail.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com,
	rust-for-linux@vger.kernel.org,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in
 .init.text
Message-ID: <2024020613-illusion-quirk-14d4@gregkh>
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
 <2024020617-edition-underpaid-4873@gregkh>
 <CAH5fLgjYCg+m7+Q63gFr425NiMkhTPWkDufB82pPHCZNhYAk9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjYCg+m7+Q63gFr425NiMkhTPWkDufB82pPHCZNhYAk9g@mail.gmail.com>

On Tue, Feb 06, 2024 at 11:29:05AM +0100, Alice Ryhl wrote:
> On Tue, Feb 6, 2024 at 11:01 AM Greg KH <greg@kroah.com> wrote:
> >
> > On Mon, Feb 05, 2024 at 06:25:35PM -0700, Thomas Bertschinger wrote:
> > >              // Loadable modules need to export the `{{init,cleanup}}_module` identifiers.
> > > +            /// # Safety
> > > +            /// This function must only be called once, during module initialization, because it
> > > +            /// may be freed after it returns.
> >
> > Oh, and the compiler will catch this if you get it wrong, correct?
> >
> > If not, you all should work on that, as it is caught in C code :)
> 
> Based on the commit message, it sounds like the warning that C uses to
> catch this happens a link-time, which means that it is also triggered
> on Rust code:
> 
> > If a Rust `init_module()` function (that lives in `.text`) calls a C
> > function annotated with `__init`, then a warning is generated because
> > the C function lives in `.init.text`.

Cool, but has anyone tested it?

> I suggested that we make this function unsafe too, to make it even
> harder to call incorrectly.

It's not "unsafe" at all!  It's totally normal, and "safe" and should be
used for many types of modules.  If you get it "wrong" the linker will
catch the issue, so what is unsafe?

> But I think for the more general case of this problem, it makes sense
> to rely on the existing warning for this.

If the linker catches this, yes.

thanks,

greg k-h
