Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D401B6D08
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 03:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769397266; cv=pass; b=qBW2IArgVm29DdqpRZrTRI+hxBRUExaNvzjcHI8O2GtGO0FZg/eNPLvergpDdZnLBeljiDeU2B5CCmibsnFlALYI4hnHYxIs71YnOgSg+S5w64PdzWfmTCoA6Ps3NtQxmDfoWrC0X4gOncRp2DKXlWZ9Ch3VAjM61KIkW/kGEXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769397266; c=relaxed/simple;
	bh=3LzhCRAFSgK+MZWPbDG+b8FtU/TN8yCDiMZtD1mSGjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MW5Tex8weG6oP4Oso1z5yaSOSGZo56AHdOwWtyFoQZTRoOjrsElLqk+Vphb9TWLio/ULbHFwZjPOgd2uR7YgzS6gbNz9qdkoQJQbAkWp8FNJtRtgy7GSR8gPN2CtiXMn1pBS1SjWHg9KN/S1WPyGy89FFuT30/WE62f5f/k3UZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiMM1RMV; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiMM1RMV"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1233e05c77bso357244c88.1
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 19:14:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769397264; cv=none;
        d=google.com; s=arc-20240605;
        b=XShW2rfpJmCngRZoRhqAU1nOKGN/7k7tO7rB3zEPLpgNMMEJqVwipCpxxvTxMlIlIu
         BgjqRNU+2vmrhmk5OVGtqL1CIJCiqOER0xX5A85UtM23xXkFazfJ4vVYA3RHDTImsAaB
         kUoT3uCJKpbhNOSn8LQyswoG426wcnMC3NlEnEWaEys3s72ZYJllTGqy7Jj/QeKDn5OB
         Oy/wqawSopA7udfApFWunDs4yS5vvqUJzYm4mp3WeB4LXj5sz9+EasatuH910HfTsUUs
         Z9gjcbbZBCH6LnvCP2xPHKFSLw1sJuAbGt6FBMHpg/+Q0F/0GlIwsKPCyRZMRC4o7/Ef
         bhTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OZteIkrAbTA6Ym+pLY4yAIHEIqOCoxgm7eqOHxABVtw=;
        fh=1Q/Ajd+RQ4c2WQ/uwDJSLNIcbB5sw71zmdX9EtLdI/g=;
        b=BvEgAEs3e8AtnCTwpl78l3jROiAU+q9eh0VEo+fR3o3flpw5NyyICfr9LlFKmfSv2F
         W6vsQZCcr7VndTKAqtf10Nf17t7Z48zxG0KpsW7fZo+1pcLoorTwdC8kxec4USosMNle
         0/HC4VzTR9i3O99GYTlcVfgS7fVdC99ZZ3KEguSdkRSIgqKvOohlj9oYCyE8FQPvjf04
         ylfJzv4Xq/8R3eseWUnSI+6GlFDf49RZEhb+J30T3XVIMBumJzlfeieA0pjeTHniz4fr
         /dN6+6DFdQOr59qbEvCAJVxAI6IxKzpo+H3sUpZmRn+67pjZ2H3xBrkS1TjiWiZrd/vw
         8Mvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769397264; x=1770002064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZteIkrAbTA6Ym+pLY4yAIHEIqOCoxgm7eqOHxABVtw=;
        b=kiMM1RMVnx0uYq4GqLef97ua6f4ShN4APrazo84Dmtlr0jl9XLb6d6IbTxJ74Bl0kU
         MOPOCG5k+zXD4nWQjm+b5p7NFg4z2wksCglSUcu53LFz4NAVZTqLOUWzQ+hrUlIFprgs
         gfo4tthc8Wjry+kRkH0IyJ85DCOA3WxXCkarERsRRFBIL5FaUvgx1dFRk/QjRMt/pR61
         EvN5nkIT9vAXjE8I0H6F7xRFO0GdSKnigdt0Nh6vC8M4BPjPptqozTi68B1FXo/sHYkU
         Gc+U0UN5f23tYbWc4pGAH06lKgNYCWyQ8/lfXImO4kgQQNIX7DmyEYW+WqEqhouT7vxA
         lMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769397264; x=1770002064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZteIkrAbTA6Ym+pLY4yAIHEIqOCoxgm7eqOHxABVtw=;
        b=vIuO7U1S91GVHn6W9xujB1F+U/yT+ex8/574lAre8TAjZIIuT6Ix1SrfSDaGcYUcHS
         7MVHIzN7+kaYQEeUNWTJaFnCkGYbkiDA6HpBpOiBQCev6LimK5u3l+Xb3Uf1bNw5xbkW
         Ki5NrO4HH5w473BvTJEiLWoaqKUdhtp++TxDOF/y+L7UENBfeovTv4KGfwZAcec97nsW
         SjxzfuaxvyOwMvG+nR+du+9De7OMJkdnkadMhpBUUZnBBYEEB4k+WjgqxkVBBv1jEJi9
         Xg47b0iIq1fjJtcrtKgv0HQGUTlJqgzoRcHGV6myjxF/vR455fepdHGOU28yJJgj5spZ
         ZAeg==
