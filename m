Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0329822D4C3
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 01:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787534050; cv=pass; b=Gl60vAGNi0tq4MiIH2lVb2bqqmm4hlqyMtvNSI60GvuRwQBQ1w9UjMyP7P625BFA+hkhZB2LmN98ddhnLEBR74/kH1vqPjsF9k1DTHoSei9QcAyI9jF7LEMXeajBSbBv5je7odGRipD7Rc98/HONyVP1Ce69lrqYAJJq66ejwaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787534050; c=relaxed/simple;
	bh=hvFYsBZoqw8WCD3IQaLdxSawAjBpcqetDrRE8izjGGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TnNbW7irRUlD244x2RLquzf5F7tm36fx5BtPvM5xXyh7GPS67em5aUkpgKSFSiyOOOXzEMDl2Ru3ROGznglJgWK+K+AKQav+9o+kua4cdT2PNtRAZ7ASc/4CxYZHTkJa4SjwRv/bBh7mDIcj7gD/YgVFjXwEAYdc98LqYbtKBgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NX9btblI; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NX9btblI"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-384caf7b168so252728a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Aug 2026 18:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787534048; cv=none;
        d=google.com; s=arc-20260327;
        b=k8SwnioLSlD0zRRo1+NO9VHY7vn8NvifiHwCOh4boK2P+1iMcuRBS38SEuQnou3Z7f
         GEqD10qa7ia/wjnBUv4b4aCl49VDtoay4OUQARDHLyrJ8eOZdBsiJKidB9svFSnBv/eK
         ALe+XzakjchJTPIqI60ChyPByE4xPwnDrNtB1fwg3duHhBxMVvnTCSkFn/u50EU1IUsA
         IeP52QnsNirKlqVCoTCSWQuuW1+RfeVLlgZl8D78r2M/cAotQz9MStTltNJvXlGx56kd
         SofNV5f3IGaqGIFisZAkPHLRbtYgmG04qhQ9bNenzErob08bFZGwYBGMKv2YjQwpz+lk
         2zug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tpBdpK7zcgEaHgt4RPqI57dxMXTLylwwECoiYOoLVDM=;
        fh=5prsYnXOznpwZvkypWgQ8hUaxeD0aez/hmBu4ykAiw8=;
        b=nPzJS1j8tlPLbNf2km4+VNepQ/jwQXtA9rL6NZZk+XT2IBfG130wxhtTdZ155TNdFu
         URNMYdJWL+Q8M5eXGaSb/g/3u1/T4ffEgYx5cZEYbBDVXMO8TGqu76iryvUlVDClSfo0
         iGoJJIRc7erb6PNOffqZb9Vndr0ZxcpKvEiSNqlhxNu/wc04RvRzCkZeXgTm9SKItDVM
         hEr+O/h/r1Tq1L2mygHaGYLuljw9LDpmOOJeoMnbKgZICoTk16RpgUGXBIfDm7Lvqd15
         Vs6OFpVXrvH1oWT9s6qYzB67xBc2xWtGG1MwTzDy4CHGNsEKN9GQ2hZH41ZymCHiwcv+
         bLFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787534048; x=1788138848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tpBdpK7zcgEaHgt4RPqI57dxMXTLylwwECoiYOoLVDM=;
        b=NX9btblI0hqpoLocYPZGwoz/01b8kkGUKr0Vk5ntFh2Hl2qyrBBRo+vqOU+LTcpSB8
         XGmTokzUvnWzGEOyCiYnBJYMn7Rkpq3XW6S5BGQckGMMQUBZbdAkqF6ArX0qiBX/aT5y
         uaIKU1iSIeLAkK2v3mp6sHcEYD9WNSR3s4SxOA6wuTblATi+rvgj1FvNQPUJMsfFGKLa
         0FPfougrliIZQ0411N9PIYs6bnhpd/XbxzRHHU/QK1zcWhRON3fLkbROgiTVc3oIKAdd
         H5KwVatrtDfOOz9N0AzSOQICwYj4hhUubg7cpJe2/XLD+IjR+hCoQelWiyRWIk8+kBvP
         eedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787534048; x=1788138848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpBdpK7zcgEaHgt4RPqI57dxMXTLylwwECoiYOoLVDM=;
        b=GFyUxbZ3oL6QmvozJrqAK17641yIKRZxDBXYITOIIsMgffJAFa1C1R0lqxTK39Ipkm
         lhRrOlX0ZI5tJ3Am1ux5O25IecIHIYm7uS+uJDE5Ig7yEOOF0q6+mMdldlB4eWsi48Bf
         BPHqB/+60EzLcPevSZiehBxuNiOU8eRFT4+T4XLU0OcA/oOKcPTIUBws5d7zY16KT+8T
         ScHluYCO5LJpl/pzDamzM/Tjj9iSGsNhe7sfePHjsy8yuCoz0ZrY85EoRRYgntGoXXre
         EaP/NvhuyEJoc9OoBz1jO2mpYeLjMSBqsN7CmbRlHrGvRdNLfrF/JCBGZN3s1EmqTZ/r
         U0Ig==
