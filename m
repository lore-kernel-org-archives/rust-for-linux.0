Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB17235063
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 03:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113618; cv=none; b=P4iBK+Yv71VCAqpJ4D3cY/54nFKFvexQZ2iCjpSsI/MRRq/FMVmP5TdI3kZGaABhWS9jC3FasQ3rPt02Sw2PKIcNo8TPlkXOKZFDr8kEjfQdy8+FEtvCFqvRcCo4iXIJ9fzZPBMsyhrF/UeyEFsbw9zsFCew5fNNzMxgt92sDt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113618; c=relaxed/simple;
	bh=riCQmqv59fYVS8hWxRXdwFETb7DJ/KktAoG6aGFy9oQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdYYzf2QalYHuMhpNkYsU8b2E6YlH/Utqvm5KmANS3zbxhBVGYZEP4h4nf7l96/y0FNorA4nLWBMpKGnaKHY/oIuVgoUO9gKUYZxR82+ieDDnPw/6TusPBPkZF4flEHWmXMiKqfocu4DG/3bQWTXw9v+KVP6m1n+FiXipEhtCgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daqKEfat; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daqKEfat"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2be3bdfda8eso5758282eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Mar 2026 20:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773113616; x=1773718416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0G55sZaCfmUkk/dIDbo0vXR8fTsJ/lrn4erTzvFJHk=;
        b=daqKEfatHOIlk+CKmkfsm1FzzTK4EUPB8EU8Xv3/Ey2vJqvyLZD6GYghvEenD1Y4yj
         WBV4C0v62G3xQphTeaJadCHSL+qikSmJxH0Yuwus42/mMQGI3uhxvo2EK0PylIpPYrKf
         4zxjgQ7S2AesLfnso3N6/029Zsy8TJXRLafOa1iHp4u6Vh5ddadb/RDRcp6xCj9rWNJy
         C7p+oeX+3lkKREz0U8htumRuLtHJ/++X1zZg/tny3OCquf6v66VMDh2yQTooDiVUA5mM
         FFWme6hgtr5Kc0M+xeyMv3tHVPX3hB7eiLsCi7T26C5q4WPI3ReHOrPl8Rj2yd2kDkxs
         9rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113616; x=1773718416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0G55sZaCfmUkk/dIDbo0vXR8fTsJ/lrn4erTzvFJHk=;
        b=UEv2FDmfT63SDqo78JKp5zkmvPKBu6PivieTKhNN7B7/L0UIBJ7/qgTD9q7qCv1yUo
         qqZmssFG5SEK75PiRr+D82bUq0KB9RFi2k+bKgvT3pv462E3/vSY9Ar4FuM2fVkvjiuZ
         le6MxRfg7I11DDu7LqdUoCMEfIN/5sJjUom5UeczL1Ely8/Y7ETVZAXSyj2bvTxVKyoP
         3/10olgXELxVq/FMSE7m/r91wUoEuyUMvAGzxF1NY4fh5+9HC9xS3WB3HUbal/bS5GHY
         RJPf6RthmFmpMBSeJCGhXdAc4cc4wF0dxIH74FtPTgI+yPwCZhb/O7ICIRjENPp4akHs
         9n0g==
X-Forwarded-Encrypted: i=1; AJvYcCXbnA24KBBhTHlopUe1X6rwcWKCLN5docahkgdvTrsykKJJC/K3TFwcsES+Pqjm5LrwwxT1PXkMmy7cY1KXWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE9M7Pp210riNdc5Xs6tJ5YYqvT1dUXQ0ZsFAZr6vtGjq0JaYQ
	N2NdLa1vdTqjs/5Gf0FoKHw6bmWBxDHgEJmXuC5qU11TPXkAkn21HXG7
X-Gm-Gg: ATEYQzxOpM2WJ8ErFUh6C4fbZKVuKHioVJj4oa9ksFmM+huG4hibfO9YoauvNPzk94u
	TQUBTDdF1iyHpRVBh8kwSHEiVv728lGSMzPoErg4r6aI5pMZHJrALukoXSue3+Ub7S4XiBDk9Nw
	fOnxj67lUr2SuAPlBvlB/Q2T261WFXKF5Kk1bQOa33HKRYcrMOoS27lwaASIEtKD//3Tp4f3BrR
	hG4twwXlKpfMHKGQCuALWasnQkSIAYXMKXalg9NMqOwP8aMTojiyYQejsFimp6xM+1aCrbQ/0j/
	YEibBL/8kx8zfT7uUkY+SeKU1wOzd2wDHH7V5L0dNFF7HQ9nmn83IzXfLurQdx7zGjHgPFF+By4
	fVkL3T8ofIg7T89+DnRef5vSnJiSN+Q6gENBvqWjjrg9D8MTz+Pz1m8DsXAcK7SGi9U1aUwefBv
	WnlAAuJP+Z/XHKFgCkuASnFNXyGHNR2um50N/RF/N2
X-Received: by 2002:a05:7301:eab:b0:2be:d62:abfc with SMTP id 5a478bee46e88-2be4e03eb9amr5456099eec.31.1773113616014;
        Mon, 09 Mar 2026 20:33:36 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984ceasm13952770eec.32.2026.03.09.20.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 20:33:35 -0700 (PDT)
Message-ID: <25240ce9-0886-461f-a969-d049c84ae80d@gmail.com>
Date: Mon, 9 Mar 2026 20:33:34 -0700
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
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <CANiq72=Qe3x5xVQsFOd4YuD35mOan=mUt4PEFRQvStGnmLUcQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Miguel,

On 3/8/26 12:16, Miguel Ojeda wrote:
> On Sun, Mar 8, 2026 at 7:40 PM Carlos Bilbao
> <carlos.bilbao.osdev@gmail.com> wrote:
>> In Rust, there's some keywords like # Examples, # Safety, # Panics, etc,
>> that need to stay in English.
> I don't know what the translations' policy is, but shouldn't all code
> remain in English? i.e. not just section names, but comments and Rust
> docs (i.e. `///`, `//!` and `//`).
>
>  From a quick look, at least I see another couple translations that
> keeps them in English.


TBH, a reasonable case can be made either way, and there are no written
rules on this question AFAIK.

In terms of precedent, the Chinese (simplified) translation keeps code
blocks unchanged, which I suppose avoids giving the impression that
non-English comments are acceptable in kernel code.

That said, the goal of translation docs is accessibility, and since these
are illustrative snippets, Spanish comments help readers follow the example
without having to switch back to English. Personally, that argument
convinces me more.

>
> Thanks!
>
> Cheers,
> Miguel


Thanks,

Carlos

