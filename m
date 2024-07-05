Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF98146A69
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jul 2024 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189356; cv=none; b=F5LQMmk8qD0G6bHqV4nN2Kx9tAM+5671wQtt8FPqNmeKyrGm6t0oVXfzNB9PUnAlRaMJne7zP52GgLkqSm2QbnysyyQY0RPbsXOnV1C0cpQV0OazADWz7v0AG7UVvfV71mPJUvLBQwpN5ElzYWp483xx+4CmippAw7GXUX2IR+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189356; c=relaxed/simple;
	bh=3rwrtLRFCQwEkRjEY4+oBw2kAJzfJEM9ShCTifzrp4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVfyWuZzu6+4VhDFRASixbuyulMhKsrTxZ5D9hH5HZS1J5IYZ+sL8UnsKEOuP8/a+9zpYtG7m51ivFyzDCVVF9mPdVkieiuERAFVVhTUNnn1Brp2Nq9eK488XjmZulN2z+5Slyjbveo6AfY+opezcBdb/iTH2zkLVuXR+L5bOiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6YdnEGV; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6YdnEGV"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-710437d0affso1046614a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jul 2024 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720189355; x=1720794155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rwrtLRFCQwEkRjEY4+oBw2kAJzfJEM9ShCTifzrp4c=;
        b=m6YdnEGVWnxuQ0k6/eEz2eXwVG3OQf/urqCsCim12KOT/GPa5/gUd8kVL0QxgyZpFA
         GPVc5dHCpJYVkkfhjpaZ82P0OWAtLZqUPY7Gi+DhhDeSzZDT5G2O8cPlxl2FmvP9RkZi
         iMS9e79KyvsA8X04yC37QCGtg7JPLmk1Ya/aHXRzHbdSkAXVNU4jZv7x620MNhVDseqN
         38vGaqzYtzUpB/waMuIJ5aSDZJyRWDcSKC2dopjHaUuBH+JRHfODV4KvcaFYo+ul1LiW
         vSgqQ9tFCQk4cXWI/ahCAvfbN4PYJ+pX7fLmUwx0u1cCjOTQJkloKY+pqF3aAns4RX9G
         W5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720189355; x=1720794155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rwrtLRFCQwEkRjEY4+oBw2kAJzfJEM9ShCTifzrp4c=;
        b=qgEL4pqCXug3jPfz9xiM6fQTuIfaPpS7Cm5A9KDlGJgiin8xAh9EKMDmWqJVEZ69km
         Cic3tM8sr2HAQ4qg9gINMR0mDfsFvormAZfNwQ4BA6B0ehiuxCARVbh3OygD/Zn74bq+
         030yxZHohW4N7ZmDUFXixRHXeJGyZeyqyNPCpGbBOHY7jYGVJcf0/vjV1KSnlMa9TrKU
         8On0dKKttapDxx6r5INZMUE6qmE76wbayfKLjqA/hU4hgQCH69C8RuAdK7mm8TYWR/K1
         ACvy4gM3WQiVjLSexNtE1SYz+3ZYzo0Ujb0TsqXLFeyO3rx1misqXrnVAVNrHjEhH9jK
         mXzg==
X-Gm-Message-State: AOJu0YxAzX6y4UyXA4jTKZTENdWFM3fJMRGfCLmzLKkk0SgOCK9LFWkR
	dVHc0QBABVHGmO1TxB6vunq4Aoan8DwgdJs6L+NgsiXiBn9uJhWCnQfBDSUvrG6kvV5b6Lpj0DT
	PettT1Vwf9IYp4nEHjhitzNM5g189gnUf+Uw=
X-Google-Smtp-Source: AGHT+IF2ll/fQbyf5CxxZesc9GA7mUj5qiqhImFDypPN/MpQTwc3LZXN9+iHU6HLhP43DOUB/OPZW35SRf7y+61P0OY=
X-Received: by 2002:a05:6a20:734c:b0:1bd:2c36:afd4 with SMTP id
 adf61e73a8af0-1c0cc73af94mr5476853637.2.1720189354812; Fri, 05 Jul 2024
 07:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501123548.51769-1-fujita.tomonori@gmail.com>
 <20240508.081144.1308480380091479358.fujita.tomonori@gmail.com>
 <CANiq72nHkadpMt9wMTm+BJ5Up-EG6ymay68qi+56nv9uLXXcgg@mail.gmail.com>
 <20240509.085826.1793889118157877475.fujita.tomonori@gmail.com> <CANiq72kJQp_GHnr2cD7e8s5CJ=Sawz9ad_QVFrUxqDUppe4FNw@mail.gmail.com>
In-Reply-To: <CANiq72kJQp_GHnr2cD7e8s5CJ=Sawz9ad_QVFrUxqDUppe4FNw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jul 2024 16:22:23 +0200
Message-ID: <CANiq72n4q-LLaUUd2AcJwPzMfB5B4nLEk39xunbERADL9Ma+Mw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add 'firmware' field support to module! macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2024 at 6:53=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks for confirming. If netdev wants to apply QT2025 for 6.11, they
> could perhaps carry this patch with our Acked-by -- it seems simple
> enough. Another option is creating a branch and merge it in both trees
> if needed.

Tomonori: Any update on this? Will they take it?

Thanks!

Cheers,
Miguel
