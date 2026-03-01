Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E7B335081
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772360061; cv=pass; b=lL2Efer6G56i9oSPRuDYwGx/ovB01T40WnXjl4WePvIfxrW9XMIT37KncsRBOJ/6iJD98oVjIsLR/6r4qOjTDMoYc1RRGaPRtCrvt4fv3HN0wn9BRe/2aUljAa+yf/RM3vqBzLSNssYknVowzBGE4Mr/2vo8u+FB8kWhciPLopY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772360061; c=relaxed/simple;
	bh=smjjcYEfUfjLt5aZvwFR1rVZbUYeuPTNF6Izj8F2xnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oc3LdjN6AgRjcT2Si4NqSocdj9ap4d0XJQBmhP8CCZbx9wBQ9631Xlvebbh7s25rMCAcI0/i9Iz6YbWRa7rHViVNoo9P7ixluRRFH7/pb4rhHStWsGD4eifmRfhuFCD9JDu4/9j7rq0wQk6dkfLsAtcJkTikutmAkfTa4zAM/sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXy6Px63; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXy6Px63"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bdff6c15a5so18702eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 02:14:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772360060; cv=none;
        d=google.com; s=arc-20240605;
        b=MLTJfX4JBfPjWggoklfqAITb2bkuL3VPW7qjWzAaww0C5YPuljtR1YX1mmGHzsfcKz
         gmASBPfKchL/Mh6V5Qlct0+V4xq0iDE9Ogm/3rRCSiSuHHLHeNcNpv2wYjIAOj5FZlvR
         4vR23m1K9+ul92/rp+ZRo44h2w4JYBQ2E8Yp1lyAwbV1dyX8IreswercXeZLjuDIQ+e7
         Wdr03R4VIh9dQp8dO2NWyw9O2HzBLYvpkzCFL/CvEbUPb6HdtJ5jQAuCZWYxtCOWZuYR
         wp1ofvYLu10R8gwklBfPegPBz7EMLuVXFcakBbPLiMFR4ruL6tPHsIKH/Acau6kY2Es1
         l6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=smjjcYEfUfjLt5aZvwFR1rVZbUYeuPTNF6Izj8F2xnw=;
        fh=neSlEu3NQzFX2XOsUePAMNyteXBC+t42UjvOU5e2gLE=;
        b=bBJkFmjY+j6jIrwiqF9B9T+8Hqlr4FxzjDjn6tIxunjMTbkKYNEdKV0/h3KCyLpfZk
         DvQthSu2JOxooNjE7nAj340LAonOZXMZU+3PbUjJvSEcMsgkVjT9EP8rrUNTyPnv7P41
         mVpDp7bf8hGcqCvYXsipJCuawO4JIKWny7y2SuY2PiLkthdZ66ok08OGEo8Kh8pWapSg
         j3WDsY9V5cLRZfvozlh81TNmcydLfIW8bOT4hdYo1wbcFvxDXXYIVxnmJp00HF/6z2F5
         tWF42Z/rm0bXjkfT8S9xlKdpQyOTo8ZMFRkxPxR8sOkbDWmj/N96MkXQ0Fz24+MZf27b
         IODw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772360060; x=1772964860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smjjcYEfUfjLt5aZvwFR1rVZbUYeuPTNF6Izj8F2xnw=;
        b=AXy6Px63gNyMukdcWvaP2gy4ok1eM7Sl7yfcTglD7tYJI2DnvbykrKG+NUbVJ5c0kr
         MRQhEHhbQaGFvq6C2eba0qk6noV4Wfy4+4fadPVViJhiMNlfxamxvwg1KiODsZlmVjd+
         noQq2QrjEqoAye9AphtsXQ6S5VOI3jA/ziTP2IHvALTbt6oRvPQXFFwcWP5h2WUBGVap
         5ganQiizwnFe22YNKgR2cuXCR3ilq0XNIJfjUTWCsxrn2qrkNPBeHjLgsKB8RFJ1tmoS
         II0hTsNtknlJdr+EuQXfW7h4U3bxFzXaFzStZ43+4AhfubRjEpocMNxaP7vYtl5uf9Td
         1rJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360060; x=1772964860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=smjjcYEfUfjLt5aZvwFR1rVZbUYeuPTNF6Izj8F2xnw=;
        b=TfsgGa8mOyRfQ/0UbIvbLc9p8hYUUvl0UQYtzDB6UtM90mav5jj5hv8jRW1PI11qkd
         pvjvMAxVo2uyE2MYxhzh43Q7QuZFAQyOWPR9h7WudwT2Ggwiw4ALc/+xvrIir8LakPwo
         fmbcIx4rKo9IRz8BMUqg9TqoosoqKyKs/6v5H2/W6FloiuofGlH/1rtKPXvpd9VBbM1p
         mlnr4RKPxCcZOv71o8GElxQAseQHwueFhMMHSWRV7cJ9289K/n+SFJzERiueYvgEvFvj
         /aDV88l80Je70UFHDtSCi1SiTyCK8FDcxqGALbzqyuyK91ElUEHmUZkbwLMXXYt9vy5V
         oo5g==