X-Forwarded-Encrypted: i=1; AJvYcCXWFr75Psg9xc1O+g9t16jL7V6n0i0VFJBeFRoCTW2xy52uCvnzK5N71l2kWvz2E36i+nG3d6Bxx8dl8VGpjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0jbNULND9kDZuN+5Ya2uXIrLEleGraH9rvMA4eZur2zyH9nmQ
	utS0SOdXTQjPXWdAwgVMJidunk0NqwzOLqm5IF8/qiPpkQWGa0ueHpreG3tXiUW4dx1M38HECkw
	0i3GGdKFtWXypr5zxzFncM2CZumtAUXg=
X-Gm-Gg: AZuq6aKFPewN0LwBqqUn32ree1v7FKtlx5UMhnnlbl1BEyycMYGLDykCDkJ1E2nbJMN
	zgWK8e+KNzr4BBATqpZtWLSs+X0mSzIloyuq44DaDhEyqozDUcyL6oL3TcjaoFBr8jpPhkUPj/n
	5DMJYzmorxPWvPeRML1Ic0PcyfCoivPoKrM1sNtaV/W7wem/ooN8cLUoMxrBkK1elxbutpVABqL
	M1Bj/GP+lXwWaSDDZcNz/Ua9A+2O+rKOjl28GtbhimThVyLc8WtD8HB7bNxgfZE4dn4QTrb5HJT
	qz12ojhIfmIXQc4BWQ01VchOHkClY6jltJEKmYinZJI1SMrhxaJmO05gWY8upCuUV3fLd0cwCy0
	pL2NZ33Kvs1p2
X-Received: by 2002:a05:7300:a984:b0:2ae:5549:2c86 with SMTP id
 5a478bee46e88-2b764508086mr761753eec.5.1769397263833; Sun, 25 Jan 2026
 19:14:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123132132.53854-1-shivamklr@cock.li>
In-Reply-To: <20260123132132.53854-1-shivamklr@cock.li>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 04:14:11 +0100
X-Gm-Features: AZwV_QhwIArKeLyBmOKnaewQ93ie5HmRjVOI9d1V9D18MhbWqr1Ta0kNY64OsLw
Message-ID: <CANiq72mV_Xyh6QakuiqKhiOx6c_=8O5yi41PDWZRL2fb=UY4OQ@mail.gmail.com>
Subject: Re: [PATCH] rust: num: clean up Bounded::__new documentation and comments
To: Shivam Kalra <shivamklr@cock.li>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 2:24=E2=80=AFPM Shivam Kalra <shivamklr@cock.li> wr=
ote:
>
> Remove the redundant paragraph in the documentation of __new now that
> the Safety section explicitly covers the requirement. Additionally,
> add an INVARIANT comment inside the function body where the Bounded
> instance is actually constructed to document that the type invariant
> is upheld.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72mUCUh72BWP4eD1PTDpwdb=
1ML+Xgfom-Ys6thJooqQPwQ@mail.gmail.com/.
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Shivam Kalra <shivamklr@cock.li>

Applied to `rust-fixes` (because it cleans up the other one there) --
thanks everyone!

    [ Reworded slightly. - Miguel ]

Cheers,
Miguel
