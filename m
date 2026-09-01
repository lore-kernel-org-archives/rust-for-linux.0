Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABCF39C632
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 12:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266912; cv=pass; b=O+bjszmrwsZJBBwCRUnic7yNH069FJbAqAaY7mcBWoxYzEamtABkstO2hRJAg2ZKxBWyuIUMYrkmA0snoG3R8bVPAqAioRpH++PgJ2AqE6GBHaEWeIrX+w7/ZJnOW951VxIxcwwZmmcAERhjClA5Ikf0lS4ADlJdtBy3TjLO5cM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266912; c=relaxed/simple;
	bh=7t95l5tIyIrvb8GA058vJ22/PqoU8KtEqZHZXzXWxGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYhvxIcDjY4Uuk9oJ8sefisj9TDggzrTSXeHaqc2MCo1wNN6T/6PQHZk4t4OdJ2oI2QUsXVH7cBBmqSU+nZ2e0Ip++Ld1g5nBo2nmHfd4aoW/cNVTy8RuBaiMe61hw/AGPM9j/1mjc5/FPgExyxirjtbi1s1rEPCwZIuHuGMPdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVGZFuqi; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVGZFuqi"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398fb0feb91so285983a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 05:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788266910; cv=none;
        d=google.com; s=arc-20260327;
        b=XkfozKKe0i4nd/mWbiA0GmrLK5JNIGCwVZU5D/2tUM5wGx9XX7smiKMu4+31UFHsxn
         ftGm3iWWeVynlrjvAiupvdKlOUIxJ6itYGzcFCNHAIVLNOlD46vWr1x3jbop85sxvSA7
         IwQR+03doVj5C2uH0jkeIRWbrxZ2wpPsrNbZt0q6cSjI/Tp2fAD+ox8yNVQMT05hYXvK
         liISjPpXaWsRjVKpJRwhCh1+7/PSrrOnXjazFv8Fw9vdu5V+vjuhb834Ta+x4Wr7loir
         oAZYrFfT/kwwNBjsSoqlGqUSAd3DWgsd9Ax4E+egy6uUYuH4FBYKoJeF08lHth4Gsv0d
         f/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zEO4ToO7aIfa8An2MxNmN2waWRZjTMnWleI/IMLu47k=;
        fh=C8VQlYO0h6hSysu5qj8NSX82JFASV9zH2Y43sGM5pYw=;
        b=gSQsm0a1Y6noZ0t5RRUiodzODG2jPBJ6NcpLMkMIgm6/h7Yu4KO+PcGSsa21vTRjVU
         t4E4/ZkFu6oxMh1bjJ/AnXbHJEZ/s+EWGRmrk9kiKw4W3HhJUmZoBv5Q3hYZf1JJIvj1
         kWF5GwU/jcbVj0GLoPxonNNjzUElAJDexKs8v7rDzqWxmEhWWyd4uPl7lueWfgJjddz/
         C5sfBEPPNq9Fz5Uiwl2BjagdzGPrJ/CJGPvTMsz1k4XypC1eplw4kivi+fMVBds6P4rF
         lba/BTSohz6579ktkIUc6AKHgkmYFDtqv1NUo87R/hg1aNQ5rQqb7fPkpUUz/SrtKcsO
         GCcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788266910; x=1788871710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zEO4ToO7aIfa8An2MxNmN2waWRZjTMnWleI/IMLu47k=;
        b=JVGZFuqigiSZi/EaDmVUstxXL81WLuTR7FSd8PSHaPThQDRyTh3KZdUiO6cK6OYsiU
         /nwRkkQNjgq3u4AO+IBZ/Va/G8/K+HmiGANVE0vk+xI0YCjPANowG+toN3L2/fYNCVhD
         wDYe+aTqZJQ+8/5PWMRj4xIL+LCtEjlufj18mqq/e7AaMvdJhlhQySvu8ZNLtCasq4Yn
         +yOhzqdSzUmOIYzAYhTtJkqfwIBu+McKU0tKx4BtJw9uO+VXlZlXCunW65n6ocb+ouSk
         v/F+E1gvVetigC8FzZRmWPAt18BNdo3zuJTfjl7hhMk0qcs7HT2OEBcsMsKZT+24hzMd
         Mg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266910; x=1788871710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEO4ToO7aIfa8An2MxNmN2waWRZjTMnWleI/IMLu47k=;
        b=ehKTwDQMgKi9YXyOisp6fL8ThYIW2EUUKxJW5v6WlpO6Tm0YD1izvaScFJ85kJ8m4R
         sSgQooaWEeAB2xr/oc9ToXCSGC4fFet7GWv/kcxRczFJC1O28q+LiuHSP1UMI5rtVQSy
         FpS1doPGYQUOZEMbX1MnK53UzSDNOhj04ChH9rH6/6sflrsYCsnw9nI7iqhlqBQxkO0Z
         VggOOd1RLyfbCYtkFJa8H77Rj2v1QrSDs7D9QPd7QvxkT85mgyBhApe2QFHDjJfpQ79c
         AmNhNjUuHGUM5Bm1gSnUXpgixby6ZaQI6PZDfZ59/WEscsNFzggdc0X66E3Q4k4XVge2
         P7og==
