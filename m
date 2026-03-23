Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BFC39C01D
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271664; cv=pass; b=fJBhQ0khxOUglNDOTiRbGLgDIO5m1GFn6yUjPC5jQu0KEkz88ZnLj43tSVZyDISBQkPTsJ+QIoYNA2/+DIE3AeqUGzaOamgfDLaXqsXoqeY/Bgh04FKnSudS6VWFyy81WokBQ/ADF2DMnvtIuISx+flUdGZbhsGFkebkwYEZNqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271664; c=relaxed/simple;
	bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRDIF9lzf3Np2xOnXCnOKfv2LvBkpwA6wvLvrCxCQvWz4niHk4pDA2ABUt4yf93q+p747wy8PSi12pBXHLyBZCaps+McHF83YXb16v41w0I3N4gOFqtM2HI1kRrMJn+uYa5cOv5oNP5KbOngiIN0PsBBVv9llgl3dtcU65OM+28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhkgXr2V; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhkgXr2V"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1277863a912so355446c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 06:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774271663; cv=none;
        d=google.com; s=arc-20240605;
        b=G3uqYr7gij7Zctejfi3dQ5H7VBU3rAInGIY/eN9dMTlaObhyCZuVot5002Bi5w+zZp
         Czl8e/heaRhaemHgZMNNOVZxm1BK3LsBzzQpjNhW4ovu9v6F9h0uubn3Dw30ufflsrm0
         YW6cyQh+uUTc2el2nkYxzJOm7PizFfRY9Y4gCdtgKAT4Q/Btpr7lexfgAbz85v3cFTWc
         ba8zayZVO+R1hGtT0eWyhM6N1qdNQnaAHPr2D3MduRh60ltt90TvF6nG1+6aNTLrsY8E
         3dD0H9F8Wh4cBmY6JJg3/Xr+zDBXoUGDuKKGrAK/yLhwhs9cSriCo4cWsNMoRpCxHLCp
         cxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
        fh=aHsbq46VjdBoLoedgzQ+Lly7v5zDFS5B/PGybEiyRts=;
        b=lcdot1A5Q2ZQdWPdyKZ85hu++pyFFJ2VEPVeXrG7hgAsrfK2yVhqYJIPU6saRjHpvi
         kfr9afZipZkc5VMKqXvQdw+XeDza3TdA5Z+Ih/80E2tJ0Ul1+oiVPyr+BEk20tgRMSIT
         NCjAP7psWZkb4GX27IkQFBMh7VBH8br0x2Uezive+h1HGK6AmdyAQLgiCHn3Q8ew+z/D
         j3+ZDM2Swx294Pnqm2TC3WmjpkG2eSuIehEIiKP89or+QQcl99Zvcdj/78QIFArVTMfI
         HP2xVepo+CP5r+5ZIaAIndMUjAhByI5acpxg9gQt6F8hHXCRRuKYvapgBXhfiZv6agHj
         oxuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271663; x=1774876463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
        b=UhkgXr2V7tpzLNRFhXHdVzmzKn0tK70enlEv/WAQKa6/uHaKn5MWn9v4P6qJ6h65WL
         uEDEsJnFa5ItfdbxAuSmqonU1fh+hAMegLQ+3TeR2VL6Dy6bGFe9D3Y7ECuQBfB9ASSo
         CKkKtAQEkFceLQxmP3BnHfO7MdhoqfMVU/GQ1hUGIGxAdReGqt2ibHusJrtdI4/udHky
         gKNQR0nFaguUyDTqtM0GKUjYA7M5L4WIRj5SNT8MHthUhX/68BWCQ07wvHwbAu1Selol
         nTOCqKzGgDCosrkoWakKLcjbFWsZFHoASn3d8niN2MlFTARhcWaeypZRLXlp46Tzo5kz
         xjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271663; x=1774876463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
        b=KlqWN32IsmOY0XZxLiqv5sGGxmdaO4kcQnxAs3oIx+bGg/8/71XI6M6q7SrQ3xcTPr
         nGgMtQyiic8HPC79nq65lP1NHe/aoJseyaV12c6WLX42ccOTwv2xSRly+AAFlBujeHqB
         /bYkvL7U+UsjSLEquAh9d5cCfK5PnH+YFO7GTm1IYgMq3uIpOhVuxmaq2KQ/4fJQeZF8
         pWWa/3QDz4llEl5DXWJJPs6srnKrB4jHYpaUdg6y5xsllif2F7X9tXdINO24L7aqtu2y
         X/UAdfLG07H56hKHYVcwq8qbub02k3hJLDDQDOXfseDhPZoHJ/W+HXM9dX3SgDao19FX
         Geyw==
