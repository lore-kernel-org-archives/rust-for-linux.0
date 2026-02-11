Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AE2318EDC
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 18:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770834297; cv=pass; b=V7xlMi76U39G6l4WNOClCmjH4TpsEVITssA4lWeT3p79X3kXy2FBOdA0s0X7a1UmgfMxyM+jw4H/bzdflnJWTwjUmmPw38gxJRg+Yx1gfcyQQi/vzj+4lQKFBn4j82y07JZrZyrd7sc6+jdLPKV02E+iQIPGxfOZd3PHrwtsz8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770834297; c=relaxed/simple;
	bh=iQMG4VAdv0ceQ5uFWIOJkMfGcq8K2Ty7k/bt2AkkDAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjP+5F6XZSXMOf14x6Dl3gJbJfrD90HOIIJu3b+xQHhRveZnJQ7PAsHxXnTOLNp+UA5DgX6et974rwlc+h/lT+SuVlH4B8gz4e35GLfMNRuvviwEjaT8T42wtxctMjXVAaMuS/7o60sTcGOgOpYR65bX7uWaFlOv7ueWSnS51xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5prHEA0; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5prHEA0"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-382fd45a1feso13859261fa.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 10:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770834295; cv=none;
        d=google.com; s=arc-20240605;
        b=JBkSKFsVAIIo/4qOI23LCLAUQQtRwo6GepdgHTilgIH1E80TVNbPDfTHskspZ+2xPd
         q9VehASoFkCj2iK44V6MJwun2k4zuLAMvJlFXxG22yRvCZBtEbnJLrg2K7vxM5Futj+n
         dqLk4LcYDZUfDsln6fbmqX3QiBv/Jc0TAapNvsmoJXVhixlPQFFYQDm/QrmdnjQ9rmZN
         WneYSuDXdfsB+Ykuc+VOxmdhUPl47DkQ6vfWYlhCWixDAPTa3LuERC7/KoIwM9MI+wTv
         HTklR+n/RLR5Y/0e7j+MSvwvm2XhsLfYK/LV4KXBDG1lH+48JVgwy5hPKxaZhBv+ZjfN
         Ku2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iQMG4VAdv0ceQ5uFWIOJkMfGcq8K2Ty7k/bt2AkkDAc=;
        fh=Rkhh9RyVcPwp72dRoBkSZiXc1BBXOom1sssod3vS/gc=;
        b=NaqrVcR0dbTC2AX6MM/nwwmEUcyBCQkpeHnykQP26mCCUjrlhPvwZgbCoSoNqdSIkc
         kpKTOwijmRSDxOPO4Pn0msXUNzkquVSwouzUw9chnGN1Xq/9IqQG0b+bB6qSepHedR7f
         kZVv2EDm+VX9KVDqyYsGPl2OaY4NjJdLptddAeBrHte+tLYs98mErdmwM38nnlcLJt3/
         97s3uI/BOu+vfk0aeafVXKBaq6DNeN0BFzJl++04wXOj9djE6uZP8WfZFXvdY6dH6eUT
         jGoGD5J5peDxxmvVOLiyCLq3T2LaMLYDwVSIr1w2pqGF1TF6ibWHaCG0xCM+24RdndRa
         NBMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770834295; x=1771439095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQMG4VAdv0ceQ5uFWIOJkMfGcq8K2Ty7k/bt2AkkDAc=;
        b=W5prHEA05VJWo1B0HmIb+D9CwkyfZt34ANbm7kddDNfPFjegVnThCvDiaL55rZA3qX
         HsfIjnF9KiifNlCQBCuF9LelbaUAK48MCDw6lSvKszrytcfIrXfw9B78FpKbkYja/NO3
         IC92qXPXRC0GOIfuE1nxEA/EDFEgE0PK6l9lVdbJeuGphStQIjCItRoKVRYsThhIwPPg
         KlnAFQZ58rYGw4rzrhy1nMmjwQujqBK1cAcDryBUNqkpke5vhH3XBdwdKZm6Rjoe3hXS
         LuoBBhWDyJLTk2X5a0CVjtNo5cu9rPv9xQxNgFY3Eh9MRb8X0RyB70q6MD3sEUGQrJrF
         852A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770834295; x=1771439095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iQMG4VAdv0ceQ5uFWIOJkMfGcq8K2Ty7k/bt2AkkDAc=;
        b=L+l1Qi99nKvAjLKT+dZTpTlSIbLSF3Zx73MzGgHA5D7WTwoHnWvglkQnxyAHLV6NZy
         IGF9zwG6SsWQ0xRrerRIJvo/xUa9+9af79easr0SeQQFuMF2bYLPkNhAmToOh15lREMp
         ZkBtTV1T2dNkYi+aI88C1Dgo7yPZHrW/cq7SBYGycuuco3nfHZkfMUNdANTSyFn+K5Tk
         JjLaQGgNpNYjXT56FESqZ2bE+h9kWn5Q9m/agDWRPpWsKlUWRbmCIyNExPkiXxKVRSEV
         iHSgMFCQ68FyPTW9gYzxFL8wFUJCre1ELRTLUS2laeu0LqScFn44MTRo1ogtg0jRJg8f
         QEXw==