X-Forwarded-Encrypted: i=1; AKwUvBwk7mfsk8UsQHoHSv7gbgjok7Zdz89gytgZF5ij6dG/9aP2rO4k/KjjyvbTHb2paDIv4Cp7DdhJTGePdiugag==@vger.kernel.org
X-Gm-Message-State: AFuF++nwqh9E6X3HLCcE95y4PQqVR/k1NR/2bps8wRbxZDwGjYocIbRi
	jyJmyiDH7A8mQdpmAVnBoQIDq+nu/GtCBULIGWX29J+Pjpr2Id/UAVCOpbAp5+l9/1bVf1yyGM6
	himMKg37ZUbBAswA+Q6Cfr2rw39pgDwA=
X-Gm-Gg: AYBFou1OvnDmDZFsfczls2fHCxu+yybf0+guOqj00CAzm6M8eT/RfRGZL/GeQgCK19L
	1/d8p4XayPT8ku4l79nxmbAdN16XsLM2dsWI3OsaNDbPM2LLwDGrEM4D8jv0ZQp493Itb0joC04
	rVTmH3EI4Ya2I/Y5mjCRHn6J9XXYTpCrhHQN7tOd5DKx/5PZ/rJI31yYPZoU5xAV1leT/NJQ/qW
	ayfoCqwJtew/F7aA429PzAYiYD0dt3TUstADd3YuoJAj/wPVm/2+/WZdna26tSk9nw/e46DPb5J
	Mvy6vfSGJvVb4je7tYas0uwV2WBFtN4HfgQEDGgOl5Pu1lqPEk6P+T04QGvirCm9JL2Vcbo67oU
	FFcX52xC9YIq0IoPVDcnmZU7P9gRCc1EeL13UHtkYHIWcU3QpB7MAzTqbQ9Pu9gQZ3Tm48mA=
X-Received: by 2002:a17:90b:3e50:b0:398:bac0:238d with SMTP id
 98e67ed59e1d1-398bac026a5mr20438534a91.5.1788266910057; Tue, 01 Sep 2026
 05:48:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901031824.1377498-1-springbreeze@stu.pku.edu.cn>
 <DL3YRAXKKEEI.GOGNVOO3AV02@garyguo.net> <CANiq72n0sgSPQ6SmUbK+tv9S5VZktA7g5XMjHOBOFNYLo2oA2w@mail.gmail.com>
In-Reply-To: <CANiq72n0sgSPQ6SmUbK+tv9S5VZktA7g5XMjHOBOFNYLo2oA2w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 14:48:17 +0200
X-Gm-Features: AcwNN1WnWizbjOWWN0pUKb8lC0ggsF-jOAgWoTP8zR1n3K8yJhpg0iqGxAVe_1c
Message-ID: <CANiq72m=CJ7ngSBrnteyt07fHNRJ63J7m+=LY7UDHLmwYKjCJg@mail.gmail.com>
Subject: Re: [PATCH net v4] rust: net: phy: fix off-by-one bit positions in
 device status accessors
To: Gary Guo <gary@garyguo.net>
Cc: Chunfeng Song <springbreeze@stu.pku.edu.cn>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com, kuba@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, andrew@lunn.ch, hkallweit1@gmail.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 2:47=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Definitely, if the patch shouldn't be automatically backported, then
> we should limit it with a `#` comment, e.g.
>
>   Cc: stable@vger.kernel.org # Only 7.1.y and later (requires
> bindgen's raw pointer accessors).

And then we should have a custom version sent to the other versions, of cou=
rse.

Cheers,
Miguel
