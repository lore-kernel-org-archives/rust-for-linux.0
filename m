Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817743A1B5
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771507221; cv=pass; b=eICaagdfjNLGdec1CryQAff0hVm0D2NsjzVZ5unCfLH1KNOaONytjra6dq3gY8RLj5z1YXD8HvvPb7w1FCv78jV/pYDKIvQsJG+eeCETAUdjo1unhi8327PL8UDwQ2jNtiHkVYm5TGCgelKhl8t5JKkcdsvSZvYl0Hzbq6QegVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771507221; c=relaxed/simple;
	bh=vVr8azruagpTItYWMgXDzAAuTQk8k6nAPlZCs3Wtpn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nzl0ozxAI9Mj/UdABGVNYrHInxxg/NUZz/W1F2n7qH9gtQl1L4e2EyQWuykllSKMOzTmq7L1Gu1qvwbmDIXHo8m3vUmmOFGXqcoLuIuJ9dn/WhnFGV1rH9nU2Htv9/AwzZnBAVat9qEr8jpyPulo8uU5a2pbKojwjydu/e8cnlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuLFXT+t; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuLFXT+t"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12736a0147cso75552c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 05:20:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771507219; cv=none;
        d=google.com; s=arc-20240605;
        b=dF46VkRAqmHwmRw3Cw/TE8Qi+ymAS0ZXplqMJ1GfLZbBSrcR0gQPpyjAZZHy55Fb8z
         FM4wTM8oVSaMXEcQGswsafH98nEUFL7NFUOdQ1dRtHnCLXu4xmaq5jfrCTqRS98Eaar8
         nxIkNFxxerLUCoivQUe2ViqzQcN2n50Db1jB+n35sSFDspNnCnv1KtzrXaGYOUU6E+Ok
         cwd9ydK1PI7/d5ZrupXj+39Rda28PW2Kdnf+kGcHAaGu2Kvi/rqmKsNrRzggfgwAgvlg
         zymCS1KsSmDA9rWWRmpkl3H/3o9YipmYXpSwwK0qC7CgYGaqv04oLKrNX4m86XOKllLf
         gxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D003WXl0rsbpbUgwmoTNS/NNE3Ye7PnrLAid4+394WE=;
        fh=zcJpQLIWAD1fUn4Un7VCZrG591McDKYYiGLpWlNXvjU=;
        b=CYFaKg1oWp9eCnbwbHv6FKQBHOeqAANh6bZcOHA2VbuvwRgkQfpMKONrCZMjIlKIlJ
         Ku5pv7Vi5R6D8dtrvKkltUGhSlSeG0VFjaRpymPjsHNa8MSCU0AMXDmvCBdnSDuLqjre
         Fu1ErtYcAWpZe4QCEZ+7PWjAGrKrEAQKO/zvaad86PbDrllNJdHRksZ2PuuHbNHfltPT
         U0Ho6XtmiQvBY9H/pCmQH+IR/jVesDtQhJ7sNtCqB8QaAECeoRFzXw0botihm5hU5DaA
         8MtG/GeJH349pIstycXmrhzqpn/cCOXMG+BrqUhsnodOmNCRBpADoMdz7ez3EZknZCZT
         mMaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771507219; x=1772112019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D003WXl0rsbpbUgwmoTNS/NNE3Ye7PnrLAid4+394WE=;
        b=kuLFXT+tFMVEkxkrkjjEOfeHjp2PGtwUAJaYKfceQwJCd0BxK8RUjnb3V88R6AcOZP
         4IIS6AEseXXnFY/TpDPWwGl/k5fhIaetmMJMVDkp3SojXmcWs2xXWsS2XUhRBkeskn30
         D9QuuwhWzemM3oxQLEVRn9qhG9pqxkWho086eOkzodPZoIg9gMNuccQx0TquQa85KzRX
         SeCVJvhocjqisvKoQT7LBESgvaxaf8QSS2Wp76Hb58UKJW7xmZKVwG3BkyU1SjxjHldW
         xNr9k6TaEdm6aY3vx7syc9QIbJRI+Cpf4Ws84mkK8Vo7aIcRxZw6T88ENHAGJmhZA9hU
         0dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771507219; x=1772112019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D003WXl0rsbpbUgwmoTNS/NNE3Ye7PnrLAid4+394WE=;
        b=LztQHfyOXxJPwuXlyJo4wb3BR3U3X6449Uhz70RrlpT+wQz/CSJSwj23rMG5l7oPdZ
         /L53VuhjfVcyGbXzgj2DTERYVNr45Hllc4UlGIQPTmXsdZ59hgJst9/yZvniyZwEkpLj
         BJfzLB2yuCRPXFC37DjmmH1HhMo4tDzuu//bK0UTaUdieCH7HI8HZO407WrpbP8Lj9zv
         JE49pO9SqKGHgd+ySDehS1iWpBFHGAzGON5rgsypDW+amg+GpCTWzSlAMD3/E7CQNDCk
         xpqBeLAXpyR+GwkdK2EbHbjQtHP3bhd/jzBht9YUUZ4pU3JfSKdRXSkhd40pPlyqpJDZ
         i4VA==
