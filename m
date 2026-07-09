Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7669437470
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 18:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622666; cv=pass; b=WR6hzuj2Tj30LnvC+x7ncpAw2JHirPxfuFHT5tAHlKbF1VIZoxZrEDc/C26giWLJrKumaAmuy316bFfYpdakDRxh+qgbtIHOml+Kp1BiZjKQTJIWYr6P9ZXAEOkHnMGkrujs5bM1iITFS3xtmoJUtZPwUhkpAuGiliaS84Ji08c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622666; c=relaxed/simple;
	bh=bF7Dpl1te4Lk6J9LHE9t8SYycWMlNdylssKH6TQcsZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuqlIi0hfU5cVD+XN5Mks1IG/BQKiQiMbs5TdJul/1XxmnY5/mnxCexNz3MWx+r+JGEj6GmKc95KlQ3yQnbFCl9sxgibpZVzc5zYYn+8zo1pEHuE3MyxEe+VThujPeKYgggs9vZJ9M9PDDw9y16CovJd8k0M32LwYp+nf4FCKlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VILRiyln; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VILRiyln"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so40963a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jul 2026 11:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783622664; cv=none;
        d=google.com; s=arc-20260327;
        b=ooFIicpy1EwijIHN7jB0ZPzuCbv4eVMKpz1nyuZe6L9OzslhY7CukAGJ2hDduHvB13
         2x870vudPebTxORnIs52LMlSw6ic5gdc2WpxCQOu+ryHTa5LhmB0aTaCfV73SiWfWXMD
         hhI82c/tY5rolYIYWc6dkh469NKzePLTJR5r9Qd3VVxqC7QNcQTRDsUPJAttNGrBvg1B
         Nek7xVMrWGHp7NOprUlH+8h70ajfUQBNvtghDVFd9mY2h8AaMj3LGSXuQ4Znu1jTlEk/
         BouQzS2g4FA7wmJcpEVDerqf3B584+ByIuYThS9byVy50M3grw9Qbj47GLAfCw68o2ev
         OtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pfL/jqBrR6ltGD6VxOxqggwTNXk0Dly8MDIQnLtuDT0=;
        fh=jUNi7LtDn+weFeeNzL9K2kNee3qLILIi8ulzfdG+vAk=;
        b=LWqv+R9zSHGbHCfXoJK1v5qCkuPW8vpdzjKpmK/hlQ9ojB7pOekSyiZJssAzLPSMIu
         4yKnws6OUoQphsUWked9nvIn/7VnMhi7RjV7l36fPwIi+FZ0G0p74dHc3A4KN/c44ogR
         KWeGwnkSirJHR4v51+9DWWXU5Som5bID/8gGSEwETntJkHB0otV4+3ZHNu5NPDvUNsUj
         awU5x4oY8oPaSpIG4PcigsS+hlYAOxXtC1XdKW5GQMaxun3SKkPbrZL3wrDFDy6HaKfm
         0BK14B9HEOe+o6GEKs0GBE7GFVHGV3DVHTafzvzkj5MD7eeyfXPrXv0Znl9s/9nYssxP
         tMzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622664; x=1784227464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pfL/jqBrR6ltGD6VxOxqggwTNXk0Dly8MDIQnLtuDT0=;
        b=VILRiylnj9cyN1VBKijcwKEi4C5/ecWL7KbuHLTPua9ejHJ+pqXp/P7uXv5nKKvSZS
         cndhIbdpspzEb1mGZtspVpvJTndsHhhr19rlbin43Nlg6Vd8Y1sLcbr3BlQ5nEGW7ziQ
         +g6VD2T0zlbjKgIsU+cQms4j8VW09EInnM6Rh6mAFx6Ova2AEt8QKGaQV4vNw2WIog7n
         GPW/pFspQDC16fhJ8HOcuFGpvikJMwB5GkZU4yYdXN0nsvqT0h+Nv4ejGYnarH2KRGU2
         UPk5JKVLxFXd7QM3qajDMNG5jbdyqqO9fQCgOuhsd/2s4USn5BjuocQ3cwf46LzLACfJ
         XbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622664; x=1784227464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfL/jqBrR6ltGD6VxOxqggwTNXk0Dly8MDIQnLtuDT0=;
        b=ORnw5TL6SQhL4HDWIhfQZ82z6huLj8p9ybWgH+YoyHaxEIfrKe6ENhJV+QYVfnTxPt
         j0sMEdctO6kjnflczy/+Ji1ajQgknbL9Zq+xqj7PzcLqGADawJpf8Fg7XRIKZWSmD5aI
         Np9EUSI7vB+NDgbu0mfVnuisRDeIZpmfJje4Vjty6le3mMdZo3eSL0s9n3RLxo31BMAN
         TYi3ppgNFhEobyze5WdWcguiIlMhE8qYI6nv/zRJx96El/6MbzJ1ngCoA2bgFs+ls3LO
         mxvKlaC7ggIYyh5rY/0M0MKcJX+/vbZsPF+HUqdYYM1Vme9/5YuvkxBCCwTmGVzo/eOD
         NDvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5T3kppXZnHu4vplgTyNzgO/+cCaRfirzztOwIkJgsYhjI3e/DgJGHKeoKFE+ZB5Q2kJVTuXOMMhagcas3ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxytf/ofQFHLjH2OyIa9OBFb5+fcX3iZg51zZsMdTGhvpX7JYof
	RaSwEuqgBSUmrtRr8aNNaA2bbunUToHEL/K4IgEhNnNpwghpyskGQGyupGAhOKHw5FXiBpYBkxN
	CSspOTR8bNEST2pwdeyBx3jXNNS4ZNxE=
