Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F774962E;
	Wed, 28 Aug 2024 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837240; cv=none; b=GuUJR3FYTtLLRPK7BlKq8VQKq76kM1NKN60rvOWkqasxMpZzrGluGSJbLwInySFZSO9zoQa9P1mA1RWLfebl4HESusWyG9ReA2V3vY3UvR5O4jgsVgQE2SAm6cBZHP117x3Rp6MV2FeP46G7zqPOnbgt5/5klab8fpvh0LhfApQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837240; c=relaxed/simple;
	bh=ghZnaAJ+VEThr3FH9O0jb/lJbXGZiKDJOo57uVGeV1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XB3MMuHvtOK92y+l2pH5ssaZp13T+XYF8b5D9QMqdunw332DS6VVOKj633RwvkuJw5m/W12MJLe+S1qrvFVveDnIInwrBe4LJwIFvrTl2iii6FRe4fru4DOvU8ARX1XslAKNOoWFIg182QB7ByZayltLgSYySlpYBisneZobN1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yw3Oxb5i; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yw3Oxb5i"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-201e2ebed48so4052645ad.0;
        Wed, 28 Aug 2024 02:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724837238; x=1725442038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSCip+Bemb8ICBMigULdX6HCTnC9f35hc67PS6U5/Fw=;
        b=Yw3Oxb5i2sL0SZmWLYXCjp1j7ObsP79ViTJoNcp3ZrSOV7EbdQ00aJ80LOIRMQ+zOz
         xDA03Q7lnj4/WD7KG2t4kgBVdvv3hvEIkXNdjiNbUk3xtwHwFJTK91Wxqo8F3Qy3vCf7
         NRKQVHlu1D0n5ZtLSLc2VKHPEOK3IzFqa4iQF3+frfE4+dZ9noZbwLMtVE6GmTyBOFca
         EcIOjDnmCLIUBg/WeF0SHA6rVQCSatkezbUR40MmgMHHEEkK57/lprGvzxPvhen5SgOb
         zptbCXNR6ACyHf1LbXH7UrK7cvv+yQAMJAWgHC2PyytCG/scsJ1CDMBh5x2yeHC1bbu8
         Vh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837238; x=1725442038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSCip+Bemb8ICBMigULdX6HCTnC9f35hc67PS6U5/Fw=;
        b=il4w6ePSZbCzZdnaZEnpXblIkJhuMF6k0cuVg5mXjnhoui6TyUDOLlu0COD2fVJOaH
         mtGUeU7D5/6QpYSL6cWpjJSp66R/0RaOqJfEfY9ZcHtzIdcX6xvOErLk/QkkImhnJt/+
         +wLs/fKRhky55siUG2o6bXhesIDvuz7V2XKtHehP5r36+Gh0moiR8vOiB4Au+xUzXuYO
         32bMygU/lJyPQO69b1VW7Qf9Ovj63QlcvCs1LGk3Mw71fmwtGlf4BZy6XxIjmoOkbu1y
         6nFJasyzVCdZ6Mqfz+LWtCTz3yFGMe0nIjhFQBrZcQR4hoU6ZP7C5z+i049AwPG/1u1N
         mEvw==
X-Forwarded-Encrypted: i=1; AJvYcCVCNGuVjJx/F9Bev3816XsKf+iSapQeUxSVqjAgG1c9qS2zdF/kIsFsRyzMz2MkzTTXx4CEwwpEypahPQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM2dlt0sN/q1oLR0QdgeEj1ET/NuKaWYdzw81z6Z8EbIxin6TP
	biSfmobbMV4pMvgaBGGk4D+HU6DwsI00Pc+hQ8aCMhCe5rJFp9DtapVnyZhrM2WLbfG6RgD+Oo5
	xCym4nQO08AFuMTQ+lihnUqxVChhZvKgrvxY=
X-Google-Smtp-Source: AGHT+IHyABdB0poHBT0/yxTNrTjxAPxluXkzEFpqADvsChc4IObbGax1uCnmgL3SyLpTCbNWSKm7+t/J+ZYVTPfTe38=
X-Received: by 2002:a05:6a20:6a0a:b0:1c6:a62a:9773 with SMTP id
 adf61e73a8af0-1cc8a0d328emr12063523637.5.1724837238318; Wed, 28 Aug 2024
 02:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827184359.46968-1-simeddon@gmail.com>
In-Reply-To: <20240827184359.46968-1-simeddon@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Aug 2024 11:27:05 +0200
Message-ID: <CANiq72kOKAB6ptLzGDuRe5wStppAqWZnED-bcoUN5V5MYO1UfA@mail.gmail.com>
Subject: Re: [PATCH V2] scripts/checkpatch.pl: check for non-permalinks to Zulip
To: Siddharth Menon <simeddon@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, apw@canonical.com, 
	joe@perches.com, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 8:44=E2=80=AFPM Siddharth Menon <simeddon@gmail.com=
> wrote:
>
> Zulip links to https://rust-for-linux.zulipchat.com can break in
> case of renaming the topic or channel if they are not message
> links (which are permanent links).
>
> If a non-permanent Zulip link is referenced then emit a warning
> and direct the user to the Zulip documentation.
>
> Permanent links are of the format:
> https://.../#narrow/stream/x/topic/x/near/<numerical_id>
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1104
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>

This looks better, thanks!

> +                            "Use permanent Zulip links when possible - s=
ee https://zulip.com/help/link-to-a-message-or-conversation\n" . $herecurr)=
;

That link is better, yeah.

It may still be a bit confusing (one needs to search for "permalink"
inside the page), but perhaps Zulip will improve those when they
introduce more permalinks (?).

I guess we could link directly to the section at
https://zulip.com/help/link-to-a-message-or-conversation#get-a-link-to-a-sp=
ecific-message
-- it may help a bit.

We could also explain how to shorten the links if the line is very
long, but that is probably best left for another patch (possibly
another warning).

Cheers,
Miguel
