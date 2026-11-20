Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795179202;
	b=tn81XYsVIop0UbF3MlK4RF/iGZQAmhs4APKKsbxEXwG1NlJHe6g2k+PYdrNxrUVCT27G
	 YO+4oWTRJ/AjmrcLSN7crlyX41wfPtEkkph5yTvUm8KlBdlAut0j8NTuncZMPrZTfSaFu
	 KueqmNFlrqG3oJDm1ypQg0V1NSgiVE/yD7B/yemySn4fZF+ZqofFI+rgpi2xQNx7OArmf
	 iEcHQN2znwhktDayC+XECD/TLGntNmlvERXvzYfG1bjT/8tJOn+FmjQBKo5EExffso8kd
	 zeJMjGf3jhHX0wo4dV6SGt6FDSUNlh0+9Gx6FGGIN44Qb3Tg7NrB5Jnu1xAv8tdqRmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3MHtFFss0dXpF2UpQwJbxcc5iQ45JvDbWcteDmyQxmE=;
	b=0Yg9g06CXCxsfKRjymhEyhBnbAyY8aTpBbRZOiof541H9XXSUok4nxSJXj39s7EvG9SN
	 JSKi5uVuEn0dT34wF/MGXZEwxReYzV7t9ZdG1UEqXip4eoigKljRPb+hXLj9rq7TlZvZq
	 IPXnLLeVHHao0IVvDQ7lY+8aBOf9QjuujB/DQBKWOfJUQWrxgqGr1Jrmot0UCWC+HdhsC
	 D/5cFk7mmI/ResZSRGK/0UBiwcNhjhdpNlKdXMfe/w8D2u3N8fwXJZ0HWGW3uzHxMSD27
	 2G2z45SQkDRLOUACA32Y2h/jxciXMZN+R5q4A3H0H6W9/d7JOMJSZTtoOW9qi0mmq8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQvDEzXg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C760A260A
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 12:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42C760A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQvDEzXg
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c1acfdb638so61829e87.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 04:53:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795179200; cv=none;
        d=google.com; s=arc-20260327;
        b=JV0FVm7G8Aju+NWXzq8AJq8r0LCUsPMZeh76pGNcrvY0W8azsLN8C/jJxPC08K8uBH
         o41p2gx0OBR5GZ1MCklyVMwrHBzeBotT++lz/fJ+PrzCWbmZx3bsL/U7tPyNw4PStAIo
         zuYj5klXSH+KAzDFq5G7y59v8ywpYXgzoeV/YjEQ5k1JR9ys3E6oD5xstZ7CiyXNxOPX
         MeKyix7X/917yitLyzhlVVIw4dIx08gPNkqjY7B5mBApI9+/GRZ2r3bDOvGdnQLkcaRw
         gPhnRyAzisiT/xAaYwG8sys5ntd4W8EcVJoQ3XxKN6BHWQhkrDt2xnESRi9rVjfvb0JN
         GD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3MHtFFss0dXpF2UpQwJbxcc5iQ45JvDbWcteDmyQxmE=;
        fh=A0dXoCzrGzaj8i3gYC6L+iKv0VtUqa5s4lmvUL/lNjU=;
        b=XqDi7MjIVmcGuG8ZSpo7o6iGta/xF75UurRwTpYZkuU99MunhH7iekc/sKVOdOcyWw
         onHL9LRuEnojg8fIJiv3p4auM31c8GFXxo1wU+MYH8Gm/ej6Ioz3hXA5zoVM7xBhEdO7
         HcO4glwSPGy3kexqgoEDwYO8Pg8qlRXNOh4ltY9sh/oHC7kvrIJ58hQyRQCoAYRoDGg0
         MQPtwh5eAPv0e32tfI5dSmC83ORtr0KX8pnGrhTygjHag3gBzshzBvH9SQ6BwfMc2n8g
         5oDeQR526YFxo1QhKgbjymH3k5CWkwnYW+MpFYPTjmdgvj2/K0iORnyqeeaiYF4ILvlM
         2C0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179200; x=1795784000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3MHtFFss0dXpF2UpQwJbxcc5iQ45JvDbWcteDmyQxmE=;
        b=jQvDEzXgKEsawRKoG5gja8c/RAKmnFqGtl062PWnpLK8r+U8QANDqYB33WsU+HHYFM
         tnPJzTsq/TWPAsJ8aoJUXJ0Y2UuHY5thJpT1f6OmnOtrLQEW1yVn0Mc3dRvW0dJdjUXp
         LTVmuDYOsgOPpc2VKnD5jd16wc5qiaot5YA2UGCgGlXGqeShOB3yGkbLUrc6QkqTinNQ
         xkL2BvktmmTu6MTxkxhxyPhrHXt0ZjC+/qsIwtj0f/netTMtEV2nIOd1OJuiO44BT3tl
         /IHxiZZbkUxwB799qxmFKI01/iTxgFy7C/x7bZmdp57Dcs5vWpPDMZOCyY5hlNb9h6Ts
         DJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179200; x=1795784000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MHtFFss0dXpF2UpQwJbxcc5iQ45JvDbWcteDmyQxmE=;
        b=XrGYd3D9bhKNvXU9SulMEm18oxn9tWUyr2iX5dfM4pSDrLItsEfbwjVai5UyJjtj3f
         FwVMywcmFAS5WlWx4UdG++WMO9evEHy5U2s/W3GvloE9+OuKKxh4luqDa+G5mq+KfoTZ
         hG1Nfqk0IVLo0RZdMszxt8ne2ctJyDjutbgtND9rIvV97gLXKrh9xnQx1G2vMcjhQyb+
         eXUd+JRlBqnKmaafhoVSWwYsYLq3i/5KQg2AeG1yJZdS03Ppkz5amxSCMshly3dmcfas
         zg+kK+a4kh+DuKVEZ1KCLqaye+/I87BOBq/3JaS1ABb+0N/bbiswlDJKhoU2IvOnrN/i
         AWFA==
