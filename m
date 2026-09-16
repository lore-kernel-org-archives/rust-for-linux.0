Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE8B44D6B2
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Sep 2026 20:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589625; cv=pass; b=JkrOyzYFF6Qc28HV6WFadE5Gb9+7VPPOYqqjcXYE0WyDv+XYcnSaVZTfEdo1SlmCplC11W8mNf2uO8LIxLQ7VLr/YkmPQ0CTBUr3/NmRJcOOYDx7cldGuk3DSLzFa1FfBe2Bl3x3yrFIpdVd1xOy2VNL33CDJBIftojjShnJN5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589625; c=relaxed/simple;
	bh=S3oF4rsx6XJphFYJ7DL9HZl/H0W5gH2D2K8F0oPRsec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/v2DhRQqdWXBX7Y5pCzTGL3Xq2KLSQVoqHF8qZvaXkZ9RmZmLlJB82tAm06mkCXNLxZWsnZDsV7x6O+6mHUCO53NkUR3wGK+SG5CNqTtcnovaYntiWQxIGzWQ5uBT6wrHkLdOUjsI71kXHWYb9X0ETYlxBuY9R0QRna7X/sIFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=Igh/NUia; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="Igh/NUia"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9105d241693so620126d6.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Sep 2026 13:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789589612; cv=none;
        d=google.com; s=arc-20260327;
        b=jF2xLtLFTdzueK3dmF0UDtRMadmGEImSWD6Z1U/mDMA9QTxmb1uxLX0hEadS1Jar9j
         o1ezHARbXGDbewStsUmXW1efiZbQsBEty2syYYFECykJDQ94EU+tf8gtDVCeN9irE6bV
         UrOTLrXvyg1HRkJZoK9qhebwlWfQjL6RVmFFe6LzWWLfCMOBqekdoK5bqTl9NeI83REE
         ptw21HsS6WGQdhAsLHHunIOlrhoG6FNFPfS/U4JWbzlsRZ/JT11v4CnB7dNXqp587Ngi
         Jhb3jfbiNVZvHsHL498Gzb6RuutfD9ni8BH7w2zKS6Yh4P0VX0MSm3nVzju8EY+owvhd
         REag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S3oF4rsx6XJphFYJ7DL9HZl/H0W5gH2D2K8F0oPRsec=;
        fh=eNQtVmW9FfHfvqSKCPRGbXBcBBywVSXs8nqnKUb+tSU=;
        b=IkDt0Qq4/LfqhxOKCmk/mNqqRhrFJL0vA3/oH7gLruCijyoYmnXjd4uAXeLC88E0Uw
         cTBPeLGx3e0IrTxIU1LH3henuq1VqZ0qHqXxuHQZLj5B+4DUlF6RqnkXRkRt+MSYXorM
         vYrYv2dnpCaNY5tYhxuQEUU9r67Y5tZJbJktnNgBeaZdcPxqfT+z3oC+PZLYdpAmYGN/
         ZS/MAmLAtzLwCd44570uyMwbA4bJz6uKFWu117N/KbXHOB5E7roZfp90qYF0dSSb8mup
         TrFAYhiZHGhOkUhp+aXk2hOFrVztGQnLmp1q9pqb8soCAlpcRCOOe87F41fNgs0Dmr27
         pV4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1789589612; x=1790194412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S3oF4rsx6XJphFYJ7DL9HZl/H0W5gH2D2K8F0oPRsec=;
        b=Igh/NUiaUnlIsxPcp2FArsesuM+Kph3TIKfFTR6gBLQyRKhO7qhaabNU1nFrfyIVIG
         mLAZ9B24aFJbqQQ5bJYDlv4vHh//yVKzhcy6HfWAJYyE2D1WUXhhxHUuLuUDjcEQfpHE
         ZpB71LQMveiCyDalK3nxNdDbmshcUnVI9cAYZmOYJXHh6YUkI6518Ay05ztOfRXfUCte
         DPScYkTqfnWkuXpR4rtqI77ep0KvOdcmScd9NnSyqednFJywp9ixx93NIaZojQEQgJKo
         EEXt/TrTlw/nPPCLPj/Ga7RujdHLFKNhBU6+IsgOfq7DX6r2wWhAlLbCdfLwcnL/lVQc
         EBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789589612; x=1790194412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S3oF4rsx6XJphFYJ7DL9HZl/H0W5gH2D2K8F0oPRsec=;
        b=BSUy5C7AeY/45WTVI73ztq829hmxqOCGtKYC9mlS9Otii4x7XK6WwHAMXHRp3Joxkm
         O6MHpb4MPMlldUDeA841KWfDfp+gPYNlgE9oKblDcVUtD0TFbYT38H5yFERN8r0Bdhq1
         LnNaND7wTxCa2XXdEunL/zvfWgqHZ2e01J1H6aItp6Z54yR1eUDPz5tSTRDZlnxFCFiy
         6YOHACAYzQjZAGwxshjAQVR01SJm1fbQAnTnnQ5yyK5wUSpQBzfynUkYeKlpNyRJKB18
         ebPAfeGTHlhHWJASPkPiuijwgEWSxgDzwDZVZdFXXHELjyUl4dqkQAfuP0sPL+v4DmkU
         nkWg==
X-Forwarded-Encrypted: i=1; AKwUvBxrJT2lZ/fkLEsykETvIrXO/SVTwsQrVu+gge67BnvqPr+1VxkCmm9HEabr/Q7L0jk/82O1lmWh8uYHNA2AOA==@vger.kernel.org
X-Gm-Message-State: AFuF++l+gi1dxC4Jp5nK8ZOgdgipSsbpoNKD/hVqlDSYfuRjABkxLbWI
	xnn/bFRefI9/TozZ3+Na02Bbxmsxk8xuxqU/sEvNQ+++8ghjm8OD1fqadgs82j805UdIpNKXEm8
	v8BtWaX+2P2S6rX4eoP0i6Y9jhD/2uHbyvwo+vEE8Hw==
