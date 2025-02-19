Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA50622F167
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 20:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739997286; cv=none; b=EaSIdmTOaMCiO5kRBCogF0vJ5xCJAMYxYedUnbXHsFcxU7GKEaDGXa6R+90CNwi6IwMZF8TuE4OTwK3wFzrEd2UQgylayk8JK9voDgAphHvj1emsMIXuS43aeVvM03RazCJOUztocGgRxPGaBppnoI1tKKlnq1+R+DptIv0R5kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739997286; c=relaxed/simple;
	bh=0Jqf+omiFLsX4+96qMFq8xeNWsCoOr/inj2nXuUmJzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0vg1Mtj68P3yT6cdJitPPnpTklDouSNwwWc6rr05Kdg3P7+zKsU4cq3ggs1xb5gQYdlltVbDFUHdHd8VMY42hCzGUUUD82LPfuNfXW/8mIko0zNEE0kZoeXiMeDhaCFeBdbE9ZYLVjrZmla1XtZhhv6AjzDupp9uY3MB2Rr3U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=XVEwtH/q; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="XVEwtH/q"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e5dcc3b0c77so246048276.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 12:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1739997283; x=1740602083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Jqf+omiFLsX4+96qMFq8xeNWsCoOr/inj2nXuUmJzE=;
        b=XVEwtH/q3uwtahemtZIZYeVgKt2oPwscKFU1Ma8Fa8b/Pjkl/G6QTzN5W19YmDZGUr
         L8OPMduNH/bepK7iBePi7EJYxObBXWUSD+3pgcVJ7O6FNAYYhHgZ+E44WuLQ80k/dHQy
         J+FJr1wDHF+uTNt6rwyzIKPjUd89QCAkphiKLZiWR4HeS6TPlX82p6kcTsLFB8oIn9TV
         aZ/5KRF1prwWkJUKByVqZX6dnCax8MS153Vzc9opihcJs9vDSfExdMFTHtKV/fxIGjWX
         JHpBCaly0Za5g1oC0oXzSWxwwp3TSYKlNRFRMxe1nH7RzGdFR47JXdfpylDsrZEF6U0v
         AzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739997283; x=1740602083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Jqf+omiFLsX4+96qMFq8xeNWsCoOr/inj2nXuUmJzE=;
        b=q9IXa1QvoH4SOdM41TiOdC1lNUt7SxKtwjwLI4aCjKk4jmKYo+M3WzM1ZW2Pk32ciH
         sbU8oMBWPcfotBxxNtMc/77krzakf3SuwJrCgrzWPKYMLPXpDK7vj0rJ//R1gjtcsG3r
         fPsmRDY5Zpgjme4grD7YXq4j4vlSofE4CnNQMxVZpcqvXIE+66JKMTWaPw2Eppr6+YOs
         M81NLd3whJN3MH/ZEppoD0Bh2MxEKhtymUEetv8YfLTz/ljOAPrVARD4YgkoMZNXRtoU
         3mR9Kn+dn1KpnXnl+nYhZa9Sa09Vdtnwr7YZaCASsrfk7TLSQf4CGiHrtX1PQERa2Es0
         nnnw==
X-Forwarded-Encrypted: i=1; AJvYcCW0iUDtlsj6WCJZttbwVulzqtbZrRvPuuyuf8pOlbrN90pfskNwuKcu0O56jXgo+nZs70RchUovaquyQjlcYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ANpDVCqEaGiQPCb79INL0199Lkg7m8Z1jYu+rkSBaQ9y2myB
	oL2IlckPOdi1TkcwPD8br6uo20RmfDas6qrKvLBIUw/keX0xJ6wFKJF898zObht1I6r30ZCgFZh
	sAfqqNMTOTZr7FCCUfyVXWyi+LmwGPnIt92jm7g==
X-Gm-Gg: ASbGncvzwoEujhmUH2MhuJbxjkIMMj1mFJtHfddnpMTHrvlsN1PL9KwV3/lVA0Buj/Z
	Tq00uxsWgWlFI96ouH1xRy8L8fGTdhQj7DZD1iil4um1X4vuEbRyLdhhXg1Vevz65CQ5gyLzU
X-Google-Smtp-Source: AGHT+IGePlpcMLMtkO0p0cMKs45EJcgHTubpVnR0FVFgPsZCN8wY2WvKVp8xiCuIu+uMpB2IgJhvErQ0UfEdqhRd4gc=
X-Received: by 2002:a05:6902:f0c:b0:e5e:1433:d93d with SMTP id
 3f1490d57ef6-e5e1433d9d8mr2320341276.29.1739997283704; Wed, 19 Feb 2025
 12:34:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219-qt2025-comment-fix-v2-1-029f67696516@posteo.net>
In-Reply-To: <20250219-qt2025-comment-fix-v2-1-029f67696516@posteo.net>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 19 Feb 2025 15:34:31 -0500
X-Gm-Features: AWEUYZn--jUstxIYkGocBKiiriYS1hZyBvCJukvbSsj7phyx-28qwZS8FcNku2Q
Message-ID: <CALNs47uJKvdL4r9r=4iv6Y1TJn93aizOfXYoPCFc2ifwvSyTJw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: phy: qt2025: Fix hardware revision check comment
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 7:42=E2=80=AFAM Charalampos Mitrodimas
<charmitro@posteo.net> wrote:
>
> Correct the hardware revision check comment in the QT2025 driver. The
> revision value was documented as 0x3b instead of the correct 0xb3,
> which matches the actual comparison logic in the code.
>
> Fixes: fd3eaad826da ("net: phy: add Applied Micro QT2025 PHY driver")
> Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: Charalampos Mitrodimas <charmitro@posteo.net>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
