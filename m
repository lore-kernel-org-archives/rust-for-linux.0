Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDCF4BD7B7
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Sep 2026 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005041; cv=none; b=Cn8PQY9CFdHf2rUnCBT6mGoydnCin12sz/vy9iheNzts663Y7ZhUDzamY4rK/gqIED2k6rFmq6SprRr5CDbnKVOZV1Os/g7YNHXv4nk6PEn93XzaUl6MG/eplWOFT3BgSAaN6y5VfpXK9VAn/pzPQqdOTpIcogyJesgV5iZDxng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005041; c=relaxed/simple;
	bh=XgUCGVJLhIlUmnyZQ21SpI34kHHRrPg2RzKmgwQLt0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FhJX9IwdSa3uPKyEKwixJqUrnt63WlUXC+FwBuj0x/NSklNpkULszpnjMXpOTNmo9B/g4f7uRedpKk4EEyRPLehnRQ22cXViE2wLremanMmrtP/+5O1KnQjsiGWbiQ4B213VsVpdPCkea+eoNHwWpE2VIG6xoXQkAorFSx9YRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wxy0lrPo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wxy0lrPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790005038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d2LwH2cP1qS4tI8C535iQCzn4GaCMcdwd0hMiPIjiQg=;
	b=Wxy0lrPoo20W5/QEbwVI6zhjpWFU8XUick3XJaGH30o9huaevpYIZ1fsmveMQpP3pURjsO
	r0/dP5OL2Na71bELJ08E/O8TpyIUUyK/6viOW2IBGgOAsFMCHj4vbhDZvxwWDXlTdEAQtX
	Sta5kLM+0GItNPMETFT35I1TNx2acgo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-BeM6rUbcOEK1M-4wRrJY2g-1; Mon, 21 Sep 2026 11:37:17 -0400
X-MC-Unique: BeM6rUbcOEK1M-4wRrJY2g-1
X-Mimecast-MFC-AGG-ID: BeM6rUbcOEK1M-4wRrJY2g_1790005036
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cdc69a7b5so68249796d6.2
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Sep 2026 08:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005036; x=1790609836;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2LwH2cP1qS4tI8C535iQCzn4GaCMcdwd0hMiPIjiQg=;
        b=CZWmaQ+PaPutOHp4+QK279qzMhYzx+K1Sawf7hfYd5ZtY+wr65iYkegS53y7ymM38l
         QlyefLwfemBXPhW9yKhOKupTREeH+Lz3Hc8hTrGQuE7jPIJ2khe2tQL+7Zh+rF/Hbyhb
         2n8ZHyh+eV7NUh7dK+uZBexkC/SdIAoPIoVd3k0d1Nzxy7vra1Sz1h2YgjuVp7tIOLxP
         N9LZJdL/W/IUd0HHMKSAeTX+6rTOuiqz25kufeHi7FWSRJnYnOZWCZKYF+2bZypKwleK
         wJ5gLz6Sp8GcwElV9XkdvYXXoBZLbEgAWZ+pm04M6EuL15RjpZPLHsoBrOUMCIzFqYtd
         Lk/w==
X-Forwarded-Encrypted: i=1; AKwUvBzOjTuotjdEVN+uz/tU6lbI5hOn0NH7ifRPKTvSFYyrzeDJGiUafSjCoU+ATB3NhdNh+slEAlXe7gedaMBN0Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kyO8QfmsVLrly7a2dNVG5C8/htsXp0jlycJDvah6YmpX6niIVt
	tDFxflET03AO08AFns839AoMKXbzKlQbxYNsZrJssOyirKRsnufO/iuV54/jjGAQVobPZGrcX7g
	Y9hE+Ey3Jzm+VnQKiPFnxRrj1VrAwsIzulVwf4rMWVrhoea5DFzOUlfAPAv5CWr4V8VUr
X-Gm-Gg: AYBFou0uckwgmkA+CYk2f0JkEx72POJWvJ5rIBxKdgrgcHtJpSr8CCEx23c8DQPEABU
	R2Jzrdcsl4MB0v3y1Ik049ebwTWe54pvHK0qt/GfTQFI9r7v350sC4yya1wR0TT99V7JBSl0qEg
	/LkYtwtRw2ffV2qaFUTAUb5QCwG46FrJSUaKk7fPNZt8HhX635pCrT+2w7aZeW6cICW71/GbfOq
	fWlQCvZN1UUQaFX32LUrNQ2xBkAcnNgraKHril4KeaqJ/HmVEAqkVRoQvYe6Y2bB833YcSkftey
	7t5SD+RFzleCIQdo/U+r4ZFLjnCxPmou0eA9hCbYrCscSK/i+6Sinx+CUMd4QkRcoAz71Hkwdcq
	U5BxPhvbyehbXEFT5n/SzLRMoYfuY6kUt5yw=
X-Received: by 2002:a05:6214:4118:b0:912:517b:910 with SMTP id 6a1803df08f44-913fc994924mr10057856d6.47.1790005036368;
        Mon, 21 Sep 2026 08:37:16 -0700 (PDT)
X-Received: by 2002:a05:6214:4118:b0:912:517b:910 with SMTP id 6a1803df08f44-913fc994924mr10057426d6.47.1790005035845;
        Mon, 21 Sep 2026 08:37:15 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa1c03sm70584576d6.39.2026.09.21.08.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:37:14 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:37:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Georgios Androutsopoulos <georgeandrout13@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz`
 constructors
Message-ID: <arFPKcA1RCecTfMD@redhat.com>
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
 <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gzKzgtAEZdUN0GWwaVYB7dCJN9c2iLY8xqYFsC-vgww_1790005036
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2026 at 07:10:42PM +0100, Alexandre Courbot wrote:
> On Tue Sep 8, 2026 at 11:56 PM BST, Georgios Androutsopoulos wrote:
> > `Hertz::from_khz()`, `from_mhz()` and `from_ghz()` multiply their
> > argument by 1_000, 1_000_000 and 1_000_000_000 respectively without
> > checking for overflow. When `CONFIG_RUST_OVERFLOW_CHECKS` is enabled,
> > each panics once its argument exceeds `c_ulong::MAX` divided by that
> > factor. None of the three documents this. The panic occurs only at
> > runtime, when the argument is not a constant expression.
> >
> > Add the missing `# Panics` sections stating the bound for each unit.
> >
> > Fixes: d01d70205601 ("rust: clk: Add initial abstractions")
> > Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> 
> As we just discussed at Kangrejos we might want to harden these a bit,
> but meanwhile documenting the behavior is indeed a good idea.
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Brian Masney <bmasney@redhat.com>

I assume this will go through the rust tree? If not, I'm happy to take
it through the clk tree, assuming the rust devs are happy with this.

Brian

