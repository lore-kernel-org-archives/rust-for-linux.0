Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B7E146A66
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395467; cv=none; b=BAAWem+xxP3YskXA+fyHrGyButwY0dERwlfkX90PE8xBODyL1wBCdKfdsZDdmNBI53buz9BiXxNinCl75UmIjCfRlhltTsb/KjCQ6GoMNKNNt90x+t7suLfV98xRqsYXcrxpRJwac2bVQ2CkOeB/FzMXVPHC9Nu0sv8m3jAoung=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395467; c=relaxed/simple;
	bh=2wwgwWCzkU1/uJtgqBNz6l48jquoQD3I3uL/trcljCc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZXk+ybLPvO0buamwSXClzxgzxYSIotKkEoy4vGMndePx+bELYRdY6ixTufJ6WoT029uMOztfg5JMu4pSUYYEu/zCu0xjus2m796V4rd8/h7pQALH8Quf+n6KrAoDBf/1bdXkhFZ17fkWWwMR9wTMgOf/hwKtUE+U/gIXXeqtJnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d6fenC/H; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d6fenC/H"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-482eec44485so19369505e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Feb 2026 08:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770395466; x=1771000266; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ExqTOkqsO8eK7E0o5abiZmMLMVjxuERqrY13GtOt0ak=;
        b=d6fenC/HQ0F93MBggZCZGIzndN5dFscRpWGYDPhg8KKTuuetADn7WAIcPFoRNyzkUS
         yhQy9oEPHDw3z40tjf5aLBBH8dsAKShqcZEkpPiOiwgO74Zz1XWbc9wKmCg8l3or81Y7
         EZLUPue5EVVrk458mlaRQqE1UJCiy8hKBnApvzjtWfsynASK/1T7n7OIByEYqLvrj0Jv
         Z2XjiZC5NAp4Pil/UfWMAYZSMu/Cujt4nJkX0K1rKjNeZ/p5EplBSjACbEWx1le17t6Z
         R4YJxBz8Zlb2taH1hv/x0rZqGrQxyfRbPXI9UuC1rHoe8bXfJsKQI2kaYGpVgraf2tM4
         7Esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395466; x=1771000266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExqTOkqsO8eK7E0o5abiZmMLMVjxuERqrY13GtOt0ak=;
        b=AAEBYRahqRhoWXEfAOBKVnUZm+v6o9eniVqJ/YEY8WfClRhysL6kdJR5eC1T7Mv6ae
         xcvbKR03xJkRVM3FyvVryWgj5NJjdvL7DKGbAY9+Ftvc19BvbXDyq/IzYNAD8U70y7Mj
         Gw595WeyFyJGVUdmLN7LQI7ME8sgIhhqczjuWpRVuGQjNIBlVa+qDhc9OkjlvrUXenxk
         fFP6744c/8NLjhYoIOJEvAbCwSRuL4yGtxDev/8gZX/hi3DZvSpnkfKrhIgFf3eb/eA2
         FZ//+eh9mUCq8WIykuhcRpvU2J9PKYsrzmKnOr0TZDd4dIjaoJcmj14k6P/8izs+SDyF
         /BTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEX0aDSMrB0n8MAlSB45TZx166jf0ZDMhNrkJwbaxg3qY9OYFOvUb6ZFEesmxaCe2dpmkTSOowGDO9tyAz8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCozdufqX/JQQIuTJlR0FI5Jt0mR+tQfrNTxbJ+uaU50s56eUX
	0wfHvt1ybHbQ4lcsMhg15KTqK9dUGtzFslsVqdwwKj67pXPTQNiDj5Gy0KMUJOqMPHCf0biNhCZ
	U6QHEX3RYKooY0O5hKg==
X-Received: from wmjf11.prod.google.com ([2002:a7b:cd0b:0:b0:47a:8fa6:6a57])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8489:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-48320229cdamr51034695e9.35.1770395465775;
 Fri, 06 Feb 2026 08:31:05 -0800 (PST)
Date: Fri, 6 Feb 2026 16:31:04 +0000
In-Reply-To: <aYYEFRwotF5AL_Ch@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org> <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org> <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh> <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
 <2026020616-hardhat-french-4dac@gregkh> <aYXtwXYAELSIoxXE@google.com>
 <2026020633-foe-etching-e464@gregkh> <aYYEFRwotF5AL_Ch@google.com>
Message-ID: <aYYXSPtndNSPZDH-@google.com>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rafael@kernel.org, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 06, 2026 at 03:09:09PM +0000, Alice Ryhl wrote:
> On Fri, Feb 06, 2026 at 02:55:50PM +0100, Greg KH wrote:
> > On Fri, Feb 06, 2026 at 01:33:53PM +0000, Alice Ryhl wrote:
> > > On Fri, Feb 06, 2026 at 02:22:42PM +0100, Greg KH wrote:
> > > > On Fri, Feb 06, 2026 at 02:16:05PM +0100, Danilo Krummrich wrote:
> > > > > However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great at all.
> > > > > Hence, we could do something like in [1] instead. I don't know if there are
> > > > > other options that may be better though.
> > > > > 
> > > > > [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/
> > > > 
> > > > That's a start, but still messy.  There's no compiler options to prevent
> > > > this "lifting" of the code out of devres.rs?  If not, this is not going
> > > > to be the only problem that drivers run into like this in the future.
> > > 
> > > Because of how monomorphisation, as-is the code actually lives in the
> > > module to begin with.
> > 
> > Ok, but again, that is going to cause all sorts of "the symbol is
> > undefined" type of problems going forward as a developers just "assumes"
> > that the place where the symbol is exported will actually have the
> > symbol exported from it, not that this place will be copied inline into
> > somewhere else.
> > 
> > Think about the interaction between module symbol namespaces here.  This
> > isn't going to scale, and will trip people up and cause us to be forced
> > to export way more than we really want to (like this patch series shows,
> > I don't want to export any of these...)
> 
> Hmm. I don't know how to reconcile namespaces operating on symbols with
> monomorphisation.
> 
> We should probably think about what to do about ... :)

Matthew Maurer pointed out to me that behavior-wise exporting and
namespaces behave almost exactly the same as how Rust handles unstable
language features.

In the Rust standard library, all functions are marked with one of:

	#[unstable(feature = "feature_name_here")]
	#[stable]

when you use a #[stable] method, all is good. But if you use an unstable
method, then that's a compiler error unless you have

	#![feature(feature_name_here)]

at the crate root.

This seems equivalent to our situation here, if we consider:

* EXPORT_SYMBOL_GPL symbols are #[stable]
* un-exported symbols are #[unstable(feature = "core_kernel")]
* other namespaces are #[unstable(feature = "namespace_name_here")]

Of course the way this is enforced is through an entirely different
mechanism than symbol exports.

Alice
