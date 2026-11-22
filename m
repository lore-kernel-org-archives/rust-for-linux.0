Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795351082;
	b=lRQrdo92D2u51O3HBYraA2ngHiBJcvvx56DbYBu+JENf+LR/B1wQBFF6HrpNIXZo57ps
	 Pr0iT95ncRmzRelObN6sTuLR56BBSW6hFtKKjM/B0kHWUnOIx1m/gHPQdcJBXyn5RcUD6
	 oflywBP5v8Uc9VAo6pt815Kr6lShBUR7tVR0RqNgTi6TqtuoRnNDYMguHTWyfHfhuLzVE
	 xQ+ERsFiT/rkQ3Fn+wLuYp+yXCYKdd9t3yprCqZSL+CfsDwGHv2I9VCpPc/UWxlwceAy/
	 h7eWN0DEdyyY7MFOXrt8s+aTalTRwrQFRp7JFYoKpP8fwRGBKZGLVfCIVL2BZg1Nkiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=sSxa9yEgOlqZ63H+K7FWjY/eznutom2udTRUeQVQF9M=;
	b=RPy7UEHNVFpHZr4R2FMKDC7wjZdzxBy22M+4OV9xXeFfYuo1Y3eam7Qpgy7SHWH/a/WV
	 JKVHqUYcxkX2xz6wS5TEh8BGCg4hmH/BLv82+kU/t7z73OaIFOjHGn3H2sYTLSokrXmny
	 RZvGVSZAhQxDA+pAB0qVA8vHqrOFVpzm8eg2rq5uuqvk4EeNlOidw9hW23lRYngS3b6a5
	 FMshxK0yOn7Fu+nLj1r8fzYieMQ5QCnJ1IPCqdwKXAPzOcPHg5qObI+n96agozlGaaHuG
	 cciPdgNZcpnD3QSbvbWKH0GdtTJ5ncAp9MNaf3YJSStGWrdX5BlUTJ3P2R+0aRWJkmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxyjyyWl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266F1606A320
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 12:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 266F1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxyjyyWl
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53639b8903bso31695961cf.0
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 04:38:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795351081; cv=none;
        d=google.com; s=arc-20260327;
        b=QvJLZiOpsiN0HHCftSOVPTijGvmnzawZp5ziIRhK5Zkq4YdNYnmG8zWj5dwlyw2LyD
         H07W57o87ouZEAbDYOfEtACtvkTC3jPrl9bfkzTl7dnZtnvRrekCzz7otkBSTv7MeA19
         TW0pTeCVxwPztRuYudvP3mULtlf2nPF24mA/a07wttoQjJgQmTH7ZMK0X4m8uhSSifOh
         VFOcsMAF24tphgkxy7QAdn/55hqtn0PpFzoCoebhcc/QsbfU1Jwsaf/odktbRxu4dNMk
         28JRoro44KA2uWjehLEp7K7Ta8LD+ZAhw0p7H9gM8gnhKw4XQwCadpdzjuqM2RkrnGdS
         LxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sSxa9yEgOlqZ63H+K7FWjY/eznutom2udTRUeQVQF9M=;
        fh=stDEqcpZm2mUivuVzZpwwJnmVT/QeI/0+oJqRoKEd2Y=;
        b=TIPC0Jz5wIiZjCn1hrDeY8qBCewlkGGBJlo3wOnrr7VYii5wGm8BfTucCOcib3Qz0b
         +mGmS9q4fe0bjdUSB5NiEiu7w54C9M7sn163hA5n9SN222A8frTOUCUOy386+v/MXkF1
         GxAK8p9Kifhb+q2KslkMN4GL2oOOBLBpjWWCCFzsC0HLb5IslaQ9xt/1HT+nHyQUrS7T
         2yFiriGR/QDQDDYlHajuJpaE3/pMJ1f9mgYAr9Cmmif9qUMXhQzl6aLnkw4HAbEKtgVj
         6/IBFTz9fXLsaS7AeMYh0PtapIPWVgtnJEpyJFbr4/BXzGHk2bwPKwh8vD97lNBcrK55
         wv+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795351081; x=1795955881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sSxa9yEgOlqZ63H+K7FWjY/eznutom2udTRUeQVQF9M=;
        b=OxyjyyWlla54w/YItAgCVSV7fGo71ivJZcClFg4EVay4fC/ENqVnGsTAw6GgMYM9Tx
         gNzZXd1qZ4FE/TSudoUTNisVTE0FxiGpmLPHdREWE+ItnR6/N2pRcC/jyvFUs9xeer6h
         +3qs1sZ6R1bG/ULNoRXSAVoaMmaznmslAHyy1o4pkzVCEG2fy+6JZtoQo5K4UlWp+9Gb
         STSvo/gwrNUMxWbiEWdHKYgUdNQOSZ9XS0+mJ631tGxsx9oqmg2G464zjXnst3P5AH1A
         eY2ZOHwfl5eO/Md62CxOuSqan37W5Yx6KRCBvcm7oDoBYsuCMJz0+IJt5vrOl4cJwXH5
         owaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795351081; x=1795955881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSxa9yEgOlqZ63H+K7FWjY/eznutom2udTRUeQVQF9M=;
        b=XA9FNXUL+yTITKpoV6rxyhHC70xdwYppAUaJbOmOvcYi8s+xRvFQzjE8hX5g9yzXlT
         qeyYP1tidLLROUCT5p8SWU4zoLvRau1vinT6DkgYPnOsWczpU+IgruOeKvkIDLNrpwrn
         +fqA7vDtHodqXphXsNdyruAGzBEbx3OCgXZRnUzMXYvBmfV97+XiIzKxocbPhzEHpzrc
         fXGYjP7Gq1mZQVqdWyxoUJovAlcVv/4ovPjmHG5xjz94GgJ0EO14sbqsnJ8AKG4Ko3Nk
         pcuLnY/d0AdjrbvIHa6CkZJ69C2vik02+WTttKvXE+kTgFLfKOJcEWBiaREe+CTmfSwF
         Ufig==
