Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875112C547
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Feb 2024 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707341617; cv=none; b=Tef96ChfsBUGFEL5IGHfpp480nfBrdxrnF596dNzo5cZgeMxyJ6tB2TgGRk48OIBWzf4xBLZUS92W+Hc/DFyjy90vCO0eX6RQDqshQsQs1RmnBUgbAHcsMLgHZAZQRhueQ35rMLmr7b5g9sZpEWTLcGz4EIZDSWnl7chW+Lrz04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707341617; c=relaxed/simple;
	bh=6BOpcg6okTWPFWaIYtqUARu47dDdOBDQsvIoMbwINeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORht/lvZNZwbXrl4oDebZtBygbMpCeE4/AklTN/xalLAmRKFz7hnJ4QKIt3nXjv192uPEQKDHWuczv9x8brZxYHaIehUA5n/CuLO6vyMQ+iKz0KNe0IO6re5OvyHXNnu+9/5kbcmMFKP40CYLIPpjtqO+8kEhmMmgGq9ImvHJEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=Y9aMcX5W; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Y9aMcX5W"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso1041342276.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Feb 2024 13:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707341614; x=1707946414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BOpcg6okTWPFWaIYtqUARu47dDdOBDQsvIoMbwINeo=;
        b=Y9aMcX5W2vl/VGu0yDEs+EPk5WXBHeaHsV7WH5dAo1UtFcSmkB9ibDRkosr6ZgW9xD
         2r11FustAYoTBnt2DFhfYN5yB7671yDlPzSN9o7h/IpXi1k+OFhkSJM+NE/OyCSiNJgv
         jhlt3fIKps099WYsPRzHjyno2zvkRaDNpkwg6sCiHq/NulrnAijIOVeYrH150MeyZYwo
         IBnyNLa2V5ZLolWAlZdg+21EwzHyL7fnOgP/iZCFcxQxN1KcTkssH7C/MWZVHOM14ofn
         dkCeiPZr/glr3FxxM20e27b3cqmOkdZ9xBu8JqwH3Sn3cdIk7LNV++i6M/NlvEXfC70R
         Rv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707341614; x=1707946414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BOpcg6okTWPFWaIYtqUARu47dDdOBDQsvIoMbwINeo=;
        b=dXZQiv/2pFg/Uk5I+bZ8lbjOU6FnZW0GM+HhxLJcd1pNk124gpXuXf8koTE67imIjo
         VBadtv6yGxXPrXjZ5/vVO0QvToqGrgzkmdFTDn1wm34d40RQtLuBFOjF5fC5R8y4YlOR
         zfatDD3hIBEMgRySjHxOos9SH4Ydt9/evCnKiGF9LAkPZRteEkrygYJcMatMH7SSTHT8
         RuhcxekDR5y9Y7kNQvI2zLK9bobTxMnuuda6RRgGZC9PKcGvJtQEbFjU1aLBIvk2bEeJ
         Vx9lvsjyuigQy/xZxDBXCaPGK8+nAaEn1meqy5KLIHLD2/DXGsUlD3xysQdeRdfpAo+T
         pIJQ==
X-Gm-Message-State: AOJu0YwEhTn0Xu9ZidxD/bgejoTZ4iXFKmgKsNB9I+Bm4y4IgoCLAd5T
	MQ+ZtlY6AXoXglEkdxhooWarjca8Cs0mnbcXkUKlUqScy3d+9l83yiW4/g/I781K1lGl1wsVjb/
	1XYCCn2z4nHfQfDWU3IHexneSIDZrduw/5h1Ocg==
X-Google-Smtp-Source: AGHT+IHrYG+/o7v1J2J3dpFwsVemFTwS1qmwD738Z1mWPeHiWxDEFgNdegqhyiNG9Feb4jofcWgOJdbWEuL4wTlAYM8=
X-Received: by 2002:a25:fc0a:0:b0:dc2:53ad:9a3f with SMTP id
 v10-20020a25fc0a000000b00dc253ad9a3fmr5899264ybd.27.1707341614524; Wed, 07
 Feb 2024 13:33:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207055558.611606-1-tahbertschinger@gmail.com>
 <CANiq72=00+vZ+BqacSh+Xk8_VtNPVADH2Hcsyo-MPufojXvNFQ@mail.gmail.com> <qo637rxuw5tcskmgubutpe6dfmhhms4d4pjivzhewl5tpg3eth@xil6gpcvdiya>
In-Reply-To: <qo637rxuw5tcskmgubutpe6dfmhhms4d4pjivzhewl5tpg3eth@xil6gpcvdiya>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 7 Feb 2024 15:33:23 -0600
Message-ID: <CALNs47t7AumxuhUorA9XRhd2s46Gu25k4tiX7RtCGxKhnCuuKg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] bcachefs: add framework for internal Rust code
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Thomas Bertschinger <tahbertschinger@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, bfoster@redhat.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 2:57=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
> [...]
> I didn't see that comment, but we're mainly looking at what we can do
> inside fs/bcachefs/, and I've already got Rust bindings for the btree
> interface (that I talked about in a meeting with you guys, actually)
> that we'll be pulling in soon.

Is there a branch with the bcachefs rust rewrite or WIP, whatever is
intended for upstreaming? I checked at [1] but nothing there jumped
out to me.

- Trevor

[1]: https://evilpiepirate.org/git/bcachefs.git/refs/
