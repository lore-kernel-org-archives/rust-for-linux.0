Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B4B1BC08F
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Jul 2026 18:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783274740; cv=pass; b=RJnLx33hOpKge+g1M+bdz01WJdXUXs9Ij7O10W9hOqur+qdVWHoUSBLQ5mQbWy88YOMdEB/RFhxwLjgzJRkDr4Obg7SMdX1d8YZ4jMlmovXBjsROMW/5mgawJfiqBppk34IHLcoGZCHkiUKvkWnh9rUu//Ix630VjxQgrTFFJ68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783274740; c=relaxed/simple;
	bh=jq9TRorttzCZADcEBFzimD0zM8K9y0TwzNpsSFh7QT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3gYyGzoZqu6OdgszWXbCTcZJLZUxcSmQ33DHtWFO2rhil1AIu4J0H1FHGR56rVwDpszXXja4Qg7opof8+igozjBIdjReqcIA3MCV7A5go/paf3WgOlMPXG93RLjN9+sSePhXj+wt3EIW/rCwW+ofZSPEWnwpMY0HXduBKU1MYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANoX993i; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANoX993i"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caa0551d8bso7300945ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Jul 2026 11:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783274739; cv=none;
        d=google.com; s=arc-20260327;
        b=oeDCxZdfLms1SkM9qfq7+2zp7ufN2+ckM7MOKywnZdJmuW7YyTEEqKCdiY6zGolVsJ
         uvDX76jYBJW7089Vp9pgHLxxNg7YiDXWOADpcokYXjW3aKYSApKTiWlSlTarkSgFBn+L
         R7sBaThcHRQmpFN/R37M0i4nM+hn1WMVXnGdn/tqpkyZ8OIws72T+mXT8k/R3AabQ6F3
         kM5gtLsGXL//axnjPm6J3W4DmwoFfBsom/XYNhbFV2P09pDNgVJM5WQENkmo4Mqwkyrx
         yN13SfzTwNnsugyj5tG8p+9m6Jv9dQ3Gm4+HJdIBmqGRfF2ZoyOhF9wa8JzmbCkblqRl
         ZTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jq9TRorttzCZADcEBFzimD0zM8K9y0TwzNpsSFh7QT8=;
        fh=3s1OQ5kouBQ7roJRKs8DpQukSUaFWxC48DmQdj1xxSU=;
        b=FIH/do5qPadifIeqjWMxmm7KXEXxJ6KYCwKm7zW0ZSTB5Oc9LytAg5beZmnzcJbhE0
         A4AkhvCK8ggbb9Wc5DAkAQLxDpfpHHYIyAFNFsTdSi2HhFO/2W/7riSuGmRzlV59knK/
         YTldPTs/tYdJ4Ho8YmToKLPN2gYf9tP9vStlheH/iqyusdT58Vut2FuQKp3ef/zIthk4
         FAVDp403S4jVIXu9QIi1SU2q5AMrYUs5QPE17O1yfKz3ssMjOEhTaAUoSFe5zSqBGpng
         DwcZovjG32OYpfj6WKleiYOkPPXaD0Av7Lah5scEN6hIqjF2zQniscG2Y1NPBgTWfwPZ
         zJRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783274739; x=1783879539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jq9TRorttzCZADcEBFzimD0zM8K9y0TwzNpsSFh7QT8=;
        b=ANoX993iN5Bw9Boi2Fbflfe1/TBZzYaSDNdbPcBkb7CY0TLfMVEkXO7J+iC7QQeXa2
         9GUMKBkIi8XUESirgwj1u6rZ/dsyMbLiEyEoQjm4uI5rcsyxCBcMdue7CchoZONClqwy
         0h0uNy/WwGNpkqdFniZ1ruWnJFhRTVI0blW5rX+6wNnWc/5VTOfpMLJSrgnCkXiM9sV2
         mZYiq03hHg12QwhzwcZ0RlYddzCM7ugvrTLCgOis1yK8WzmeG3V/kFkUdGzOCA6FQjwZ
         xENZHGiz83hRyz7U2ebe4GtdyJuc+GL3Mbh6iy03xRrdJmCi1LNJiJXlEH65gHwDmURE
         EeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783274739; x=1783879539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jq9TRorttzCZADcEBFzimD0zM8K9y0TwzNpsSFh7QT8=;
        b=pHe7HoadX7LHjZPt3U7hB6H52C42s2uG6r8M8G8SLgblL8565OMWm+7P1ePTtEB6eN
         HPyZKVR1q8eg10U32lmmPVqaspuY2kB9X8Q8Wnk12RsgjDH1z9IU+kTuipX2kyJJw2JZ
         NWlt1zYPM5haANJGx9ltLQETB8tCwthMtJ4yeJpS/WnCv5BT5WxdEBUuedQmP257g0UH
         3DFUF32pftZ6V6D+epjBOTHB2ijhtibda/T/d94CjLm7oTj6hoBZgIhfLlQSB9nLw7mf
         pts4hpnMxMOZ8OlOrifOEc3NwF2ixHaTlTqniCXT4SLM86BUQyturDucHwTu9j0sKn2v
         B+zQ==
