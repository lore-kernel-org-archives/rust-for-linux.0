Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911C338B140
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 15:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351737; cv=pass; b=k5/H7MKJYqmXhCOtDIDj6xKvmLn4lrivziGvQWghe8s+Wo3bJXyKxqWsgSVw1w7vaj8BTWKSZg+fFl71z1Zr9owMRpxzhIJXLEqq0/PVm4omRGCEE9uSvxi8w4pe5PUm0QKK53Bp/IvIpxmYQM3cjpTTkM7kmeVCp63nnuqQhzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351737; c=relaxed/simple;
	bh=7k6DeL6ujQWC8Az3boiJtx4HMnVIMtLm4gOs7Ec0JAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmh2O7d1pPU45a+V1gwXnPNvrpaXqzwOjiICoMn760fROme39Um7EKGSRiPvz1tosOKDpxQlzuIfUV3quuOK50VxVb0p4ICSlKwRBu/DES1akJXy/rlxdd6IaHL2348uCl/RuXeGEDxzABtzOUiNqHkvJlGWtTJ/SGh1hUQcGZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QV+HHMuA; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QV+HHMuA"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso81927a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 08:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783351736; cv=none;
        d=google.com; s=arc-20260327;
        b=o/KBdPxxlZM3DMbPxM5aqd7PkD/HZuEmfO57VVqIWdOSFI4JupQd9GbVNxHvrjipm6
         I7Q7CzhvbVRwsj2h4HNmdUBswqV0RY4rix6VJTtSKkxxn5TebQWDP+dzs+B31Z+UXG5V
         svZAizl24Dq0qyY7Q/ibz7p9h/3+pSw7qnXT0hcajN+0GKbh7GisS2yhBn1zFVVS56Qw
         i4Wh4nIFUhpe0T5KlyrOVVHXAX27dUCi7xhKO1rITHbCCR5BXwWnFNec7AdgpqZ1goVy
         cZr+Au5Io7gpDKCR+xkkzemjpdAManS1nSjkIH7xjzlswim6zgWOlbYI2xRdKMQCF1UU
         SKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7k6DeL6ujQWC8Az3boiJtx4HMnVIMtLm4gOs7Ec0JAo=;
        fh=uEMlf2UtFYMV2iAqAoaQAV5U+IKDy2cte3o2JVhpqP8=;
        b=JG6nr+kt6qovWwIrVZXlZ9S4Wu5xll8GtK4/UvIb01f4PTFjkqrc05k3ZCuhcbpHoo
         R5YLehkkoQ7qWhf36/br8++s3jn2DavhN/u/6ArieBoxpNzoiXIwiqPXz84jNGtPn5hw
         zuph2we35xZ7lAOxWC1/i/HQPptjk3DEC1cKqUO6EXFfi+Le1XGVuqk8tmJFltBbA/cV
         YmMhEBh7Llzt7nZxFKxLsp/ZvdYg/Ix2mMYZmLGzMC4iaOBv0K/mpm3N/v2Umt9DbxS7
         8PeQ091DuYBWrBoYJi0jVIiUPTh3JZxZ5ntMq14k6jg4tGvkglgwehNiUkr3TdiapwQj
         pM7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783351736; x=1783956536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7k6DeL6ujQWC8Az3boiJtx4HMnVIMtLm4gOs7Ec0JAo=;
        b=QV+HHMuAgmhD9PRk7fji0v+Sh36Fvq1RksQaTL9n0iOtkpZY6+9QPKSWp6Umr32jam
         uel8jtMbwg7/CtR45PZ6y1b9MZrNdYOqo/QEkIr0olc6KZtYaj4pphx5GGLcVzQhfZkS
         yx4YvmhNpUwiHqtHTvzyhIymGLK644FHzObRncaNYriF6JnZHQ6uAOznqOKi/34yA045
         JAyqn+lKld72NVADINM4hbdfA39EhqibDLpAuoYN2Av/6LgOurQAwdj33/Mn4uxrvLBH
         F0cnTPjQDcwPBQbmH7m2BfSyIuG/fTfVJG31F1rnGawzFgiTusXihndTKWXM/vPpinig
         HLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783351736; x=1783956536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7k6DeL6ujQWC8Az3boiJtx4HMnVIMtLm4gOs7Ec0JAo=;
        b=NltGi8v4gR20cySzf/ZTRILH6pJgaz1/6p1gGDRUqR2bTwJXetjd+NPLae7cJrE2ch
         /PY9ePGjKzY3uiWCRUT1sflX33+62x0lyijGPbMk8pfDKe/3U6GHnPsBipSXYIKoK5Lj
         iVpcArcUNO1pE67AzKGkNy8Y1x9ob9kQX/3O20cJCx35rVrRRgnWcd8msBZCJhoqUwnj
         +94A79MY9zV9bU6halS5Ej30QBH8TK/PSNgt/JXyuVDQXScw6fsUjLHwF1M1OqVt+mOp
         PsJTg3Xtf5CsAnyTgs5kY6/MAN2e5u0dCAYpf1LacHKpyh89dyD6H9FJDYbFbKy0mK6S
         DoHg==
