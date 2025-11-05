Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E332DEA62
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 20:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372912; cv=none; b=EiRAmF0a4P2SJ+7Q7sjdfhcv4JOMCJ7QD1PEQni+j5NX8i0n+sDhC3UcqRRJwbgaeLiI8Fx7tDhAmy0y2sYSskcj4dLOYGiRO5BrXDA2RLcItB1Nco5llnLj9qyJXkOCno3nRfWZ4X1QhuztipPznBwdG9Pk6D8AGeEr5SqDpGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372912; c=relaxed/simple;
	bh=7eexqkAR3aTk5kcNM9FozDvWuf2bX42Tll3Mr6lavRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mb09rGeMdI0knG21Ekud06PaE5yscO6yWxxnr4slgTnzZLdNcZbYwlmudceQm6JlUSxt+Ad1ZNfBz+iCKZBWhMFLXbkI34In4dtssmol+32xvaFdeoaikyNDN5oAkG401OVzp11ov+GpgARKujdvVrrq2/UvnHdVHyl7wFkS0Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ed0sAcZa; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed0sAcZa"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8801e4da400so2899826d6.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 12:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762372910; x=1762977710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xg7BvAvTvVVY99yfjG2FmHNYxW6OAUeHF0c7b0G9U9Q=;
        b=Ed0sAcZaVg6f/uEsrY9BymkG+RFJFkv7EXdoUlSh++orMmfgBCkivcLMoYpKYmWXgy
         QXinii7H0c1w95tpBfTJrHq3ZkgICmbw0VqtByyjVJ0CIALegTDJFwU1FY/ekbqwnw2V
         C1iXpTCQ8uCx16bqX6rUP3NqlswYDyYB1hqZ8JUnuj2GfFNlGRiVgYsTDYvdEda050lV
         PziXj22CrZ0m1QoCbDfa+fpFOUdBmJhjeqMAZoaWiSco8FSuiRonjjAhIdH9eSQc/Zxe
         Bl97nSlwkDbEwZgOMhdj1abDbbhG5uYVTRvKGuA8yMOPjqb+6flXxdYx85ROSjBtu++4
         94VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762372910; x=1762977710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xg7BvAvTvVVY99yfjG2FmHNYxW6OAUeHF0c7b0G9U9Q=;
        b=rALN1Fj9Vb2fkYewGVIGv3/+cbkEoBJ3DOd5oMJSpoQbNG09IfhlWkozbtsF6OltDK
         QR6HmuL95hjaXdZ82i+ZXyLb67tx+XHQ9DFuQiksvMHT95vXKGQsl09DypvQPrLWSJSq
         0Zbr8ogqu5mPp3FlF0uqkbxKJqilD8T3GRoPomAch7+vAcGqsMdk//DHe0Udz/O1WF+x
         9serOFnKygARvYeSRNwQD49GAG800GSqrLb8T4xhGOBu0u4MvWHtuEQrQcIb6vbWe/AE
         I2AyV/h85Gl2zJfnFTvCguV/vuyzxFKHP4Yt3JMWWllif4z+06rwc/l97O4wKnPw8WS3
         yT1w==
X-Gm-Message-State: AOJu0YzEXQBye2c/K68A/gI9YWndBMm/dMqTEQo5nLzfFelgj6e2Ow3E
	ICuZcd+mnuo+UGk+PuP8LjGZBoXd+v7ZaLvNNtygPsacosD5ooYQ7xL+
