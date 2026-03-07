Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EC72DECA0
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772918350; cv=none; b=VFZbDTjebiRLopBelOMUst0427E4F5qmraPQimsnIPYyGbMNLab6MtXurGKBeyqvvk0x0ghlFZ9YOHhHVdHoNkfWP3J6Kydc0pCIIH58hGxGUhe41Xe8lMVMy+OPPMA1tk68F2QdUmUrIIiI3qrF1CBmYlhPjTEMn2IXGZKaCEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772918350; c=relaxed/simple;
	bh=Y3zExc2To8gm5Uokvv2lsc3X4xX3v+SfgtWbXGtWm9s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QkBfH97y4BflhrKbgPNvpVxyIR49SnRK2mQ1I/UYnqL+XeIFM0AmbjKuEQ69xhwKkfAyZ9WbtUb568WWYj2+u7LPdwFl6ai3u4FTeQ0yJapzllV6+FfN5RGQdvKS7KrMm9/IJmLXoQ4CcZ/wnMX7kaPmARUMq11vezajHiS/H34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A/roz6EM; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A/roz6EM"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-439b50dfca1so5340931f8f.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Mar 2026 13:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772918347; x=1773523147; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bXKay9MbLzhkCn+559OyyxJkN2o62vFz7U9PKE2/DIQ=;
        b=A/roz6EM2MtDLG3CP6UEkk9VxMsyfOhUAcdetF/3G5ChQ9V0MpJo9yOy94wPAAQVqM
         UqgiT/bpoMsTS2iO21QMgUC9OCM5Ah8qnaIILZP23xlVkXWV6Rsa0y5RmSrKbyg6vH4z
         ye0szfHUNBrmzC/ToZrjhbuFxioJgheFY7y4yASKXAxUaQ9Zn17IYYkdXVAc3KDQMLXq
         PExUmhIJqfXtDR/6RREVqoiEfT/l1d2MAQkcLcOTzlMbVyV6djafx+lhRb+zs2Y+Wssl
         AVgraTvNkTvIB6RsPpayMstXMJKImuXBNjXyv+jZy/BtAjS8Oa07/3R7pMO8UCzlIitH
         MK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772918347; x=1773523147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXKay9MbLzhkCn+559OyyxJkN2o62vFz7U9PKE2/DIQ=;
        b=W8BVSfinIUkEHJZfd/23whkeQESdLHe6i7Ug6qkEj3Cgcze4//lDAo2aDOFMHzWh4h
         FlpXkMsVp8V4kpcyFnsQJtoDe6K+JS+SJYRX7vefB8qEKLS6WHm4rOCGY6kUeAt/f2aQ
         BlIDleVaqUfB8NI6z6wUpvI1JSCnfDH7u7PEJffROolvn3nvu0bHN0AmydlV2p5bp4p5
         GpI6/cP47ESiM8WETEJfPcBMofSU7gjh0L67gFSrFuCYn+eTTugg0s07EuM1Ez2+kMbv
         a5jjY+M8ZFbevk7PiY+ME7cdIMSDEJ1+Q8JSg4tO+xRP6rM+MWeoAfH50nblBV+i5PWm
         NBUw==
X-Forwarded-Encrypted: i=1; AJvYcCWVo5ZztaximfjXeIyY5+m8dY0LsZLLIZloh3v0AIxGfh64Az3nrkkX+zfuW+B+94RxlUdPBgKqL8l9P72XIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRamUremA+a26YtAeDqFW2aVKt50pafiXkP4ZbZ3hH4rrR8be8
	lhteSAdUszrH7UO48hqta68g16Z6iS0TCRiZf8WsY/XJHe8f5NWhqZqOL2fBCuamotP4O/cMBb2
	l5jLVLDNUJ54mLrnhhQ==
X-Received: from wrai9.prod.google.com ([2002:a5d:5229:0:b0:439:c5a3:f5a8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:186b:b0:439:c040:cc8a with SMTP id ffacd0b85a97d-439da35f6acmr11648580f8f.32.1772918347381;
 Sat, 07 Mar 2026 13:19:07 -0800 (PST)
Date: Sat, 7 Mar 2026 21:19:06 +0000
In-Reply-To: <20260307104131.4c1d0de5@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260306-binder-netlink-v1-0-daceb5bc83f2@google.com> <20260307104131.4c1d0de5@kernel.org>
Message-ID: <aayWSuOM59uojtuG@google.com>
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

On Sat, Mar 07, 2026 at 10:41:31AM -0800, Jakub Kicinski wrote:
> On Fri, 06 Mar 2026 15:12:12 +0000 Alice Ryhl wrote:
> > The C Binder driver exposes messages over netlink when transactions
> > fail, so that a userpace daemon can respond to processes with many
> > failing transactions.
> 
> Ugh, now I regret letting binder use Netlink. Should have seen this
> coming :/

To be honest, I'm not entirely happy with what Binder is using netlink
for either, but it is what it is.

> > This patch series adds netlink support from Rust, then implements an
> > equivalent API in Rust Binder.
> > 
> > As Binder only uses broadcast messages, I did not add support for other
> > kinds of messages.
> 
> Please no duplication of existing code in Rust.

The plan is certainly to get rid of C Binder, but it was unfortunately
not possible to get there without a transition period.

Alice
