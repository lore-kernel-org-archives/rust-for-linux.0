Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FDC329E7C
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 06:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769494379; cv=none; b=GBlSdczqTgxhhugb8VemTE2d1itcaJiNNQPJd54zXfedl1Q48qf6TW9mE+Pa3Qn8gOIiHDsxOkk1GsdHXCFYUnM/E6QVkkL45m2tAfziqZMazfWbAtoSoocHPE7C4MJ7PIlAmL+zMVeF4qgetDFFZyuVMq2FyvLRjkJfi5mSeuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769494379; c=relaxed/simple;
	bh=faBTxwheqDYhGgIPPZR/ojVMrc5NG1nJKa4gZh/WM2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njT0ZVQrDYA1vzjsJYubUDWYwDyDtTdC0mtblUdJkwX0Yz8quzWerV+uTIxYYas3Qx/f39sVCcS7dkhS2DABNV1q5VjKFagHaTVCBLrE0KaNInUCtLK0EMETU47uJuBZLRfL35oj24f/firteFpIrekLsZpuwJsEtfQH2h+pmS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5nuyZz9; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5nuyZz9"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c5320536bfso614772885a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 22:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769494377; x=1770099177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5SJ+Y+KeIDnRSFr4o+HXdV3wlx5jhTuPc2Q5JNeDX4=;
        b=f5nuyZz9yb61KunfufBgCSeSYvyOubuPeALxHtJj+TRTB1Fp7pV2E0DTKsBw0I5Z0C
         wrmKYStX7Yj6KlLzEvj7lV21BvXVNTdLHidpmkIeHSSSlDhubeidzuKWWT55BgKqzOOK
         Uthy1S7kNoDfIkdQw8YI8vaaiicBl4vlvkGURmM/dj/vBUSIq37LKp6S1cEHZqIUoyZ3
         qn4HA9LKDVcEQsC27HlV6o5jckV+oIOVokmL1H5InLqqHpopLN0plT8sKUFrSX9AYBWB
         DOR5b0I2PzdudpSG0qOt/tVEWkaNZNyVU81jryKn/nn49qtEyD9dkkgH54ph1KsEeIbP
         Xkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769494377; x=1770099177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z5SJ+Y+KeIDnRSFr4o+HXdV3wlx5jhTuPc2Q5JNeDX4=;
        b=gqCgGMFcI7i6RF4lSt6+a4f08AKg2F9LxzgNSuW53wqijpikV06mxgk2iJ1E8j7qW/
         wXBHVn6dWq5T6z4XronRiH9sOSML3sFjdduDD8p0CRz0BnA8C3F0b7JF89Avmte+5TQ+
         UzmdWrQ/r6gtNOONJ1z2sxWHTOfD208b7pE75p4xyh6V6l9SjLHH78OMB4jvJgoABNQT
         yhUlxyfkGvsjiDc2QwICAswySSQ3t0Kk9yNbr2sZLrF4LeqeVfFejvebbw/gO/beoqC4
         pKSTaeOi9yibVXuZbfdeVgW9H/lNWCbSkcxrheonEkidrRHaMxEDegMhe8H1a/pJZul6
         WMEA==
X-Forwarded-Encrypted: i=1; AJvYcCU9mHZYJAeoT7geB98+VO/g2KgcfYvFlNs0yx5IgwBJDlsta8d0zXUqcHN7jRQtVUeztlMz5h8OC/k3mWM75g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLa43JsHPGIGa3EAURLIUVScJmuH2NXdnOcUpdHU1zZKtwA6Ki
	EW47B9brkz+0M8uAnfMOCGZwwai29U4bavBt/RT3HinDs0H9dDjtqCPx
X-Gm-Gg: AZuq6aJCjYy7+COu0OTNfjFbZhBARTjV9I1U4iDrUyPbCJ8Kla+eqtTfSmQshWd50xF
	qCeyVoJQRv/y+KgMiDj+ps/PnVbT84BhDerediYeX7ajnIGOXZLgCXw4BXAQX2gjgo4c4dtCGG0
	tT/AXwFZ58h8sE7vie6xcOpcEs29zem1a202eqpUv6ctqt5o1UCHLnHd95S1FuikmLwL1GGG374
	N1zW7g8VW/eEan1OwLTDkD7Y4oVYOxfvA3bHSMHCvE3Vdl1YAmeIJLsFFQGqlm5MXuLudpo9htb
	BYYzAXrcJY5WXBv39cD8wR7jIwfVjKmMcOk5tWUGA8H8XYk8hy1ochANwDngT7sWeFqyBccDbXC
	n10Q/gGwC5Oa6Ce8NnfjoZ8zN6JEJrM+cQRl61Hk7h3fhPaGyTH5o5Ygq4LnWArPi9DvkiKvKCK
	8AfM7pZaA5Wz0G3nkFs7Tx4w7yBSut/Qzo0jhHm4d+9nbckXpHBsh7jz9/y5UaFzVIkD1FZ9VUJ
	LcQNCJxkT8ZQxI=
