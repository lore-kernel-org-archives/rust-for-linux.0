Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C104B3A4F37
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 17:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771955679; cv=pass; b=CbX3i2ZVsO2SFyrRbQX9aGZlqijNonMATGqBHnSTnbhTP58ueW6MKPMWPOPySiWNqrJzogowF7H2RAYjq85b8z2LSQ2vzz/il7Euh4UGJUVL3CEI1///cBmkxXkTNfPqsagp3Ca+8XmoSR3WKqC6MqJTHxtIk5Tnom7FibED9ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771955679; c=relaxed/simple;
	bh=AbCHyk4rVeTnfeUk96ZMwoOeBaihiTpGNh+iPJyOkGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CnAfg95BQaIJhkljNKkqKaXSAZG9ncAkmn7Rj5kDFnhS63zwgaVy7DB7zsIOHh8LVTA0GlGvj+p1uGjfVNNdDCJ/Dp0Dno7rUX3oFo+uc2Mg5epBOELT824P/TO0B829GNJ1FjDsD+CAxiLaBzCYIrkVZeU28iXcu8sbgywHw3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTfUyfrw; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTfUyfrw"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bd5658b901so262180eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 09:54:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771955678; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4bpccq2BNyOewqKvMl7mqnidbhORzvIF8rhA/8j/6ZIAmcC+c5jtZgH+BvNbNlvbu
         MgF8AzNXYEVgi4JxhFW/gRnKBzpgMT0zPsbUcXT6g+nAcLjwkdagRJuFcvNPvAJl0KEz
         H0HrNHOlfyp6GxNzs1aVYwfrYsr1qc+h0YsVUAqfD98CXS7gy6wdO7ke34azxDMKoTsu
         AXqg8twOl9mY4XKNjcUhCPuf3Yfgyu8zWAiSAN3kO1dvx4BDDZcUkpnQXY0oNe10b5Jo
         cvORK6NsmI+avv9l9D5QCOYSW7vraGjdh73zmodfvnaTmH/KZtVaGM7jjImHN37f6gSx
         yUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ah0AfPxyqE9MAeo8/B/PGijqvIRNE/+AWXO1lfvW5jg=;
        fh=MBB+1eHY2rZ9dlDiRGmDu70oL25ecKEVM+AvOGyoCBk=;
        b=f0byD7OkSor/lKRGr89TFpE7mTBKSUF5V++cg7t5CbljNQM7kh3/ASHcOBXpQP5hWE
         7+6p/3yvC/F/oJWY+8IoR9LhoFRmP3F9FwBesjLQnWwXlH+jcDGMPG7QOBnR7+Y3MD8E
         jsL3Pd5m1J0YTCWVb3K0JRYEPbVG06Li3TsmRLCCqnt/oFHrBMLvSnPwWd+KBe2A7X20
         6B4ywx+bN71gfiR9XQniUD0bFrWjIVVKD/hGjajfJUgPl6ccQUXXjYrLVXN9KbZUMPJt
         Xe58NgGESc6ndiCqjiQqykL4uxFuyB2VdeEQf/rCLoCyyn3o6VffkFyuvtM69qcy9zts
         /FrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771955678; x=1772560478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah0AfPxyqE9MAeo8/B/PGijqvIRNE/+AWXO1lfvW5jg=;
        b=OTfUyfrwQPPKoH0p7PqdN5824QoeJVx8P09J47Runz2klejwG810BxtKiqGxn8qljf
         jymi7tkaI9bIQj7qjNzSOHR1J+WqxIZgLCtLZ2e47JG6QBDGd0i3mVES1XU1sAUfvVw7
         wP1G6dUmvlPTiRzT7fUc36Ojdj7LaFYypbh8YBZiu1H43W7Dtiq/xQnpN01Qn+OrYGp2
         i1GR+QLa2lBy1IcmhQ0nrmmJ5q/O75/uUZX+P3/4kyVyVmxA8f8cGjhJWMMmLY1HG+zn
         A7bBX949DYTynwnIQ2yq4YJ72tdr77ZZGsbCrZ8hEEhxylPTofhMj9cWgGO8gOOiBegS
         HNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771955678; x=1772560478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ah0AfPxyqE9MAeo8/B/PGijqvIRNE/+AWXO1lfvW5jg=;
        b=pVSx3NDW49eMZ9Uo7Xtle6TyjStoIYFsxqlZ0ZZcv/kqhb6yg5rGrBhi/2WcydZHnZ
         iYedpGR681UizyiuZvJmb3kz+krBQbIO/u03cnfYUAYo8ewpypCrCS/xdplnMAvq97z8
         XvQeIsQcF1Hb449wOUHLD1znSBxPN2NT/6vDTxxKOPjB/PlHd8IQqLD0QXegh+o1WzEC
         p7+jp22Npn+EDjCuD6eCp0s+CfeOFlURovwM1YdZLVrIkMXXSSasPe5/X2o3VJFBx68P
         oRqFcWjgVD1SbEreAgiAZ+TcZBxCdys3PSQbYCE2hPbd54LkvM+2hs3tR0X2sXusUFsA
         yT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjgzJq+jfQdqWpATx00ffCucMHvqHClWv/91xcu5516LftojaQbtNVii+6sVFm3qbFcrhDREZ52id9ddvfgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOWHYakMRcJsBn32RDsH8aLCDhJLXMZK0b8npPE1agtyQ6uR7l
	HtqAfbV1e7Rc9eXGgjUZoG7kdbXWlRYUT6oCPHLeVdsqIt5Fo0mC4AMf4ycN5nK6kSJaEuymGY8
	4UqL3X4LjVfMZJ8Yr7IgO6JB284+hsQs=
