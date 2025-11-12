Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151E1C2E0
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 01:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762909471; cv=none; b=bfGK4tWG6qBGMvWjMJ4AP1PWKR6srpWz1u/mQ+m7Pq5Tyo1F60A+ZTh7cLffoZ5pFk0lmXET3tinO0usfsSJ2/n8VwFxaO4ezuK+W8rTBLQapO2Sw6nn0q8ufoq56rGJHKtHZ6C01SGcgIqWV3T/hivqYotw3zjPCuHx4RJcUGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762909471; c=relaxed/simple;
	bh=gmreDvm/ygJpAhqLTt3BBBC4Hi33XRQ+y2W8VqWsY6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2q2B9Ty1kHakVDu2azHKZI+ZsflIbwY69EA0k2jIQO6V7B3JcYuxGq1QTeiGISqDj8y/O+MAo6XN0WEFMhXKqaC7Y0WbRbOMm4jp/Ro4JasZwpZS7FKgaWhM2JYIqezQ2EUdivFmEk6m5ubftrXAtmL9Ilzk3WkoJliHSgORak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bku98F9B; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bku98F9B"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-882379c0b14so2530806d6.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 17:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762909469; x=1763514269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMeJ47XyyAuPii/bCH/ush9bSt0vwAZ+n4pv5mZbV8o=;
        b=bku98F9BMyUt3Q1eI/vZvSUI+Oz7tWYz5tgL35HfArCJxJWC4VAAmtNU+KdtlmyL+W
         yyWcRi+8FP1UKg7gc7Q5seG16+fzDxqDtIayFubY2L+dq5PSm3shmiBd6Z35q3yaJ8dR
         i0QMdUaxCXDk9nGRrQWP6bTY80SPfsACh5IC/3z0RKashJqlJStxoMAn2/fSnexIJzMR
         wcAR5wmU5tCIyTKXr9JWMGjI0SHKk4UdaxGmelT9Aw9GulCVyYHuhQCJdU2rtHgbdauk
         H03T6+5z/r1J2xFQ8xMW9VwIhZ/MidMu68TlxX1E6+9Ea6dYRUQqK7zXMoBagYACPk4H
         1/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762909469; x=1763514269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TMeJ47XyyAuPii/bCH/ush9bSt0vwAZ+n4pv5mZbV8o=;
        b=pN6F/5poBJo3wdYd5UzV+7SSlZkns3gXbPvTDowck+M5XTjpxzWlCCeNwk3Boo9oY/
         Eee4PC3Pg53hl8W3U0MArwBRjIU+qQ9ivTVapm+K8OyQUlf8+FMtaC9AD+sImWy0vRLB
         1SEKIu/G8Ss2Bg/35zbQrj2qy+UG56myTyrOTUR7MZ2a1+UNz39gKzJ8bS9yxfoPls0z
         USwH+kLH8UAm3j3TAoilPPm1gUS1fNuUkZuKUYbiwNliPxOUZbyUwn9lsvAkL3HvujfX
         x6ZWUzDVRf+c+ZkYqJQrShaMm+AbX6bLyd9F7rzmDZXKYc6muI9MZnNw6Swc7F/msZCk
         gv0w==
X-Forwarded-Encrypted: i=1; AJvYcCWMNQhpV6IfXKXay4Q55g6SIkyOAq4fiGYj3xa7pBlYazsQ/YRhc1ZRkVzHJZgCfdQvW4CAO0KBLSmvKpze8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz37H1od7JP4b9rLTuHw/O5sw47gbgueAb0Xtr3Ri3dhojcz0fK
	L2iBF7P8RWmMcmXhjk0ZdbhMt6FFx9mHCkW3R8WRO/PB6Nn/NUS9BwOO
