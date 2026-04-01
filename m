Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BAD402BB4
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042770; cv=pass; b=XEHTn71/vBIU1UUuKp4krSNCBlIYkQS+GSrv5Q41LQCZB4PLC/OCGeWpFGtr5drP5Q+SF0ZRu45DMRxHESmAFIRnDgA2L0ZWWdOVI+iy9QEUItTTtgXjFZL/l2uy6H2TZWTT4KzGmRdqzclcrmQFLVTvR8eMZ5E+ci1wLAo0IKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042770; c=relaxed/simple;
	bh=hQhL8BlIHJhtFOIFyi5aQXEtyqePolC51OzWPrqhqWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Stm9/Qk6Rcy1iHir4OL3K+aDYs3Q3q4Dm0ezq44lzqScx+UTKQY2264rewUNw0Lgdf+vMR6x8YnxhWYclnfe2gkzrjGIfXN4Izjxxr8r186rQnonNvj0+8Nh4IoNGXxysJwxOcDO+37clwWudEThWHcQDjOyjlVBTDW23bhAN1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2aTf2x5; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2aTf2x5"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b8095668ebso175417eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 04:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775042769; cv=none;
        d=google.com; s=arc-20240605;
        b=GftsFSNDcOpasxKzjhNmCnh1yaA2jNOXsafyHlAft/GHltuDX5qjVnf29dNPEdt3Ap
         Zirze6dSKEY48zCJb8mazIjcq8w9pHa1FKJW3zK9Is6WRwMILx++G+7Pkz4dA4yZSCbb
         lZ5HzYVZgTqq+gjiSCbd5JlJNnIz1xuxpyetx+fkdBb1EQlIiW/ZmFVa2GcIt5qt6MDM
         BSGbRG1ydlqlLRazmvnkHjCMbMPMNw009xtRSsMUcm3TZjUm6T8FC33L3PjGlIGVRUvp
         RiZ7BFutNUl3YtkoaiFppkrs3CuLGQmdrf26pbvDsPoDJ1PQn705EOd7oFh8gghhla8C
         8rFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hQhL8BlIHJhtFOIFyi5aQXEtyqePolC51OzWPrqhqWI=;
        fh=bjfK5kEjEFFJc/bCwkl5jw7pmrnmVlO13ZK6e/HZmxY=;
        b=Om3XApZBtI6hrNWRnHLD6o5N0Fmk0GrS6bpGyNsogWzbin753X2K59Fl0kXufYUH3N
         5jWIzER2E7Q/zyS4f2vRlbLWEhLrBKPgkcK002EiwUCFv0VviQgvpm9tFRrqn7VLmDge
         N3RryPdFYlVQxOWMjjyHsfnCrH1dwD1K/D4PhCHTW0sk/tKuU+kVwl2EszNI1q6k0ejh
         1dCDBV/tvO3eFdSkOg5p9luNKieh53g/ozc878jTBQ2i1HmggEghbSbT6kkvQ/v9pXxq
         6LpsEre6yANvPjchVbLnM00c5dWXqDMrRwKzxXVppRLcBebjgbXs9vgjMxtn+gygckNh
         GkOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775042769; x=1775647569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQhL8BlIHJhtFOIFyi5aQXEtyqePolC51OzWPrqhqWI=;
        b=M2aTf2x54E3YcjLOiZfiMWrrosXo6sVbQ5q/ybfwSmdkUTI1k7cf0RFhF86FRQsbqK
         NAy4olutpB50os77ZwmVCV2PlLtZTOfuI0s9ECexrIOwSNCHh9j0Js9bTjrVOJQS5VYB
         eSetNL9KXQ4fPMLZxUMzAHl7DiZ+bm9R+FGanAPQx0y8eYRu5O1gDYAysuBOZF0/13aI
         g/6lKGMjA/Dr4FGRAhty1Wb1x+dueeT/tXypmn7UTKWMluqbsvmMLiZqO710uTL2erkx
         4BU5R45y6CUEZfNdfE3EbplqUOFTrP+4cGx5Z65OdRt4Vv8LYI75g+OVzIApC0BAk3j7
         9cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042769; x=1775647569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hQhL8BlIHJhtFOIFyi5aQXEtyqePolC51OzWPrqhqWI=;
        b=I1S8VfI/2WzqmF57NsUaZ+tlqJetsjLxl4y/GhrIfrleDDtdonoSarvlBvZ16hWFRe
         k34vR9dWUfc93mMAVeMEe25s+BGRm4f9+k5O0lSYxdJtQ7Xujtv8/PiQPL0iKMHMsZ+r
         9M0gsAPrwRQr6iMvgY828VKh6l4Q8qWutPWgXGbc3rdfW2sVv7nbsO1oftefmuLPzReu
         jWuDp2epwuBCZyTcnFWYuf+BPz04789uGK9SK4GWN5bsjCdNXfd+on9dbpUYFqM+Aswh
         gE9KUCJXJ6m0jMWqPe/7KRuL3nLwzVt/PtRvA81ZZugiAXBHTixquWy7nygGmAzUr4lz
         6gMg==