X-Gm-Gg: ATEYQzwu+CfjwZUcq1fJtAeSE34MEC7diAN8l4t5rndv3ppNC0pzBqzJIb4fR0Y0+C+
	z7zoWVIJb7E91H3haoytdfIQIXzKyNTrrYxynaxmoxGzi9N1kdixJtA8mGHieTeDBQr1YQfQO3K
	43MSrFXOzwj92jesmiARjWc8Vh506rxUaKitnzSOcIDDtdH52/+sFSuT9gRcIC4HklV68oWWW38
	KIf/hubdiszCUduadyRN/C0RiU9EtUuxCSYugutjrI+boHbyEFFxYIFrlmqVREI9AljO70cdFDc
	L3DjOnJatGiPVe65cYwN6hxFkumr9o3OOfFUmrSomoSdZ/TnSvFDnR7T9rcBVO/EsC4b18eJv8J
	ncUqap052eGOWc9Vwuc10eTzsq6op
X-Received: by 2002:a05:7300:3f06:b0:2bd:a4d0:a9f0 with SMTP id
 5a478bee46e88-2bda4d0aa9dmr747822eec.7.1771955677644; Tue, 24 Feb 2026
 09:54:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224043211.1747-1-iprintercanon@gmail.com>
 <20260224164926.1760-1-iprintercanon@gmail.com> <20260224164926.1760-3-iprintercanon@gmail.com>
 <CAC62b0xq8vg4njbcvR9JLvW+o--UnNHEGNVz-+Uxa90d16j80A@mail.gmail.com>
In-Reply-To: <CAC62b0xq8vg4njbcvR9JLvW+o--UnNHEGNVz-+Uxa90d16j80A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Feb 2026 18:54:24 +0100
X-Gm-Features: AaiRm50Y6UwuGIeNQC3M-fh0wmvHNBVWwpGd8K9JL6tfiKZjv5ETwCQ0J_5qf3k
Message-ID: <CANiq72kRoHsLx7GSrRq-OP-mz6Y9nru8UMp4dcvdmNJasGZcuw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] net: phy: add Rust reference driver for ET1011C
To: =?UTF-8?B?0J/RgNC40L3RgtC10YAg0J/RgNC40L3RgtC10YDQvtCy?= <iprintercanon@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 6:04=E2=80=AFPM =D0=9F=D1=80=D0=B8=D0=BD=D1=82=D0=
=B5=D1=80 =D0=9F=D1=80=D0=B8=D0=BD=D1=82=D0=B5=D1=80=D0=BE=D0=B2
<iprintercanon@gmail.com> wrote:
>
> Thank you for the feedback, Miguel. You raise a fair point.
>
>   Honestly, the new abstraction here (speed() getter) is quite minor --
>   it just reads a struct field. The driver itself doesn't bootstrap
>   anything significant beyond what ax88796b_rust already covers.
>
>   I'm looking to contribute to Rust in the kernel and started with PHY
>   drivers because the abstraction is well established. But I understand
>   now that duplicating C drivers isn't the goal.
>
>   Could you point me toward areas where Rust work would be most
>   valuable? I'm happy to work on new abstractions or drivers that
>   actually need bootstrapping, rather than adding another reference
>   driver to an area that's already covered.

To clarify, if the netdev maintainers want to have more reference
drivers, it is up to them, i.e. please do not feel discouraged by what
I said. :) I just thought I should mention it in case there was some
confusion.

Regarding new drivers, if you want to work around networking, then
probably the maintainers can tell you what is needed. In general, I
would suggest looking for hardware that is unsupported currently --
that is usually way easier to justify and land, and there is no
concern about duplication (and possibly arch support is not a worry
too, since there is no other driver anyway).

Regarding new abstractions or other kinds of work, you may want to
look into existing driver's lists like:

  - https://docs.kernel.org/next/gpu/nova/core/todo.html
  - https://gitlab.freedesktop.org/panfrost/linux/-/issues/?label_name%5B%5=
D=3Dtyr

We have also threads in Zulip about looking for things to work on --
in case you haven't seen them, you may want to take a look at e.g.

  https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topic/Lo=
oking.20for.20open.20issue

Finally, you probably know this, but you can always help not just by
writing code, but by reviewing patches and testing them -- that is
very needed, gets you credit in the Git log, and by doing so you will
likely realize what other things you could work on around the same
areas you start to review.

I hope that helps!

Cheers,
Miguel
