Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E21A2C27
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Feb 2025 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739118510; cv=none; b=GO5ZbgxLCcPh778ZprjKgmVCHnkWSY0Af+nFM4Gw2/c4AVEBffUgouy5WS5X887EpRiDSjF1lgxHhK3uu6CTDJFAXMUHYlBYDESCI+9gipHIkBv5B1dOwciPmKeBFnpBSBQ89mU2T2h+3T6+IO+bqfOnhAWUzQHNh1QML6jh2TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739118510; c=relaxed/simple;
	bh=nQQGWFIz4kSqnu1kGUbVo6y3Ae6KjA9/WE3B2NnCO9c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EtAOJXNo5DfW8iyXyYPO/SXZ7xlQyLAmAEK3ztvLFtvzG7TGDga2pD22EL29ARJFl8GLWibYk44brQXCK0xKUYROSZ8V/c5vFTY+iM/ASMpdTmr7TxVhOqB+Tfn78M7Avr+zMOPUKocyg6SHclHZw8bXOTzyrN3MF6CDgqCT9Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=3PhToE70; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="3PhToE70"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3f37207259bso1106114b6e.1
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Feb 2025 08:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1739118507; x=1739723307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nQQGWFIz4kSqnu1kGUbVo6y3Ae6KjA9/WE3B2NnCO9c=;
        b=3PhToE707z0kDn8phM6J5OVValJBA36uVaLf9mprUW75Z5jN5MSW7SbA7bhGh1P6MB
         DIXinjqj876yaYsDA3Bh1zMxPV2102xSwjtUKIzvPgZF3XPlfa8pAbjijm4P6eKZOiAO
         s+Uf4FCO5I+B/iGx+VcKChE2wUa6auhw6UoydXwrPmJ5utf3wtVLoxbHwAzP55avLJoR
         Ub4qDXegKZhTpslM497UIgWuFHtSAnw+rRVuUiGhbExcg2T/7IQM+oIvRlzmx37WfgBS
         GC4/Y71mkFbTxlKYf3vv5pXaX2URDAmCnYdbheqxVDeth2yAn7zc/0s0gpSPnluRMHme
         Ht9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739118507; x=1739723307;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQQGWFIz4kSqnu1kGUbVo6y3Ae6KjA9/WE3B2NnCO9c=;
        b=aPp03XMaaypPqZS/JuWkXoHoWFPqHNWf9ag8rQMN1HS1VCEjETSWX4zA7J+uJB7ZaG
         vKJ2moYo3eITBkpB9cBcJ13U7hVCQJ2YWW0VdeRkUX6PWeNPRhBl61TdOuL6VL+RmtJI
         0PL9g91h3s7ZrGTqnu3jOL6d9H46lBtQ1boyE9A4v3VAdLxKAGbq0hv/nnmYF+d/RJgw
         Y4cQAXcn7pNCaboPjieiEQP8PoVg7qyj9OQacwPHURxQNCaE9Dv03wVyoalwnackxjP1
         rk5crSI5bzSM278l31Y8weDy1KVLVZ/YJkYLTliUQ+1o9aH52BsycK33T/UjAcK10c7+
         m7VA==
X-Forwarded-Encrypted: i=1; AJvYcCUD89rcEZIYNueQ3xBpDKYxiGM6yQTtvVieDxjpSPQcgvvXa3vu6i3sDRi/lr7pO/R7PPWalWGhFN+QMmov9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE4B1CQ8ag/lQSg9R2IEoMCk3cSmurL2+oMQ82opAEfxNO6Jjn
	G9TDNJFig6Tnv56AfY94RERJG0GP4a4YWRCiC3NwMp6txh8+kNmwzoOGGn7JDg0=
X-Gm-Gg: ASbGnctmJxsBVj9c4gJf0MqSalRR18pF4XSX56zuoJ8HXravgyp+0X86oYAOG79Iivw
	kQFhPLDEghO0Pfk4obae/DOqVU1n9B6oQb6LhOZpxpH3z4wpiRm8mRbrYj1xtLb8YeRU00WCWKr
	y60thw95JKYm+ganb4ulNRfMeBzjewVVcchJ9hsLx+5k4Qmmck3Rk/ebliSy/AolPIp7f3KD+VG
	fDfimXm67RBgh0nHUgJthqaHP+gRXBpiPJIGnDmSIhXd7IMHZB9kCrWz1myV7FOQbNMiroV+IsC
	z3TTVEXVv2a7XL1N4WR4lzfnxD0hGOXhwOd4IqC4PZShPqqPd1n2K71JcQ==
X-Google-Smtp-Source: AGHT+IFNMNWYl1WupTtff3rH3xveYZ/zBgh1j4QRo8cZQGBw00E8/IkGzma+E84CDwsDvfT0eK3wjQ==
X-Received: by 2002:a05:6808:4482:b0:3f1:cd30:d692 with SMTP id 5614622812f47-3f39237a1f4mr7611873b6e.26.1739118507407;
        Sun, 09 Feb 2025 08:28:27 -0800 (PST)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389fd5d48sm1799868b6e.42.2025.02.09.08.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 08:28:26 -0800 (PST)
