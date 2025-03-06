Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C4D36D
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Mar 2025 06:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741240878; cv=none; b=SmUEhOmyBWgZC2JkL/hz6V4K7yuui4mqwY/2cd50YK8U17Ziie0lcT4GyBd9nghX+agR3bximHt0VuZycgSJtvsvRw465ruCskERvrtRVgjWlGTCa2RaWQY3FntUWGKzAnYan7ulp//88xV3/RdKEQnIqE21pWBJJK7zqti2KFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741240878; c=relaxed/simple;
	bh=x79uJhntOy6x6YdydKD8p7xjaTIr5/tLuTPB+tqJh4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hs44aieljmnu5RGhYwd4sIV2450txrBpkqEsRVQutmiA/MSObADPpS/S3XoefMP9PSZ4/PY1eeLSjVu8EXTUvBru2sGiSgtmVOm8TApag87lVRK5NrO6EaKok/CP+kBWZPMmCzihwRLSq61hBP2jMx2/Y0eVVH+uGVjSBYr7frY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUJSgg2C; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUJSgg2C"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c3b44dabe0so31755985a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 22:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741240874; x=1741845674; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hGBXa8fjwAPpu5VkbQs75cxJYgpUBF8TofVM2cHD1L4=;
        b=cUJSgg2CeNA8jSg90sEz/MPPnEnoFRyiyjS0X/2iAWjK5Cx/po6QkGBkzkcDQVtS3M
         l2EtB55fwPS2/JxktxXCa8qFrxgRA/OZoz0IsNX5FiRMuVgBUcOtTVF16V5rdD61w91Q
         gpv6RRbrghq8jN/wIv9FBKKbqqXiIt2xqnvG2eBmjNuqussTZ+7c8NIajZHHOisqGbUg
         VPvvvzqfPuTP9MBlEYL/k9RoV6gtgs5FAJQLLBB6ggwQ1GXQT9pB641LmZmyveV3qjL1
         CktvuCPhbnnoEguURbeFvJWvDEq+FAjYAHlcQqCtKb21jyYVALUdZPU5U/5mMbELBJ7E
         FNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741240874; x=1741845674;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGBXa8fjwAPpu5VkbQs75cxJYgpUBF8TofVM2cHD1L4=;
        b=N68XEyEp3HCepfKIy1uBfunBum1D4CbtJz0G7+GfcT5akHJlJuQfWgp1xKgM1MgU2L
         an5gVlSE92bn46wDv6Q3ZWRqzK1WKViXjVYIOOGXwDzUmgIiVgVwZumUFX+GpWyVUqEE
         gA+CG6OliytLTHgXkmLwQGdKtmX9Dfi4NdN3dPgKZBY/51xpNR1rqk81zURUpjAM6Hhl
         ZJrc/uGnePHVCZskE7zgcLqMhrIVXX0PgGEeomTd/mVkfVY4IAKTdLTcrBIUDqANsQzR
         sc+NweoLqtJ1NtZpiZ6pZPcVT007tc8/MlY0lOQt1mnuQ0mzEaVu8ifBMPbG8OiUNIfp
         jHWg==
X-Forwarded-Encrypted: i=1; AJvYcCVWpsSqeB0/BzkQZ9zcsm3oPxlCJP4HESrkZWO/I48sLVjj/JzpsJ7JzxOqjSYJdrNOvAqknrb0G8neLkEzKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfvWMWCiX4DJZUtY/rPCQzqWo4T7R+ns6YnWn6XlDd2mCLwKWJ
	w45m1MElgyu6blOl/XGpCp/bN9GfzuhpBkL66g+tjc1Gdpopy1Tv
X-Gm-Gg: ASbGncvD7zQw00GpE4oWEtBREMm90g5Y73D6qj/DciRO53Uk6YWfAPesmklZh/JG/jT
	5Q2hRcRTkSite3KXlEBXHFv/xF6QqcMvRD3aInWOaieZ8l2bEIDHdari29GFOavJHdNrUTIXrrq
	4pVQEMLkU3b9ONurzOMZDeyjY1xLaRfLgGwH10Wg1DxTOCCOYAjcD+Dh48aTtiqsoSaQvtubbLp
	GOI3BIIv1hzLgTV7QL2LzBf1eag49q0NVQwTlte33TNFpcHJNsPYwaQKAzwD8U9+9jwxWXlv2hh
	SZHwFOQTMds02g91GxR4BSeHZw9zWVCCa3ZTzzOj9gvawF+2ddS5uFZLsbSy/HF09j94kRnLHCR
	H2x0tF2BZF1ZFTFKXZaFBX9hm42m9IkN4Q28=
