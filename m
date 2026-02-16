Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BA517993
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 20:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273775; cv=pass; b=S4lAmjs97ZcdbzZMBkz+3IyQRLalbmxvoTooWPCEJy+lywrETWfarGdVUbBz++gGsUf3lO4N4CGvJp+PNaZenOU+RnOu3ZkYfhqnmSx70SjKHke499jgji0hVyDq9xA1O07A5EjPtLeZ86YGZUZBpCnHGKHX0NBOGrdfC6+43l4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273775; c=relaxed/simple;
	bh=4ibFEzXXChAO2RqRcrNQP0FMTVK5UfUedZhWCZ2f7wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+INIkS7TE80RNnLPHxyilO62EcmFms0Gx6LU4hZLSWJkTcXebNLXRQ1aCmMCg9J8HcJICchpSgusf+NsbiiGvzTQdorDn1W1HPFRBWkD855u6FF5vwSHE6qqAH0Nz68oyyk2jfhIbI7z0HhmalheZAWB/DbartIfXCOKdRxzbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNaFPRvG; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNaFPRvG"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba76d64d14so151405eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 12:29:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771273774; cv=none;
        d=google.com; s=arc-20240605;
        b=JcSYAoUBaCN3XQ6LQ06BbGcibCR0Q5ZNu2h1Z31zLbwU09xGSFs1v6GjfIaBYrhQT4
         WxKn9zgRdFSVv5P7LhYr1iLz3q3FD0tgCXMa0G3IIpLB8GFfGWgiK1GpU5W9leKRnRhj
         bYvAPfLVGb5uy+Ay6PHGg7vKtiLSssgyLKDZLMarx86qbHeZ8PjvGRVI/ynxTArVC9fq
         4IoDCd21dGCDdA48URIHhCo014I2i4lMunyTHMhC65AxsBvyp/cMRBCe8GTaJyANU+tt
         6ZdmMmnAiWIbOz0P0hmwooTB67oC12UpxvQXTRP/Zp27iAXZxfx+XSJ0Xf0/OJP1aT7y
         NNeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yvTmw0FTWEFnlNknsUVXo5zpxpcrF/q3/BW4Z2G1xis=;
        fh=R7p6W8Y1GmNYt+VNSUZOiHFrg0PiBC2PyANP2B2j6II=;
        b=a6VGdxGMnBVl68Z5+/B1jSJizoD9p+GvIPN6NP+aUsO/HgWStIn8TSqjVwfbDEOqsl
         xhSbEwlp6KZ8FflbUJ3+FRss/QlrZnb5/LzxN0eOTBlQ+mRA3mJh6lcN5AwnGMKJs0LA
         d45fZRAT67zFb0Aq4ufJZeVvQUyI2RYDHfUba8S5XVCtjXXGeruX08vVP4DKYGw7OQkC
         QsUYooI3y2BL2GaHQf9TLTOTO/lhnhcIdSrAbOWwJwmah477xWNeL9z+fAw0IaA8XEfB
         yPbNlHl9Nwj464lxbY2TksM3T6QumYPHpTD6dhf/tCsYCHzbgjEC/26s6OVq47Ln9+a4
         fGnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771273774; x=1771878574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvTmw0FTWEFnlNknsUVXo5zpxpcrF/q3/BW4Z2G1xis=;
        b=iNaFPRvGuZyI/704IVrOBFKlLKLfEFxkzh1ty7Dvd6K6abzBb3V2s+yBoU9/0il3yn
         o2JZD14ycJQkCEbAJReGxKl7iHk7DC6OZQqvfeiKXJE1OXnZ6pKKw3bMJvfkkg6iBSCy
         lawCuKrncwieNFdNjkvp6oI9rC4z914xChL+PAppmIp1O34SlooWOuHYULUCKc/rkTBI
         qXlwJcR9V6JhBtDhb2wc8gm+88IZMRmozSofmwUTblCmybrhrjL3dhPfc8oMgARQSKqW
         AM1qsTqr/RL/37SSRmLzuHEeU5Oq3VfAI5Hy42O5RVKT7BY8SMX03LSCb4u3v0C0qFJw
         Dwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771273774; x=1771878574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yvTmw0FTWEFnlNknsUVXo5zpxpcrF/q3/BW4Z2G1xis=;
        b=Ohu316NpheMC9B9D4n/p6eRLIzTuROfC/8xckdrWGr3pDb3ccQKe0Wq9F95gY0tmz/
         TciCBBt4f/OG1rUHsiEC7PSGI5+s/TZg2tQr9jWCxtLzLVXBbU/A+/Vn2HEhR2vICAID
         KnKAd3x5Ptr2Qn0CJHo8x7HdWYwF1dqfXaTt0da4elQotENMuYkPHe43jEGV4nIcmvrx
         FICSzd/N9BKogh5ssG+K1jN6VIrZPaX5atwLTd+y4i551EiS652SeM2Foy/p4qCG7zis
         a43QUcapBMN39FG1bttjXKvDB5JJKHWO/CAHWexynBpy7xQ0UqmUTPJQP92piAccplea
         kriQ==
