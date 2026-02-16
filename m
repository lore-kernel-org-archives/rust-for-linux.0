Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC287277026
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 20:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273313; cv=pass; b=AL1oiKhcTaboOJ653I6IKxJ+hT0Udd25wcRg9rZJZGGjWjHUEc4zt/igtey4MKyINwaelMmrgKBCJCB/87sdQsGYHuanXXMbfQ6h3JbElhg8u5UtlXkofns6Tfn73WlKBSIMjg5EMOmyLGlbf5Shdvo7DYCDH+HqiZfxQ8CvNYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273313; c=relaxed/simple;
	bh=00X49G8URmAPWOmKUIz9whqVAwYvZ81nXkkyquZNNnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ip6uC5inSI26hzy//ewagUljJnVCPsPMb65BgUlaFCafYAOea1GfO3MQRLhhHPt+u2oF8wRH3CxTLgu7yXg8gwVfVQ+PFP895y+jNiZGFyHZNkhOf/gB+RGX9gXjGSOwKD1swFTupePJna2W1M7dANoghEScjs1WsesgreqWm2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkG0sB2a; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkG0sB2a"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b86a9613d8so325319eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 12:21:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771273311; cv=none;
        d=google.com; s=arc-20240605;
        b=I468J87ge4lctyCRKTzYiz8E0y5RkigpaJ/1fYRa4bR1Uk8KNY4AkyXjvneSFzq5kK
         4fTAzCDf3KcM+Ec4jm1W6Unay65FxIVlSmPCmJW8udT8Hz+REB4WUDehrqMi6jwZpqW7
         ICf9Po17RSKfznau04Wnd1kT1xJhpX5GmsbIf8Udz2wPZ/sEVMw+uyYCg19Vvg1KdEia
         371ChqQm23JoBHYnnJzGNKjx75NxzaWuqecUEisZlD5xmFiR0St/vRPC/dYIzH/t0/TX
         f+M86Bo5dg6HZwoEnA+jF5EbtNepkd0oxg/t/VKw9Mx8ra1s4WjvRW12yQ6AFkpywCAH
         pwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x9S8/lYesIb/tgYict9NJPbXaFCz8daWdDEaW54kWGg=;
        fh=R7p6W8Y1GmNYt+VNSUZOiHFrg0PiBC2PyANP2B2j6II=;
        b=SB8n/uAm/F5wLhb7ZCV0HJ87PN+0zODyInI9VHJsBeIp9bq7y0g4taZQxzEorci4Zz
         iL/YCPMEt690w2Fx0DZzkLsA8q8HnOZfsGH6uXeW6ULYQ/cnqNk5NJ8naN6cGedlLss0
         lH+Q9UipWIog7A3VM2xI6WP5xYI8UstY6o1eyjRmLELGpyZbcJiZFGr8XsV87h8gGuxg
         tDOOwjf+XD7w/i7UPCj2R/BHUaHr9w1w4q9MKP6Y1ZyqpkYMqTFkzJnEldtc5vsKladW
         dR+XmxLzoFTewTdYRRM5yoE+q/DvfBAhbyDVtCPGZiGkPLRDkYtUa62katAIpn366UN6
         SWZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771273311; x=1771878111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9S8/lYesIb/tgYict9NJPbXaFCz8daWdDEaW54kWGg=;
        b=FkG0sB2aM16LzakyiXOuKmINWlnqUkqNYk9X9kkYqV94OqWOWCtptzsmfQSRfnf8UJ
         GL45rF3luc72w7KM5mvCO/0E8FI+5TbUsCwP9UhvAHXCWS2dATtqswkBYlQWYni/Yuqc
         I5q/+gBU4BvH2YtsKjlvsa4ik1tko4/mYVFToMluLUNphUNeDA46BqeEX20tf1SSQl+y
         HoM2EQzC6nZM56iHNVJp4zOXj6FOznfAHnxpRr83oSRrx2WjEY14Qxprrq+9KYWVHLg0
         h9ZENDVbb5TPrEinpwL6tljO224+8jCE9CS2DClfRRLzIoeoeiKOOJ+PRnDX0GAOfbRn
         FYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771273311; x=1771878111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x9S8/lYesIb/tgYict9NJPbXaFCz8daWdDEaW54kWGg=;
        b=huTxmYARwxQxHhmSjhbqQ7jyepaB9iy1/OfEZZZQs2DOqbJ447D/H2cVySDWMqa9rA
         wp6MDEU8mqyD6C+XgqjawT6D1YKQyPzsYt3tu3siN7603cKKnhCfndLbQSqfr9XkEXXI
         KX8F1XNt2WY+ssIngW/prC03pMslteoBNoouRxVHtA9CZaanlhnECcouMTbeUuff/DgR
         FVMt4+EValx2MIFuhJYEUeZES3jCvwkcq579ckgvq0YBQmvqxtIMm0zlQR2i0iIW8ion
         DIHB8ApNuiAg+QSUJEeGIdKECZ1/qz+V0Z6rlVSDjZkR26oBsl4cGLVrnT1OwksOJyTs
         3EAw==