X-Gm-Gg: AYBFou0Tv7nzz3i23yB55OoApt0iH8TcXRQrolQtLf77YG8riPWj6Qg+TlUy/QQXLNi
	uTbuSMz60tfAZ6OgDWTddIhgvn8s5ECTIPofbP/hGrPf2DBKxG2cmDkClN+fD+tolRMyfVebu4S
	zHfuEDDv9nARHCRF/7sxOb5ceRPjwhyIQh6M0KUCYT45Mh5WrYcHVNtGX876aBCJC5ECSytBVRd
	UGGi+F6Aiubv117RNmRJhLSXeYC/5DtnuNrRO3Q8OR1uH+azcHNxIFkXHAV3/ViTppsTfMhX3gI
	u/oG+AlqQANwCsky1tEQSTtmUT8Uo9ovLFALC8GTPGC2gUuTeqZ9MMjdf0fbP9B9gnaezx8h/ZZ
	ZPdtYvIQ7XgbWnw==
X-Received: by 2002:a05:6214:5906:b0:90e:9612:c330 with SMTP id
 6a1803df08f44-9123d703895mr95041126d6.4.1789589611934; Wed, 16 Sep 2026
 13:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dr-4ZXYvFqamrGT7sNDgGGci-fvvY9rMjSg9s4XG_gslBqFmVHmmd7yEt5xN5mBU5MlsdK-uvAL4Ydfz0J86Sw==@protonmail.internalid>
 <cover.1789420324.git.pgovind2@uci.edu> <87cxud4ja4.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87cxud4ja4.fsf@t14s.mail-host-address-is-not-set>
From: Priya Bala Govindasamy <pgovind2@uci.edu>
Date: Wed, 16 Sep 2026 13:13:21 -0700
X-Gm-Features: AcwNN1WCWaOBj3vZW8JiVncx5cGVlQ8lvEJyeauk_dtu7PCPMCVZqVJJmReWffU
Message-ID: <CAPPBnEaYfvpuN4XtKZfgR1TETNkR57RuLimDOb5r8EkTbcXpig@mail.gmail.com>
Subject: Re: [PATCH 0/1] rust: block: Fix unsoundness in `Operations::queue_rq`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: boqun@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	ardalan@uci.edu, zhiyunq@cs.ucr.edu, dzueck@uci.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see. I agree that that's a better solution. Thanks.

Best regards,
Priya

On Wed, Sep 16, 2026 at 2:50=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Hi Priva,
>
> "Priya Bala Govindasamy" <pgovind2@uci.edu> writes:
>
> > Dear Linux kernel maintainers,
> >
> > We are developing a tool called FerroLens to detect potential
> > unsound behavior in Rust code in the Linux kernel. The tool
> > internally uses an LLM to detect bugs.
> > We then perform manual analysis to verify these reports.
> > FerroLens reported the following bug in rust/kernel/block/mq/operations=
.rs:
> >
> > A safe `Operations` implementation of `queue_rq` can retain a clone
> > of the provided `ARef<Request>` and return an error. This should not be
> > valid under the intended blk-mq ownership semantics, as an error
> > means the driver returns ownership of the `Request` to the block layer
> > which may requeue or end the request.
> > The refcount of the `ARef` is expected to be dropped to 0.
> >
> > If the driver retains a clone of the `ARef<Request>` while
> > returning an error, it leads to a mismatch in the ownership state of th=
e
> > request. The refcount of the `ARef` will remain 2 or greater.
> > But the refcount alone does not prevent the underlying C allocation
> > of the `Request` from being freed.
> > A driver with such an incorrect implementation of `queue_rq`
> > can lead to use-after-free.
> >
> > The Rust `Operations::queue_rq` documentation and type signature do
> > not currently state or enforce the restriction that it is invalid to
> > retain a clone of the `ARef<Request>` while returning an error.
> > Operations is also a safe trait. Stating the restriction in
> > the documentation may not be enough as soundness depends on the
> > implementation.
>
> I am aware of the issue. We have are fixing it by reworking the
> reference count on the request structure and introducing a typestate for
> the request [1].
>
> I would appreciate review tags on the change.
>
> The change is depending on the `Ownable` series being merged, which
> hopefully is not that far into the future [2].
>
> I do not think your solution of making the `Operations` trait unsafe is
> viable.
>
> Best regards,
> Andreas Hindborg
>
>
> [1] https://urldefense.com/v3/__https://lore.kernel.org/r/20260609-rnull-=
v6-19-rc5-send-v2-38-82c7404542e2@kernel.org__;!!CzAuKJ42GuquVTTmVmPViYEvSg=
!Mmu6zot6sYJyX3kAVFwlFI5CTUE48mHNXBkT5jjgxS6Y8BBntxgWOKwJUXFuJezuLmGMgd8SS4=
cUwZoKcskObA$
> [2] https://urldefense.com/v3/__https://lore.kernel.org/r/20260910-unique=
-ref-v21-0-e83257373062@kernel.org__;!!CzAuKJ42GuquVTTmVmPViYEvSg!Mmu6zot6s=
YJyX3kAVFwlFI5CTUE48mHNXBkT5jjgxS6Y8BBntxgWOKwJUXFuJezuLmGMgd8SS4cUwZppzzXx=
Ng$
>
