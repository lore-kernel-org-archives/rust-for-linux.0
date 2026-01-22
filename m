Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBDA35CB89
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 01:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046926; cv=pass; b=mT9yKOV7os49FXDIgFq1YupQWkZPdl2OjQuCaIkG6Mdr6TFgb8uX++JEUfTCequ+TqEgn82Ii7uRdWiUj2m+WzDO3uNHE5JIx6u7mxaEPoSuUN4zCHwjrmEoN2O9FoM/qUGnZEQQtjU3JaRmRD/vh+a0x1V16NxJpLg2u9CJ980=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046926; c=relaxed/simple;
	bh=s8Pycml9Fkd21qLtAfP+c2DxbBJNyUMd5kAPvNgICXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnGzKL8WHZuTM3A228+TJ3HqiiptcFbWITrreYRMANF97Yo5fvnIdhgtG/6aXSxUM82Qq2ByrwECGsufwPOr6liQy+MmOUZ7UfV3kjmwpdWuq68KU2/wV7ScP1HdYMznRPec8NTeKMp6fkijkhIk/+1IBCB3YfgPnN3E4XjY4ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQifqa+3; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQifqa+3"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b703e04984so40917eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 17:55:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769046923; cv=none;
        d=google.com; s=arc-20240605;
        b=b74VdfV05iodU0cau6Hz4JPnbQ6INa1Tohy8Gm+0hDKmdcwvbHvW354xa/ZhHC5AYi
         mtMjJtaGO/0n7fQsbd3BE2yUXPKa1yl48aNfiSe9uft9Zup0hL0Q6AqWFLq0JpfJocwK
         MVk45EsP1I/ZBLhd3uy7REtHHdesDbxPp7WrocnUjUvpNrlPyDYFtTNcxFizsQeY9aEg
         xdfjF0YxMkIFopFz0sG5Z4Xg/Da2n8wcFncOe/uTUk2/zTsaYRhgPi7ugaN2LEbmpman
         k4O9nfkp/IqyveFEd/EH1qxOXu4SxEQCwtsXbEF9vDMlJIYwh4nkCrb+sXsdugGgJUxF
         1YQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s8Pycml9Fkd21qLtAfP+c2DxbBJNyUMd5kAPvNgICXY=;
        fh=AuGPu99wCMOe80kpuwdXTdR8ZTWzBFJmTRqeRqmT1Yk=;
        b=H0dtvKBky2r9pJE7o3e4Lj8xGB/3ZhTBIRcgBEAG5e5MVZrPM8bVU67AXVBhch1xYQ
         5FBMFwSv47PG0d1znP6FXh3vx1sAqLD/F+A2nSJ8O/i6q70XQzWvpVs30mbG/dnY8xvf
         yDH3j9XOYycX7jsUxjf2Z615TgY6LB6z3ZahlMlOBI6qD6eoYNy3Hzgn0+i4nVkiBBKx
         1rivIIfm2qTqY1k7en2Av/udZgfbUA1aj51UXc6xX/YvrQiTCf5vHfITpulngNUvIXHN
         ZxxPV4cgSFdWwCJqNSiknu0X6ifECZkmZ9a/c4HXne9e8VVGUwpbk69LC1xZ6o+an+3x
         Sgtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769046923; x=1769651723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8Pycml9Fkd21qLtAfP+c2DxbBJNyUMd5kAPvNgICXY=;
        b=IQifqa+3oPM1YDYHJws4QGeX6OavUuA86YjaoHAPNbmIz3YLnUd7Qdoujl8VmjQFqS
         GykXn4oacj8k2UzI3PFfgpfdwlNSX/XTH23BeYGO8gn5GtrxCEVW4Q9uWVqCq+WMrimm
         eulNld51C4Mws5JLzGL9nF7yJUHClXrDQROg+TlIzMHK7Z/EY/eJGCElBwhxv6VWehDp
         cH+BmzB5JtyQA51WLImjoA3s4he/SKJJm0mlPs5jJ2zCQz87+UvkN5FCPa0sBK02rGin
         9KKoonhlOiULyScovYs3Oo3lWcKfmjLm3FTK6fVF3CupF9a6v5NEW2gFeEWKNQjpp/Ep
         0F2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769046923; x=1769651723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s8Pycml9Fkd21qLtAfP+c2DxbBJNyUMd5kAPvNgICXY=;
        b=fcRjp5cKxu4JG7ZCv9oYedqGDBtQ/AWVZ/GGntq6EJniAQqh5+zAOzSUUfGPz/0eVV
         R4h7oJmzFBe3cx3Dkc8j6c7+Ms+AKEJSOM92jjZ51owcY3YQL4HavJ0DgquSX4xvtziM
         jzKSv+VdmqaBlDuHVFNF2A11awF63gOKmx/wJnkxjeEhnY7xGNU1urKrcbIIMZHAa7Q2
         2WeN11+bqJ9w+xHC062PZrNea772HROAzV0fnOKqfhSbbXSiGHxekfvE2euqTr+CYPNQ
         q7vagnGScB1OoiIcTOnJxLgPkKefD28Kju6ofHH9eH5l5k+WxYqtKvnfAJZu8n/G2zH4
         Ntrg==