X-Gm-Message-State: APuU4Z+yvauuCsJXARDB/SL8IrWPVQCDZ1Bqwd9deowzGgDZGFSJ91Rp
	RLXaHWKQ4gzSTWjbqS4KjtvBYjeVBmrpGTBKANHqYCelHbngjk/NQe9uDrpkQPpciausvz8A/h6
	zSxr/tVa/t3AqQ5+Zz3BJRlGuD//XM9I=
X-Gm-Gg: AZFdTZcMbWScG23reLNs3eQXH9Yf5XQLh/0IP3sXe0mNreyOUHnsXOvygw9cdICkxsI
	wFrjIAIPvbbmUCBoi2PXOJ2Nz7sX4vbutth41f8H2ZFXrsfhaqp9OvhcXl2/FlNhOBOONw7IN+w
	lACuSnCBNW1ABv5dp80cYwhx6hPKSbBqJG7Y8zt7wmivPYIb9XqLqpkOxR/9NQALU2vJBLd7G7h
	yEssbxFEyLvlqB0XQbz1JaLsnS7qi41xOarEdEC+21DfoLsxwxBp9iwjwHph5xhD9hXMjYQIeXa
	MtFP92EApvGMfeBrj2ksM9gPZsu/qCyMOJhvpNLfLOGCHHqf/K371Lf71HPoYcyDzTy82Utc5Oe
	QIZhrd0FP42jxsSvER5Xd0h+7DbtHcNA4VF7X
X-Received: by 2002:ac8:5a0f:0:b0:531:2eb:be76 with SMTP id
 d75a77b69052e-55d6fcf94aamr171245131cf.22.1795351081084; Sun, 22 Nov 2026
 04:38:01 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122072007.14685-1-mbkchelofficialdev@gmail.com>
 <CANiq72kV0YwG54i6fLSv1Rwtu+3Ks8XUzpdkZohY5tiH6LzhRA@mail.gmail.com> <CA+YDrKBYCB+AzOgDY6M6cczSyVNkY8me9UiYB-tZNz1bbanPnQ@mail.gmail.com>
In-Reply-To: <CA+YDrKBYCB+AzOgDY6M6cczSyVNkY8me9UiYB-tZNz1bbanPnQ@mail.gmail.com>
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Date: Sun, 22 Nov 2026 14:37:49 +0200
X-Gm-Features: Aa3M54r8LittEhUI_zZQXdsqi47SWLexuaLd5JYLeAxAvAn9FF1NmJfcK0xT63Q
Message-ID: <CA+YDrKD0sWWxrgC-BaURdyuv=kmuh0HsfV7wYUJ2+-PdFvb9ag@mail.gmail.com>
Subject: Re: [PATCH v3] rust: gpu: buddy: store the allocator inside the Mutex
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Joel Fernandes <jfern@kernel.org>, 
	Matthew Auld <matthew.auld@intel.com>, Arun Pravin <arunpravin.paneerselvam@amd.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

No reason at all, I accidentally dropped the brackets. Keeping [`Opaque`]
when applying sounds good, thanks!

Best regards,
Ivan

=D0=B2=D1=81, 22 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3., 13:55 Ivan=
 Tverdokhleb <mbkchelofficialdev@gmail.com>:
>
> Hi Miguel,
>
> No reason at all, I accidentally dropped the brackets. Keeping [`Opaque`]
> when applying sounds good, thanks!
>
> Best regards,
> Ivan
>
>
> =D0=B2=D1=81, 22 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3., 12:48 Mi=
guel Ojeda <miguel.ojeda.sandonis@gmail.com>:
>>
>> On Sun, Nov 22, 2026 at 8:20=E2=80=AFAM Ivan Tverdokhleb
>> <mbkchelofficialdev@gmail.com> wrote:
>> >
>> > -/// The inner [`Opaque`] contains an initialized buddy allocator.
>> > +/// The `inner` field contains an initialized buddy allocator wrapped=
 in `Opaque`.
>>
>> No need for a new version (I just noticed this skimming around), but
>> please keep the intra-doc link when applying the patch. Or is there a
>> reason why it is removed?
>>
>> Thanks!
>>
>> Cheers,
>> Miguel