X-Forwarded-Encrypted: i=1; AJvYcCUap8AXcxtDEnAD81WsLL0A7UeMU81LtRr3pjaFWYy44viwLZXLkN2ujeQaLRX67lPvlKE3QRukdoU+AEE6XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYl4a8zJGhziOWZ1oAjiWS5WhffY+sOe98K0y8OYXnSid69+y2
	+Ee7omzXFGm5TP1LkYOBCVa6+Gansrjxy3xc5RX+GNoIB4dCHQtiQBSjwcOcVT4mrnONOAzX7WZ
	y8EvEr2zOa0lzCZnDAPR7YPqtzr6rOg6EF346
X-Gm-Gg: ATEYQzw1e5EzqYg3r+6qresZSI+dCOwDMA23wI6Gpzu2yfRsJk+0Trb2FOah8CfFoZB
	IJ+7sbtDJVFoyCg9TMDcN+4d+iggDiJhb7MuuhBIU5FNLl+wrOiR9hgeSKX19tpE1MmTv4cX34+
	GSgvprLYmX6EoGxOw98y3+5oXWLQCX5U31M11TV2c11eqm5T9rEcZboo5L/05D/xPEUgoCYez3f
	z9GVqdgR8VihLrgGTRC5Tjm/Z+D2DqYxpaF3vSYQ/aYGKWSAxRoxOHAosc09w3wZVO1ikoAPb4Q
	VLFuvpAxT2AmPwNP4sFe+GcosT/8034u8Ni5y4UOqPhRDKuPR+tqCm1dRHb5IquRTUD2rKWYGOO
	nSVqCmK0jBWpc/+FwZ/QsO045dwrx
X-Received: by 2002:a05:7300:fd11:b0:2bd:ceb6:5d16 with SMTP id
 5a478bee46e88-2bde1d153bdmr1650466eec.4.1772360059929; Sun, 01 Mar 2026
 02:14:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301015502.1722156-1-sashal@kernel.org>
In-Reply-To: <20260301015502.1722156-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 11:14:07 +0100
X-Gm-Features: AaiRm50Fdl0EQs8Iv3zuJ_WNhaCmLslUaEiE8LfKnqF2gKgqEqLKJTYpWaThhHU
Message-ID: <CANiq72nJJKdY8Bfq0Y76vU_fM1Ho+002cT8covjAkRFHk1dU9A@mail.gmail.com>
Subject: Re: FAILED: Patch "rust: kbuild: pass `-Zunstable-options` for Rust
 1.95.0" failed to apply to 5.15-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, ojeda@kernel.org, David Wood <david@davidtw.co>, 
	Wesley Wiser <wwiser@gmail.com>, Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 2:55=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 5.15-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

There is no Rust in 5.15.y, so this is fine:

> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).

Cheers,
Miguel
