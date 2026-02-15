Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7892D258CD0
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 20:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771186482; cv=pass; b=V4yD0O4aeoYTp7z3tsQ7AjlPwL8quUmHzDviZdj2aCEvu0VV9XKEle1Ls4r9PZMLsgva3m1yilinz5QC4AOLPJVxwZILVn4YccOGicIoGSBuNB7LH2IwSXoh5LGHBM9/3PWa1jaZTyiQBaPq+nZDpYczCH0cDjwZCpBNatR4w6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771186482; c=relaxed/simple;
	bh=0uTi6kWOISajCqeksZ6BiPIjxgdQakK6uX64/2tUR68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vf8CoVauDUH3TcdO6PV7SXbwKB0UQdXBlsyICic2zOFRjhY645cV/+EcFRrcFI2XG3Xl979MhjCqt5SI+Rk78hv3Efr6KaDIexch4jL0pR4iAwjN53cHIeTu2aWSDyxDaujQRj1fUJosxQ9wTYeuVN9aVxC5u3MKPCXdVsnY3yM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CU1hW6Pw; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CU1hW6Pw"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba76e80509so190641eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 12:14:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771186481; cv=none;
        d=google.com; s=arc-20240605;
        b=UKh7e4DfIKCOL6Q9pjgS0+fB5X67w+arbwzzD5bpRTHKRI47nvyxbs8+YEqzqsqtTz
         N1+rOvF0jHB2U7CbNuRpNxA/ApCZvs5NVolPNpjjDu1JQ3K5FvHLyZxFeOunFbWP+OKt
         tAkWqiR5Y0osAoK4ZWyVHpOkQFBj5dLY5Z913e3DsRyeBaS5SoCf76NGTuaYmSgA1px0
         olH6EMQmDDPk51JiuucLxh6OiT+v/i49zC64R+W1Z3SnGuYPmNxryVoat8zKiCSNQOqJ
         1t51Q2kVqQQzxCJPzauajD+FeYNAe5/i6KKE44YDaO4F3VplDuP/mlTEnN8P4w/KliCL
         UgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4GbHDjiAt+Gr+k18UppEZslZUkcTo9DoeQh4ebh+Ig=;
        fh=rj0TXL9z2xO41EeT/hhR6nbl/1Eg28wRmCssq39xz6c=;
        b=WjCBjgiRVH7htOHZ4KthL0GI6oufeW6hWRNw3tfyGRchkZFCZ0M4tEsCNT0PPPBMX4
         EkRmWZM+h1K5gi0hpDn4jCbQuwH4gq1vd13g7pCHg+991RtVRfuf2YCG3CK1MNuVrt+C
         bSxZOc/zw1Nr57WcWDJFIPuHr/p+8jntxsbRGVkmJ1pX5myfXZb2SmuUCfqDHn2c9HjV
         UMWDBfWqtZ+bL/n5UQxGeCSEUwlAFJ2hZnrbH6jkavpz0KA7PP2nRz5yiANpBZu8aoAe
         1dvLN1wxaGniW1dLiCOcAUNly/0G7haFYt9nksTuX2AcFFctQB+XzsnzzfShH6b95PgU
         0KFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771186481; x=1771791281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4GbHDjiAt+Gr+k18UppEZslZUkcTo9DoeQh4ebh+Ig=;
        b=CU1hW6PwmoW3NjjY26k3gswj39gje2bdV/0g6m+VY8aXE9P5wrAWOxfxyjqI9rVyld
         w1MlP+ZJ3tShe4p6pFPJzJhu/XA6UELbwNDVWZXZj47l9BuHpvhtTO3s8CuS4qQMvFgC
         uR9jsefoufwspU0i9aYtr8kxmifS+F4yECAUvlDzIboVj424HDmU6CGaDBv8RWkaeXK5
         tqBDb1wCi4rkW1d/vGiSIjm4Pp1Q0GppNXJyaIJZ/TnsHwA7hMCstTNDIFqghbEP4oTz
         xEr5QEZWgEkmZzEFA9wT5BaApbswVk3J4NCaqxrTQDYmB4yrWCC0zb/ThZYEO8YRqx2c
         rNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771186481; x=1771791281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y4GbHDjiAt+Gr+k18UppEZslZUkcTo9DoeQh4ebh+Ig=;
        b=m3CN+ebX8ysrRlUDsNT6huiVWJhv/EA2juz0gMtxoLlH8/tBaQcRnI2wk/93MBwzT0
         pH734szCMvg6VKwGUgNh8ebVebPdVa6L3Uo+Mv7P71G/irpQozjtUCdgOyeuNSm+xP55
         rOVQfX68IeGrOEsMwI+jTX7FbDWekKrE16A9N9Tyw32LCQ4xrkKg2QtJ0AV0uhjm5xx9
         jdY4l3XpeP39ETKuKwhXEYqJMuZ+0UBFkmuyLAn21gfzWkW1qW0orOebT5IQ38OuKhv7
         6VuX65ClbUVPpFj4oZiC53KqXD30alry160YvD1iXizLct2UZRlzAdYyqyShHGODGazg
         MV2A==
X-Forwarded-Encrypted: i=1; AJvYcCV2BpSmy8fR6muLpTdGkfk4dPx88MXZacBbHzO9xczIp5Owc3k3Qj8I/Wp3VTKCC1/fIrMTGukA2OZUw7H99g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKBr5SMmJoiLgKm2DdBrNTyqPmniFppVjxZevdfAyy46yzbn+T
	eGzYphq9q27l7EKnYaumuRdaj1MzFknhtz8I3mgGo4ELXzq1fN/L8kqPtCHRNNMZLTXRdBGinfp
	vUkjE+5mlqeVBK/wXQExVlpw9ZwVxevA=
X-Gm-Gg: AZuq6aL0VaDMlZbYp7BD9zQ3Sarmr4I+t44OLhgq48YI/OYzTExfZq8hXhVNOX3Gbww
	bZla+0DMCCF6AAAvaPwxzbPQmbezVRhrg8qsd8fxRBNK4FrHt/RwjnjQuSuEO5j7JR9u4ATWPaO
	OsDJbmP72mQV2rYzUXxKJDlOkF9t3cna/P7Z7rmGU41/yLSbiH5seEwVB8GJJ1KfUdfvtxG+CwA
	igmuxeW4o9ddfixRsfdwkIadXFp8MKRig2nZUex6wz/7yCPHvxSuiawrUx+ST2d+MQe3tpzn2XV
	8FJXNmUu/Md+hKLIi3BWf8EjzL0c4uDr1Gw+lDaPJQVS/N6xx41FUM/F3Zn50bdn6X2H23Qb0Ec
	kgM0N1goN9IORYoxvrN6CMO7D3Lrqg/vxGoE=
X-Received: by 2002:a05:7300:ef82:b0:2ba:6978:2b0 with SMTP id
 5a478bee46e88-2baba0da09emr2165980eec.4.1771186480597; Sun, 15 Feb 2026
 12:14:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org>
In-Reply-To: <20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 21:14:28 +0100
X-Gm-Features: AaiRm52jYYQ7sdwMAvtHt6Z1Jcc-e1mXHgS-AxF8e3fa3IFsaaAbNgn7-saLZN4
Message-ID: <CANiq72kH7TforZTt6kjFKKjpgg_SmT7Yxur1UP_wcZ_x-c2dGA@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: add a few helpers
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 9:10=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
>  rust/kernel/lib.rs      | 17 +++++++++++++++++

Please avoid adding things to the root of the crate.

Also, for both patches, please mention for what it will be used for.

Thanks!

Cheers,
Miguel
