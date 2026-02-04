Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA8E22173D
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770220569; cv=none; b=p4xBMzKq9z3Yi1qQrhO0QaXxouovHnXFwkyKvS7I/v0eZk/RkvFMQdZQNt/PGeNdjl+6wj4OnQ23js8Q+jyNTIoxlMDMVuC+6z6DTWj4ApirGIIbAQPNnKt9Mk/ZhqrylkavhW79rT5d6Lv/ywpiFC32CSh/Y8rhwVnb9zN3jkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770220569; c=relaxed/simple;
	bh=44tE68fxbMUytve8JLfI7Un3Psmjsb0xs8E7ratrBbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GndefNrC+MMmFHd0LLOAs3ZZgCQA5i4fefoJanFCC6qZFL9JkzuWb9NgDO+184aLRXMzDwuj97qlMr9SIDNJ98MHskAE5ejLDogG0Fjr+utna0gwOyg+lDq/xvo9lDIgYGLcNSFC2brRZqoef3O9Xg7znmo7c8MdnhV8dU8ZeqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2lYUsUa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2lYUsUa"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso42739395e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 07:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770220567; x=1770825367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N68/duQnJWtvLCCDp1UvZPR0PP1FmT4LAcpWWINYqtI=;
        b=F2lYUsUaIfJQczqfmlAnBtzwdEtDW2gCXNfxMJgEFEp1GdjFvqCTHGXKMrTNoUwvH1
         HlacoAFRx/U6JI3eeXUwJcu01Q9R58Ah0WiHjd/S0B7JFiYUP4QPYoKlGuX20ubYZL1Q
         id/r0eGGJO+yfqUVOjTrqCt+uEx2h/3P/jlHQRD2L8Jimh6Iwyc9Lgmw7y/1hdcCEX/K
         FG+3zaB9VFlF/u0N6UAXV6s5qr+ogBpwEOdkMsWJ3z9kJwPWylz3aM1lXv+Fj+r/C5RD
         klZIMRKSFpwr1kwwV19sbn2AtEABAr7hyvoAPkIIAI7AYsNBOcBRLyHON/tTFeFSOVjN
         9OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770220567; x=1770825367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N68/duQnJWtvLCCDp1UvZPR0PP1FmT4LAcpWWINYqtI=;
        b=YPSjIA44qDVVMR08DFHpMmmsuF8wimuM2Pjwv/Mb+1cVW767o2j2fbAwYerp74MY1g
         nul/81kWdWEqlRF096dL5Gvx9c+JlvOABRlZUuxYkfS2W88K8BkVZ2E3BklLDGvTGp2H
         D3Vya9m4DJ5EupFKdiKVrc1kgM2k0F5Rwubds3rTWCAE1XOJoXB1aDQ0QEF8cgtMpUp+
         P6VNoCPS+GgBzYG65u/xTAHngFaWwtnpcEFdpcx7061AXGGjk+3dzSdSUoZNz42NER6G
         kIrpMvG26InotbJly2IVHHq2dvh5yaUmSGbAziZsF0wG4r01lD0lPRWcdCQoK6ZK7Y5S
         VAbg==
X-Forwarded-Encrypted: i=1; AJvYcCUWQ64yI52BTUANFQZEKrTTe+VLNeiG/JFA5Z6vLWNjpO2dUJMcqEgzPOVyyGExYMbT0KUeVSVj0NgEENurXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJspFH5Kjv1l/VcNZ7UyHE1bCeU4laAb0hHCwoLmYFKVse7cIR
	zLFzBBziRGJesF5z3U4MifVzXfDO1YBOjQq1tTABc8obZWoez1Wbjval
X-Gm-Gg: AZuq6aJbi9KJhwhooxGXYR47omCIugSw+A63h4bkYLlNn2ivlq2LySd3l0cTXpTMdCl
	N8TE+w0lJVQKIflEIqTkYiNX4jedi/sN0RjLruWKkcINhu0a1lbsjielO6F+1IfbMCr0T8DBDb3
	8xYc6jvqfgh5T5Yqb0yGoPDOUM63ExQPLk+Zoc7EelD7zEEEUbPRi8S+bHceHDr2hRW3wc2aXIA
	Cerd5HFpDyGbso4/KMpbLGymjuEby0wihFRmaHXXsb32qefcVK/FmGFibxxVwzYKQ8V+ysJds0Z
	zzC7z/DWYbsf7AlKzC/jgQV8NmPw6nXroSsME9aFJf00Y9de9RZ57jbvwn9VVpEeX2NKy+PghvG
	yuQaeMWkdDYYxt3CeWzIMOHfdakVHbo/JxtOdE5kXvHQSIuS036kJz7lkjv40RasBOoNJghVjEh
	38HiPQvCY//TgfUyEMVKvc2AmK9wc3FQlGGNm5nJY2GDDLf0YW6QScT78X5yyNyPicXK8klH7bX
	o6e7/xI8Y/k07k023+Jg8NL0YEycO32Fjsi+Q7lYKwkHQ==