X-Google-Smtp-Source: AGHT+IGMZORoxpPptESEUeQ5BahQYOG0jN/KQlVlmEhIYEuw7t2Rysir6gZ3ulnAp+ddHN/5jRtqwA==
X-Received: by 2002:a05:620a:6019:b0:7c3:c8f6:59bd with SMTP id af79cd13be357-7c3d8ef3062mr1227778785a.54.1741240874464;
        Wed, 05 Mar 2025 22:01:14 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e54ff7a5sm46778485a.82.2025.03.05.22.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 22:01:13 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 764EB120006C;
	Thu,  6 Mar 2025 01:01:13 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 06 Mar 2025 01:01:13 -0500
X-ME-Sender: <xms:KTrJZ3mYgaXEYCbHwxF30QBecPdaMHmd42UTLRzW6S6YCwCq9RzO6w>
    <xme:KTrJZ629rKwGSwGElaKe9sTAeCwZ1c-wKcewInZd6xCMi9QSmPbQu6ykhvd_EJJFT
    uV6ZP24ptIdLO9Q9A>
X-ME-Received: <xmr:KTrJZ9qI0pC3gceQ5pwvgHmMh_qkP4arxG9PGmSJ7HV2EuQzQO7NhgGonw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdeileeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgu
    rhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeeuohhquhhnuc
    fhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthht
    vghrnhepveeiheefvdefgfduheetfeetfeduheeuueeiueetveejteevvdfgfeelvdektd
    eknecuffhomhgrihhnpehgihhthhhusgdrihhonecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrh
    hsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgv
    nhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhope
    elpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepughirhhkrdgsvghhmhgvseguvgdrsghoshgthh
    drtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegurghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgt
    phhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrlhhitggvrh
    ihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghh
    rdgvughupdhrtghpthhtohepsghoqhhunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:KTrJZ_mMc0rX8N_E_dtJPXz_ljdFVdJv5MAWFX7NQif3Qk5YWw8VBw>
    <xmx:KTrJZ12AqqO5U92hYGEtMlCEMU0LUQ7dovVlNMJxwLONbWl_JQAtoA>
    <xmx:KTrJZ-vRjlt3OVLSD9P-dOpagfqImPM1JPoNGhrIXdX4tIste7_HVg>
    <xmx:KTrJZ5UUqg2Xp8QtLnklC0Yat8e2sadQpy_1i0cxMpjqq5SD_s5Taw>
    <xmx:KTrJZ01u9dfxhPl13W-miRYpZuspDIiIiNKHQPu8DjZQE5VKByioF4kc>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Mar 2025 01:01:12 -0500 (EST)
Date: Wed, 5 Mar 2025 22:01:11 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org, daniel.almeida@collabora.com,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor
 description
Message-ID: <Z8k6J-rLXUp9y-o1@tardis>
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
 <hVvs4-cEyMjFMKMMqergIA4OCAIJUIfXQGi2a_uisGZaLJHUWiNtGPNASjjeprDQrtNtasMOfTrRIiYwXE2zgg==@protonmail.internalid>
 <20250305053438.1532397-2-dirk.behme@de.bosch.com>
 <871pvbhqap.fsf@kernel.org>
 <eGDvv6uA00fjuGAgV8uknZos4J9VcrxQ7lk9brRpmdGEGIHYZlxk-ZRsGxXsr-SCZE6IVEuPKs5ko9gukJwo7Q==@protonmail.internalid>
 <Z8hwGGn9huDjyDWN@tardis>
 <87v7sn759g.fsf@kernel.org>
 <n0Uj2Z9c_20rMgNGkpHAbJ2IQS5ueeREBy6NHdwpCp8vg9V5JrRPJbP3xBFssuyDTcN1JUulMK3cwwDu0U0fkQ==@protonmail.internalid>
 <Z8icwtIpZ3PO9YcZ@boqun-archlinux>
 <87zfhz5gq2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87zfhz5gq2.fsf@kernel.org>

