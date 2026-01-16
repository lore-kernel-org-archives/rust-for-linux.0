Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6346342CBD
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 04:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768536024; cv=none; b=cVvxhpcLGwjugULvLosI/wLjomAJily76Ru00ZtNbYbfZb6IPw81CzHbE1XtH2w0viiWLor6jfsDt2XATA+ZeTGEgyey2dm9giAvJn1++3wfM0AotM3Ufh6IUvaoc+UjUX5cvXm4TnPVj5f2zqvQ1BmDIVt7rWZ7j5Gqt7KaxD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768536024; c=relaxed/simple;
	bh=YxMf0N+2PBxjBMmSN1z9dSRK5NP9IjWiocNlkdmg7kU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cptT5qhrljVjw39e5wdx8k3JZb+/YFFrr78Nqr1tB5+jFAIp6SDxgwctgVk6aHoAPG9UIicNe0Q9Dl2g07E+XSex/6lqc9MkNcAnNTLeokpzSX5EbQceQ/6S6fdaRaGY2dIgdEZjrygU0lqmAXhtKqCdW4cavS53YnbrDiVOZOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGl+5Xjg; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGl+5Xjg"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c2dd0c24e5cso604907a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 20:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768536022; x=1769140822; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmj6+iPPfnDT8tUn7KQji2dq50dcqb+jVec8kt8AZpY=;
        b=fGl+5XjgrbZbNCOcrQ2QEpwH1Hk+sfnxNmRyMLMaXyOgr+A5Bj10o1u7BjwL8ipPDZ
         7d4U3S+KfQOHAtTCr3KYsWUyvZfHbCZIBKyD09nHdMg5YHEIp+gDtKREt7Gl0ItIt+/E
         LEIIOGHUQ4tzjLATO4D8GMO0ktvSnHG1xDYhe5i4ReC8UvBaff6vAlnH7eVnRE+NxeuR
         eNBkMv6oXGfWeWyH48WKQQ9Vu0Ffidno6+uW8tQwo0JNi7YsE4KgQlCFDVt8mDvFdF9I
         l+m4W080THIbdLy9Jo8yEsI6whhZZpwhKWUeTNlaRG7nBXJIGqebpm++2oFRxXCS3JSY
         i5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768536022; x=1769140822;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmj6+iPPfnDT8tUn7KQji2dq50dcqb+jVec8kt8AZpY=;
        b=WtLcHEsD/i5RgLLNjeCiwp78ZMjime7ahCOUwz+zAaTESOQKTF/7QL/Jm5G4cKnHtS
         2RfPn2jqHRZwEfVKiQ6+puBla1cbdELlXeT70DCfDMBe1CoSVm/q4jT8VGReR1QB7nc4
         iYVXDWU6pwpBA8yeH3UVzqUpbkXsoRRplHsu+U+JlHaFvGJuMffP4j4s3Bpn1ijjF1J9
         5XVwy77ExvsScY4ARKsU0vYtudUyz55VWhrwm9DptLs3+eEkNvdfMgNAIOA7rqxIYndn
         6cl1+KlOPogUljpCOevF9fu18ncYHIAds7deGMUEA1227aHFiKAWzFdXIIr6ltflZRLs
         gtHg==
X-Forwarded-Encrypted: i=1; AJvYcCUCvtTB59v9s4+QaG3tWNwAvbxCenNuvZ2EFPXIhXX2EFHhq+WEKJ0o70F1yk4HkTT7HaW+LX4pEbnQsvEY1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXZhs/2MTtA1r/+1ZXnKTD2XXWPLsQnw36aazB9zG64q+C6vex
	prbKOVTunsfF5Nee8Sq3d4+sfGuz48Zt9Yxmohh8+7x5KxakvqMOezHc
X-Gm-Gg: AY/fxX4SFukAadIdldfGQyYopxiBmC9Wjs5l5d7WZtazz32K1mqrYs3HDf/pE6beOFp
	y3xwbrgkrH5OOMSVGgpNuKGwqSwQEYS4AJ5d4idBLCQTrEcFPQFiJTD10Em72dvXsDfw14i/rTT
	DM1WlspvsjLScBO2jA0MzjKCCma9dq55DWPvGuqRMZSxCq+B7Sxto/q4Pat4BLLcFpoBgqz1/rT
	4aO8Y96IGRzjazlh0uxedTu6/KSsPiLkQGZnsjXjcCnVSyahFpWSvHPdshqd4zH6dDuVpSyn8H0
	bNp1VfzW6HWDvbgpER6jZzL36ulNCzjdwsm5ooxPoMqPmYK6PAbn5DFC8Ry3D+1fcRLbOIfW32o
	xJfv9Muz+vnsqZirgFZNXWN/bAgeYhXvsjn49QyrP+7VoyAtgkboigi4noq65hCUu7/h/bePgBR
	0qryMpOQ==
X-Received: by 2002:a17:90b:574b:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-35272f96da6mr1441648a91.23.1768536022320;
        Thu, 15 Jan 2026 20:00:22 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf355ca7sm732783a12.27.2026.01.15.20.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 20:00:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 13:00:17 +0900
Message-Id: <DFPPP27ZOPM3.6JJXKNOFHA44@gmail.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add "RUST [RUST-ANALYZER]" entry
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Tamir Duberstein" <tamird@gmail.com>, "Jesung Yang"
 <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260115214545.63262-1-ojeda@kernel.org>
 <CANiq72nYvttE6odYpaQZ466Rv97jgK7T0vybTcMNftk69iu0tA@mail.gmail.com>
In-Reply-To: <CANiq72nYvttE6odYpaQZ466Rv97jgK7T0vybTcMNftk69iu0tA@mail.gmail.com>

On Fri Jan 16, 2026 at 6:48 AM KST, Miguel Ojeda wrote:
> On Thu, Jan 15, 2026 at 10:46=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> =
wrote:
>>
>> +RUST [RUST-ANALYZER]
>> +M:     Tamir Duberstein <tamird@gmail.com>
>> +R:     Jesung Yang <y.j3ms.n@gmail.com>
>
> Tamir, Jesung: if you want other addresses (e.g. the kernel.org one
> for Tamir) or other fields, please let me know.
>
> Also, thanks a lot for agreeing to handle this, and welcome!

I'm fine with the current one. Thanks for the welcome!

Acked-by: Jesung Yang <y.j3ms.n@gmail.com>

Best regards,
Jesung
