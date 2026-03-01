Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2BC335081
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772360034; cv=pass; b=bOyEoRnA52f2eufb8FOjPtKwi0TpODAAjqgjZQck3pKONuynunFooBqb811AYC53KuwCNpArpZYJ4GbyAy543uHxfQBV0Z0fA3yfhFRoZHP7igtfqIHyOmoMighg5zK2UOqWlBr+n4ij/JUTM9BMF4o2FZaoX5LLREw0ba42vYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772360034; c=relaxed/simple;
	bh=QERv4eKUlmZOQXI9AgmqSV7lUjptvtTpV+52nAuVu3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ud4vtKqheyxtwmvtp8ciATwmpofdL1dTKPfnc6SUache/J70Ky/mFF5k5cNIe7dUQtoUrv7cFqHZ2LWSXraM03H8VUbrfWREx4XlDGPIE9qctLL1XVcgI7lCWI75hdsPKj9Nfgh/lq+OyJKvHboD5IN5BvFjY4jkuI8bm70tTpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CugbtiO6; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CugbtiO6"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bdff6c15a5so18695eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 02:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772360032; cv=none;
        d=google.com; s=arc-20240605;
        b=Ya2Z7G65cpsVyc66qv/+v89XZx+XFmzBw4hOhWyegTkBQbmOJZcsWEVmaC74R2xvus
         yx3Mgn498RchduvrWrabCYU5Qs3bJ+2pulezd67F/oajLNA6WCRaQOvRWfP5ZIz6Wj+D
         Rtd40dBqN68XVaOZHhDwlgVxUsE9CQVhUxTRQhhpTDUh13UL2OUYvVblsSET/zNELy5U
         cBkGjp3R2bDg3fYPdu9Fk1ZSgMnMRum8l7PwRGbqFzM9KeIrOqjNnBqjmiCp8U7lC8jy
         d/4S69VH5X0zF750mv05e9OW+9FPGDNZT9Yr1yxBcT5tz+imkYb4ePzSOywIVGFaIYMT
         Blog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QERv4eKUlmZOQXI9AgmqSV7lUjptvtTpV+52nAuVu3A=;
        fh=EpXWfVy0eys2QHypOaFR0ccZRDacFLQG8SNU2paZLJ0=;
        b=D5jCzKYFo+VvWYX3PRPvlujHR0EWBLomosozPMZTw9JlfYxYx8hgLgmmPZDAfvoSz/
         RMSqbrP6D1vpWIRG0sO2Md1HxADdBAsJ/5yeBH1dby173eaiae3lqDvJbbHtfydHBF2R
         WRraVmD5Nusjwc80ZmsT6SYWhOH6oex47RUBZRQ74y+3DUbrDG0sZeAAd3RWZ70t5zUw
         EVPIZChNNd04kwWm/U7S44zgbXqQd9MQe2vk38WGF5jbSIeL/hiLHMOKHhVgLXbSJ4so
         j+O8+M/FhkWRe8vsgPIPjfkLIjKjjJeusvHSCanGU/OvJP4ATfYqMFJHG2iBhbSz6SHH
         wBKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772360032; x=1772964832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QERv4eKUlmZOQXI9AgmqSV7lUjptvtTpV+52nAuVu3A=;
        b=CugbtiO60Cuj89HuO0KTMu3slWY+b7oHTqBJIv9IAUsP64mPyKxYet1xCtQtSfeX7k
         RWmitNH1O1LQZtw0VkChP6wQGl5qM5Q1+U3VYoIe0fz6dnOUc2XYmYhANI5xbwZgZiPA
         u0zjsL+Qlggqj49TMf0YLYBoLX+FIbsR1FAT8l7R0SFuDXs+C8i5HAZ2GwHqzDJ0zMjA
         yVr1a4hspW0QQzzCziHgPyhUF4Zuchu/Jj84R6M51WeE1L4kMPSGCgJ+s69nKQucCd0g
         YIh0GnzBRlcseEy8RFC2tuiFoNXjHDX34Rb3GpjCapSd6dykDJlh0YQO/H9eWK4jvMMQ
         gFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360032; x=1772964832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QERv4eKUlmZOQXI9AgmqSV7lUjptvtTpV+52nAuVu3A=;
        b=eG6d8C146xSY3bVB9TDAIeMA8/RLZPl8CR3k64jHC65hHCJljS255Ze8YsLluXGh9z
         H15Ua+6/wmpXxm1mZeLYQV0pna8MGgQrHJkYl5za/NfuVKSwvi9WZ0H1e0ltOggOYT3B
         1ZtTJNpaNfJNbyvJVdHinFgBsAggirSsGHAsbXWqxtonKF7T41XIKadyD+Xe2VMWIwUM
         rr+mqqZu6y1ZILsf50fldGzWVoTs7bS8v58oq7NhuY3VQ9FzUTjVy+rKmE0QmNwTrI6X
         QDxQ8gi+5/uBAoLNpgBQ7/3lsdK7RKDu+lrAgQWKc+SmgCXrd3pRNFZRSThyQo9TJQ3Q
         4SOg==