X-Gm-Message-State: AOJu0Yzz1tkHe3glML6rWHw5m4XemKUA0OcegsBAHR8OBrhcHZHsAdnK
	r5H4bo/Gfdbs4yzNMQpiQSV1+c9hzu8n5FdkC1k+VLdzR3i4LEUIzQdX5rJmP8paNKkbpJz3s0Q
	Us9PdhepVxX18uSJunyJ+sCRBQ9u4xqg=
X-Gm-Gg: AZuq6aLsGzsjrKkMLbW1odwAxmBAbztxzOgkBA+e/8cHHLpPxvhsvFQEZmR34zm/5yT
	ipWuL9fKd4p9Zkewg27tXf5IN4+I4rBjGpX3Lw1HD69n+al3X/9sKudR94FoiUi3wwEJRsNnhr0
	f69mjcdIoEd4FK2JWklY3NfIgEOilZPT9VZ8aGYdHORlhIPh0H/KRLgTwEZwltpCSMx6R1kZCCW
	NafFNMLGXPvz55sBbHK2TWyrrJuSZshxBZaYpb5pb7H3F7duv+2zYmakjO1JaSwYfNsgutYh+qR
	78LtkMvnJN41DYCRrHBoSH7Oz5N8AdEShdJjNkEDN+VWO3+Sv6M/Nw9qnQUWgRZ4Dd8osTgzAYb
	WmLZjqDWBakXWJGfv81usvDryePxkoY/o3LQ=
X-Received: by 2002:a05:7301:1299:b0:2b9:ddef:2c13 with SMTP id
 5a478bee46e88-2baba09ccf4mr2730305eec.5.1771273773580; Mon, 16 Feb 2026
 12:29:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212155735.185415-1-alizainuimx@gmail.com> <CANiq72nPF_L2cjewDhgpiBxg_TTGMKPEknXL4Uqwi8eKGBJ+QQ@mail.gmail.com>
In-Reply-To: <CANiq72nPF_L2cjewDhgpiBxg_TTGMKPEknXL4Uqwi8eKGBJ+QQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Feb 2026 21:29:21 +0100
X-Gm-Features: AaiRm514Nvn34a0AlpJKnuQVZVNGXyJi0l9Cy8JsJM6D_Cpcsdt2MaiqoDRTXjo
Message-ID: <CANiq72mkw6dBu-0uOpwSv_qQEREfLi3uUR4h2f48ViuSB_LL_A@mail.gmail.com>
Subject: Re: [PATCH] rust: list: Extend safety comment in List::remove
To: Ali Zain <alizainuimx@gmail.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 9:21=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks for the patch!

I see you sent a similar one, I think meant to be v2 of this one, in
another thread now:

  https://lore.kernel.org/rust-for-linux/20260213053123.8869-1-alizainuimx@=
gmail.com/

I will reply there.

Cheers,
Miguel
