Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FB25625E4
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 19:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191901; cv=none; b=aLCdeV0rX5Xzyq0r/P+ARPC4SfuCZy83UDd66KTKdgR1SwJN/FlTpIsvM3hIY23YIugAnSflzIMFgvQyGE4DU3LCXgYzIe5GoYEz8Eb///6Gq39El2fcsot+rx2qOQUFmvyKbu4u9PM9L2DUsqqyiO6EEVh/pkhcmVOTuL/ghD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191901; c=relaxed/simple;
	bh=6iupfhzSHmFB3n5I6wsdrPypYlAtg1EjTEHMjDviSIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gkotLlCsbtly4iZsohMCuz2Ty30bmEXQXOm2y8fQBJNY7r1ToVReMfTWGY9SbzrfAPgs9xYy2Y62S5/j8P7XAdEe/CE4eQTHFVeQm6IIcacy2LgS6bDMedpBYfhuDe9gfR/+mVKAd9nPmoyawAbAz4TznT2zBDbXC+2bOd4fvzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Is7mSpCF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Is7mSpCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790191898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ovivw96bNcYL69Xo4W26bbtJi3QOHW7T3qBHC1K/UZc=;
	b=Is7mSpCFEi3PjNGLWfPoI+vW2SdyN3ZQvj4kb20womUBMOvoWVXMt7nfjvSojkx8rtk5TR
	XewifqYwuvreF7IG8CRjxVtOz3lWBomWniiEK08lbNQNBeClUZPJVL++gd//4xaIZbrt5g
	c0qViOIuePEN5j4ruZZTNR6cEkzBH90=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-JndJk-REP0-elZ09BujZTA-1; Wed, 23 Sep 2026 15:31:37 -0400
X-MC-Unique: JndJk-REP0-elZ09BujZTA-1
X-Mimecast-MFC-AGG-ID: JndJk-REP0-elZ09BujZTA_1790191896
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106fce784dso23638896d6.2
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 12:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191896; x=1790796696;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ovivw96bNcYL69Xo4W26bbtJi3QOHW7T3qBHC1K/UZc=;
        b=TKABODBnstLvNKlqOKLr7t8ux61ynPOpiSPdnyTDQCrkbsWsIPAB0Wqt8p5ndxBZwJ
         GDyg+XwvvYMIvXNZ0ojmNhCbCpZEpgiaT1AZAfRKj5MYk9BlsCakRBCsakyYbH2+tdID
         miEQbiRzxFjjFS4mtKExNYUIGw0JeHxSto4W5fWNUXhtnYbrxhI4Qe8QFqvoaQTpnn6M
         wnQ4S6JNXgJWj0CGLvuB0FoA2An0adTWdua997AX1CpEWJwEqTFw8gsqP9o5cm+2aVHA
         qptLAgh6nQ/mrvD2ftbP2XuAa/6vacpf4Lca7hoBNfsaKXNAkvkuTYV4RPuHP4zeQX0E
         7TcA==
X-Forwarded-Encrypted: i=1; AKwUvBw6wQDC52MacnGtizHE2EzBQbAUAfN/S4FrVCkNRdfxxieYngpaBFMoxTWBYFCA+dATKT8IJMalychsmRoQMw==@vger.kernel.org
X-Gm-Message-State: AFuF++lQbR5k3roQ7s7V3q4yAO1X45/u5Cr3+AXmH0CKFyk+kr0iE6PD
	iCxoFXR+YPUh7JYLbEw+EB/eGPFRuVJRqyPzkXdCwi1/BU+4J9kksut3aVuiGpCUKEjWFE0HyDA
	kPKUHXAYQ/RuwzehbtRQ6MvHfZBUe4hItGtKGN9JUoQJ+hNaE5/Qr550qn4kTnjEHi2dN
X-Gm-Gg: AYBFou2ai3HGWitUe5CBqn6b6x5skcH0auG2zNXTXZZ9+aFA2HdnPhzLqirrtYBu6Y1
	6zXjWuysq50THBZvlU/mF+5Sjq/qI6jvG0HXSI+l0P8JjLoUUYOGWv8NtqrUZJh2Yi65GYfZp3X
	3PMheH6D5PguMVHU+CX5L5LmFngChYPtXgdc4K5Gk+TcX+rDl+wawGPus2S0L/zMWd81vTjuRYk
	RmclsybNvTSeXUf6HdkxMqc+TuG1OFn+Ajnow8DLsnWPIZivuBFzIbTbvYS+b++lUSMUwXvs3Ba
	1st0So4XraJFpX1lpAvNuDlqpkgZJu57uLb5EcrVKn2ipEG66evD5oi2dUMLN3ZvSU5SdLLS9tI
	G+inusiHN
X-Received: by 2002:a05:620a:890e:b0:93c:18ff:a0b with SMTP id af79cd13be357-93c3470da05mr22943585a.29.1790191896487;
        Wed, 23 Sep 2026 12:31:36 -0700 (PDT)
X-Received: by 2002:a05:620a:890e:b0:93c:18ff:a0b with SMTP id af79cd13be357-93c3470da05mr22940985a.29.1790191896030;
        Wed, 23 Sep 2026 12:31:36 -0700 (PDT)
Received: from redhat.com ([2600:382:8529:2779:5d36:56ab:46b2:2e62])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248bd54esm297435985a.38.2026.09.23.12.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:31:35 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:31:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz`
 constructors
Message-ID: <arQpEx3LI5D5_EVf@redhat.com>
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
 <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com>
 <arFPKcA1RCecTfMD@redhat.com>
 <CAH5fLggOMBVi3DjQSmLtstnntgJQzDsQjEt15nRkiNi7EuLB8w@mail.gmail.com>
 <CANiq72koa5rBohoBg4zaawBUPuhBatGouBzqTWi8djxMaaLacQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANiq72koa5rBohoBg4zaawBUPuhBatGouBzqTWi8djxMaaLacQ@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w3SN6mb25IwK2uv_zW3jiLixKzhGizZXr_9d5J4HL7U_1790191896
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Sep 21, 2026 at 06:08:46PM +0200, Miguel Ojeda wrote:
> On Mon, Sep 21, 2026 at 5:51 PM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > My understanding is that the "default" way patches land is that the
> > subsystem also takes Rust patches related to the subsystem, and that
> > the rust tree is a fallback tree.
> 
> Indeed, the idea on how we suggest setting up the `MAINTAINERS`
> entries is that, by default, maintainers keep control of both sides
> (they are the experts, after all) and that, hopefully, they get more
> involved on the Rust side etc.
> 
> It makes sense for reworking the subsystem, too, since it may happen
> that a rework on the C side may need adjustments on the Rust side etc.
> 
> The file is already under "COMMON CLK FRAMEWORK", so in this instance
> it seems fine.
> 
> Brian: in case you want it (but it wouldn't be needed!):
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> As Alexandre said, we may want to rework how these work (instead of
> panicking), but documenting helps for now (and whether this counts as
> a Fix or not is, I guess, up to what you usually do in your
> subsystem).
> 
> I hope that helps!

Sounds good, I'll pick this up.

Learning Rust is something that I want to start to do this coming
Winter. I have an existing userspace project that I'm going to convert
from python to rust.

Brian

