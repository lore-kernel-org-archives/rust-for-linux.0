Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AB62F7EFE
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Sep 2026 20:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789937710; cv=pass; b=j0VJ5TQC5PC5oJ6CmQl8a86mnfUkeKgQ2VCR2yAXWltHhREZF4T/nAn1tx7VFMrWTnMID8qjzokAR8tAmrk/S2rwWBIlHxaSmunGPOGRZnYMgAPM78cLK7xqL3nqxkK8+sPvyCs6E+T8DbLNVXRAHeX/N5jnOBEbb1XwTlXnqH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789937710; c=relaxed/simple;
	bh=2QAlJCHFO+aQprduHJPjOcvOedppk4oBX0krsjqwCpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bK2zDwqaKlFt41cZTYOkssMOzv89dsLy29CdTM8qxFOEAzc/ZbkqoOGrkbrb8p4ejiqa9migxUK5aT68j0r9vnKekt9c5ap6fUjF/O6luJojF0I59dpvxzS4QcFM1aQSGMaQc+GPgN4ggy+Yq0yZHvFAdmvk4+lfwspIA//7paQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkJLWtiz; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkJLWtiz"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39666bed441so259157a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Sep 2026 13:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789937709; cv=none;
        d=google.com; s=arc-20260327;
        b=pT2Tqw4hE/yG5BGXbYOdbqxNtnPOPIoTDdk1/SMR5yptKsdsv/eSKJyQs22GSfLFKG
         cveI0/kSvj1Rles08YlEzyWKqxBV7wZ1kNhr1H2HB/IRZupTZkx8cOGEPSN116Cdl1IM
         44/z39KaPxNfQdciYxgIfEuVJ8YM1vEPJSzU3akaG7a6CgtIu6OJiVB0ZE40eJ5fsxjw
         x2/BkI8fuH/FeK0smayAe9q+KVT3q29bTmwGQPfk83UJcTrS/Z8DEk9cvAIsQV3/JAzD
         74O6fuSo0OQA0MOhtn5hXZ1HXYOCRdFC5G7xW73C2LsGjvUvWY3XikGsUS3X46hav83e
         SiYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2QAlJCHFO+aQprduHJPjOcvOedppk4oBX0krsjqwCpU=;
        fh=Fw0PmQuzKRvy8JuQI8tN7llNJAyraKv+SBsLgwBV748=;
        b=AMHDS3YI2grj6DVfihyd/rFNWBOZxaVUbXbNB9kwXL6TiB3lyYJbjBaZbEJBJMMujH
         EyWBDlgL8SqnWtc7OSYblAla6enehwcJpdpxer5y7CFwT8Bqi4NLpiBKnMLkJBI8NPW4
         nkyC6xykghlQN/TruZ5WZExL/yzb6RLEnUk1RPH0iRF7qoECGMMJIXpFP/zKEnwyjaXH
         g4qrUUSg9SZBfuSXMf49ffJCDfJJe0rOAR9hIaPTO+ytGDJN8t7V4QcD8HNjGXGrG3bC
         tdiSmM2wcTaMxuPm5/Pd4tP4RRT2GhBSNhWe6xv6/tgQ/xu3IczUlpkZYCR6s7PYaVPh
         zuyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789937709; x=1790542509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2QAlJCHFO+aQprduHJPjOcvOedppk4oBX0krsjqwCpU=;
        b=KkJLWtiz6iymvuJ08v7i77GsglqkO8yC5Vd352W9us5ioHRdzLD4+L8ueVgHJy9myU
         aYi6LtQs+/hcEehTyxUylma2POVuvKkx/HsIz2ku/UaxC3WM12IdCZOq4Hu/2eqg4mF5
         HBzMhi9ixmbVAK4Jdywkj8KulMSBn72LJttbFxUZMEfCpSZHxqyfiXObNjT702VtZZYa
         pu5lyDjYhBz2ukIwlsLZmsdBElzNJZ0lkwVww6jyEMZR4T7XdDY2Q13wC+v4XDFenrmZ
         Iz1nPEcRKVlFHm7BOS7yceZ8dOtaRE0L5vDwmOHappEtJTZ7iBDYDjiLjxMTS2hWg+2R
         SXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789937709; x=1790542509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QAlJCHFO+aQprduHJPjOcvOedppk4oBX0krsjqwCpU=;
        b=TKPD7XSpgfsPQCADPzUEBktzn41DS14fXlAtkPprtWdob2XnbDiVXqxZ9Nf5c1Hvbz
         vKdLf2Qu9a1mBCcUKRFEuLnfknvhKW3XhfLeV9N7JFqCntusYy72dM4mDku+mLL+5iCq
         eD1bNZSHjZ7H0jDOqcxMSx3r/J4uLGFoLELCqyjuCwm5W9r/938p+u74RbATqoTT10Tg
         whI2p9JQ8O1297rE2vQPOduwJNX5DGYIvyVKF/Tl7lQpylfkxryn3sLFORplpjL2Vr50
         R4koZklZd1IlzYRik0leAmvtCOywV4rYyO1aOliqi29BL9yzTPR26vJzKDctfpGwsL6v
         /a+g==