X-Forwarded-Encrypted: i=1; AJvYcCX4bRNle0Hg0dnSzwY2oK0X6k3FNqs0lDNwA8wb+942GriWzAj25jzHws1inrLBWRCQdtvoRM0SImF+ZWfBhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx72I2Xg+EUE+xGeGjKHANXKoBROyW3e7yr6L3+TbwGkMAodzUT
	MS5RgPLcclgCMHHYTPBE7qwXarE6+eiGDHKVB1RGIIRFE85z9HYdVyK+9RZAbOMSCcoYWNcQypA
	iTakp8y1nmBMJVkP6DZnneH+Xun9fhu4=
X-Gm-Gg: AZuq6aK8zeOTOXcYRRqjlfbBkAZ4g2m7stkauFAY84GexwT//cxuJ13o9ciQzd8DE6n
	bP5bBK9bZZ/fNdQcbpasT5cb+npbPA4oRq90kyUXU34Omc5Lyfqfd1bmUE1znQXZM2aUekP6soV
	ukEk0d5k2iK+WmWegWIGfp8mHeC1nMrwvpOpMzUrp/q0QwcLkuyyfTPZMcmVefn2SBVzg5ufUEu
	mbNoJXpIXgTaJRkaKUm7c16rnCpGeyq24OxUFlCwIB0j8MHptwC0kQVi13z1dYCOUV8aEq4ZoKy
	Eca2mfCmTi7IBAJjaVhKnxlv4FucXIeq0yN7TZdA/nNfFPMd/Z77FVaJDih+mLnW0Z7PY/oxU0/
	nMpDwA16I7Bb9tJu4nBKDfiQe
X-Received: by 2002:a05:7300:e60c:b0:2ba:8204:3f81 with SMTP id
 5a478bee46e88-2baba0f8623mr5294480eec.9.1771507219516; Thu, 19 Feb 2026
 05:20:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-atomic-sub-v2-0-8bd99cadf26d@kernel.org> <20260219-atomic-sub-v2-1-8bd99cadf26d@kernel.org>
In-Reply-To: <20260219-atomic-sub-v2-1-8bd99cadf26d@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 14:20:03 +0100
X-Gm-Features: AaiRm532x5HC-k5-9hdfponpI3GrzX134IVXvxKuj9doKOXgFhOXho-5dugHr1o
Message-ID: <CANiq72=JXKLwSDtS2TPr4zy=nEjKOPTKcG+Yg0U4u+GU07WwdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: atomic: add fetch_sub
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 1:20=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> +        fn fetch_sub[acquire, release, relaxed](a: &AtomicRepr<Self>, v:=
 Self::Delta) -> Self {
> +            // SAFETY: `a.as_ptr()` is valid and properly aligned.
> +            unsafe { bindings::#call(v, a.as_ptr().cast()) }
> +        }

[ I see `fetch_add` does the same, so it is fine here in this patch
for consistency, but I thought I would leave a note here anyway... ]

The safety comment, as written, could be read as just saying something
it is true without justifying it. Something like:

    `a.as_ptr()` guarantees the returned pointer is valid and properly alig=
ned.

would show better why it is such, rather than simply stating it.

Cheers,
Miguel