X-Received: by 2002:a05:620a:3712:b0:8c5:3495:87e2 with SMTP id af79cd13be357-8c70b887cfemr81859485a.39.1769494377106;
        Mon, 26 Jan 2026 22:12:57 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e37d2422sm1152193785a.18.2026.01.26.22.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:12:56 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id E974DF40068;
	Tue, 27 Jan 2026 01:12:55 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 27 Jan 2026 01:12:55 -0500
X-ME-Sender: <xms:Z1d4aQ_gx5kMobkdPRafZ1j1hW2WomBOrR0eV_9eAzgjNqjoad5ISQ>
    <xme:Z1d4afN_qQIIHjuWfkcwatYy-AzVgphMzq0sBuUUpuk4PTXwou6asTC9ZqDjkK8Xn
    armE-2tRUlCS8tPxHr_Th0c1xgZRAVB4IfGNuQJZP64BzORENnDrw>
X-ME-Received: <xmr:Z1d4aUDXDbLOHGgLguMgLjDY8OSJxPrceis5WwCJR12RUy5MgjK1vIDp3_Kehln7u2julec5bouC65fDKo3cxh-9cdXR8E3y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheeljeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejffegieejvddtgfekkefhjeegjeevuedugfehfedtkeffjedtleeiuefhvdef
    geenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepthgrmhhirhgusehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhi
    esghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothho
    nhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhosh
    hssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:Z1d4aTNy8jt5K9cpd7a3NPGaY8jFil2wMnknhyvUvhFP74XrHtBkDQ>
    <xmx:Z1d4abdUxlNZqBXCDg2FicqmHi7zr6GdEfwSfJ-UHJJC4h1FE1iBZQ>
    <xmx:Z1d4aU5vCESZfthiFkfoW7Fw_lwXJT_iMmJJI9GP_H-9L27-jXNNQg>
    <xmx:Z1d4adLF9pJzBpYW1GqIrMqnXdDiEsvEAShVS5sP2KRMADcxRC-bHg>
    <xmx:Z1d4aeUt5fJtz_smAWIJ-BL6yPu38UZq5Rp2c-kDS967JN01T13ptUWK>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jan 2026 01:12:54 -0500 (EST)
Date: Mon, 26 Jan 2026 22:12:53 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL][PATCH 0/1] Fixes for Rust synchronization PR of v7.0
Message-ID: <aXhXZdkBAwHukksg@tardis.local>
References: <aXAnTVnprfDnj7se@tardis-2.local>
 <20260123054624.8226-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123054624.8226-1-boqun.feng@gmail.com>

On Thu, Jan 22, 2026 at 09:46:23PM -0800, Boqun Feng wrote:
> Hi Peter,
> 

Gentle ping ;-)

Thanks!

Regards,
Boqun

> Although we chatted about this over IRC, but I figured it might be
> better for me to just send a fix PR for this, so here is it.
> 
> Thanks!
> 
> Regards,
> Boqun
> 
> --------------------------------->8
> The following changes since commit ccf9e070116a81d29aae30db501d562c8efd1ed8:
> 
>   rust: sync: Inline various lock related methods (2026-01-10 10:53:46 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-sync-fixes-for-v7.0-pr
> 
> for you to fetch changes up to 6583920e15fc567109e1c64ca58c917f52f40736:
> 
>   rust: sync: Replace `kernel::c_str!` with C-Strings (2026-01-22 21:36:57 -0800)
> 
> ----------------------------------------------------------------
> Fixes for Rust sync v7.0 PR:
> 
> - Remove the usage of `c_str!()` in the example of static_lock_class!()
> -----BEGIN PGP SIGNATURE-----
> 
> iQFJBAABCAAzFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmlzCUwVHGJvcXVuLmZl
> bmdAZ21haWwuY29tAAoJEEl56MO1B/q43YYIAIkVv+YTbNpODC5Kfy2F0/XxeHoB
> MbBSKvma6QR2m1Qx0c09o2NKcEU4ZnoPEi4WDhAs1ftfSyyc1CwE6gBApFirBvIu
> VzAWcEKJkM16+IiWQDQKPbWssraNmKGw4zeZlXi6q+iry+2r+Hy+6JdikcgCshYn
> +BYKjrkAh+mkXrQ1F95PfK0tfiT8fIbJCIeroPi9HlCmNlAYx0dP0i3YvF+5nWhB
> a5rU4TmQDKmCXXwyIqVQeOkK4kMme6wPOOSxjd5g4W/srS9hcmM3mYAASl1omm2X
> hr/9yyUOxSLUkG9e0x9XIhBkK4YwGS0dLIG6SQCvh//2vX9ek8BzBUvHzE0=
> =xOu4
> -----END PGP SIGNATURE-----
> 
> ----------------------------------------------------------------
> Tamir Duberstein (1):
>       rust: sync: Replace `kernel::c_str!` with C-Strings
> 
>  rust/kernel/sync.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> -- 
> 2.50.1 (Apple Git-155)
> 
