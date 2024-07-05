Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1141BC43
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jul 2024 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720191489; cv=none; b=V3XGWQCVXwytOLKKS8p7PFdLMxtQIgcrEgpwXque1nTih/hDKXt7Nuc3Zy5xGxR/jXnciHi+g6HXO1dJ9UP7gLhoWbzEtE+59rNdKD9hsRaAeq8GGRm8+fXrtrhf3M2xJI3uvFjfu8ToJE/qbCYsPtjP5pUxrMUKNWyfbuIy0tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720191489; c=relaxed/simple;
	bh=pJi0syy/6B+VhD62la2dwtUr9ItV+Tl/+hW2IPrmXLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWvm94NNW4W68xzGrKC6Q6TiGrLSBtK0vtZKWhmT5vRKgbg2PyxcaGduMB+b6+SO7CfVFT8Jm/jtRD4kOsRAH6T0dCTdPPy3+kILphej5qWD/EppJEwgU7TTQ0VukT0NCs6ZOWqz39CKyEHgF+WhlMGf6IQdPZ7/oWgd79T9rz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+qnLFTI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+qnLFTI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fb3cf78fcaso9526165ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jul 2024 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720191487; x=1720796287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJi0syy/6B+VhD62la2dwtUr9ItV+Tl/+hW2IPrmXLo=;
        b=N+qnLFTI12OD5rdGZmguqABKRqM/aHeT2H9Xxyq7K/iIznIgUlfZjUB7cCt3J5L4wR
         465GArPmfzjv8Xsx3LbJ82mHYy8dQqi+wrmm2sp+GpvF7+oJMNPhQgoZ6ovGuKHI1dC9
         zSAQLbenFl9W3Ski68gJF7+kJosCs9OK6pRM9vTiof4cBgtbZUC3w8Z9rXYVcr+psHAd
         dC+7p/k4VTWr2vahfD8FZ/mm5RWU50p27jWrCs189IjsvmDvNc+/fyrSFzMAAeSeLCBw
         +rcXJeV102t2Jy9jdzg9+ACChb4LujxHY5GUwriLVbVYAlTVyRVRBkn+OfCgu1uqj0MO
         zx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720191487; x=1720796287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJi0syy/6B+VhD62la2dwtUr9ItV+Tl/+hW2IPrmXLo=;
        b=I105oDKOEwNpofwCyNHerCMKIO2mUfRYalLuNvWzsCYQPGpJhr9Ll5Re2Cui06J/F+
         2KeagM3wA4D/yc0jXEJoa/POFAEPnMGcksoPg3V9XnyM7yIH5SImf2dtSQJ61onFSQPW
         xGi1mEIR4yIAwO1RYoqgSRmV87z36m3wAxmkvM25R0mtlkO7RtcRduuf6num12uRms6Q
         IzukybJ8XCGN/zxKUDzUc2rp1YwlRwHXpHNIBrqCdpjsGXR0KMPtXpzluABaN3kMSCrd
         GuK+eJyB32NGw18Y6Yz0/IUPyOuxfAsKEfozyIuc4PegDROum1NHE+xrNvD+P8mATvG3
         QSrA==
X-Gm-Message-State: AOJu0Yx8HOAq6iGO+ZAu0KQiHKIOabRaexd0KU1aGfl0EAj3DJc/jGzm
	/N/hwUk/4K3KqqBKkYfm1oUHag1/TW+lujjZa+wo2WBWG+P6fWfQtomPVo2Eo3pzOJo7Vv5sRRr
	STvNoQK4jvT9WT4swNvLIdGlsOPg=
X-Google-Smtp-Source: AGHT+IFYT5xeDo89mDAJw7S/10QANxqACYHhydfl6/7kOfxb6w7k9CqzFnGhBNNpwjHQwezq2PPuuY9tm5F7hUkKXmw=
X-Received: by 2002:a17:90b:4b07:b0:2c9:cbdd:acd with SMTP id
 98e67ed59e1d1-2c9cbdd1224mr374646a91.35.1720191487571; Fri, 05 Jul 2024
 07:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509.085826.1793889118157877475.fujita.tomonori@gmail.com>
 <CANiq72kJQp_GHnr2cD7e8s5CJ=Sawz9ad_QVFrUxqDUppe4FNw@mail.gmail.com>
 <CANiq72n4q-LLaUUd2AcJwPzMfB5B4nLEk39xunbERADL9Ma+Mw@mail.gmail.com> <20240705.234423.2088694847041637488.fujita.tomonori@gmail.com>
In-Reply-To: <20240705.234423.2088694847041637488.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jul 2024 16:57:55 +0200
Message-ID: <CANiq72kk9=3ppHB0OhXktPN-jvfSNR9=KGJ6Bp43+1rjgFoY6w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add 'firmware' field support to module! macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 4:44=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Please merge this patch via rust tree for 6.11-rc1.

Thanks for the quick reply!

Then I assume they will not take anything depending on this one this
cycle then, i.e. I will not create a branch.

Cheers,
Miguel