X-Gm-Gg: ASbGncvnNqJmjRIJdfKx56I+NZCZlITTxse5nVi2wMTHBjdh0m2x6xUfQPqNIiZIT1T
	HrelmFww/z+qjBpkYUHBhMgzmiWvc6Qru4p+cvU/Uv7MxGfeZfRw+bVPrZ+VOR3W5OYOJFWHVIj
	v4NR5eOXWtIAwe5wkwRQoV2DYCnMu+G0yd/bClHMU1RKEN0s1FUOn9JFKcmdTS1cd2LK5c8U+gD
	2qOcJoAL2I0BnlcmT5Abwh2IE3iNiI6o6MhAGhrg0J7k82bU3EHOHpXrkXkwvH45hZVXsDwqadE
	HaK5Rg9tSxRKZw4b9fyVltyjF6ZuAyW1XqoSUvA/SdV4oQqslPN4mYbgqgSkBr/jqpuUqw+aEHX
	Ev8FCq4xzFv7WgcsDesjC04SDAhPOqMgqjZHH8Lj7HnENHY4V5VC/sfTCY8OQIwrlYtMRvi1PIS
	3D7UXN8UHANkPFwJQWNdmX8utsyzT4lgj4HEPnLaegnaA1ls8V5Ql79A87Nj8+GmYyNcCIKZUEt
	qVl
X-Google-Smtp-Source: AGHT+IFVLGQ00DIhtnQn29RM7sDdmbh+N+170EUuGjsId3fEMEeRlA2qqR7cvtkvrDFqT43ZjNY+vg==
X-Received: by 2002:a05:6214:c6b:b0:87f:fb1b:ef95 with SMTP id 6a1803df08f44-882718c34a7mr21362006d6.8.1762909468695;
        Tue, 11 Nov 2025 17:04:28 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda68fc2acsm75585241cf.26.2025.11.11.17.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 17:04:28 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id C2312F40068;
	Tue, 11 Nov 2025 20:04:27 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 11 Nov 2025 20:04:27 -0500
X-ME-Sender: <xms:G90TaY6LmU0cyknGmyJbL3PN7m-Mq4JEBUs2bCr8hr9lpq95Oz0Bhw>
    <xme:G90TaSEQHIvDsQvl-7QBqTXMeBTSMpdYkdngxUx_CTWuuzqJwbRqF_gfxBDF12zf4
    w-6YNBLH3fAgpDt0R6Cj_yh4-TZt_WOkxbuWZq3PIZvPJaMIaamcA>
X-ME-Received: <xmr:G90TaTBGV3f6WIz_alI3XnvLc3-onEMo71rgztKDq9CltepCyNTSZMQ8x3LXP5paAIhrAhVYPj9A5KtW3_e02ELBIP5z3V0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtddvjedtucetufdoteggodetrf
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
    htoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgv
    uggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:G90TaXyI8O_1wTJWXU9r12EnriAxlhhWFLSk8D4tN7ff3COUeAs2jw>
    <xmx:G90TaX7Ip5U_7NLEuf6OIFYJ29h5DJnVDoiRttFPpwESqMVO7b5q5w>
    <xmx:G90TaYxknoUHGO30Q2f7-Nv34O1Yg6s3SabmWfU68ciskWWzZcLwQA>
    <xmx:G90TabeyoRtXSbEPLFig47LJdnexnhymDBEArvEi1yUxqI0ViFfowg>
    <xmx:G90TadDsTjrg_IP5GN0G08GwwSBsgRf8pMxg4-AyvmlbvmQC7mTOuusE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 20:04:27 -0500 (EST)
Date: Tue, 11 Nov 2025 17:04:26 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
Message-ID: <aRPdGg01VDJucAfS@tardis.local>
References: <87ms4u6q1f.fsf@t14s.mail-host-address-is-not-set>
 <aRIN4U8L4-wQjyHj@tardis.local>
 <87jyzx6ix5.fsf@t14s.mail-host-address-is-not-set>
 <20251112.094508.554651669948369724.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112.094508.554651669948369724.fujita.tomonori@gmail.com>

