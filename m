Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0A33D6D5
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 20:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762892771; cv=none; b=JOXXvAIuVyu6O6AkBOo7KvVyO5JoRFtCiH0EcoKEUKQRtdadJL324mXrl+Z1ywd3S66WF7/mqt3Wf359bg0+GkWCqdtZRZ0TM2aMQC0mE8Rb0r1lWUCW/0+DfLv/cwb5Iqo4QWUKNiNO9zhxlYkeHohU5CjTD+aQv1pj1Rszttw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762892771; c=relaxed/simple;
	bh=11T1OSw+fOm0290xNO6ijQlyS/5utxOgct4XU5aWmDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IO4luDI6AXP3czjHQSbWxmdEcxaoTfjDlf1jHdgO+DCIST+DJPLy+3mdw+3tpc1krxJTpurrFdlTapLnq5owOJvnZJVQS2WXZ8De6qfmBwzAUX+darg67PzSwaYa0q6T7wFI/pLEqng3TxaTDyWU0fhSimDfUu1a7K97cahmLzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rpl7tfG+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rpl7tfG+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297e2736308so103835ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 12:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762892767; x=1763497567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11T1OSw+fOm0290xNO6ijQlyS/5utxOgct4XU5aWmDI=;
        b=Rpl7tfG+BjVmuOUR3E429fV/Seev9ejFWegcaKOzYHf6LdGOWgvBtWE2GtwU1fyptg
         RTZeumBUgHQHSx0472sXuZmTDfsGgXZhuPoktyt30b2sAWEehtMLNDIg/2pzangxpGRZ
         /8VfzzTMVZCfo1StFUsMIGp5vTCIM/a+/C6bri8viDcqyJGroyZvnTUbXJInLzYqHX6z
         KsgK5q1MtV9QxNK3Gn3Bnp5EO6Btfum7lmk3TzN/UyArMI83dtkwuKTaXBjGuU3nqMfY
         vHU7a2jwwgUqGqkmSRe1PR+uSEpX3t06hbLoPFII0b1Wnqdyb1uTRoSGImfdJes1HJL7
         52dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762892767; x=1763497567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11T1OSw+fOm0290xNO6ijQlyS/5utxOgct4XU5aWmDI=;
        b=AWAPz9FQ8a2RHj/0oAqn6AB0FiMzMqixzJs6B0p248oHTJDs5fmQN8s61a6QHvdN/I
         pSkS1ONtegqA8FLM5IJljw368XUTSy91ygvU5mam+Dl3171+youPthMbE1/NrI/1Ab6C
         59IQ6QzX6bgI0a36P9DfmxjZcitxslmY7EIgSlZBAsdwT5ypEv8yQYYDt0GHBfFS4YFV
         FCRuFsvuCQwatY5INB5/qL+XV7tQ11cOUnDteZUfvJwWeHm0GbKWCnhgnyVBWehZMUN0
         op04TqEtguZos5RYg1UhoEv3nBdW1qfFcjin6ghd3/SxFLukC2md/fiVNITkZTvK/9QP
         hsjQ==
X-Gm-Message-State: AOJu0Yw2y1Sy5VN+fJKmMX7ZdpTH23tFfJfyNWEdjhS1QKQNzTzm6HOC
	e8Dcvz4iGx9p+rdd42/qEwZi+pA5CddlImSnD3K1Y76MIhy1YmmkVP801V/MO2HoALUV24+zmww
	/fKRGdKh64X6JRVg/+Y9fRJy0v62cAkpVYaSP
X-Gm-Gg: ASbGncsjO+SDOg4npyBma/DkEiL2OXl0rVdrVu97htYk5V64OOEf+pgsd6Ohllwi8ob
	YpIUTyJppBDNq+iatkw4nCB+d5abIh43ACtZYxnndjTS7l2l1/uT+82wBnQwwNLVA7ebq7FMa7n
	Ql6yIM6+qkRVbxP2IzGgOTq/d02c9GT4spyE1Kzs3knHTwr6PeTRU6dTNjfr7+KlDRv6x/icsdA
	v3yaqN31qPCK58vTYCip7XB/bB1EJn1VwA3gccOqjfrA9IxAR4wWALipaPChdO0AUsKt9jyJiGf
	YJwdcf5oDNUenwPfyB/LHvmx3q5aw+edfHkzzG1S5kHbNTcyW2mw8HgmsT9PiJj40bnQdPlhsE5
	ENqczrJuQ7YqZow==
X-Google-Smtp-Source: AGHT+IFCcoHO2xJfS1Sof1DUsWbAdGYaxeTKBmba03mE/2JU4uX7HKn9hxeITkAq9PRn2cAisWtp0pMxIwuw3O8k9Y0=
X-Received: by 2002:a17:903:2f85:b0:295:586a:764f with SMTP id
 d9443c01a7336-2984ee36788mr3279015ad.11.1762892766704; Tue, 11 Nov 2025
 12:26:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <73757a9a-5f03-401f-b529-65c2ab6bcc13@paxsudos.fi>
In-Reply-To: <73757a9a-5f03-401f-b529-65c2ab6bcc13@paxsudos.fi>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 21:25:53 +0100
X-Gm-Features: AWmQ_bkaSE1HO5ou706dDOQ1GJW8tGRABZGYfQpG-llIaM6rJQzjd85AdpjQT8w
Message-ID: <CANiq72mE5x70dg_pvM-n3oYY0w2mWJixxmpmrjuf_4cv2Xg8OQ@mail.gmail.com>
Subject: Re: [RFC] Secure TCP (STCP): Rust-based encrypted transport protocol
 for kernel integration
To: "Lauri Jakku, CEO Of Paxsudos IT" <lauri.jakku@paxsudos.fi>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 11:27=E2=80=AFPM Lauri Jakku, CEO Of Paxsudos IT
<lauri.jakku@paxsudos.fi> wrote:
>
> I would appreciate feedback from the Rust-for-Linux and netdev
> communities on integration strategy and long-term direction.

Sounds good -- I would suggest Cc'ing netdev, since they are the ones
that will decide if they want this. I would also suggest Cc'ing the
relevant maintainers directly, not just the list.

In general, as Greg said, you will likely want to have at least
patches for a prototype that can be applied upstream, i.e. to the
mainline kernel.

Cheers,
Miguel