X-Gm-Gg: AfdE7cluHyQjcsQNZ1zZhV2+m42k8AGeuNFvT98YW73j1b6kfBAQ5svrpTCNsVblVec
	BdgwxYDSl0BUGzVswOwyARVx2vSDlOEJjQ0gLWuvERe5LieFvGEn2KlxNz0g7dCDQ3UdsjCkbNF
	PDTc1nGbnsx5VyGvy5IZUwlizx2UeBHrcgutcyhlpsMxizCm9u1Al/M4mmbZ0WNpMlORbwfO4UN
	oqxYG8JrwDW8RqoWAvltS0OVKwdWhaMorvHKuoiExeRPDA6VCqFCXIM6NL0ns6DTj5r8MTVKxjd
	pOVt+uFEau1R0hVGixGgqFhH6INAkYyAtDlKz/L93HMGGExBFwPeG0NfW/bfiGbNSNWRzMNa1bZ
	Rl5zDn5FG8I7rFFB6rHiOERw=
X-Received: by 2002:a17:90b:3fc5:b0:37f:bfc9:55fe with SMTP id
 98e67ed59e1d1-38a20c49089mr4107095a91.3.1783622664188; Thu, 09 Jul 2026
 11:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <akKBVsFBro_4QM74@casper.infradead.org> <202607090956.6381F35@keescook>
 <ak_WOfpcaZIuh99t@casper.infradead.org> <CANiq72nQ=BmM0GRVrcmXHfE6VqD2hsssxqJEE40TirDiy82+wA@mail.gmail.com>
 <1F884E12-63DA-4A65-A811-C2D40FD9B5F7@zytor.com>
In-Reply-To: <1F884E12-63DA-4A65-A811-C2D40FD9B5F7@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jul 2026 20:44:11 +0200
X-Gm-Features: AUfX_mxOoQ7RqqQNLgp4uTzipc6y_LfMp0cxy6WGg01uzMDy0MSuitpFYJuUqJ4
Message-ID: <CANiq72m+YTQ7NG4m8h7ho+GCkx_1Gdk6WuAeZ+KAORiETytWig@mail.gmail.com>
Subject: Re: [TECH TOPIC] Implementing malloc
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Matthew Wilcox <willy@infradead.org>, Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 8:18=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> In case it was not obvious, my comment was meant to be ironic (reductio a=
d absurdum).

Ok, I appreciate the clarification and that you consider it the right call =
then.

> In fact, I'm surprised and worried to hear how recent this was. This unde=
rscores my main concern with Rust, which is that it seems to have *very* di=
fferent stability criteria than the C code, where we are not allowed to req=
uire anything that hasn't been in gcc for 5-10 years, after which the clang=
 people discover they never implemented it and so they ask for another 5+ y=
ears of keeping the old-syle or fallback code.

Hmm... What is the concern? If it is about the window of supported
compilers, the current policy is to follow Debian Stable's version as
the minimum.

  https://rust-for-linux.com/rust-version-policy#minimum-upgrade-policy

It was openly discussed and finally decided in the Maintainers Summit.

As things mature and we get the improvements we want, we may want to
extend it to two Debian Stables etc.

But please note that, regarding allocators, we could have moved
earlier. As I mentioned, we waited as long as we could to see if
upstream could give us what we needed. It didn't happen, so we
pivoted, but we could have done it earlier.

Cheers,
Miguel