X-Forwarded-Encrypted: i=1; AHgh+RqP2fvWwSdxNB0EOPPHL4aAcFldLd/EksdLh0JJkAAvqvUIvsecHEvGQg2+XemWmfcLzC+JCX/Q3PKS3bhD+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdmHxa78zRQ3WxLggkbT680BtbT4LiAbsr5u3ZXGO1kJOufd+2
	hob5ys0VDWneRPo9jY0g/YIzThVfrYnqMmXCHSeKpEAKZgOiBf74ARU/3pOHQokEbcc+TwPxoo2
	Al2StMASZMi4IpKs5tpy9TbXD82FOXDI=
X-Gm-Gg: AfdE7cmcKR8L+ekJOhXlyjKNy8iIpssS6B1kH/eWoFdmXDIUpinlk7iAFzHdNQVAGZB
	MBQQhQXwOGj9dwDNl7WvHY9t+a45Kfsi04bT++jGwYJS65ukhlQejiTF8jBxTUZDVlfUTjevyk8
	JEoG8y5EcSoelxQFVjoY77HzWfJpR+GmFjSYxhfnGAfiOxOh5xFHZpSv3aIyk9phXjUKnVULrgM
	RGnS03aXzTkdUadVOVxaOK6MtcA3mb6Z05sCYeGaxcvwLool8qghYq5xWipC3Az7P0vYE2KgogZ
	pIgvnZJ75DsGzYz1dsdZf2v+bzloprACu2SCCNzSpJyQ0AcnxoQ9xz4mZRKaKAo2TknLbhWmiML
	HANjcld4C0taC
X-Received: by 2002:a17:90a:e7c5:b0:36b:9323:c726 with SMTP id
 98e67ed59e1d1-38281d6e749mr4462314a91.4.1783274738743; Sun, 05 Jul 2026
 11:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705175936.4653-1-litvindev@gmail.com>
In-Reply-To: <20260705175936.4653-1-litvindev@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Jul 2026 20:05:25 +0200
X-Gm-Features: AVVi8CfW8czBZAbVgtBunA05HKx4DZMhyQptG7lgNqArj3IYRbN9fursU_DRyYU
Message-ID: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/tags.sh: Prevent binary files appearing in cscope.files
To: Sergei Litvin <litvindev@gmail.com>
Cc: nsc@kernel.org, nathan@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 7:59=E2=80=AFPM Sergei Litvin <litvindev@gmail.com> =
wrote:
>
> PROBLEM

> SOLUTION

We don't typically use titles like these in commits. (Same for the other pa=
tch.)

> This causes `make cscope` command to generate a `cscope.files` file that
> contains *.rs files along with *.h, *.c, *.S

Missing Signed-off-by -- the one you wrote is below, in the part that
doesn't go into the commit, i.e. after the `---` line. (Same for the
other patch.)

Also consider using `-v2` in `git format-patch` to annotate which version i=
t is.

By the way, this sounds like it could be backported? i.e. perhaps we
want a Fixes: tag and Cc: stable@vger.kernel.org.

Thanks!

Cheers,
Miguel