X-Gm-Message-State: AOJu0YxnAhPtI2pgKlTwz07fMRQglYTQD2/o6ckvCEvEAs5KXX5vnvyq
	//0PPqkZwSIDwya4+smVZ25EUScYbFchdaMXr7q7wbRX+vWT8mbgjIPfBT8c85iFW1NLWw+wX/H
	mdJQV6q/W7D0P1veqnv8xyPH1VmK2kf8=
X-Gm-Gg: AZuq6aLzVape3YOHudccrVoulrmCBMS4HOnh+gPwZ5h7mThmWtqeWuzy277ge2ho7hf
	Ini5Htcpdb9g3VQlZvdSo5D22bFYtBSM7m4Pdh3rH9qtSixrAbPyvKb0HtC96HPLS8wfSW0Dz9l
	9HLBBIM2oerovMaYABGYsfWRObrhXquApk9yOe4LNPMfO62kwmzJRgKxOQ1/+KUdDM0GGZbYjkf
	F99Wla9SZtD09AEwNizlQkXlcsvPC6BuYt6gErrYYIGChK6gVGDAFbZeW99iXxTdjWRcZxk6M3A
	izVlZqHmjgrnB7VCm2VGlktD4yutYnqC48gi1XG0D5MyoUyP1qMjg5HYEkQtGQEexiPoGMd69G6
	kTOie3NsdLuwT
X-Received: by 2002:a05:693c:408a:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2b710089fb4mr1341069eec.7.1769046923537; Wed, 21 Jan 2026
 17:55:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119202250.870588-1-zhiw@nvidia.com> <20260119202250.870588-2-zhiw@nvidia.com>
 <CANiq72kL9xwT-wdyGNpekmnXioUhwLjcayE_pkmKEEw+RDCyrg@mail.gmail.com> <20260121112929.5497b997.zhiw@nvidia.com>
In-Reply-To: <20260121112929.5497b997.zhiw@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Jan 2026 02:55:11 +0100
X-Gm-Features: AZwV_QhekQs9-amcH8X6hMqIMkD3M0IVxuBxjjtGtTw-9JU2gW3bh3jYidNYBz0
Message-ID: <CANiq72kz9a=Hx_tWLpSmmQ82MzO98V8-i+91qSutJvgKU+d-kQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] rust: devres: style for imports
To: Zhi Wang <zhiw@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dakr@kernel.org, aliceryhl@google.com, 
	bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, markus.probst@posteo.de, helgaas@kernel.org, 
	cjia@nvidia.com, smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, acourbot@nvidia.com, 
	joelagnelf@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 10:30=E2=80=AFAM Zhi Wang <zhiw@nvidia.com> wrote:
>
> Sure.I am trying to Cc folks who comments in the patch for crediting
> their efforts. :)

Ah, I see, thanks.

As far as I understand the docs, Cc: is intended to document in the
commit message that someone had the chance to discuss the patch.

I can see that, if someone gave feedback in a previous version, then
it is a way to say that they had the chance to review the new version,
so that makes sense. Having said that, if we did systematically that,
the list of explicit Cc's would grow quite a bit...

Personally, I always understood the tag as meant for key stakeholders
that you really want to explicitly mention in the commit message as
having been involved (and that didn't otherwise give another tag at
the end of the process), versus everyone else that is Cc as usual in
the email headers.

But I have seen it used in different ways in the kernel... :)

Cheers,
Miguel