Message-ID: <d7944fbd-f9ed-4d5f-892f-5afd72c3c6a1@vt.edu>
Date: Sun, 9 Feb 2025 10:28:24 -0600
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
From: Carlos Bilbao <bilbao@vt.edu>
To: David Airlie <airlied@redhat.com>,
 "carlos.bilbao@kernel.org" <carlos.bilbao@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
 <20250108122825.136021-3-abdiel.janulgue@gmail.com>
 <20250108135951.GA18074@lst.de>
 <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com>
 <1894f095-e93a-4def-a223-d5c089ecc2df@vt.edu>
 <CAMwc25p1kGHjy7z19Kg+vv7yVc0bF2taA08hBKhk72e4HiK5xA@mail.gmail.com>
 <42efddde-9fe0-4984-a903-c89328a726b6@vt.edu>
Content-Language: en-US
In-Reply-To: <42efddde-9fe0-4984-a903-c89328a726b6@vt.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/9/25 10:19, Carlos Bilbao wrote:

> Hello David,
>
> On 2/9/25 00:44, David Airlie wrote:
>> On Sun, Feb 9, 2025 at 9:55 AM Carlos Bilbao <bilbao@vt.edu> wrote:
>>> Hello,
>>>
>>> On 1/8/25 09:16, Miguel Ojeda wrote:
>>>> On Wed, Jan 8, 2025 at 3:00 PM Christoph Hellwig <hch@lst.de> wrote:
>>>>> No rust code in kernel/dma, please.
>>>> What do you suggest?
>>> This is it. What do people suggest? This thread has received a lot of
>>> attention -- maybe it's an opportunity for the community to brainstorm.
>>> Here's an idea:
>>>
>>> Some maintainers clearly hate wrappers/bindings to Rust, while others don't
>>> mind as long as the R4L folks commit to the maintenance duties. Depending on
>>> the subsystem, it will be a completely different conversation. It seems to
>>> me that right now, every time the R4L folks interact with a new subsystem,
>>> they need to understand the maintainer's stance. That looks like an
>>> exhausting process.
>>>
>> That is the process we are committed to, everyone has a voice and gets
>> to be heard, and we move forward in the appropriate manner with each
>> maintainer. Bypassing maintainers is the last resort, not engaging at
>> all with maintainers isn't a productive way forward either. Your below
>> attempt is trying to create a technical solution to a social problem.
>>
>>> Would it make sense to have a C middleman that Rust calls instead of
>>> binding directly to the C funcs? This dispatcher would provide a simpler,
>>> stable API with fixed function signatures, even if the C functions change.
>>> If a C func is removed/changed, only the C dispatcher would need to be
>>> adapted, but until that happens, a new error could be returned to the Rust
>>> side (not ideal, but Rust doesn't just break).
>>>
>>> This would obviously impose some limitations on the Rust side, but it might
>>> be less conflictive than direct bindings. Also, in Abdiel's case here (for
>>> example), he'd explicitly take on the maintenance of the Rust abstraction
>>> and its DMA dispatchers, leaving no ambiguity about ownership.
>>>
>> This just adds overheads for everyone to little advantage for the
>> cases where maintainers are fine with all the other approaches.
> I'm not sure there's a need to worry about overhead in this hypothetical
> case if the dispatcher is merely a translator and doesn't validate inputs,
> copy buffers, or such. It would be less than calling from userspace.
>
> What I meant to say (I wasn't clear before) was for this solution to apply
> to cases where maintainers are firmly against all alternatives. Obviously,
> if all the parties involved are happy, direct bindings are preferable.
>
>
>> Also the bindings code in rust is usually pretty trivial to change,
>> it's not like you can really abstract things that far, changing APIs
>> is hard no matter what, understanding the nuances in every C driver
>> can takes months of work adding rust bindings to your changes is
>> rarely going to be the limiting factor. We have learned over the years
>> to not make API changes that are subtle or hidden, and can leave out
>> of tree or in development users broken in subtle ways and as long as
>> we keep making API changes like that, updating the rust code is the
>> least of anyone's worries. This isn't like having to learn Mandarin vs
>> English, it's code written with a different syntax, it's not even
>> perl.
> I'm not sure there's a need to worry about overhead in this hypothetical
> case if the dispatcher is merely a translator and doesn't validate inputs,
> copy buffers, or such. It would be less than calling from userspace.
>
> What I meant to say (and wasn't clear before) is that this solution could
> apply to cases where maintainers are firmly against all better
> alternatives. Of course, if all the parties involved are happy with direct
> bindings, that's preferable. But as you said, this is a social problem, so
> maybe it's not a one-size-fits-all solution.


I accidentally copied this twice after rephrasing, not trying to be
annoying x).


>
> I agree that in some cases, abstracting the API could be complicated, but
> I’d focus on keeping it simple and providing Rust with the minimum subset
> it needs to keep things moving forward. Abdiel's PR is a good example --
> by keeping the functions in his CoherentAllocation, we keep that option,
> but lose the granularity of DMA mapping attributes (which would be some
> default in the C dispatcher).
>
> I agree that making subtle API changes is risky, and it would def. be
> something to keep an eye on.
>
> And yes, with this approach, some Rust developers may eventually miss
> certain DMA functionalities in the future; but that would still be better
> than the current situation, where _all_ Rust devs are missing all DMA
> capabilities.
>
>> Dave.
>>
> Thanks,
> Carlos
