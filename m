Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C1F33D6EF
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 02:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773367958; cv=none; b=bBwbGVEuKAmEJ+DOmXMjmAM1phrnuG2q/ck5j6lNzhhFgQZx/sWql/xjMOK5VCaZRYgwL2JAYt8TFPuLz0SHh46gM3v1zggMhsAsnROPCfEDR6wND51pSIZL0jV4tnl3160/46MuH8H77k6o6rAn+JIcpM8zPgzD5dOS2zlIqKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773367958; c=relaxed/simple;
	bh=R5kX8BPQ+CDYGdPeei3dhycI3hXIHMHg3V91onGJBWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCmRQPtu+yFBvCcLs8yVzpeMfg6nuitOX/fddd951c/j1k6m++OQ8vzKvqbqGfUgB/VUojRt69f0oVdWwG0QoOJsThx9YKcbTDc/DlDgydJImU3/Esu+TRwoLTT6/J+yVFFQPsWSUPQ1k10IAHA3t9tU5kSjlQDDcvrNEkQuCiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lphFk6b9; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lphFk6b9"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2be1ab1fa7dso1458870eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 19:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773367955; x=1773972755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R5kX8BPQ+CDYGdPeei3dhycI3hXIHMHg3V91onGJBWM=;
        b=lphFk6b9w3PGozphh1jUSX241D+DtnaOFioPuC/YJVs4/+V/MaeXGWiTYnTk6r+gxH
         Tnm/TsMSzy+07sXJP4UUxtvPeF/GewQYcZnPCr7i+mk6oGY5SPEZzASfaxl4B2pVh6tW
         Byc6LhWMZJ6AOUxjaHilovHrS5L2+vOFEjgekjNkZA02tkFc58cKWjRKRSduuBCzL1DH
         bgnu2afVKRBbU6nGLiv58Ctz6o58eyKUtyyB2DYbGrJlCucOaOG1ehZsx9AcyR6u/S/r
         b8GWQz5PSy73f5LVQQCuYHG/9rD6/67vFfj/emQdGc7NxCNOtSM+cq11vptZ9S5JmwOb
         zx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773367955; x=1773972755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5kX8BPQ+CDYGdPeei3dhycI3hXIHMHg3V91onGJBWM=;
        b=gxzQjX6qDQ/mxPBGZi2FlBfWd3R8Pa+dPZlU0VO+J02pgHxAvB8OV4nMH4JlSCXcn8
         knBkk5mDnSVV2qV7mmq2lC2eAdLmzx2jEVwW4lEGQgW06ZlFRM34PSDExTyDO5e7I14J
         pyfi5CbMRxG8KHyFC/JDkpOnuAG9gbJdyT0jynalYyW7kj8W2QcAG8eHWDwaf+Gnor+K
         LNC5NAUb5DeV1JzpyTlR+U4/1BWukj4opwhPrykEanoXEdm0Tk4Wl0xFl+5Z4r0x+aje
         6CcV6hLX7rxxLzHTm76EzMTFoGC9X4f6u/n14Ia7A95AOUHuEJxtOh/7kQSqIsbYkavi
         STzg==
X-Forwarded-Encrypted: i=1; AJvYcCXaN+r9dgE8v2nSk5Q68cTEGRXVYSz8odRMpOwzuazRFs5FL3YbNfq5Hmqsu6pjmxNX70g6cCzJV9nR64GZUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlW1nbO9zRQUE7qRvOKhX8xR39cTRlaBOkX+n5yYkMzTClXxep
	q/aHM/x1acA/Lc8NM5lHYpYpcDqjTZeywPZ98Td/9pEOIITqy5hZwH5r
