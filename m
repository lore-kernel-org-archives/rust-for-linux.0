Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54E9225408
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770642174; cv=pass; b=Wqif5WIxSCuxAqR4EN+mBHAUxlnj/XOBnDZ5RfcpkgxeSn5fsG6gv+zhq0KKr8nWgJFGJ1Fp//+fZIK1GnYYCRQnfIFInhaoIJ9h99S9peKlvxcuv75hn+9zBFt9imL412YzAGrxWXEwP8K7K0Umbq/0yVxoWOl9sSOtXMJ1FC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770642174; c=relaxed/simple;
	bh=9B/UCgO1tyVkfJRuYxeUewthRi8id8Vcztdl2EPgKj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9NWsqHPZHduREN/QeywPjuLUd5CtAJldaq/BbC3e3VVQOMVLTGUyUMjv8DT8scjvG6oSRzyzCikf5b8KMXktMvD19eQaBsmJAFYcChc+ezez0qElx6Hd07NHTLJLxl83bnP+Pm47/4x3xZIxAtcRtTi83AVOUykSTOzyWEyJzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UU7S8d3G; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UU7S8d3G"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b86a9613d8so83180eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 05:02:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770642174; cv=none;
        d=google.com; s=arc-20240605;
        b=iXVnsWgFYn7yPe9Nj0cd8Y7DdiVKhiOZ4TZp/oj9c4va991ElBpAS8JB9itaW3zTw6
         swZuOKakwgSjhb15ClI5+VE7uVdxqDwk2M4gIrQ4smkekldujeO+asQgMUeZgK9OvZ3c
         Zc47pBBk+c6smq5oEbc/EkYfPRMOtBPtx6L/bUS54JRkFNhdJ/akcshXPSrAsnrsMf4+
         eAHg2NjAINQyAxgi6diViDuktUy/pvGmYvSKNu3QReyn9sbz5Upejm+/NNV2rlNBQnaW
         /0bz9ShwJ/UkR7bgojMLuAZaFbmWRCkWTuJp5sksbQNEDtK39taTqKK5kZIRCTIYhcC3
         lJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=khoFsSTVz4b1i11FJkTbeTmQEtUujLgmVbgw/XgwjGg=;
        fh=oKA7eBVyHc8aMddiodr+uWXlvUkoQiNVE7vgmskAg3E=;
        b=dcBHGOYuJD3igVsWWDlkvT+4AFJmVpkwf1IfWT3Q+96dpnuYNzZ+kwZMfcZPMu1Ndc
         SXbU5PljLPJoqWz6JuyG5wM7dBYhmv61+VW3mKofj3I5oVTXGdEAAgEiZ66NHDgoHyl7
         +VUAtoez/QhHGZxoSAHcFSYCeIVZunWJgA76UACx/vo3x3pl4fhTiweTrvv6GYblvEed
         DvRj/FL2pb1bnSnJbOc2tstRw5JelCh5/ZvFyYPca2UC8M2f0gO3PSORZUNBf+Jlv6QX
         LvsmB5CNnqAx1lNOBHqZHj1UkHdOCSUaxvVv60RWhSkQbQ6ekCpVbJsjM+E4bdiXKT3v
         VZTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770642174; x=1771246974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khoFsSTVz4b1i11FJkTbeTmQEtUujLgmVbgw/XgwjGg=;
        b=UU7S8d3GFNEtRb8AJRM6x+qWF8Y8uvIynzbi/MilP42OHszQQAChNUs4gvF5K07YOO
         DjUOXvYHv/azDeY/Ju24bWlggsEsXTml9Z4MEXnSD1C57nEA0t5UFQQHHqY2seySK05D
         QHyEOKztpvyS5/VpAwO8XoLLpAxqAIYVPi4DDUuwuado0mZ9OyPtuhYyk6XJ3Icq+iU+
         fNJ629Z3GmqdgvjUbsJPcqhO7OnZFiFU6PyfRHgLOaLV46Vb/ziZ/bII+RUQaoblxI4f
         2yLe5bka3vA0d27E1gd7PcVY3gOJ+EDmRRm4AnsSPwbvvbVxfDkhnTrd/E2dhySVQvf3
         206g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770642174; x=1771246974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=khoFsSTVz4b1i11FJkTbeTmQEtUujLgmVbgw/XgwjGg=;
        b=HwH4NHLx8AxCN84XKAEjeE1VMMxD8PN5rtG8N05DBcF1mWS1sYAdxWFol6vJDXncMI
         UCpdG7xKL8zM1Y5yYotDTMSSpZNRsKjuJyczR90EzMsk80ZlP1tDe5NiYc+g3BLgAb4C
         uYftzQdlIpPPQcnr16MwcPAcDFu8B9zTufwZ84YT3Bmkgc2WmOiZu2tLkCps+xNuVPkS
         9Tmw0JTjVQm75MSqOcslbnLVQsuvRlCiMV/nxZ1GAeFnFmfDEMroOFa/53p16z2xpDpi
         hmp0XLCVjMZZRJmkU7mXVc8tSDv/Afk7nW95DLevRNE3R002ei0dk0jNwmcVUOUJdYx2
         tavw==