X-Forwarded-Encrypted: i=1; AKwUvByKxQV+iTn+NjH7n6E1wBtPvWLTwXx3iNV57GQMqcW81IkjECHiU7V69nhkfpWCF38sdZyZz9p9UgkYYs4KkQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m8J2EmbyMDjF61cxwgrqixftazxPf0bmMyMHeed+3lJUzenKT8
	11VjS+qW2qSDFU+Q04ysWl5CT060CzWiA5zhcA0jV9EGzDhJJ5kCjagcykdTVoYuZ45QU/MUCum
	z1MSF2CO5JMz8oPNRoXlokY5ODVaeC8k=
X-Gm-Gg: AYBFou2W4wo6KJQPAOTMlczP4u+jtmatZVRx1kCh15xM+lnzbsL4+iG/HhxyKriYgvU
	IDoGbe8ey0RCIOlYNv6h572FhCUnDDcdto2nEfvLEpx5lp/EI6dev3Ov6QnlDd+UKIWv6+cjlz7
	x6z2I2XxgUXCkxR6VIc7QkQDSGD+8usi8PfxKQUhNwZCEDA8t01DcEgyNmgYJygepmmXRspQTO1
	Ic54gy5c+xlw92zFp4sVyKkWikBY5eXFQmnlKaF8xpeQpyV+hQ5wEkoJ5s7Nt/sJtguU10gzCGL
	972UgN28mvI44y+0gphJLyVMdQS0v4sx8BhmjQ7nkjeXhwwGgIEAvs8DXZPq2dixHQWFXv95kJ9
	As5UuFASSKcFoJZY3mgY5HCnHGJD70pNdIHTW/CHPoTPWUR/8dHlyQ0B9wQJ7F7eK221QpCyJZx
	tkBlicfXBuOdsJak2eizo9Zm7aAzTVhkTYXzl/nYySt1BadrS7kXY=
X-Received: by 2002:a17:90b:58f0:b0:39e:261:4e13 with SMTP id
 98e67ed59e1d1-39e54f42eefmr18446151a91.3.1789937709019; Sun, 20 Sep 2026
 13:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113192949.689834-1-lorenzo.stoakes@oracle.com> <20260917041453.1029362-1-springbreeze@stu.pku.edu.cn>
In-Reply-To: <20260917041453.1029362-1-springbreeze@stu.pku.edu.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 20 Sep 2026 21:54:52 +0100
X-Gm-Features: AcwNN1WwUg6oLlLYr5RfTxBEgK72uNFH4WeptZmKGXejtsxmU-NlN2AjQDSh7lE
Message-ID: <CANiq72ko6sGmmUhN4bSfmmmnDjo966_D6ro8y=EGhAw11ZVCzQ@mail.gmail.com>
Subject: Re: [PATCH] rust: fix typo in bindings
To: Chunfeng Song <springbreeze@stu.pku.edu.cn>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	wang lian <lianux.mm@gmail.com>, Chris Mason <clm@meta.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 6:15=E2=80=AFAM Chunfeng Song
<springbreeze@stu.pku.edu.cn> wrote:
>
> Since the fix already has three Reviewed-by tags, I assume it just fell
> through the cracks. Would a resend help? I am happy to send one -- I just=
 did
> not want to post a duplicate of your patch without checking with you firs=
t.

I am happy to pick it up as well.

Cheers,
Miguel