X-Gm-Gg: ASbGncskiU7skTMUqdpwpnTrgIQ+tLbyJEpooWw6+a/A2gu5uPKAc6EovHfGH6pvfnX
	tRKEgmuF6hjo9LLPwiAr1LCwMuhA8oHKr1le7wihP+rRwGHp3bQnfAHDUU0OLwET2WR686z8+X1
	L/2lG6uUXCMq09SzQ9Rk+yM09GkH6GfuIiIJzr10FnGhWcP1rF66Oc8iTdfHr3uhpD10qlajtUa
	o3OF7XS3DXbxNe3E+7rEo6y9Bq/qsn4R0ONjpWTRqzFSfI5O9O5cI+Sqy1Itq+9Bgh9Q90nngIh
	x6l7ItgLI0aodQSYe5OSdZ151DuwPzm9AqvyiQK6+aHkxBCak+3gWUA5THnUJp6T6lNXjqb8dkV
	+NX84Wnp+9P/1lzc/nNrYrFJiCfVfee+uNCD/AHDV/2kge745JpBwOEPU0fDgI05u667Zqcv8Aw
	iY5RlePnvRAkF8Z1XkxdNpG0JW4lnUg1Z/JnL8DkdEB+9fmK7Ltp0Uvzw0z2ufx8Zqw0/xPmCjZ
	zG7y5s0ZV1Ue4A=
X-Google-Smtp-Source: AGHT+IFSoM3lWfHi4jlIEW8WgXyrC0aA9EtAy/JvzGSk/v4RxXZ+0lsltA0H7C1qgeneNoZD0FnnuA==
X-Received: by 2002:ad4:5dcf:0:b0:880:4ed1:ce5f with SMTP id 6a1803df08f44-8807120b843mr60063076d6.51.1762372909868;
        Wed, 05 Nov 2025 12:01:49 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-880829f4dd5sm3478246d6.45.2025.11.05.12.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 12:01:48 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 32DE1F40078;
	Wed,  5 Nov 2025 15:01:47 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 05 Nov 2025 15:01:47 -0500
X-ME-Sender: <xms:K60Laajk_IHxR8oDDZbPPh-Ix6uw7DmOiQhZWMy9E91KVA3VqNs9sg>
    <xme:K60LaW8KQVLotCd3IRCxKb5RVV68ilfwna43BeY7eG06bsl9H2qEk0dhG8YEAar53
    rQ5iugyDvH32qrVpCSiw30Qia6UhO1MuHZLClZOvPJxOM8YxXWgTw>
X-ME-Received: <xmr:K60LaYPHRhgG3NhQrp5hSMswJQlny_h7MDj73xOVIhu6DRKT-66rX2psgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeegkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfoh
    hrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvg
    hgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgr
    vghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpg
    hghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:K60LaZp9zJYqsBrK2Aq9gcuOoKG0SAaC0FRXhDhJz_CBb8ZVnSnX-Q>
    <xmx:K60LaV6JoVADaMy5aaW3WhBg-lA-pBjPNlT2IJBwi7Q-q9RYklCJkw>
    <xmx:K60LabqMAjqCtnSBVwMxSI7w_OtBDWe2T93bQjeaxvVsLzhipvqlmw>
    <xmx:K60LabImnE-Q4U5xP0UDTY9Rh7n5hGJtxO9SY0IRpbDqr7ar7oi_bA>
    <xmx:K60LaQj9cpqbCYNGODzOYgmDp1XOW53uFvmgZFSo2N0n0b0UmdbxLm7W>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 15:01:46 -0500 (EST)
Date: Wed, 5 Nov 2025 12:01:40 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH 0/3] Remove the usage of Rust native atomics in debugfs
Message-ID: <aQutJAgXt4u3BOmq@tardis-2.local>
References: <20251022035324.70785-1-boqun.feng@gmail.com>
 <ad655011-d695-4dca-bc60-902aeffe73a9@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad655011-d695-4dca-bc60-902aeffe73a9@kernel.org>

On Fri, Oct 24, 2025 at 04:57:22PM +0200, Danilo Krummrich wrote:
> On 10/22/25 5:53 AM, Boqun Feng wrote:
> > Boqun Feng (3):
> >   rust: sync: atomic: Make Atomic*Ops pub(crate)
> >   rust: sync: atomic: Implement Debug for Atomic<Debug>
> >   rust: debugfs: Replace the usage of Rust native atomics
> 
> I ack'd patch three for you to pick it up, but I now wonder if you want me to

Thanks!

> pick it up through the driver-core tree?

Given there are some atomic library changes, I will send it as a PR to
tip. Thanks for the offering!

Regards,
Boqun
