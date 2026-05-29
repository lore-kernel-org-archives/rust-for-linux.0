Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04A63F0777
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 16:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073819; cv=pass; b=Wd6pF4FsH/0ycoanbhNvo4PrJqMMY+BH0cPsygt6MfqrETn7iPdLMIkFqd2w4TD+HACCQFWfmzXkmQKcew3bWT9fSpHpk4WwlWKsKMpcgm0iR+xo/3zlYf691QEFpan2vYB/AvsFw6T4zuE3ewEScpo4P+M0toR/Tlf7VuUEI34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073819; c=relaxed/simple;
	bh=Cqj46itu7YvhryEp4XiC09o/JiR3dUKvq7oz0vPTGGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lrNsnRrynwkHb+d1uVssMO6/nboiGj/KgwM20Sue0sUPA8sI2R8rmDNytLcYBAPhepcHAXsw9acat2l+Xtv6/3Bu1O9A3466i6RFWYbQ2Qr+fi8ImXkCcqm1ZjkF/jhBQEpNPOO/nUijC4r7VM1RSVcevipFE4PnitbVNN04KgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2Og7CjR; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2Og7CjR"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304dd3bb7a6so165573eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 09:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780073818; cv=none;
        d=google.com; s=arc-20240605;
        b=HpUD7/BQ/q2uJLClMvE7wpXzcD0gc34/C9oixCG36J3fh04eDtx9BCC082z18SghNN
         84/tbXVSYgEBKmtURT/CnjWkMhDdKqRR0HS17yG4MCtfIIQFHWh/MG4STKLaCjWdViYb
         E+mmcV1p7HaxNDOpYvvkwhJ9p/V3QnDwQeIfc4NRoQYikGG4GUmxRTl9Tf5r3cEzPB9B
         QJn3yX2gma8FPWM6JHnciF2hekhycx7Cp0raIg7l71MzANVeYgxYvybCMZdCtD/kc2nw
         ZzxDPyWmSLZ8sbF/qOixlDIAoFKtKf7yRBcqjWgZ0AVibpXOSHIMs0++Ee83872qmzSc
         BpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cqj46itu7YvhryEp4XiC09o/JiR3dUKvq7oz0vPTGGw=;
        fh=Drw1SF46JVPnnH+23k5O9m2ZCkCuG2jNoCTfPFgn4Qo=;
        b=Q0IEJXhBIgoL2PWn6O3husGbnG9UzpZBoJfbkHC1ZMGmD6YoW4tzAk9FLPTvfbCikt
         ie+bVYHybnCTmFlg0Z8z28AHCquh4OyRLvLU0fX4j08kssH6YqXbjo0rpU/mFV0iTo2A
         GVA65LXMKoNUOqNjwLK9soTGtbhe+rqeZJM3pidnQlTwnp5ZDcP6WCQInDwngsF1+2Zv
         WsNbe1p+5DnCMQof0L3w3CzBBv0/gLchYHk9kX8RjjS/Mv7nntXXsU2zJ8dyVHLBphfb
         Owabrabqg8m60yv+hMNlxfxFaifdT7ub+xF8TYJq0c6HfzO1p6TVz1AHrmQ1RFYL9zgk
         hsCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780073818; x=1780678618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cqj46itu7YvhryEp4XiC09o/JiR3dUKvq7oz0vPTGGw=;
        b=L2Og7CjRQ+YHM9GnQoDJIEHXqMuBE3Z3phgKUKC5lE4mBLYwXhTsAbxssuu+oCRnlX
         /j33KogqWFk1HRiB7uFNEbZYsDseR5L+nWOQTB6hUtdAr5+C+/mYHBextJZ258PJFALh
         dNEQCIYcKMsxTdmzCE3XR46RzeX2ClaAbgYmyzZ+XhiiLb9FOQWalcTbeUgmK36xvKnf
         O+/uvAyb6QH/uKMgrgXjkgva6dsZvp3VoQjYbT0lhhBmlivD80kj9IlXnqRoreuTypdu
         z+2kcgNojBMhth0vU+PMql7O/OvtH16qrtcP9R71i/pueWaf1fybuJL145WFVploc+aj
         bzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073818; x=1780678618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cqj46itu7YvhryEp4XiC09o/JiR3dUKvq7oz0vPTGGw=;
        b=L3csSRpyWIOMGMrl0a8GywzJ/AbhGfi3a+ksI5IdLlXKbcJVOGsZl/6FxUgmmv3IBr
         rWdqcKAlPjPvTtS1rzqR0SkxmgB2QqwD5l2WjlZd/vaNQUGbIBEWwJBB8KdPWqIbd+M7
         fnjB/dGAMhLLfo+kGjylic4c/i2Bbv6oMiFol4mHNJ7e1mlW8Jwfi1cpPf29JWxESVk2
         0v/6ELa5OmTNlGZfwObskQ5KYkHfuC9ow8ve0O7I7gLHGgeW1XJu1jz9MQAIj/xBWCYU
         vgu+cuy5uy6WR/NxD8mvDkIfHRPRxfXbpwoxPhawMyxKuyVZPBCcPCtCmv4QvXd+meUq
         QR1g==
