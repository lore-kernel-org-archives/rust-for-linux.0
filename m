Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DA6406812
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786616218; cv=pass; b=Fm6XfAKbfC+n1adk5Lq6cmbuphPqS4I+SbsiQWpNhwiP2Z2DkPFPkqc4+geVuF1zGqPkUNNZCux8RFRvTuFEH0o2vi9NAI/uG/8Yi6/AzEDRJb+aOWnKSTG9V38+5Vmns4A2LSstYwiugSyZFci7m9+y7gBBE9jAcDB3OXfOwgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786616218; c=relaxed/simple;
	bh=dAcsec4MBjkQqQsnIuy1L+PURVXLbHBQ/8BxeZ0fXiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/RGY6JWIBdlQ5sqAlP7dq5stlTQPu6ZVhuHz6nu4uK9QmLQBR44ywxnkyel5bEOGWPby5fgH5yyGzqOtO523VkkMIKzzgIHSg0heFkHTQ1nHuBZRXA1iPktS1bQHABRXuxbjyjZVlWD1tkWQOWmAi3hwjhh3EH0o605M4o2AFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rr1cHEgb; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rr1cHEgb"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf49dc28ccso3671665ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 03:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786616216; cv=none;
        d=google.com; s=arc-20260327;
        b=ndMwWxzhgCpPku6l5KeK7iD+reawDvOZSYZABOrhlYCYA5thm/1X0gz6eVJ6JVeJC/
         aon32RpACDsD8honTXNreo/tBBocnCA4McX3qcd9UxD0+zHbSIvcK8CYZzVsEpQllrmH
         HGpEoNFZRDGwwSM8rRrFzq2/vuC7s1w1gn/MAOgEABWh0tASK544gDxGm+z9+0QgtAVz
         2ErsapjpR/kpBvPu6zIXpyH12woLjFhnbNpNKsXHpt6kGGViIRq2r6gK3crUpIi+mfX0
         JPrsIKILXupREeLmsf2seBf+GGJ2F6teIjShftecYuV5yD/ALrbCP9hOoDoYZuzYtAh0
         SawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dAcsec4MBjkQqQsnIuy1L+PURVXLbHBQ/8BxeZ0fXiY=;
        fh=XPFB8vVMkBrNyOYJTYZ8gAdM+QvP/Jwxv/G3eGCDu94=;
        b=jgRbp5TDYmCpVD1DNTFbgcqvIe7gOteGdqoyINtsvUc7At5zqtdgSC1hBk7g1DqhXj
         L+lb79hrMoMOaIV379oJbrOO7oLvCjoyev3eZcC2Vfya5zOO5CCablaYoY/U5WfxKmjM
         QLQH5GsK6zXF5INWZ/0uy845SWSvCoVuUwYvueu+JSX9ynXY9va6rvlTRBhCpRAS3lY5
         5Z9kIh1B2Sh85V4XeHaCU91RJ/sEFtliKpFb9+qHYwDuODYdTDUH26FZFUmnqzZuZ6DT
         Dikrzs2Rn7PCpaevW3PwzkJPs2IjOZ1V+hAyjuY3ee92cVt9Z08dSZNu+rdEHNP2I6Ew
         ZkjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786616216; x=1787221016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dAcsec4MBjkQqQsnIuy1L+PURVXLbHBQ/8BxeZ0fXiY=;
        b=Rr1cHEgbaNtwXjpof1gWYKTmNzenY0vIi2Mlq8JTucfMFQSggnNDupJW3KWqfV2Z+v
         oKuNb29d2VjWVOG2iddWA/pSV6FqpyVoRGJiLzlt3sFqxmwi7aC4v7Ggsz87zgPtD9ra
         WUdpc/W6c4/kPdCKSZt/Z67MDtXxC0jHhwK6a8EsNX0b9AEanp/aLQh07bScbp5qvg0V
         9CUeFx7azQ6R6MvEhAksc9+xohh2yxSF7HA0ABB7oZlDE+9ha2NJQFbh8UXU4lnkz13j
         8BowKW4EVKzjb1RPa2XKKdTcU7CxcUgWQ5ve9y+njSNnx9fJEepcWLWal8XDaU/pIPD4
         pLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786616216; x=1787221016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dAcsec4MBjkQqQsnIuy1L+PURVXLbHBQ/8BxeZ0fXiY=;
        b=G+FbjKXV5FfXb5/X6jCVVG6VhLmEfUd1n4Hb3TICw2MiTtG8LRqGA3nJIwzzPlA1Q8
         c2jI3J9f3m8QoQwiC1yIEPvY08zthWMYvV9PItPMZn+sBQpUdJKejcjg2qG0nu6bz1It
         fxLvtPYh91SVwYXCqZiI77bTjbvRew++rsQBdKa1jHC02w9ApL2l0T79z7j7jD7ORtt9
         JQ397f46++f3mfzxu/8pu7Ps1DGq1MCA2WqCs5RKgYSuU4W6o+fJ6OnlqGXfUjQMXmm8
         p7pF+dR4LY9g4SSo/P3+mf9XuVl1farNXzsxB9bu7tGDmAu6AVhYVTLgV2mejLTfnVkt
         YLQA==
