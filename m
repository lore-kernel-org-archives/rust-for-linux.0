Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D472FCC0E
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 22:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768343209; cv=pass; b=QN7H84imtgmlBrrzTMEaycgpUUsF4B/7+alurj/I4P1Y95hQe2Ra7d0wBmh2MAApH6ERF3C9kqkWFMbydjH9vVlQlnylXJG77MHjy4J+EAv107ddtMpxtnNOXMhgfF65SM6QTD2OZln9ED+DHGxpMG6yj6R/yTalkr0XJcAyI14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768343209; c=relaxed/simple;
	bh=LuS0+qcCgqfC+GOn507Jux8Z8zklMcMRt3X5fmJ0Fyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRE3ez0t+LFLxhp85e34G1RxggEiqR6Zkv46LaGs7fICGz4bi28mGWkRmhW6j+8jo9XZfb8wPQFiawYrlFCmWtcIWb5Dr9ChmZOExVCzfJjLk1v+TqpMBLTVmO7GivxooSf3w+MGuFgpHplZPInOY8EiTHhw3Z7kGBHfRlGcIkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgne1TWO; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgne1TWO"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ae60d8a05dso213188eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 14:26:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768343207; cv=none;
        d=google.com; s=arc-20240605;
        b=PDvYu515S62oOvIRqQaivP7CwZRumOXq20Rn/a4SYe8WHHUY5G0MTNxRAmtM5OG7lC
         N2p2zD5xMHDHygpay3J8G+/4k6Ymjws2BGqOJFGsbwdwkgVPM3BTW4oCYsAX7vaDGVER
         WUFrJzaG/B41OFNrn7W9jgJwWLHHacBANI8A6FL6pBLLNAlZz7E13jBX6c7LkvHtc7Fp
         EionUBLldtoCBwunbe8jP5k1GDbIhdAzyIFe7rq/Eu/81YQjz3UZF1bc8PrAtGIT/R19
         xQSfadwT1OnCNxF4mjYy8G9O/DX3rAipbpZ683FQ4FqZcqALm3KvFv48wrTOwCLZAI1Z
         1V6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LuS0+qcCgqfC+GOn507Jux8Z8zklMcMRt3X5fmJ0Fyc=;
        fh=vcNEVNGSk5gSrIeKExYdtyCKePp7C6UX+gxJM0W4z80=;
        b=APEB88sW/tM6tzqpaOsI0EdVW8jMml6tm2vsPg0AIQ27RvyF0lrMumonQ2nogYG3KC
         1+e1tD7nl6/y86KwR1lhmunLuL1R29ndtovSa/ZVM0vAT3rROTqT/OOEwHgQDbCZkzXD
         u2yPYHjGYrOMAzWm15ek2aJN3Tgbw/l8YYXgKdFEmFT4ODKpzLu7OLNV0WOxAitvi/Fj
         RJlZ9AtPpq2kWcd+xWfIX+mnl2hcivX73uT11kfvlVxk3CNakJFDHXGiYlYluPsjQ9iY
         LXKWRrMtAjNh84t9zaU7pYRQqKhGxPJu/X0ZQypoGsDX8R28M7qhJGHT7HBwEU9ull4K
         fUOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768343207; x=1768948007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuS0+qcCgqfC+GOn507Jux8Z8zklMcMRt3X5fmJ0Fyc=;
        b=bgne1TWOiE78edgMWryFB3RwkpjRcGaX28nWlE/Te9HzDYRqrThnlINF98ADu/rlpB
         dAhkC2W4PX2Vs+2FkVJuvcX/ec/Eauf18mE1Git3KE+E529zCTgkD+Aaf2U4VqI/eaDM
         Ug6KzxC3u3b51s+NQThGSxQUp3o105ONTtDr7x69bLkQ6BJsYVr0dBPRnoAhZvDUk74i
         K3tR61Z9Bq8YKBQqFVP+Iqhr7Ak75BhX5fb9iaXcqtm05ZwqPxEMv38NUlXoF11SydkM
         +6v9nK/spZmLKa1FKEAz1l+wUJpqS1NC2cKHlI+iAqaqlPwMSENAsPT75heikBGVgmJr
         BTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768343207; x=1768948007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LuS0+qcCgqfC+GOn507Jux8Z8zklMcMRt3X5fmJ0Fyc=;
        b=qvoRUPhIdD2Lud2IxwqIpkVE7i+AR9521hCdRrxOz4VK3Vdzrdlb/x55GG+YFFWC3U
         Qw088JXqwQNcnXPL47P3s/PKQ9BMZgU5sirCMbFHg86SvRN0Mm2oJ5QaBP2RR6B2qg6C
         n4fCNaMi5aHTQ47VX3swjQqtHt638Mft4AOWy8eGcrphZop6ZOuZMBGnr7keqwP8YRk4
         QpXKhfvyHqDxoGR/LeZjvrhL3h0/5mjSdKTuOTTCnFyN1iKjiFwGRWp6Dk1xMnmELTiI
         l70zF1nwQo9JOxCPZczOu+Cyqv9GKwgc8rym2VBJEoIqxgpsRFnJKnuVeKN1+aBdNRHf
         dyVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh8ML6TRXh6Ub/C07uwbmU8TqaY9qyTckHssupq9eHAHkAdkbqfVrEjO0mAsaME+MSDMG8eHOSHAabJAWA7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5DbausNuIX/3Gx3xF7EVAFiUzMmcIzONG8jueRmhEC7qj/j4s
	QhGBsVxB1V9z+nXycslFWYjtMgQ0qAhaouEjwr8esQKWu1+dHU8wFSf9gH7q22+Hp3+FHG6L3Jx
	C7OOBq6kJBjhhHwybnMYcSdXIq+ZD/hE=