X-Received: by 2002:a05:600c:5304:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-4830e8ceeeamr43535075e9.0.1770220567323;
        Wed, 04 Feb 2026 07:56:07 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:ec97:869b:e20f:5396? (p200300dfbf2de300ec97869be20f5396.dip0.t-ipconnect.de. [2003:df:bf2d:e300:ec97:869b:e20f:5396])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483108e3ed5sm41244885e9.5.2026.02.04.07.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 07:56:06 -0800 (PST)
Message-ID: <c150ba95-a60b-404d-823a-316710035dfd@gmail.com>
Date: Wed, 4 Feb 2026 16:56:05 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
To: Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: Jkhall81 <jason.kei.hall@gmail.com>, dirk.behme@de.bosch.com,
 joe@perches.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
 <20260203152542.45017-1-jason.kei.hall@gmail.com>
 <20260203184933.23c92f8f@nimda> <DG5GBHGZV86X.2XKAU6WLWCL7Z@garyguo.net>
 <20260203193240.68bb136e@nimda> <DG5HFQ1JHRA1.QTLZFE4GDZT8@garyguo.net>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <DG5HFQ1JHRA1.QTLZFE4GDZT8@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.26 17:54, Gary Guo wrote:
> On Tue Feb 3, 2026 at 4:32 PM GMT, Onur Özkan wrote:
>> On Tue, 03 Feb 2026 16:02:02 +0000
>> "Gary Guo" <gary@garyguo.net> wrote:
>>
>>> On Tue Feb 3, 2026 at 3:49 PM GMT, Onur Özkan wrote:
>>>> On Tue,  3 Feb 2026 08:25:41 -0700
>>>> Jkhall81 <jason.kei.hall@gmail.com> wrote:
>>>>
>>>>> Nice, emails sent from gmail get automatically rejected.
>>>>>
>>>>> So, Dirk.  To satisfy your concerns the current 10ish line
>>>>> code update is going to slowly, after many more emails
>>>>> written in nano, mutate into a franken-regex-perl beast. 
>>>>> checkpatch.pl is already huge.  I'm not a fan of this 
>>>>> approach.
>>>>
>>>> Me neither. I wonder why we are doing this instead of using the
>>>> unwrap_used and expect_used linting rules from clippy. This would
>>>> catch the problem much earlier than checkpath since many of us build
>>>> the kernel with CLIPPY=1 flag.
>>>
>>> Because it's okay to `panic` or use `expect`. checkpatch will just
>>> warn you once when the code is introduced, not continuously in each
>>> build.
>>
>> That's interesting because it implies that it's okay for people to use
>> them without "// PANIC..." comments. That sounds problematic since it
>> means some instances will have that comment while others may not.
> 
> My personal view has always been it's okay to not have it. It's a burden to
> developers to always have to write these. In many cases, `panic()` or `expect()`
> calls are needed because you have something of `Option<>` and you know it's not
> going to be `None`. The C equivalent would just be a pointer and you use it
> without checking for NULL; we never ask people to justify why they feel it's
> okay to dereference a pointer.
> 
> Sure, if people would like to justify why they think it won't panic, brilliant,
> keeping doing it. But I don't want to make it harder for people to write Rust
> code compared to C.


The question is if we could find a way to make it *consistent*?

I mean how should a developer know if the warning (he gets once, or
even if he checks an existing file with -f always) is relevant or not?
We introduce the warning because we want to discourage the use of
`unwrap()`. At the same time there are places where its usage is
allowed or even needed. How to know what is valid? The warning or the
usage?

So do we find an acceptable way to mark the allowed ones? Or do we
drop this patch entirely and hope to catch the "forbidden" ones by
review? Or?

Best regards

Dirk


>> In my opinion, adding a clippy rule and using "#[allow(...)]" in the
>> places where it's acceptable to use them makes more sense. This is at
>> least more consistent and doesn't bloat the checkpatch file.
> 
> `#[allow()]` looks quite verbose, and also you cannot apply it everywhere (just
> blocks or items).
> 
> Best,
> Gary
> 
> 