X-Forwarded-Encrypted: i=1; AHgh+Rr962ePyCjCf1AWZFTkQylP6Q4QFnvoUfs2RQx1AGL5XVRyHpBlc4SIc83wn+GK3gwS/7hfOcaiUSz1TbSStg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp5/P7xC6kCK/qJsH2dwTnuAhN+J3RHcWDpYRkquxsujlrS38r
	IIFqgBphWxdliTX3jeKQnpDgyErC0MEw20NHYGdkN8NNQcRyEICpo/K3eesQm8uC+zcuXlVu40R
	E3xvYgxEyujuGD/0FQSv9eyLG04sU4jU=
X-Gm-Gg: AfdE7clnseKH+K7mKSH2eMu5k4c2EyIMAw3sr10EHZPgR+syeCr2qC3h3GNW2VhOBpP
	JBfzuKDH9KTqC4aI2nMabvQCwz1iRWZiTnezyxVGTmFqOhryIbPHZ57IL2DhOM5qnMjOv/d4yp6
	brQZ9xoWEpE2Ln+2AWNHgtbTTIKlS0khZSSWXiZ5mgwLzkiaePsAPYf7JCBns7oHgKBA4WpiOd9
	FOs2gxhhShipIhejBmDrPlj3ibuhXMVE9g+Mu5Rcu354tpy1+QQzBHHVwuQSVuL5CzucihQc2x2
	0QjWVVmsEthRhsQufoxWpp5ymeQJUk0jnJFFsW0gA8Aahr5F2LqtHQtygzBKEjA1oXxrlPT1dlc
	NmUQTrTRfbIAG
X-Received: by 2002:a17:90b:3c91:b0:380:7688:fc06 with SMTP id
 98e67ed59e1d1-382a00c393dmr6538387a91.8.1783351735962; Mon, 06 Jul 2026
 08:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705-net-vert-imp-v1-0-95a35ddff411@gurudas.dev>
 <20260705-net-vert-imp-v1-2-95a35ddff411@gurudas.dev> <d2c1e11e-e616-4b2f-aa17-5eb96f045833@lunn.ch>
 <DJRKZD8LBXXH.MCISM5ZLNVMP@garyguo.net>
In-Reply-To: <DJRKZD8LBXXH.MCISM5ZLNVMP@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Jul 2026 17:28:41 +0200
X-Gm-Features: AVVi8CeWDj_fcpRxlY9LHajh2MWaBpJDhHsu09AJf5QyOF1UjwXW4i4yZ6uAlV8
Message-ID: <CANiq72=-pEL+CHL5uhmnGna4xjEWnrJuD=FwHBwtdJryie+X4g@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: phy: qt2025: Use vertical import style
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Guru Das Srinagesh <linux@gurudas.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 5:16=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Miguel, do you think it's worth moving to Rust style edition 2024 before =
we
> switch the lang edition?

Maybe -- we could easily do it when we remove the `//` comments, i.e.
we could have a couple automated commits applied at once by Linus
before an -rc1.

Cheers,
Miguel