X-Gm-Gg: AY/fxX4FMttcqGsX49gVWYOyl851sBx3OH39V47bYzrhe7wvTC0tGqD/5dc6X3tqKWv
	q9avCpfAycJ+bJo1TPRr3B6HMzgPFQst1ROJeOSMF7/p0K+/4vuzRIyI+FHPP3zskloFuw0Etov
	GWw39ywMbAqWW1+JjBriDVABLHUgIxc8CsIC1JAw7Hwf8KxVPj10bWSl/3pPs1YKpPZUQWxHoKF
	xeaa5j64wNiEwh1DhJPbHyYhL8OQf4HfCFt3OZjtHql3Oow5iWO96KUpI27s+8ubzfV37Wd82zI
	JsAmtvi58dEOdtwvsRU0m0bbbZYO2v7+QhXtndd8MahVKK9RY6m7fSGsm5o0q/r9v4tHb9Ke9Ho
	h5I3Eo7jANldU
X-Received: by 2002:a05:7300:3b1a:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2b4871e9771mr337897eec.6.1768343206975; Tue, 13 Jan 2026
 14:26:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113202138.565332-1-foster.ryan.r@gmail.com> <bfb5bee02f2e69ce1eb8c526dd4cfb82de326226.camel@perches.com>
In-Reply-To: <bfb5bee02f2e69ce1eb8c526dd4cfb82de326226.camel@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Jan 2026 23:26:34 +0100
X-Gm-Features: AZwV_QiviXtSAVj4u5AziZIrO1CT6xW4aq1lygI4yLxR0Y44fJoeg-pd-VOvq10
Message-ID: <CANiq72kb-uiBug5OgMz7pM_MJBSzwAvjCjnH=y=LFse1zVHg8Q@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: warn on Rust comments with rustdoc links
 above items
To: Joe Perches <joe@perches.com>, Ryan Foster <foster.ryan.r@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 9:57=E2=80=AFPM Joe Perches <joe@perches.com> wrote=
:
>
> Random grep results:
>
> Note: seems to be used as well
> What about NB: and INVARIANTS ?

Thanks Joe, it is very appreciated that you review checkpatch patches.

INVARIANTS should have been INVARIANT (or the other way around, but
since we mostly use INVARIANT, I guess it is better to stick with it
now).

Cheers,
Miguel
