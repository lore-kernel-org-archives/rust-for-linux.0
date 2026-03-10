Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896E535BDD7
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 07:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128865; cv=none; b=n3TOm1sSUwC0BqUQgdk6/FWdFCDSXO4BHbfTBSbit5H8zuVAgWTO0FxVbnW5INZLi6oaJmwtuHOhO4/w6EZHHs2Dt8KCWn09Im/78oKsXdgSLvCiwGYzwCaG5VOcmCMoTTo0GvN27QPn8szw2kmMbAtBJisa2Tvu/rBiAc8XMXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128865; c=relaxed/simple;
	bh=CEMltqQW9u10Dc2iBNuTXi2X2wgdQ6LtEATQpEiFmIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Odae1kFJ5H6akC1zeyOkWjPe8L58ru2lkv5Ja60YWJTgScS5DrLtcOHNc5+GoASKTSumP5doQDY964yrX8DiMgaJt8qUx1WyzjZgOVO6z1asrrh9tWEiWXnVoBtwcYLmYuXyaG17D6AWsSHbr7/FOkluTv05M9lDr27OeeXPmvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t9qU+g0F; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t9qU+g0F"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b96d8d60303so198701666b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 00:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773128861; x=1773733661; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xXA6X3KJ8wqz98mCcEpEVMkHZRCBuaUnyvX8XE1PQJs=;
        b=t9qU+g0Fg35pqzgVF0KwcUYxr5CrkQ2lw8+6R71nPpEhzSqvJLx2qzMIsHCSAP9biG
         G1swGxvwSmr1XKQ1Y9XCk3yC8w79Hdl4AF19fXQgZRbeOJNMfvoalEopeJo9Nh2GU4ZL
         OsgA94v9GY5pKXkAgjeGUp63996z8XRbxqXlLU4vqaWGwvckO+cDtkul+gBS78A/YuGj
         oOI9EJSofRvcPtxFQIpFmo7VfvEtINJDGy8Ftf3fUOGU68d/3l1DrMaGWQPTdehcWNfX
         9Vky5JNr8ybVxh7A2pFGfZ3x/pZzVDPibbZvA/dn9QqPC34Ut9rwcDT5BT4QLgb5YKVk
         pq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773128861; x=1773733661;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xXA6X3KJ8wqz98mCcEpEVMkHZRCBuaUnyvX8XE1PQJs=;
        b=OVExRTSMDzxBHn39daLa1/gblsxOnZ/L3g35aMpA6HWz8EhfQAOJw7VmZR1NVoDwGu
         uqMcjco/P+Qs3/pqOMTytwxAytj97n8U6l4e4rV7ynCjfsVfXO+ulnY29L8lnyL9U8QB
         DSrrEUfYxq7T2Ozlkhmq8lpNE7Tdu6loOZmSC2lje85AI6FUGC3vVZ5KqVuxDGRtiD5e
         +nQVjS9boA6HgPLgxjxiGQUiwGkmrcInP/YYBBvffgNlLI4bgXNgCOA5L2Bql8nNO2ar
         /Rc7qPccGKB6LxytvAxHLEqOyRWezb43Y8+lzNFfbmvNgxWbbVXteUhbiYzEEh83SnpJ
         PP+A==
X-Forwarded-Encrypted: i=1; AJvYcCWBCPPNdIAHpiV/rzmLHqZUNfh09nLeUmBIB9LB2Oh7wXmU6qsa7hfPWo/f/0eSLtrM2FGah+VjvluEP5JQeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/+WC6SB84MJ4U0GG4mbHSC6nXT4lAp99GeTNN4YJd/1osw0m
	5jykehDqxacyrHbDcOsRLRAglIfKEIp89ZC5XBMGvCkqEs95zqYuZzHqKddnS0SHiVR82Ypr9Hp
	KSWLvCKKNyY5/HCTrBg==
X-Received: from ejav26.prod.google.com ([2002:a17:906:339a:b0:b94:578:d46e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:e117:b0:b96:f7c7:6233 with SMTP id a640c23a62f3a-b96f7c76586mr210194966b.19.1773128860572;
 Tue, 10 Mar 2026 00:47:40 -0700 (PDT)
Date: Tue, 10 Mar 2026 07:47:39 +0000
In-Reply-To: <20260309142400.596f5010@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260306-binder-netlink-v1-0-daceb5bc83f2@google.com>
 <20260307104131.4c1d0de5@kernel.org> <aayWSuOM59uojtuG@google.com>
 <20260307135941.51353a4f@kernel.org> <aayrtyPKOqVGpich@google.com> <20260309142400.596f5010@kernel.org>
Message-ID: <aa_Mm3mHmF-eFh5x@google.com>
Subject: Re: [PATCH 0/4] Rust netlink support + use in Rust Binder
From: Alice Ryhl <aliceryhl@google.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 09, 2026 at 02:24:00PM -0700, Jakub Kicinski wrote:
> On Sat, 7 Mar 2026 22:50:31 +0000 Alice Ryhl wrote:
> > > > To be honest, I'm not entirely happy with what Binder is using netlink
> > > > for either, but it is what it is.  
> > > 
> > > If we're both not happy let's take this opportunity to find a better
> > > solution?  
> > 
> > My understanding is that userspace is already using or looking into
> > using the netlink uapi that Binder exposes here. I don't know to what
> > extent; it's not used *that* much yet, but it may still be tricky to
> > change the uapi at this point.
> 
> Let's explore it? What user space components would need to be updated?
> What's a better design?

Well ... the thing I'm the most unhappy about is needing to have a
userspace daemon that is notified about all transaction failures to
begin with.

But if you must have such a daemon, I think the netlink based API is
an okay way to do it. You can easily add new fields in the future, and
it implements notifications to userspace on our behalf.

Though using raw pids in the netlink messages is pretty ugly ... pids
can change, and the pid namespace of the receiving proc ends up ignored.

Alice
