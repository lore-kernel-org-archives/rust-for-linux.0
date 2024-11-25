Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495B010F7
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 11:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732534298; cv=none; b=rSIoUEhe4fL54+d83d+mYPKPwNTAQ4piIuV5F54lNEKxy93gyde8DY6SQ1keXAqtYC0m6xH0wgzUiE4yDKkMd2M2pMPdvC3+52/iiECtPtYJsDFc0Ye1D1Vokuc7AmbX6a6WgeIR70MxWCLOTrAsvdY4Amc9GC2MuAsL8ohDmQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732534298; c=relaxed/simple;
	bh=ILIVn2WWp4C6OWM+ctTCqHnnJVEdLwOSDJAp+AS7gDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fb1VBZskH7fbJp8+hbXS422yBNmhWz4VZXvno/s/XVwdP4NrA4UmLRdhhz8URLpYQ7QiFPt/AOD6JWVtUzFIEX1kZox6IocKE6lJFdqC939hEIFQrVrbqpmS0tundkgCzoOxBwzyo1uZ2DsMX9xG9inBHvqS0GmcKefztDEVaLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=B7eyT1qY; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="B7eyT1qY"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aaddeso6044612a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 03:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732534293; x=1733139093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6SJ38ce5tn0Fxk14OTp0L+1fb6LfP6hxY0gY3dvSom0=;
        b=B7eyT1qYvwKL3RTvH/nWouByncQhvgGSZLbuqSM7PU+R3XAanT0fHg9lwtRDWpjlhi
         KDpzZe/8LUKZYRj44+0tqgzrN4bhjBh4opmAQsI4vyBj7XB2VY8ge8wb3lVEPVbF0yJ/
         2oDixc7vqEpGsarg8cKsYC6FmrNfunWYahWNsGx1hCYYW03TNTdh2zwoOI0pCgdmd5Z7
         A+IumMut6QnD9246rtRn7gExl3OYnXXVwzb44PloCrDm+YcZBEnBmpNB5SZVi/jOpM4v
         lI52hSs/XPlZFpYgaRiyTvtZQJqVRAyE1PS33CK3uKaHF8NcZmCjZXYN8DBazxL5nmbG
         33mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732534293; x=1733139093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6SJ38ce5tn0Fxk14OTp0L+1fb6LfP6hxY0gY3dvSom0=;
        b=kLNhqId30qg/rrvKQvRpoY129R3KGFYcdHeRi66ojV9tMSMYjAJ2aLequhH1Ga7lp8
         s6Myid4bh7XFBnzUqAlM9ElLBKn++htHadThMWwBVikvq3lB65uU1DEK8lBNhTutA7Km
         3PC1nFSa0saCn05xZdmMlY70/nDApgIlzL+DAo7OPDsIKO0BofsC25BzhAsuuYGG1vzA
         PbwN0geQyJWXI/jYkuqntQrg1SMaFzD9mL1BOniKhn3nCW8eLaIbS4cGLbyQJVgS08fE
         EgNWUFL+99pVF8Dkxpr8GsZok0Bgkk6MPsdw1XNha8auHIJaYeUBk1rmGdw25blsFftA
         AUdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNAQzDNdgGOekUmaHxocbE46sh1FYPmZO8mVYHVZk3JRdxHz7LaTyH9Xl1nClyPhQPblQNIf62qGcXZBuNdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvm7/3VChwbnEVe4hPD1jh7IIrf8ffm2S/ns2OwqRd4WTwk/VZ
	PO5csvAt2NeZxfF5OPRj60JiLtXpgm/vrNApSzWRLbV88lbf0K1uE80Dmw9mdyM=
X-Gm-Gg: ASbGnct5YXfbP7xejbci4wee8wPxPmyg6Casro9F2Ugd9FJpi6VDaTldwJrc2HSYCN2
	XNpHBQkjLPOVDQxrzvh6+k8D/lIO1s/ZqhjFFHoZ7f30O60MPqV2B5089cPaL40cRlZydeJIS9s
	3CKSde2Zz3WGwIqrxAJP/HVBbfdcezKMWO8q5WHr2oFDl0rHzaXq/a153jZg066JFkzEqCAZU77
	NYoHyDXyMQPqWoRNkT2n5Bh6jzrfxJIekO6b2U1LJBCBhvlE1EeXmEklTJz
X-Google-Smtp-Source: AGHT+IGVQi/do5CMnyA0mWSbyTfsOq40lvfRiLeQwrXHZtfO71h6GNrlNg8QoYlDJ0BbCU/Bp73urw==
X-Received: by 2002:a05:6402:28a4:b0:5d0:214b:8f80 with SMTP id 4fb4d7f45d1cf-5d0214b8fffmr8993104a12.21.1732534293095;
        Mon, 25 Nov 2024 03:31:33 -0800 (PST)
Received: from [10.0.5.28] (remote.cdn77.com. [95.168.203.222])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3c0044sm4049961a12.48.2024.11.25.03.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 03:31:31 -0800 (PST)
Message-ID: <e83d6617-ef4e-478a-a274-766b0834ccb7@sedlak.dev>
Date: Mon, 25 Nov 2024 12:31:30 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: error: modify `from_errno` to use
 `try_from_errno`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
References: <20241123104857.49385-1-daniel@sedlak.dev>
 <20241123104857.49385-2-daniel@sedlak.dev>
 <CAH5fLgjEnugoWErZn2ssE-x0eQW+SyuNFsL=_AwKtV0oQS0ewQ@mail.gmail.com>
 <CANiq72kJpQBUTEkEyNgSt4iYe6dDcAvCkR82A4ZSGeEiEdkuwg@mail.gmail.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <CANiq72kJpQBUTEkEyNgSt4iYe6dDcAvCkR82A4ZSGeEiEdkuwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/25/24 10:27 AM, Miguel Ojeda wrote:
> On Mon, Nov 25, 2024 at 10:01 AM Alice Ryhl <aliceryhl@google.com> wrote:
>>
>> This changes crate::ffi to core::ffi, but the correct thing is to use
>> crate::ffi.
> 
> Indeed, this seems to come from a bad rebase on top of the latest `rust-next`.

You are right, I was developing this on top of `rust-next`. I get it 
that I should be developing on top of `rust-dev` right? If yes, should I 
also include the base commit id because of possible conflicts?
> 
> Cheers,
> Miguel