X-Gm-Message-State: AOJu0YwykUkemgY4wlneMLa22YQDlyxuH4ToBI5VPyfrpODqFiA48FyA
	uEs99LEfOPDp1d8MnoqXfh6i5RsmZ5YTg1Oe794E766CHjEbsIcwMVe21S5qPnB3LFfx+xORXZW
	LX2POkzjPMGtFJKJl87KVFR4ihPhxci0oyCL1bxU=
X-Gm-Gg: AR+sD13SzJm9MCF3JavZsjiIG+oYosLMStrlLaCXSU7VZeCmrR5RmNmXNg1gv0wEjjk
	lUMnJrrzExNf0CWxad48rd8V+UOwspENSLdAXFAwGym331wFBalkWXf0CbJR79FSyqGqt8LqPWP
	KMtSbw9FZFLK3flB81rHALzZOfHx1JXreuaNHeqqL5uk94JmVglUiLT9c+PGXC4DM90q1XCIkaN
	QA9oAoqGsESu3bYMBOrpWeCfMYOIPY4wmhTzmuTqBy6i9WqdtKQiYV3Qyb82pLvgo01eaaSl/T3
	7UwZrE0f6Vc2HzlmwKChubhHDljwEfpbtUAqs7FP/WTy5SXMcBzS+sOFwAhkoJfVQXXqqO0itrq
	ewOEBcoBlnqJ/OOuvCJYln67jCka4BglZGWL03CXVvbFSlwNwDm2mj0Lu8N7V
X-Received: by 2002:a17:903:b8b:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2d389bb91d2mr32117645ad.4.1786616216155; Thu, 13 Aug 2026
 03:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <OzuVxu0--J-9@younes.io>
In-Reply-To: <OzuVxu0--J-9@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 12:16:43 +0200
X-Gm-Features: AUfX_myRS-hC2b-Fgy2wgLElp9ZtexpC18yEJnlFXTodtdUnQe33gUamLZPyyNw
Message-ID: <CANiq72mftC+b93Mx_BNcS1FzH5vNHgCykwsoO9hmbpJxaTeYuw@mail.gmail.com>
Subject: Re: From<bool> and Bounded's invariant for signed N = 1
To: Younes Akhouayri <git@younes.io>
Cc: Rust For Linux <rust-for-linux@vger.kernel.org>, Acourbot <acourbot@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Ojeda <ojeda@kernel.org>, 
	Yu Whisper Personal <yu.whisper.personal@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 11:46=E2=80=AFAM Younes Akhouayri <git@younes.io> w=
rote:
>
> Any thoughts?

Thanks for the report!

That is correct, good eyes -- indeed, the `Deref` bites us again like
in 223aa25aee82.

Do you want to write a patch?

Cheers,
Miguel