X-Forwarded-Encrypted: i=1; AFNElJ9ifT8P4l/6Ox5aj62W/qQGlX2CW15BynJjKYsre06KyDh5brsnMqMUx5Dt7vgd1zqF0SprZESKS8/WX50sbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKwdx2N/ncO/EDj9VhFQGCABmmDNQMGLpqaHVHPcp2Qnqlhvm2
	G8fge/5o7Pq3s96coavISNy1EKnBLo0+nb5/lHpN+6DNT5pkMJTHdY1o5hqzWvnShsm4hfxTOaT
	bqGdhbWCXjGUhuACmJz72zyijS/CllRs=
X-Gm-Gg: Acq92OFaYLbcFTjESRWHP5K9AiC5rYds7RYVUdhrCTSqJC7mOQ2uZA1BnlwutdwD23J
	BJ8JX7ZlpC99Ba5hKqPSHQScxjwyzMH+mltLM2TiHsDglcy8z2NdUjf1rI4hpsBJ5NNFekt4CCn
	J9xXFUH4j0RQf3R4Q7SMWqsxGiMdiuHCMilSemZNYxUkDSI7+WBjySR2SLD7GeQR9od4jHUATwA
	o23vwtEJLW4EpPkjnnMvNQCCtxzmQZMbdA5pjjRMQN0E9N0LRQUOIysa+DHiLUv+Dsm5xQu6p8l
	r/J/dsrRvs3slAiICjz1nBrHcMZQRrFmsVnYhxouVls8EiueqeKyYWEISPSSGZL9fi4jn/jBxdT
	2vJ2jIEa8bUl2wrIrN7FHX46KAuQEU+ksKA==
X-Received: by 2002:a05:7300:ef83:b0:2ce:db5e:354b with SMTP id
 5a478bee46e88-304fa68ddbamr139320eec.6.1780073817734; Fri, 29 May 2026
 09:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529145752.1209016-1-japo@linux.ibm.com>
In-Reply-To: <20260529145752.1209016-1-japo@linux.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 May 2026 18:56:45 +0200
X-Gm-Features: AVHnY4JYjhkvJGsVVBxQ4qyfPzykgr6M7vdApOZCndTkgwrTNRpPxuKfHWpObS0
Message-ID: <CANiq72m7D7P=dV69FMZMOwUVy_Yr464F_4s=194-iUX4pdt-SQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] s390: Enable Rust support and add required arch glue
To: Jan Polensky <japo@linux.ibm.com>
Cc: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	ojeda@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, rostedt@goodmis.org, ardb@kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 4:58=E2=80=AFPM Jan Polensky <japo@linux.ibm.com> w=
rote:
>
> Tested against: rustc 1.96.0-beta.7 (6be5f81e1 2026-05-17)

Rust 1.96.0 is released! :)

Cheers,
Miguel