X-Gm-Message-State: AOJu0YyycKT1DoIuc4eFnC8nIoznvXeU3LxO9D3LUU6gH81S7qa2xLZ7
	01Oy0P0gyR9PjkMNjuvqyAvI36ol5pUS+pr9+p8GOZOwqfUl6841iO//6Bb0Q5O7peMj0aAGhhY
	AuXtA7AsZ50qeQNC1QoQEadjxNTdRg9i0I3Y28MQ=
X-Gm-Gg: ATEYQzxdtzqFe7SnE10WDfK8Lr8V0ApTucuNaXiKm/8s0NLtvWOvfIcYyuv4QO5u8oK
	+76Y7FZxzSU0Pyg9XiLkZdEJFg1t+4FEtTFpViD8P4n4gb7tOEqyCQG+lNpek4nABbnlklVDem7
	A2AUl1yrHRU8ov+aZx9P+LLLnI7mmAfzbhrmEBEHBlcPtuJjqIxYF8T9ZFW3jgw09kktKNgLQ33
	qzrkmBCgWL95oXPYN1eAOH3HFip4dleZshbK3DDawGw2xYHo8G9RR657aW5AU7My5u2hBbHLdrR
	SuUVVZJB45EUEa7RcDbqHmWbn8XasQOw/9fcuZCsgwX8I4wZTiiLQx7uWMSWyYOWFeOiR8Xv4YS
	UhxPFCW+22TBVDSnWfZU6jRM=
X-Received: by 2002:a05:7300:2211:b0:2c6:2bac:8af with SMTP id
 5a478bee46e88-2c932db3c6cmr751423eec.6.1775042768651; Wed, 01 Apr 2026
 04:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331190308.141622-1-david@readahead.eu> <20260331190308.141622-9-david@readahead.eu>
 <CANiq72=SkdcggDkUhA+46pxurgfSveA3KJjpvT08RKN6MkUeyQ@mail.gmail.com> <0357ae66-f3a3-4bc1-b96f-5231cf544080@app.fastmail.com>
In-Reply-To: <0357ae66-f3a3-4bc1-b96f-5231cf544080@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 13:25:55 +0200
X-Gm-Features: AQROBzAWwE6KQ3LOkV8WLReHTu8jcBOZXSDsw8e9aOeFlZrWx2QCMOWp19PpgAQ
Message-ID: <CANiq72=7QpAHOG2dwYdwbMQ_jBne9DVBfUtnFg38+Wk-BcDnwQ@mail.gmail.com>
Subject: Re: [RFC 08/16] bus1/util: add basic utilities
To: David Rheinsberg <david@readahead.eu>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 1:05=E2=80=AFPM David Rheinsberg <david@readahead.eu=
> wrote:
>
> You mean enabling the unstable feature in older rust releases? But there =
is no guarantee the methods exposed by that feature did not change while it=
 was unstable, right? So I would have to verify that nothing changed over t=
he lifetime of the unstable feature, at least for the parts I am using.

Yes, exactly. We do that for other unstable features.

To clarify, it is not like we add unstable features for no reason, but
if it does simplify (and they are already known to be stable etc.),
then it can be worth it.

Cheers,
Miguel