X-Forwarded-Encrypted: i=1; AJvYcCUPDb6Ewgh8HEoEr3DLRAjFfytNKKkpLR/o5ZK4dCBIHQekwv6bGWflF9IP+jubt5Fp/0dpqaTVzfiL6xkIOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpRgqp255AMGHgqtK5MIeSCD15gfO7k6nmpwQ5tXrC3fV3tBne
	pqGuLrlHGiXdvGs1MxmP9ITXQ0SXL5ItXToZ7brcCI+jkiTNH/86Epsb1PltfP0K/ZP6LokZVx+
	b4cNYBPuByF8SDijfKzrTAtFHQQ81NlA=
X-Gm-Gg: ATEYQzxPZV2+a2ulKkOf7fLIak7lnVRFCZBfsRJ73Ebn6CcwPWDeAMjCnkXeRAZAOXS
	vhSB318ZKQ/rw2hO5EMWf+bI7X2V79fNavYKG6e09zRRg6c8lCKybWhe65I4fJW9TTg4cM2Y9KJ
	avCfozo2YaUQXB/6t0BQh/7bfTdm6VFT1kjdITLVwMRvCbnwQ/+2umKz7rFcbKhjc0EzW7DewS/
	aTZmA4jQpozJcYi6BRxGyq/89AqBCrrI7DDwcn7FmkdBaihTUHXuxr0VohsVpsk9a9VNbDNrsB+
	5OBGX36qEkK7YPDHolneGxUF6jpfdrvRtjWF4raK8vweMJi/MkqgwTyhOyxcreWEWrtMCdhrLMK
	NSUUnhMPYV6CG6Mq/72ewRss=
X-Received: by 2002:a05:7022:f8d:b0:11e:332:1e01 with SMTP id
 a92af1059eb24-12a726a9b6amr2560622c88.3.1774271662774; Mon, 23 Mar 2026
 06:14:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch> <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
 <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch>
In-Reply-To: <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:14:10 +0100
X-Gm-Features: AQROBzCU6xTHp3fepOJZJySC8VZYOKbiHafZdHuv7S9AawfpKcVFscMWOGjChLE
Message-ID: <CANiq72kbp6cDnNsKb+rPHiEJzOa-EnvR2HHthM-VtT2GMukY-A@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 1:55=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> The current proposed code for netlink needs this feature, because it
> needs access to inline C functions. Is the implication, following a
> chain of dependencies, that netlink would only build on x86_64 and
> arm64?
>
> If you want netlink on um, arm32, riscv, loongarch you would need a
> different implementation of the binding?

I still don't follow -- this new mode is opt-in, and only a couple
architectures (or whoever decides to support it) would be able to
opt-in. Nothing else changes.

> And a completely different question. Are there other work in progress
> solutions to allow the use of inline C functions? For networking, in
> particularly MAC and protocol code, anything which needs to access a
> struct sk_buf, a solution to this problem will be required. Do you see
> this "fairly exotic approach" as just a sort term bridge until some
> other "boring approach" is ready?

This series is really just a way to increase performance, i.e. it
doesn't really change what we can do.

Cheers,
Miguel
