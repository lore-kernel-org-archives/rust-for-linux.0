Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A92C1B3B19
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 23:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765407744; cv=none; b=EAZFtbs4rJrFTDss/MXRzYYWi0HDKxRcktMaUs4mpXQSpJ9QBvuoMliLUls2R3kUv/3gN+fMtBAQzI99vq7egDDw2+GJSImHNi9V9UV0aOGS6mMoLjikku/BuutMWB+l52UedS9M5nTyV5Q7i7cZw3/rnHMJDgD2x32ufcls9OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765407744; c=relaxed/simple;
	bh=TMsOg0EFR+UD64BBXz5fs9hL3fa0Q7npqIA+cjm8z8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdMTR8F6UpGnPP7U9ciXsbyfdSqYL0JbrsWYqfmbYhnE1Lc4HRLcAAjQwrh84pQ2p/OgO7o/Cb5/YfkN3u0jBJoiLq2IXY/P9FIPjlTzD54sFPkjgRPsh6lF4GY1mY/MM8WoX0KoLXqTm8Hv5LHQONfbsqlIqBIgiVwmwyPadhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ls+BNl+c; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ls+BNl+c"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b2ec756de0so42749685a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 15:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765407740; x=1766012540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUoBBL2VOn+YOW5vsEXLFDa2rH2hmmbgJMn0OL7Moac=;
        b=ls+BNl+cwKGV8DEzSnh3DA2/ZTBUB5JcVC76EM3txqgQftKlJCeCKrrZhoXkNAvwlY
         A/ObH5NlUG97uzWYcYJMusGUSP2k/r49y2aeCHtzNFCtAKB46PYPWO7TZa96ZQUqD2bC
         8KxNygxlCbGniBW838uThKP60fUJIXTP2CxUT13wS+I48ywwC5mpJZqgF4QpNQ3wrB3k
         jhmaEv3u4Km1rzoucbvceotk/hJfvdaM+3Gl4Z7/CJepza3PxEpp6OpiVOYRG0Cad2M1
         vb0xvDuWFile5I7SO3KUSDe9xo51yl8Z0bmGKuiOLABgELtoLQlK3YZWzUD29ABdvmc2
         q8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765407740; x=1766012540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JUoBBL2VOn+YOW5vsEXLFDa2rH2hmmbgJMn0OL7Moac=;
        b=Hx7ftN6jjntWx9qo1N4KX8yFlFAVH0JJGXgOuhp4daNlSwslO0B1EqWpbLvMiINVgk
         DezpBePPNeNl5p5OKUvQwra74P4r7b4rtEYVJ37tTAePta75eCVMsw/sIo6ZKtrFssMi
         WYQvQeX25rIQb68qYYzL68gKgSqY2SVsWj/ftFa9UawMrOQE5rVY53E+B1A1SlN6Jgp+
         TngMm61FTIXQOmYs/yM3PXX9qo5ATGl2sphUKJREZKZE23I1L+EhAK5Sh8TrIyk1m3W/
         OK1DNRDxpAhzeDdhJWb8qhfmOdczWl1dFhS+TtiUbAg5s/vbeRQuvOrbjdSLqnnCKBiI
         OPmw==
X-Forwarded-Encrypted: i=1; AJvYcCXuGnpWE00Dfbmk/VpX2v1dq6/78/gCGkJV/c+79bOD3QM/fwuMAY97MqikmL1W3LvhnAHEL4iKPV5WZaUXxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGLXY99dRsoLWBDz8do0QX68Cz0UFY3pSs6XrKbP7xYlwaEbtZ
	GGz1ujLp1y6ODkEhKbeLfmTJ0P9O57wVA7IiLx7XeZEuiXG1F+EzIve4
X-Gm-Gg: ASbGncuZH3x/Sv+JEt+mrJy+0bMaWIYi/lR712Xvojxvk+K0+AgXS05F6CX3X0O235G
	hQI6pBBVrXoszImsG5IbV9FQY1dtYADEtZP60w1Jcrx3LlZV0/uopuqcBplHmCEL27zO0JYVLkV
	+yYqf7fcy7QaBttKDS+tP4iEw56G1z9lnmM889HCm67zO74xW84UoyUyUMIPm9ZPVQcZX1ix8ho
	m/Kh1dIkl2cGRWgGXW/LMc/s6wExYqD2S9OcUqOpt5JhyJINdGWseo9CpKtidC8LFQWBsJRxdy9
	ols5S+YYyZ8CdZzHRfl8eehAM/l+koC/pXbg6j0Jvxla1ilMgo0IPHi12Oan3kPX+dxM6Ne2zXl
	ZSxklp2qlt9BcFVbbNUGLYvicIlmdCOR/aFL40F/bmZa9OZIqX/9vEvkFthBtlIDm2Qg3ySbONJ
	/DoiQhod6ma1Dh/5XL0SguXLuGGYCPPGcliEI3y5X3OdYaNpXUYNf4Q1ioby9KvuZDTT6jNp50f
	oGTt7LOofcF37c=