X-Forwarded-Encrypted: i=1; AHgh+RpLxFgqZLNI+NIS53qGIudpOXpPY+umNKr/RZ2/8Zu9OXY1K3fEEeLE85dayXfJwbbsuBphoHHtxJ2jfta1kg==@vger.kernel.org
X-Gm-Message-State: AFuF++nqFf1/rn6Lb8u56jPn6rFWIFM5GYbSeIK5afd1LwqfAlkZoDtq
	h9C96ZwhqJDyIYkvrq++MjXejfdyWO1QI0Fy8HdE5Ki/Nv60TdEZbsaHylajEbgWnW61Nzk4mQ0
	uG1XFMZUdvbFr2WX50LKwsH7qtGsyOPY=
X-Gm-Gg: AR+sD13ZPH319wTrgpWkaeSnKZVswPJuL+mWBby84ue4oHZE1ujBqDfmpW6rv6nAIlU
	1g+NUgnGa1iGVi3254pS7Hp2xTaiIp/oyDpCcy1kDga3be+f3BhYH1KUGfG9YGHyFiR3GWulqHc
	Ue7X5pqSGoxMouEC6lYEgs7NNJfo9/gw/rIDCqYKbQIHZMSzr9JtxEF+RkHq4DsvOdETp5bdpOX
	8GI2bmrOzhi2r23KyZNHZle80dW1lE/B+SzsEd3Cw4vd7LumZFDEPX7tqWUdtIDfJ/fr1UtAAHD
	HJq/dgmeIkUTes8prQdbsRxJPk1A0sw8Xxs/QewrLhM9lZ/gZCJD1GCzCVfGmfTqHBw8S39KyTP
	CfgWTLc+Z6USC3+s9NMz/3ZQSZevjbSUHySnwP6/RJi7HXoBfD8jCb6a6QdWR
X-Received: by 2002:a17:903:b43:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d64b0d7b26mr197324495ad.2.1787534048213; Sun, 23 Aug 2026
 18:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810150322.61809-1-nikolai@nikolaigrlica.dev>
In-Reply-To: <20260810150322.61809-1-nikolai@nikolaigrlica.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 03:13:55 +0200
X-Gm-Features: AcwNN1WFPzPgInRIP7BJcsyL7bSsfhSPCDf9OnGD0fa7wbhkj_D5VY-xMGcaVQA
Message-ID: <CANiq72mgtM1F4z+9EfjvPFY0ZuaD5L7SedffKq5FgGTNo5qhPA@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: list: fix incorrect pop_back example comment
To: Nikolai Grlica <nikolai@nikolaigrlica.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 5:03=E2=80=AFPM Nikolai Grlica
<nikolai@nikolaigrlica.dev> wrote:
>
> The example uses pop_back(), but the accompanying comment says
> pop_front(). Update the comment to match the example.
>
> Signed-off-by: Nikolai Grlica <nikolai@nikolaigrlica.dev>

Applied to `rust-fixes` -- thanks!

    Cc: stable@vger.kernel.org
    Fixes: bf87a41b85d6 ("rust: list: Add an example for
`ListLinksSelfPtr` usage")

Cheers,
Miguel