X-Gm-Message-State: AOJu0YyElswfcSdsjq/HAqQdatw7nAoTRR0tuh2nARwCX3TOUfR1MopF
	mbXgkJLCFJvwrl3QaV4peU+ewLUpp/ZJq6rAigzdgnLX3VobLdYPDOzKKMGkShH37mDmpbLbU6M
	ECV9DGyM9wnrKSZvRKz09QaV73WNeMus=
X-Gm-Gg: AZuq6aKaBJZaHp73kQ+zG23agaO0mNuC/bblAvbyAOamQRv67zB91+MrBCQghRRl7Km
	68TG2qbLWPSICpnw3zBjJtz+UM73ozX/CeUm9XyVl8UXiP+SBTCeuuufZgaAMf2rd9NYRArMqOk
	ZOjxw8X7e6u4lYCbplSWoRirmoRX1tyQ4dPkwJdph0fP7X9j034JfxF2sSdEYXjoseIC1bgBtCd
	fXvajwa8mmOcS4ghhm9ERo5UmXp4Mmzj4FKIGL/nN4luQngfO0p9oeuv4D5zp6PlS0OD6Bx5+0J
	M6AKP6Xj2PyCj2R8f7s9qGZ8QUukYm6WXv14O5RVCl2baSGQI8C21WsQcvd2zvzSVYV5p+PGZH3
	tTh2TbleAM9OkGrJoF46jhLYP
X-Received: by 2002:a05:7300:2327:b0:2b8:2082:5bc5 with SMTP id
 5a478bee46e88-2baba0da25fmr2948297eec.5.1771273311341; Mon, 16 Feb 2026
 12:21:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212155735.185415-1-alizainuimx@gmail.com>
In-Reply-To: <20260212155735.185415-1-alizainuimx@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Feb 2026 21:21:39 +0100
X-Gm-Features: AaiRm50x27iPLCh1MKeHW3nIiD19oTdF8ZzmKFPqFZWTSIBFU0kJc4ZQh731gL4
Message-ID: <CANiq72nPF_L2cjewDhgpiBxg_TTGMKPEknXL4Uqwi8eKGBJ+QQ@mail.gmail.com>
Subject: Re: [PATCH] rust: list: Extend safety comment in List::remove
To: Ali Zain <alizainuimx@gmail.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 4:57=E2=80=AFPM Ali Zain <alizainuimx@gmail.com> wr=
ote:
>
> Clarify that T::view_links(item) returns embedded link fields
> that remain valid for the lifetime of the reference.
>
> No functional change.
>
> Signed-off-by: Ali Zain <alizainuimx@gmail.com>

Thanks for the patch!

In the future, please remember to Cc all relevant reviewers and
maintainers (doing it here for you); otherwise, your patch may be lost
among many others in the list.

You can use `scripts/get_maintainers.pl` to get the list, or the
commands I have at the bottom to generate `--to` and `--cc` flags:

  https://rust-for-linux.com/contributing#submitting-patches

Cheers,
Miguel