X-Google-Smtp-Source: AGHT+IEAjeKNPJryWjUXIduq40MIuE9hd1XIAFGK8m6EVj0DpXi5MjAo3OdKcsWzjzpX2CVIIeEaWw==
X-Received: by 2002:a05:620a:280c:b0:8b2:eaf3:5cd8 with SMTP id af79cd13be357-8ba39357ebemr627394585a.29.1765407740132;
        Wed, 10 Dec 2025 15:02:20 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5453001sm69285185a.11.2025.12.10.15.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 15:02:19 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id E2D88F4006D;
	Wed, 10 Dec 2025 18:02:18 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 10 Dec 2025 18:02:18 -0500
X-ME-Sender: <xms:-vs5aaiNJ6m71ipyIM2anMFX3zmB-ZYk4SECAtlX_88Xm-PHXpkPsg>
    <xme:-vs5abezpgnWtCWllhx3wOlGcMzZMRYu6jlm36FvWB-tGfExaGkSv7ArLg9es9q99
    ryELWFkm2DkzpfnRZhRFZVOLKWL5rtx_yiJrSYsrg3CYgdasIwuZtk>
X-ME-Received: <xmr:-vs5aR1fCKFFWIXN5YSOMnuks_r0aFaHbYcLnl9tJl2p-Ps8SbXR7Hq5tO3oLKCTcrKZYm7I13UkzzFPQo-gbSnVrn1_uDtM2XM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeejtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtth
    hopegrtghouhhrsghothesnhhvihguihgrrdgtohhmpdhrtghpthhtoheprghlvgigrdhg
    rgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusg
    horhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohho
    ghhlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilh
    drtghomh
X-ME-Proxy: <xmx:-vs5afpcUkGgvhKcpfbmxPCkx1cK4Ob1qY0uyQz9DzvQRz6nlbWVKQ>
    <xmx:-vs5aRg9vWxOnZJIs58dUQOwI3Anip40UtT9hjL597PMoDb-_AMHew>
    <xmx:-vs5abnySScZ92JpHa_U6v0I-aq6XR59o-8floXSjUvJvS8qKPB7nA>
    <xmx:-vs5aaoWbG8IUF4AKSCKaj1H84BcQ6ML1P1NH5SzJsdkDl2OJInqMA>
    <xmx:-vs5aXKgoL2Ct8_cvpDUicYIM85kV1XTRbFu7E5KU0nsF1Lgsb9xKx9P>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Dec 2025 18:02:18 -0500 (EST)
Date: Thu, 11 Dec 2025 08:02:15 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: acourbot@nvidia.com, alex.gaynor@gmail.com, ojeda@kernel.org,
	peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v2 3/4] rust: sync: atomic: Add i8/i16 load and store
 support
Message-ID: <aTn794JgkRrwGpzm@tardis-2.local>
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
 <20251117001035.4068507-4-fujita.tomonori@gmail.com>
 <DESI62R10XIZ.245BISU72Z2V8@nvidia.com>
 <20251209.081456.1519886345847572170.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209.081456.1519886345847572170.fujita.tomonori@gmail.com>

On Tue, Dec 09, 2025 at 08:14:56AM +0900, FUJITA Tomonori wrote:
> On Mon, 08 Dec 2025 12:08:23 +0900
> "Alexandre Courbot" <acourbot@nvidia.com> wrote:
> 
> > On Mon Nov 17, 2025 at 9:10 AM JST, FUJITA Tomonori wrote:
> >> Add atomic operation support for i8 and i16 types using volatile
> >> read/write and smp_load_acquire/smp_store_release helpers.
> >>
> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >> ---
> >>  rust/kernel/sync/atomic/internal.rs  | 48 ++++++++++++++++++++++++++++
> >>  rust/kernel/sync/atomic/predefine.rs | 14 +++++++-
> >>  2 files changed, 61 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
> >> index 6fdd8e59f45b..4c9f4f76dbdf 100644
> >> --- a/rust/kernel/sync/atomic/internal.rs
> >> +++ b/rust/kernel/sync/atomic/internal.rs
> >> @@ -263,3 +263,51 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) ->
> >>          }
> >>      }
> >>  );
> >> +
> >> +impl private::Sealed for i8 {}
> >> +impl private::Sealed for i16 {}
> >> +
> >> +impl AtomicImpl for i8 {
> >> +    type Delta = Self;
> >> +}
> >> +
> >> +impl AtomicImpl for i16 {
> >> +    type Delta = Self;
> >> +}
> > 
> > I'd suggest putting these next to the impls for `i32` and `i64`, for clarity.
> 
> I'm fine with either. Boqun, what do you think?
> 

I think we should put them together.

> The reason I didn't put i8/i16 next to i32/i64 is that I assume that
> i8/i16 won't support all the methods supported by i32/i64. I thought
> keeping them separate would make that distinction clearer.
> 

Even if that's true, it still make sense to put the impl blocks with
i32 and i64.

Regards,
Boqun
