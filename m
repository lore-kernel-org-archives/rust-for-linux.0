Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656F526F46E
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 01:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762911035; cv=none; b=MjIi/HEEq9zSh5EEsKnuM/dPUNGGaY10LktaUOlnIsSTlVodCobTX+vsN78DnUKfd097rnCZFN0pzLouL+Fdu+8xhEIEmQZ30RjWbtP8JPB//hQKCIoOZHa1qeqBz5hp6OT63RRQgHgqcW4+qRxdnrLHljT8bDZ9+A9B8MLtYuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762911035; c=relaxed/simple;
	bh=kyD2wP832MV1bQnoh3LJA26134TS8bDYwQ6SneT3LCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kT1A+g8PvLwETm5jF+puUrIqFM7Cv5dLRj71cW60t744lk+LdzUjZkCtFqRmdG8VORrGOvIcGRbMPzamzD7d/K9XR6EH/mvKIOQPrQO/K1VbSlg0CgrZ1ktCN1inGVC+t1qyj8fk9Cdb8E8R/7mkXAFEoEdqkrslHMaRTF0HlMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLbz2Sux; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLbz2Sux"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4edb6e678ddso4133381cf.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 17:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762911032; x=1763515832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTzkeBzW34W3UqkE4DbsF2FzXlWOjU/t4tHSEm0wJfo=;
        b=PLbz2Suxu3Uisn++a8xH6zF8KjkU/lptEu5XjM8YtqJrL2hG3kjRpEdV/I/Om6Y7sF
         atXR//36GipLOBREPgts7JMHQxF+9/Cvj1ASBAnMt+JNCQU3W6Mr1Ky7i1JAFaEBUBUE
         AsT/daQNYMD4s/lA2DfO48XiFZw37k64Uk36vzqv+TJRufzi09UJCeYrcLsD5QkIQ1Jn
         GN63iCcEJ/rE+0qV9mYe/BexpmzvSJ0vWAEcuKgqAc2g6uEkE+NBu2B+zmqsZGCA0F/h
         Ke/EMBJ0k4kYCt4Dcd6iZoPN2laKENj484kH80l1ndQ0IQgfWBPRtiiTfoQcdgwQyvuA
         okbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762911032; x=1763515832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bTzkeBzW34W3UqkE4DbsF2FzXlWOjU/t4tHSEm0wJfo=;
        b=IoPtr83i1nye0i8r+8VFb7mmxveHVuwttwi0qx8xgTeSEe5By8JqgbziDFh+nAoWlP
         oGd/k8lgwO1Sdi17/k9BYIMDeb6ec4MOmnHcwEMqIJgNUMWTJlO+liQ2i2lsctVI8MOp
         jcvEpWN6rjpDnAKegvkTC+KxZPJzVbiG63MHqr9ZdPm5vM2pb9YiYjtFWlGLacyL+VAc
         0+fDg1B1o/pNYUdzK3iH5ioDS4y8m0gbM22fumQ7+NTpcZlLtlpysA+x5SCm4DMdlpGx
         dUAdlyzSj+jnE1/Qp25aP3JgWQcBNStmZr0c8dtvWGrwve07vSOE9AeDoNd/ZOWfL64P
         /RTw==
X-Forwarded-Encrypted: i=1; AJvYcCX4yMtn+G5iq5/9PE74gibe39Kv8rJKd6iP7nrU3xJqS9812cSYoTLV1Unn2ZAMx5hSqVocoPRfSgbEmieNKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR+dn600HBGDGk7Pc8iri5KSS5Lzd5mW06+pHfqyZbamuXpzgw
	4dzgF2NFn4o34QaDp8a8LKGV7mOXK18Zo5dMQ1XD3iUfdolXGxDJAa/q
X-Gm-Gg: ASbGnctijgogwTfrlcuQ8C49hAALbSKHZRG10Pg2Pz8SjRBJJV0eH4mP0CAIVPxAsZX
	vErk7Bcdhvm4qn1lME9rlGozos72wW5U3lOM0sgDn02TWhuc5DZ5R5UmV8D7PfTbwNhRbboOf2Q
	DgiIRvvF+LDC67YsviNfx9JbPSxZRVARvTTbE40pUzwCD2ilNOUZY43ZR1gA22knCKGoiJkt3bq
	EPT3Xu2nVuOqSoVQtBCBrXoUIo7GqIEoNo2pkXrHyydOWkFOSYyT7bX0uknzK7ppjLw+tMTndB7
	e8hyb9fI0xZvQZad9kdRsSzeo2LbNSsjwibEXsMyhvvDDA209t6+uXEhh3lkVamqW7KEKiIrzmq
	LIlJ5ke5tVo594ECVJlNwI+YUiT7ok0A6dIjhraE9o1ofHUovp+KqV7c/TeVxZV165JvS4CZ2ec
	sPvbqCpWrUi1/gkmHRZDsjFyhnbT9g2Jeec7U6vmz3Zuw/z6Y+lQJtUDuYmM2Jtd1kaXDSjpO6I
	RM/
X-Google-Smtp-Source: AGHT+IHAMvhmGpkoy+dwFH7SGtll5KNb0toeiELlAPqV3FygN1kqtqZqnreEqfCCrA98wjZkNomIMQ==
X-Received: by 2002:ac8:5889:0:b0:4ed:d7ec:854f with SMTP id d75a77b69052e-4eddbd761bamr18759041cf.48.1762911032137;
        Tue, 11 Nov 2025 17:30:32 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29a84b0d1sm94173885a.9.2025.11.11.17.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 17:30:31 -0800 (PST)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 158A0F4006A;
	Tue, 11 Nov 2025 20:30:31 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 11 Nov 2025 20:30:31 -0500