X-Forwarded-Encrypted: i=1; AJvYcCUY7AvEiXTSO+TXhfwbHpHHgnr4ebOMkbK9DHGKiAI9iRAArwz429tjmzb6lUalwq9bzblwDwWE8Kdq3hk87Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQpFVJMiOPyL6uGLhWfS+1OOOhCDK343rQ4e06ksmp3XHy2fJW
	MgsZ+qT539Ps/xQZuYfIVOREbpbxHT+60UJgyrEe9qmjlVkV7EVs2YWd7dHnWOjqghyRlwktwVA
	v1O+GXvgARFl3TgWdc8kDNjXotIjeljo=
X-Gm-Gg: AZuq6aIukMCTcYfsl8G93mDgdLx+mc1wkRLk3j+kO1U+r59SWi/ju2qZr/ymN3EmdWS
	15tFxEKMyQArRpYge8s2V4jljnCk71YgSJRpEZ754n+1dKCTF+p06OzrdAIVHXe/AhiFS/WjzxD
	KRaxVkoAqQ2FR5HLvncRiveF5HCTOt2W66qlcmBcwRadAOU2Qwnk+bbntkzcfT2eiXZrhXFcXj7
	j/YQuVyVhXppInrl9fv4drhSKqsr1CTtasrf/Z/vF4jpZ7uyuwf0FHF1Tmffnic+4tqnK0P665D
	3A0zC+nh54W8vSv6sXB765tUUfzcS3LTThHe3W99wbNn+KsucM8zzA32wy1TqYOe5LZyIcW5Eas
	Q+y80HrsJC+OK
X-Received: by 2002:a05:7300:e607:b0:2ba:75f5:72cd with SMTP id
 5a478bee46e88-2ba75f5830fmr502025eec.9.1770642173699; Mon, 09 Feb 2026
 05:02:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121183719.71659-1-ojeda@kernel.org> <aYmgjEWaLrdsubKM@monoceros>
In-Reply-To: <aYmgjEWaLrdsubKM@monoceros>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 14:02:41 +0100
X-Gm-Features: AZwV_QiSCxvsBPMPbdvLVQ6n5PFjHBckpVSND2cAYzso4jDes2NZlheZfkl0_H0
Message-ID: <CANiq72mMS2EeU9ayDpm+xCz3xQyRBgRyWW8KKvJLAuCC64Xi3g@mail.gmail.com>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 9:56=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Looks good to me. I'll wait for Michal to add his blessing and then when
> picking it up tend to drop the Fixes line. Or do we also care about
> CLIPPY-cleanness in stable?

Yeah, so far we do. At least, back then we decided we would try our
best to keep them clean, and I build the stable and LTS kernels with
Clippy enabled (and I think some downstream users may do development
based on those, so I hope that effort helps).

Worst case, we can always drop that requirement.

In any case, some of these patches, even if not considered Fixes (e.g.
a new lint), sometimes they may need to go "urgently" into `-fixes`
branches rather than `-next` ones, i.e. even without such a tag; and
we can also still send them to stable -- what I usually give the
stable team is a line like:

    Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

I hope that helps!

Cheers,
Miguel
