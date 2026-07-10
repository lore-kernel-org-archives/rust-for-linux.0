Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430F93EDAD9
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783671237; cv=none; b=LILyGbGdacHqmQznr7tR3JGQZKPBcPyc2+dVPPkCOdOpviAKrt7YTW078XawMgw37OEoyYz71E2amBkDzS2QcZrliSQD1PwRPyUUpoiqjmHByfOhadEt5OhfWO5+76g8ph7URzSn/Q7xtuQ1rCZEHQM7H/4KQGgFY1vVOLeVikU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783671237; c=relaxed/simple;
	bh=fQNMh92VeLSlO1ecfwPM1X8xP2i/CWyttCUNi+n0yq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=owgCyr6BH83bQq0mPC5nr9xEhH6kGL+xrpE9rE9rU2Tunjjwa8xBObvyfqcwmMzqlAHvpp/idvoJkcVoNgOHLXZY0y9muVqCRdchN+haE/1DSvz9n2KP9acsL4ZGa8hSB8CeplGOx9Pu4n5QzTYSpMrGOt4p1k5S2wAUZpgU0Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KsC2G54d; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KsC2G54d"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso4911365e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783671235; x=1784276035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/42m05gjS9dGZ9Y5Rd7DyQC19g2JGaFKE4JVdUiv2c=;
        b=KsC2G54dnMXlbb5QtcakRSRwwW7tG0xCEhW6KySgUVaQMsarqhQgHTO6nt2HnoY0YG
         nE2TV38AdtbW6a9oOjrLYAW/813UBqAaSVxP1WU1hWiS2ycQLocjvRhe2ZIi4ylhP//o
         GrXTgv+apb6NqgR+2k87nkI/lp+bVxtDrMhV8DZEbyFoTzpB2qv7D+eRhTvGPV1VzIGW
         2a2rEk2vA4blEt+TfbOzL/G90hFdCPLpJgHDClgxKQCMq1nEtIKfxQ6qxG1SsYlfoi7q
         JdWPcVPllV4Ta6vaRI95DMdPhe2LsMz7nMM212Ne8y4kvCxjx6A7VQF1x3IC1iLjPO9o
         3Axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783671235; x=1784276035;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/42m05gjS9dGZ9Y5Rd7DyQC19g2JGaFKE4JVdUiv2c=;
        b=IxA7aD29uAUBb1eQNBhIqz4rK/j96OKfDrO6Ircoh8Iob/Sl/v8tWY6tIwHEd+FdWb
         +0nxSuHK33DG7KM/sYEtS/4EcD5Vg5iFl0jTI/4jk7LhnEiKux+i3hXLPMJ34DpeI80I
         mGNYiY20oaXqQq57Obefb1DG293mWCs+b83EyfTh1wzCqdIYctmeS5el3rNLZ7BVVNIh
         4iwRovPZGX60FmrjqGZJoUecHsKRBELtwW2NZazI3sC6iIA/DVY9OGobA2c6PkfoVfUw
         btXV7/WnXmsBO9hj1SjH7EL7FJyBURuUQiSQ9a04WRwNNK5y9lWLxjCxO78g0kikA5uA
         VBFg==
X-Forwarded-Encrypted: i=1; AHgh+RpYyVMCC++nsbaIiyCixkbh1CVgPOMOzp2e3NcWAL5Sxn4lNRE7Wg3g4iYY78D83qsdgzx2g+oZ5EK4i70BBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLvbXpV0ospfH41BhLX33hrrDXSx1yLUfS5OKd4LYr0eZ1fZfG
	U+wGi5VseHzSRc4UVfr6Z1nKCwtR1O2ND4wYwwdW7jruMioXPiGeXmnyoqZOtq4Ny78=
X-Gm-Gg: AfdE7cl/Gr1tloQNGad/OCNv7aTvsVfgIWxFpMnDIkUpNO7GFl2xp4KektsJDZ7gids
	6K0LB9L3N3PxjAyPHOUsVZ9CY2WcIx6BfZr1pTAmSlw+zA2E8KIIiPbU+hI+pRcW4Yumsat5bNl
	sx+C7qjG79qRBmFAxnyRYt4XdYiXVC2SBYshlNKA6MSfhBS++rN/LUvlpr2x8/LNtpE1o06f9mf
	2UeUsscc8Mspb6bhmz20kdCA6aucCgqEiteUr4AY4wrlJzYtGtxJhQB/Pgj9GObQpUQY+wN0i0t
	zFuDTMHSQ9ZnvXoCC3grMlOwueU6jcGAejUcHdiGH4gO8Nzl6saHKpsZ54ART0NRrEqIV2ai017
	3QElU65XL2oQmD000CW+3tye5+MN2jd20wprn96I4vOZ2FF0AJ7KgEFhT99+ucmMpZGSaH9mFFM
	yPMWvuH9DiNwwp0xdSCbO/kCEtD3u1UJN73g==
X-Received: by 2002:a05:600d:844f:20b0:493:c77c:108a with SMTP id 5b1f17b1804b1-493e68a1dc1mr80248175e9.36.1783671234688;
        Fri, 10 Jul 2026 01:13:54 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccdbbsm123685035e9.3.2026.07.10.01.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:13:54 -0700 (PDT)
Message-ID: <30e500ce-e9e6-43cc-bbdf-ded7c0ae56cd@suse.com>
Date: Fri, 10 Jul 2026 10:13:53 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: module_param: return value by copy from `value`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260601-modules-value-ref-v2-1-12ebbf0510c9@kernel.org>
 <52feb9b1-2073-4fcf-b2d1-a7f42f1e72a5@suse.com>
 <CANiq72m3w7L5CmAsFvOpSh_jNk4jL8+A4vz8GEp+E8FY=TJcRA@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CANiq72m3w7L5CmAsFvOpSh_jNk4jL8+A4vz8GEp+E8FY=TJcRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/9/26 4:13 PM, Miguel Ojeda wrote:
> On Thu, Jul 9, 2026 at 1:48 PM Petr Pavlu <petr.pavlu@suse.com> wrote:
>>
>> @Miguel, please let me know if I should take this patch on modules-next,
>> or if you'd prefer for it to go through the Rust tree.
> 
> Please feel free to take it through modules-next, of course.

Thanks for the confirmation. Queued now on modules-next for v7.3-rc1.

-- Petr