X-ME-Sender: <xms:NuMTaS9UGZlrZ_mGP2XTY7MybX76LK55epQlN_oqy49-zhBdJbwfWw>
    <xme:NuMTaa4iMRHfsJTO9jxS8-D2vYR-JWZdBSnpbv-vWPvRfa_sGN7kuP6P9x6Ii3-GZ
    RbLBwdq4D3vXMB2c2mGKsIk2Q14iJgnU2K5mnMt519UE6ol9w_0Ajg>
X-ME-Received: <xmr:NuMTaTna9twfZBkvHCaObWd-e2bsgfHT47ui9xdwFVL570T2DmVS-VzPkqlPkq3oMLby9vOnoGHOxqbTN7uu54rHtKKiYi97>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtddvjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhi
    tggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:NuMTaVGmLtoK3G71bO1uKydB3PmmoH2hvDAHBPIlu23H-NI_cbRZ1g>
    <xmx:NuMTaS_aQ1flAgKtbBdR05IhpXdo6Qw79DwxJQcE88HXMz5op0yptw>
    <xmx:NuMTaenyIvrugD_Tnu9kuu1-U8mE60hdk82nbh7AQOmAITI-08nU-w>
    <xmx:NuMTaVDetbNeKweHNEIISfz6iRMAhHajHSAwe_z2YEndgHsaCqbfyA>
    <xmx:N-MTafXyHPm16q3P5OzzJJ9Ohjfw4gRqeazPz5MCs1aBKuBv64KQhX7w>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 20:30:30 -0500 (EST)
Date: Tue, 11 Nov 2025 17:30:29 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, aliceryhl@google.com, ojeda@kernel.org,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly
 once
Message-ID: <aRPjNS9jIsyHGAPl@tardis.local>
References: <aRIPgOPvi4uhGQcM@tardis.local>
 <20251111.120949.1793896304189618185.fujita.tomonori@gmail.com>
 <aRLG1Ofr5QpJGFaB@tardis.local>
 <20251112.064349.598094996228184902.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112.064349.598094996228184902.fujita.tomonori@gmail.com>

On Wed, Nov 12, 2025 at 06:43:49AM +0900, FUJITA Tomonori wrote:
> On Mon, 10 Nov 2025 21:17:08 -0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > On Tue, Nov 11, 2025 at 12:09:49PM +0900, FUJITA Tomonori wrote:
> >> On Mon, 10 Nov 2025 08:14:56 -0800
> >> Boqun Feng <boqun.feng@gmail.com> wrote:
> >> 
> >> > On Mon, Nov 10, 2025 at 06:21:50PM +0900, FUJITA Tomonori wrote:
> >> >> On Fri, 7 Nov 2025 09:03:01 +0000
> >> >> Alice Ryhl <aliceryhl@google.com> wrote:
> >> >> 
> >> >> >> That's my point (and probably also Andreas' point), we already has the
> >> >> >> type `SetOnce` to do this, no need for a `OnceLite` type if not
> >> >> >> necessary, and the fact that it can be zero'd by debugfs doesn't change
> >> >> >> it as I explained above.
> >> >> > 
> >> >> > The SetOnce type doesn't do the same thing as OnceLite. SetOnce has
> >> >> > three different states, but OnceLite only needs two. I don't think we
> >> >> > should be reusing SetOnce here.
> >> > 
> >> > I mean 3 states should cover 2 states, right? In this case we only need
> >> > to support SetOnce<()>, so I think it's fine, see below:
> >> 
> >> Yeah, that would remove access to the value member, but I think that
> >> init member could still be accessed in an unintended way.
> >> 
> > 
> > What an unintended way you mean? Do you have an example?
> 
> From my understanding, the init member of SetOnce is designed to be
> accessed by using atomic operations, only through its methods. If we
> use SetOnce for OnceLite, however, the init member would be written
> using non-atomic operations, which is what I referred to as the
> "unintended way" since I don't believe Andreas intended it to be
> modified in that manner; i.e., not through its methods or by
> non-atomic operations.
> 

Ok, the "non-atomic operations" seems to be a distraction for me to see
the real problem ;-) Let's clear things out a bit.

First of all, data races are not allowed in kernel, but kernel has
special rules about data races, namely, a few operation should be
treated as "per-byte atomics" so that they will have defined behaviors.
This is kinda a gray area, but it's what it is.

Now for Rust, we shouldn't do what C code did previously that so atomics
have to be used in OnceLite, but when interacting with C, we can still
use the special rule of data races in kernel for reasoning, so the
"non-atomic operations" part in your argument shouldn't affect the
validity of OnceLite or SetOnce.

What I was missing, and I think you were pointing it correctly is that
SetOnce's internal logic doesn't handle a concurrent write to zero, even
if no "non-atomic operations" issue, this still breaks the
synchronization of SetOnce. It's like adding a invalidate() function for
SetOnce, that could invalidate the SetOnce at any time.

So yes, SetOnce may not be a good fit for OnceLite, but still OnceLite
should be in kernel::sync.

Hope I make it clear. Thanks!

Regards,
Boqun

> As I wrote before, in this particular case, I think that it would
> still work even if both atomic and non-atomic operations access the
> same variable though.
> 
> 
[..]
