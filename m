Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E85576C87
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550472; cv=none; b=Qki+OFVx7/+Yd8S2tm9wleJWeMb0AUk1QfdcmgeDiwdbaVZuk/j6eS/v8rujUptdDCba6A19W6/6STNnhx8Ct9WMU6WFtZS6JrLgd6V+Zro5ZElWsxQKucgSShjug3hOg1yAp7KXRhlpYqoX3jyzP/ahQK9fHTl94vkwt2AspIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550472; c=relaxed/simple;
	bh=oqKgXKSliWMNtRGRS11zEI2+u/6LS1Xh15f76QfAj2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgXYymBhUshAlkrvpwOjFEqxwJET5Bp8vlG3DRq2o1Lo46A32luy5Y70PswCbFvVY2U2KYcHQRJXIEsUsJDTpIKdROWV2xP57rqi/gNqZr8hC7v7QqCeKz3C7TFbhr2iXTLpZLGDRDi/ezQQaoVd10Qs/y25ZHDNCxxbOhaf1KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6Z12jHs; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6Z12jHs"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so2650139276.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 09:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706550469; x=1707155269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MHVQHehe//hUYCWyrZP55FbWLt1tVxAKZO8iJTiBwk=;
        b=K6Z12jHsvwtxEIFgugGUxY8XFjAWzaHxrbiyup9KtDWHq5i4pyDaKG/ZRfooixX2iv
         QpobQfFPtl60jxRcsurxg30IiU7nZ8WH1ItOqoK9Nhu/HJxUITzyc+dRYrQGzKoVwV1v
         d70MKEFl3OkscK8yS4GCPF7C8FrtciEXj/31s2u8aahyIMCjEmvL1CaJV940YbhB1UDk
         gSkK8fhTFQWHimlkTdLLgWunRYlXNZJvqj9S3iP4FQfRjfaYYiMfEOmuTEcm0qxj28Nv
         CXUA4qDbNm82UQFscb1JILgJPaR40qBuwwPWBViAqMnYUtOAc4onompHJjx7GleLAC/u
         c+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550469; x=1707155269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MHVQHehe//hUYCWyrZP55FbWLt1tVxAKZO8iJTiBwk=;
        b=k29pBrlK/cqkwSYOHMPsKhcpDmJYTCk+DawDCwdFysuwkS0rLnlswot2JZMpn0Rv05
         WToHJ4sXkJ05UC5Wdiq1sg6+bSQwUnvJXTYpNm6DOmxQE0EuK87iI2zJYAMDB/AY8H9N
         /k+PU0Q0CqtpjrLCGSFXTkMy0ZhiGPTDGkndT1MMo+EWPpzJcg6XXFCNKEASJRWxLi+R
         VmcfskwxC8O+zKyHu5e/DS5rylf0ukGoPnaWNIa4ymf/iOAowYV4qww1TJoSEM3D3wGk
         nIITLO0WXTLZZoqMoWjfj1CkZoLTyN2ZDrJ1QWhlf012RaNsHrlEVjZsvP5xE9nX31WR
         NtsA==
X-Gm-Message-State: AOJu0YwfQvAcwexfS6W670Zlgc1JVH3zMTvdWtLfoNX99ao/uxbIG93a
	iIU08vPy58S9U/0Ag82RV68xKJEyLoTN4i+7gEAJ/HKPys7QN/FPw5z9xl2uQn7cwUm8kaqTcL9
	59sAOqCd9oeDQO9ZvWJLU8J6r80Y=
X-Google-Smtp-Source: AGHT+IHlOQziCij/taHePmR4rLXSw7lyeIICV4pQUye78GcYmtgfcbI0CoRNtFaj6xnqdQrfxav4xy8ARWySDUS8I/8=
X-Received: by 2002:a05:6902:728:b0:dc6:4f7f:46f9 with SMTP id
 l8-20020a056902072800b00dc64f7f46f9mr3391708ybt.6.1706550469350; Mon, 29 Jan
 2024 09:47:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123075325.1270967-1-dirk.behme@de.bosch.com> <20240123075325.1270967-2-dirk.behme@de.bosch.com>
In-Reply-To: <20240123075325.1270967-2-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jan 2024 18:47:37 +0100
Message-ID: <CANiq72kjF5-+NrpE03Psv_P1hkxwGww9YCFZRDenmMqGFZ+5Pw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs: rust: Add description of Rust documentation
 test as KUnit ones
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Trevor Gross <tmgross@umich.edu>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dirk,

A couple answers to your questions from v2 (I answer here instead of
v3 for context).

On Tue, Jan 23, 2024 at 8:53=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
>  * Sorry for the typo Miguel! :)

No problem at all! :)

>  * Miguel: As you wrote most of the text, can I add you Signed-off-by ins=
tead
>    of the Co-developed-by?

No worries -- but note that it is not "Signed-off-by" vs.
"Co-developed-by", i.e. please see this section:

    https://docs.kernel.org/process/submitting-patches.html#when-to-use-ack=
ed-by-cc-and-co-developed-by

For instance, if you want to be the main author, it should be:

    Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
    Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
    Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

I can fix it on my side if there is no v4, no worries.

Cheers,
Miguel