On Wed, Mar 05, 2025 at 10:07:33PM +0100, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
>=20
[...]
> >> >> >  rust/kernel/types.rs | 26 +++++++++++++++++++++-----
> >> >> >  1 file changed, 21 insertions(+), 5 deletions(-)
> >> >> >
> >> >> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> >> >> > index af30e9c0ebccb..f370cdb48a648 100644
> >> >> > --- a/rust/kernel/types.rs
> >> >> > +++ b/rust/kernel/types.rs
> >> >> > @@ -271,17 +271,33 @@ fn drop(&mut self) {
> >> >> >
> >> >> >  /// Stores an opaque value.
> >> >> >  ///
> >> >> > -/// [`Opaque<T>`] is meant to be used with FFI objects that are =
never interpreted by Rust code.
> >> >> > +/// [`Opaque<T>`] opts out of the following Rust language invari=
ants for the contained `T`
> >> >> > +/// by using [`UnsafeCell`]:
> >> >> >  ///
> >> >> > -/// It is used to wrap structs from the C side, like for example=
 `Opaque<bindings::mutex>`.
> >> >> > -/// It gets rid of all the usual assumptions that Rust has for a=
 value:
> >> >> > +/// * Initialization invariant - the contained value is allowed =
to be uninitialized and
> >> >> > +///   contain invalid bit patterns.
> >> >> > +/// * Immutability invariant - [`Opaque<T>`] allows interior mut=
ability.
> >> >> > +/// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of sh=
ared references.
> >> >>
> >> >> This last one is wrong (I know it's probably my fault, sorry). It s=
hould be:
> >> >>
> >> >>   /// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **e=
xclusive** references.
> >> >>
> >> >
> >> > Hmm... are we trying to say "`&mut Opaque<T>` still cannot mean
> >> > noalias" here? If so I feel the wording might be confusing. I would
> >> > suggest we don't use "uniqueness" here. Maybe something like:
> >> >
> >> > * Always aliased invariant - `&mut` [`Opaque<T>`] is not necessarily=
 a
> >> >   unique pointer, and thus the compiler cannot just make aliasing
> >> >   assumptions.
> >> >
> >> > (I use the wording from UnsafePinned[1], maybe there could be better
> >> > wording)
> >> >
> >> > [1]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#summary
> >>
> >> I like my wording better. It says the same with fewer words, and we ha=
ve
> >> a more wordy section below anyway. We could combine:
> >>
> >>  * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusive=
**
> >>    references. That is, `&mut` [`Opaque<T>`] is not necessarily a uniq=
ue
> >>    pointer.
> >>
> >>
> >> How is that?
> >>
> >
> > I think my biggest problem is the word "allows", the phrase "allows
> > aliasing" sounds like Opaque<T> provide something *optional*, however,
> > as I understand it, Opaque<T> here just disallows certain optimization
> > from compiler, in other words, programmers want to use `Opaque<T>` to
> > forbid something, hence "allows" may not be the good word to use here?
> >
> > How about:
> >
> >   * Uniqueness invariant - [`Opaque<T>`] disallow alias assumptions
> >     made by compiler on an *exclusive* references.
>=20
> I don't object, but I feel like we should be able to define this within
> the context of the Rust language, without going into details about
> compiler internals.
>=20
> Without `Opaque` it is illegal to have aliased `&mut T`. With `Opaque`,
> it is legal to have aliased `&mut Opaque<T>`. Or at least that is my
> understanding.
>=20

Oh, I see. That's why you used "allows", however, allow me to explain
why it looks confusing to me. For `&mut T`, we can still have an
aliasing pointer (a pointer that points to the same variable as the
mutable reference):

	let mut x =3D ...;

	let mut_ref =3D &mut x;
	let aliased_ptr =3D mut_ref as *mut _;

it's just that if we dereference the pointer while the `&mut T` exists,
it's UB, e.g.

	unsafe { *aliased_ptr =3D ... };

and `Opaque<T>` allows above to be not a UB (there still are rules like
we cannot have data races, violating these rules would still be UB).

So to me "aliasing" can mean "having an aliasing pointer", and that as
shown above can be provided by both non-Opaque and Opaque cases. I
wonder whether "allow aliased/aliasing accesses" is better than "allow
aliasing" here.

Regards,
Boqun

>=20
> Best regards,
> Andreas Hindborg
>=20
>=20
