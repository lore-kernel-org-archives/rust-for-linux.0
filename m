Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A54C76C85
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 17:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550694; cv=none; b=IVcqvyRwQ1yUehCCZmzYcnC2UEpspVtS9HXtWfb+eg8wxXjBNje++23hc4U/EurrbmTd3fpVQlr/vCtuV7tCsjAyh+s8VduVPY6M3YnNKg7JYzrdnxU9GQs+BqAU3lqMIXZZ7tkZ4TMG5OPv8AjYeEkpXPt2Pi2CPJipl7PqpUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550694; c=relaxed/simple;
	bh=UOyST3FvBn6xuwcj5BG536u9lyF5Pa0S/BPugigBIgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aPfKyU4FRV26wcEYG9fxyxGEU4QGwnVfZibhV2Z2o0e876nLNAPIJ4nxSRVb3vSQkX013lQEvYOni+SI9uDqCU62XLL8wAdpySPk8zfws6gQedASzMn7AIkOJSres/qkD2QRTctok9FE5WyD3Dyy0Xzy/7RErrSmeRWGsAT/I3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d39zzrlg; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d39zzrlg"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5ff7a098ab8so29297237b3.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 09:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706550690; x=1707155490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0jB8TgYSlrIxbeTbYdYL8zst/hKXzpi4mTLfauIrkI=;
        b=d39zzrlgWTkk2OaZATEcSwjR2zA9xeCv+Dzl1UXeSVrqZ+c5cq+Xg9waUSDFIEZhKg
         vnh16QYbRNTzerGRlv+/T7BBn8m+sLjodRtCM7RMRJ7ChHBbzHGhMNMl/wz2lc0tti9M
         yfKaKewO3SJpdQIYmXcueYQB7m0DoqO2hig3hm1OPzlMuQLgf+qwtx4bZAImrr73K2/i
         VLBxQ6gPXOBFZ9wnOBMR9QcvavEIJt6LzrDvNahB1FPXQLxNWoMLQJ215N3cUbGtRCc8
         CvTf5Aos568lhk6oA+4atW6ZAH6VzzDwDoOE0v8PsD3psj4U0w8t5fHUJxrhGqRJuyAv
         IM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550690; x=1707155490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0jB8TgYSlrIxbeTbYdYL8zst/hKXzpi4mTLfauIrkI=;
        b=CdJAcL9Mh2VxztB96yice5GK3EOm62Xq/1l3byfLlGNCXIK7atTo/CcUYMldN+StgI
         4b4/WWYjY3+TuVhe7588s5QcyHsJvz05LzhZehND0FQQzmSMktRBzjnXtaqHuZKySioQ
         q2f59xBrNBDnjllf4uJJ7eD2czZPr/sG8XN1JxFpLTMAHbRJnhD+CFq3F563+XmaBmhB
         L8WgzMGIKwqXaHppCk6sK3sLv03Bnmm5YTuj+jzyCPoJMrzha2YMR/kZgKKbLEo4QVA6
         UbStjqGnLvB8kvD4xotQUhDkaLNPuXaTYVCVrQRBtxPmFipfUdx2rcCaDtVlBODX9oiy
         Rktw==
X-Gm-Message-State: AOJu0Yyslg5ULBAcs8tuGWuUqohW5WHkFFlByVII285hIDJqZbA7+uMN
	Q62Sa/2kaw7dq+Nk0QWcv6lsw+UzPkxlX/+StqLE4jrOGd36OqmSYFXaTy4R89iZsLUaXhpal6H
	KbmGRj2x2P+7Q7s2GQikN8Da+oBw=
X-Google-Smtp-Source: AGHT+IGlhFFL4+1+fH4t6+U/8Lw9XF6VaZ6a1SLOTRbbtIAvOa3LJ80+DpsgoaLk0HRQaYPpGkDlDGb8ZRloTPQxgWg=
X-Received: by 2002:a81:8d4a:0:b0:5f9:42d2:8709 with SMTP id
 w10-20020a818d4a000000b005f942d28709mr5422743ywj.23.1706550690507; Mon, 29
 Jan 2024 09:51:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125065551.2436403-1-dirk.behme@de.bosch.com> <20240125065551.2436403-2-dirk.behme@de.bosch.com>
In-Reply-To: <20240125065551.2436403-2-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jan 2024 18:51:19 +0100
Message-ID: <CANiq72nvTp+yQ3s+cv9=dxO7q3jv_iFpbVjxh3r6LLxQrfaO8g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] docs: rust: Add description of Rust documentation
 test as KUnit ones
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Trevor Gross <tmgross@umich.edu>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 7:56=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Changes in v3:
>  * Got the '?' operator link to work :)
>  * Rebased against v6.8-rc1

Great, thanks for both :)

> +This are the tests that come from the examples in the Rust documentation
> +and get transformed into KUnit tests.

Typo: "This".

I would also perhaps say "...documentation. They get transformed..."
instead so that it is clear there is not another set of doctests that
are not transformed.

Cheers,
Miguel