X-Gm-Gg: ATEYQzx0DF5JMAuS6M9wzEVwk/tbvE0trNWGcj5IaBGvCKlg3sH11vyEqQC/mUQeO7x
	vDK+0WiGz5fB0+lYm+TKNMqbvS6CuwCGR/N6LHQ1rwhMSHCVCs29nITSswednxAv5odj/FdhRBS
	MRG1nfWxjoCsWR4lkW3W8HhdSMNOgfJzsxHryJCGcOZiF3uWTMw2pxYgkfjgnkLC8v/tIQ+25C0
	E0L0pASoGLZai7C0zJlV2ccZv0sUtF3BW8Vb7dkI5jyIJyv5SiwGHE4cvZhXtIOdu4B4+Mn127t
	FkCayX8u5B0lzYfos8fA1BY9NEP1C6N69DWeC98vknZ2xz+7opzjYEh5cdKwZPI+lOBLe8V6ziS
	zDY7QhN0GNQfwoZb5l+4xj80d5N512KLK1Wb1+fJMQ/farL2uDTKv3gUVju4nGACcBTrHnJWr4q
	NYUOwsjtWXA0f3BziE1HdenR9AA/Pc6rZaq2qhHtOh
X-Received: by 2002:a05:693c:2b17:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2bea5477f47mr956251eec.14.1773367955004;
        Thu, 12 Mar 2026 19:12:35 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab527170sm653550eec.21.2026.03.12.19.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 19:12:34 -0700 (PDT)
Message-ID: <037345d9-56d2-4499-ae30-1a29482900b0@gmail.com>
Date: Thu, 12 Mar 2026 19:12:31 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] docs: sp_SP: Add Spanish translation for Rust
 coding guidelines
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Edwin Toribio <edwin.toribio.j@gmail.com>, carlos.bilbao@kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-4-edwin.toribio.j@gmail.com>
 <389808bb-f71d-4c35-bfd0-b4db14268d58@gmail.com>
 <CANiq72=Qe3x5xVQsFOd4YuD35mOan=mUt4PEFRQvStGnmLUcQw@mail.gmail.com>
 <25240ce9-0886-461f-a969-d049c84ae80d@gmail.com>
 <CANiq72=ZBYS-P7smq3u=CKN5y8_LTo5jThAegCVHhmo6TXTdpQ@mail.gmail.com>
 <b6558f4d-e424-464a-a9a7-ad14a174c542@gmail.com>
 <CANiq72mvzMnkwhGV+_srz=kLazpHVg5+-HaOtczaTzgFdaYQiQ@mail.gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <CANiq72mvzMnkwhGV+_srz=kLazpHVg5+-HaOtczaTzgFdaYQiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 3/10/26 23:11, Miguel Ojeda wrote:
> On Wed, Mar 11, 2026 at 12:57 AM Carlos Bilbao
> <carlos.bilbao.osdev@gmail.com> wrote:
>> Yes, I suppose one day I’ll work up the courage to use automatic
>> translations for what’s left. But I’d still need to review everything
>> carefully to catch mistranslations (the classic Spanish example is “driver”
>> to “conductor”), though in practice the issues are often subtler. It also
>> means resisting the temptation to skim large paragraphs and trust the
>> tools; something that’s probably more tempting with docs than with code.
> Ah, I didn't mean to commit change, i.e. not for maintainers. Rather,
> I meant a set of suggestions for readers about how to best read the
> English side of the docs.
>
> That is, when they are done with the parts that are actually
> translated and humanly reviewed, they might need to keep going and
> read some English parts (or the code itself), and thus perhaps they
> may appreciate suggestions on how that may be best accomplished could
> help.
>
> And for those nowadays using AI for translation, perhaps what could be
> added is a set of guidelines to guide the AI while translating (e.g.
> to have a greater chance of not failing on the subtle points you
> mention), both for all translations (like whether to translate
> examples) and for particular languages separately (like the "driver"
> example, though I imagine that is handled by context nowadays quite
> well).


Ah, I understand now. Yes, maybe a prepared prompt with some
well-thought-out guidance would help; that’s a good point.


>
> Anyway, like the policy across all translations for whether translate
> the code snippets, these are also just random ideas that came to mind;
> and perhaps they have been suggested before. :)
>
> I hope it helps, and thanks!
>
> Cheers,
> Miguel


Regards,

Carlos