X-Forwarded-Encrypted: i=1; AL+hErHa6Y5XWKWzlsF5RsZTXmofpm/EySC2LBWY9MRmst+SIcV7hICYmLYV6dXhuCQDaK4LJEB6WN+oqi+5tfHm+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+03/lddWPo2386guKLSwU9kQ0HPZ/dwjZJATrqU0igySBA0mbF
	HM/QETIhiUyjsJzIPc8vXDXKJk5O4iCNRZTrQP8YAyNUh2tjOi9X47rESY0EG1zXI55/j3UdOvW
	DNcrM5OIDqAx0V4kLlVmpvHapbSUy9cYJqg==
X-Gm-Gg: AZFdTZdi1guM/pG20LzW+79+LgqE2wX5D04QEPp1QAQevK4BBnifmsexwgQZAw9niqD
	UzcKkao+OO93GaV+JWoS9CLndgRJ2Fe9YTDGr8WHryI5VGnP3T95OTZ4goTUx5JtNQ06LENoCu5
	N+FD01r0dbqxQUUX3bW8sTvfrIILCO30BuU/xVyKnEDKb4FZsqUpPaWt3xV+j9P92ZqoVJpprwB
	oibpg92/yxYpphBiX/CE1Q9o8AAZrg9kPv8OnkqBZ5CxPmR4Mkw06+dtFrpwCdTZHMpwjxJjVTD
	bt8NaJ8C69JJrlbE9Plr1RIPvF0JV0GbXx/GqDBXMJOPb4/gwTP7JNYZO1OCUzvpj08/DcSk2V0
	gT+w1EvzVB6pGg273kqwc2LqNVix0pNcJF//LVwgkaXEQGDUPE+ftoVoa7Lor8RlIgZ7N+Cc0aO
	UOIULnN2egnN+XRyhFxCkbKO7Ry5aLWFin3AJd6XbB7SHJ5AW0rLZnvbB6O2w79ABdDiPPSGicx
	TzYp6x92NTNKQxpS01bBtN4QWJpXH6j1yF00vbNxmQrvw7JRKyZEl6l02NQ8dfzFz2A/GUL1YAA
	O6h19t4kqfBKweyQwA==
X-Received: by 2002:a05:6512:1394:b0:5c0:da9:407b with SMTP id
 2adb3069b0e04-5c1bc8722ffmr1214127e87.5.1795179199679; Fri, 20 Nov 2026
 04:53:19 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avXdJyqNNqopuH2_@ashevche-desk.local> <CANiq72nw+g=RTvR-zZh29D0=MOwNYboNSeKkNr_Z4v74Q4hn1w@mail.gmail.com>
 <avc-fQWSvmtHhtCO@ashevche-desk.local> <CANiq72=RbzZHgZEMfLkDRQx-_PoxEfgL_Ar8figchde5u5qc=Q@mail.gmail.com>
 <avq_fOVO4dina23a@ashevche-desk.local> <CANiq72mWNJ6qpxUrsGHGiRHeqb=uHMzqEuYLOkK50i40T=yHNw@mail.gmail.com>
 <av9a5P6ciEEjmxbO@ashevche-desk.local>
In-Reply-To: <av9a5P6ciEEjmxbO@ashevche-desk.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 13:53:07 +0100
X-Gm-Features: Aa3M54rzj5mDtJm408mf92i5QGgwLI1wtx7vw52vAJORfiu8m-wJjn8uuDkfi0I
Message-ID: <CANiq72=8RZazqi6_yPa629n4s2OuQ2NODtfhfAM6kTRpryqthw@mail.gmail.com>
Subject: Re: rant on Rust in kernel
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, ". Boqun Feng" <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> make LLVM=3D-$VERSION supplies the version of the compiler, can it be use=
d
> to understand which libraries to take?

If you mean e.g. setting `LIBCLANG_PATH` based on `LLVM=3D`, then maybe,
but generally speaking, the kernel doesn't try to guess too much, i.e.
it will assume the toolchain you give it is correct.

Overriding parts of that in subtle ways can be quite non-intuitive,
and sometimes may not work as expected, e.g. setting `LIBCLANG_PATH`
may not be honored (depending on how it is built), or could in
principle even break a user that had a `bindgen` that worked just fine
otherwise.

So what we do is instead print a message when it looks like things are
incorrect.

Cheers,
Miguel