X-Forwarded-Encrypted: i=1; AJvYcCWpdcFq+iEHzqdBb7wQ0i3gnAk7zrLzfRni18X40TMW8Tme69x/Q+gt6rM8BP6+Yg/qfOv/cRvf12HQvIQS3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynn6BDW1q9gJLiB7SrUx/mJ9fLILGF2wsSMHncrIJ6qokS39te
	ld9f8NM5Iigs+1KnI5eUIFxS6c6s8RHrw14T+FkSJID6ssH0wWJcSwU5HsFqYdkNHCIPFzTpJCL
	fwnlGNNLGT9QXIqG2MIMu1qIAisl0S9z8jrBM
X-Gm-Gg: ATEYQzwcyCkFxe47ZngYPGu43JX5b+c2AybL3mKdS0xfSKGta/VkrLjxrP9LiJNs525
	3PBiKQ6FH6oE7wBqY4DNldbKG+/15eu8zNdm0EEEcXml+ymEOUL6sZnI4W2aP3hRv3EwhOXJBGT
	C86flLofO+X4fwQJ7z52m9Sm/BvPR+mG2Pu2pGJJBibueBdux4BckvGw2Tkz1NGvoKhAKVj5J7I
	pLHKDWcr+cTnJ7llBgql4YdtHFhwkhuLtL9lqTqV9DJCYEC9gSxt7QVj8XeL0On2gJERdvcjnTm
	moixhSs4Mu8oQ3KRY9FrrCb+CZeDfWgu3UX7mlEtAL4ldWYzgCIolRSazwFHSlu175vOhUJW5fV
	7r5i+AgUBRVmJ2vsOrSBTW+geQqvS
X-Received: by 2002:a05:7300:724c:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2bde1d1535cmr1841036eec.3.1772360032199; Sun, 01 Mar 2026
 02:13:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301015836.1724150-1-sashal@kernel.org>
In-Reply-To: <20260301015836.1724150-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 11:13:39 +0100
X-Gm-Features: AaiRm51kU1xX2n6LHsSv4jLUf25Ra4JIJBszCLjU-FUJZnmegoJJxrWL8NcxIrI
Message-ID: <CANiq72k5hJSJDBF=opAzY99ZTCQmUUkGgiFWm9wCQPkQ2WyYVw@mail.gmail.com>
Subject: Re: FAILED: Patch "rust: pin-init: replace clippy `expect` with
 `allow`" failed to apply to 5.15-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, lossin@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 2:58=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 5.15-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

There is no Rust in 5.15.y, so this is fine:

> Cc: stable@vger.kernel.org # Needed in 6.18.y and later.

Cheers,
Miguel