On Wed, Nov 12, 2025 at 09:45:08AM +0900, FUJITA Tomonori wrote:
> On Tue, 11 Nov 2025 10:02:46 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
> 
> > Boqun Feng <boqun.feng@gmail.com> writes:
> > 
> >> On Mon, Nov 10, 2025 at 01:16:44PM +0100, Andreas Hindborg wrote:
> >>> Boqun Feng <boqun.feng@gmail.com> writes:
> >>> 
> >>> > On Thu, Nov 06, 2025 at 08:12:31AM +0900, FUJITA Tomonori wrote:
> >>> >> On Wed, 05 Nov 2025 21:59:06 +0100
> >>> >> Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >>> >> 
> >>> >> > "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> >>> >> > 
> >>> >> >> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
> >>> >> >> pr_*_once macros.
> >>> >> >>
> >>> >> >> A proposal for this feature was made in the past [1], but it didn't
> >>> >> >> reach consensus on the implementation and wasn't merged. After reading
> >>> >> >> the previous discussions, I implemented it using a different approach.
> >>> >> >>
> >>> >> >> In the previous proposal, a structure equivalent to std::sync::Once
> >>> >> >> was implemented to realize the DO_ONCE_LITE macro. The approach tried
> >>> >> >> to provide Once-like semantics by using two atomic values. As pointed
> >>> >> >> out in the previous review comments, I think this approach tries to
> >>> >> >> provide more functionality than needed, making it unnecessarily
> >>> >> >> complex. Also, because data structures in the .data..once section can
> >>> >> >> be cleared at any time (via debugfs clear_warn_once), an
> >>> >> >> implementation using two atomics wouldn't work correctly.
> >>> >> >>
> >>> >> >> Therefore, I decided to drop the idea of emulating Once and took a
> >>> >> >> minimal approach to implement DO_ONCE_LITE with only one atomic
> >>> >> >> variable. While it would be possible to implement the feature entirely
> >>> >> >> as a Rust macro, the functionality that can be implemented as regular
> >>> >> >> functions has been extracted and implemented as the OnceLite struct
> >>> >> >> for better code readability.
> >>> >> >>
> >>> >> >> Of course, unlike the previous proposal, this uses LKMM atomics.
> >>> >> > 
> >>> >> > Please consider if it makes sense to base this on `SetOnce`. It is in
> >>> >> > linux-next now, but was on list here [1].
> >>> >> 
> >>> >> Data placed in the .data..once section can be zero-cleared when a user
> >>> >> writes to debugfs clear_warn_once. In that case, would such data still
> >>> >> be considered a valid SetOnce value?
> >>> >> 
> >>> >
> >>> > It's still a valid value I believe. In term of data races, Rust and C
> >>> > have no difference, so if writing to debugfs could cause issues in Rust,
> >>> > it would cause issues in C as well.
> >>> 
> >>> @Tomo you are right, `SetOnce` would not work with someone (debugfs)
> >>> asynchronously modifying the state atomic variable. It requires
> >>> exclusive access while writing the contained value.
> >>> 
> >>
> >> I mean if we were to use `SetOnce` in pr_*_once(), we should just use
> >> `SetOnce<()>`, and the problem you mentioned doesn't exist in this case.
> > 
> > At the very least it would break the type invariants and assumptions of
> > the `SetOnce` type. There a race condition between `SetOnce::as_ref` and
> > `SetOnce::populate`. I don't think we are allowed to race like this,
> > even if the type is `()`?
> > 
> > At any rate if we do this, we should update the safety invariant of
> > `SetOnce` to state that it is valid to revert the type back to the
> > initial state for zero sized types that do not have a `Drop`
> > implementation.
> 
> I agree. I think that even if the type is (), a race condition would
> still occur if the init member were reset to zero using non-atomic
> operations. For instance, the as_ref() method effectively checks

I already explained this, the debugfs writes have to be treated as
per-byte atomic, otherwise it's data race, using "non-atomic" to
reference that won't be accurate.

> whether a value has been set, so for the () type, it would return
> either Ok(()) or None.
> 
> Although SetOnce is designed to atomically set a value, allowing the
> data to be modified by non-atomic operations at arbitrary times would,
> as I mentioned in another thread, unnecessarily complicate its
> implementation for a feature that would not be useful in other use
> cases.
> 
> Could the root cause of the issue be that OnceLite, which isn't
> updated atomically, is implemented using atomic operations?
> 
> It might be better to implement it with non-atomic operations, as in
> the C version, as that would make the update behavior clearer.
> 

No, that's introducing more problems and inheriting bad things from C.

I would say we can probably implement an OnceFlag type (similiar to
OnceLite but also support cmpxchg so that SetOnce::populate() can use)
and use it to implement SetOnce. Then you can avoid violating SetOnce's
type invariants that Andreas mentioned.

Regards,
Boqun

> What do you think?
> 