X-Forwarded-Encrypted: i=1; AJvYcCWVGo11o/902nJcwfLESt2qwh9cPSbRR1rtnC1ebjW8B5Xi0p1Y9AnALhXsibrkey5wyuKcSUdY2au0cgs2GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxjRTkq9W6SGeXjYbPzFi+PVAHa3RLaqo9RX2nC254Y3oymZvz
	iatwXyY71nf0KOQZFyV1VuOcD8k+xmQnlNAndfjriekJHuVFvqy6DJo8beqEDnX6+kpvfOtqyQR
	FG/5d0BnHpNW/R6VA9+Lx+7oQ5Tiu/CE=
X-Gm-Gg: AZuq6aLMvGj0guN6lCerEvLPReS+ypbXrHU0RXijDYeoVMF2PnYTsWVi+usFTY3ZDnc
	defgAI4yeXVAlnaTD0pM4fbxei5c323Oi42IeKrHQ5Di78rkNTdFDefssn9WFYfiyYl8/ZC8760
	tZKMf4C7KlIzRnYvLkZVzQBsh5mAlf1aJ9v4jJpumG2ohF3zISW7yEJ1zYwOsfrtL8NEnM4kMH4
	mkpjNG4e4YDJT3uu90Cj8PAz+Ksgoq4yo18vJRNqOTl+lHMJzvqhdwTHsVeI5nW8GzcwdeCQm+/
	7ohhBE0o+JyTkfA8/llE2k54Ntildu/l/YqukUbbKS7jDwJyOg9RGC/X0QsKTjJ/kdltbmd0eu+
	CjeYdc4cJMs9lZBxCU6sNBHqKZLbkn9Y=
X-Received: by 2002:a2e:9b46:0:b0:387:e03:147c with SMTP id
 38308e7fff4ca-3870e03171amr3123811fa.1.1770834294387; Wed, 11 Feb 2026
 10:24:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org> <CAJ-ks9mF5x5mAUcfN6dWN-NWoaE=j-8h0y_F5AM2Pnfn8RcV6g@mail.gmail.com>
 <87ikc3viqs.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ikc3viqs.fsf@t14s.mail-host-address-is-not-set>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 11 Feb 2026 13:24:17 -0500
X-Gm-Features: AZwV_QhMUgkHsYBPhkqtwQcOlYdKuPSOxt9s5-PDmT2DNnRzhy6-9DZN-95P4wo
Message-ID: <CAJ-ks9nZuBJnw=AAr68Chhfa+QB=j4OQURKJrnAFJarqw4gZcw@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
	Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 11:31=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Tamir Duberstein <tamird@gmail.com> writes:
>
> > On Mon, Feb 9, 2026 at 6:38=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Add a convenience method `contains_index` to check whether an element
> >> exists at a given index in the XArray. This method provides a more
> >> ergonomic API compared to calling `get` and checking for `Some`.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > As I said in v1 I'm -1 on this change. As gregkh would say: it's hard
> > to review a new API without seeing its user.
>
> I already gave you the user inline [1] and if you wish you can also see
> it in a downstream tree [2]. Gary already explained why this is required
> with the current implementation of the borrow checker [3].

Yeah, that's fine, and the poor ergonomics are IMO a feature - I
should see the ugly `is_some()` call in your code, because it's a
useful signal that something non-obvious is going. This function hides
that, which I think is not better.

>
> Best regards,
> Andreas Hindborg
>
> [1] https://lore.kernel.org/r/87344gh2pk.fsf@t14s.mail-host-address-is-no=
t-set
> [2] https://github.com/metaspace/linux/blob/aa43a6ecb68a785a90e167609aa57=
c5a0860d123/drivers/block/rnull/disk_storage.rs#L218
> [3] https://lore.kernel.org/r/DFK801ZCI1GD.34GWJ10JZBBBF@garyguo.net
>
